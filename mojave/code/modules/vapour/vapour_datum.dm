#define SPREAD_PROBABILITY 50

/datum/vapour
	/// Reference to the turf we're on
	var/turf/open/my_turf
	/// List of all vapour types to their amount
	var/list/vapours_t = list()
	/// Total amount
	var/total_amount = 0
	/// Height of the vapour, used to create a sandpiling effect
	var/height = 0
	/// The overlay we are managing
	var/mutable_appearance/managed_overlay

/datum/vapour/New(turf/open/passed_turf)
	. = ..()
	my_turf = passed_turf
	my_turf.vapour = src
	REGISTER_VAPOUR(src)

/datum/vapour/proc/TouchAct(mob/living/carbon/victim)
	if(!victim.can_inject())
		return
	var/list/singleton_cache = SSvapour.singletons
	for(var/type in vapours_t)
		var/datum/vapours/vapours = singleton_cache[type]
		if(!(vapours.vapours_flags & VAPOUR_TOUCH_ACT))
			continue
		var/amount = vapours_t[type]
		vapours.TouchAct(victim, amount)

/datum/vapour/proc/BreatheAct(mob/living/carbon/victim)
	var/list/singleton_cache = SSvapour.singletons
	for(var/type in vapours_t)
		var/datum/vapours/vapours = singleton_cache[type]
		if(!(vapours.vapours_flags & VAPOUR_BREATHE_ACT))
			continue
		var/amount = vapours_t[type]
		vapours.BreatheAct(victim, amount)

/// When a user smells this vapour
/datum/vapour/proc/SmellAct(mob/living/sniffer)
	var/list/singleton_cache = SSvapour.singletons
	var/datum/vapours/dominant_vapours
	var/dominant_smell_power
	for(var/type in vapours_t)
		var/datum/vapours/vapours = singleton_cache[type]
		if(!(vapours.vapours_flags & VAPOUR_SMELL))
			continue
		var/smelly_power = vapours.smell_intensity * vapours_t[type]
		if(smelly_power < VAPOUR_SMELL_THRESHOLD)
			continue
		if(!dominant_vapours || smelly_power > dominant_smell_power)
			dominant_vapours = vapours
			dominant_smell_power = smelly_power
	if(!dominant_vapours)
		return

	var/smell_string
	switch(dominant_smell_power)
		if(0 to VAPOUR_SMELL_NORMAL)
			if(sniffer.mob_biotypes & MOB_ROBOTIC)
				smell_string = "Your sensors detect trace amounts of [dominant_vapours.scent] in the air."
			else
				smell_string = "The subtle [dominant_vapours.descriptor] of [dominant_vapours.scent] tickles your nose..."
		if(VAPOUR_SMELL_NORMAL to VAPOUR_SMELL_STRONG)
			if(sniffer.mob_biotypes & MOB_ROBOTIC)
				smell_string = "Your sensors pick up the presence of [dominant_vapours.scent] in the air."
			else
				smell_string = "The [dominant_vapours.descriptor] of [dominant_vapours.scent] fills the air."
		if(VAPOUR_SMELL_STRONG to INFINITY)
			if(sniffer.mob_biotypes & MOB_ROBOTIC)
				smell_string = "Your sensors pick up an intense concentration of [dominant_vapours.scent]."
			else
				smell_string = "The unmistakable [dominant_vapours.descriptor] of [dominant_vapours.scent] bombards your nostrils."

	if(dominant_vapours.descriptor == SCENT_DESC_ODOR)
		to_chat(sniffer, span_warning(smell_string))
	else
		to_chat(sniffer, span_notice(smell_string))

/datum/vapour/proc/ScrubAmount(amount_to_scrub, update_active = TRUE, planetary_multiplier = FALSE)
	var/turf/above_turf = get_step_multiz(my_turf, UP) // z level above, if there is none this is the highest level
	var/pseudo_roof = my_turf.pseudo_roof // roof
	var/area/ms13/area_check = get_area(my_turf) //check for indoor/outdoor areas for the planetary multiplier to apply
	//Dissipate faster when outdoors (no roof, openspace above us or highest z level)
	if(planetary_multiplier && !pseudo_roof && (!above_turf || istype(above_turf, /turf/open/openspace)))
		//This really should use a blacklist not a fucking whitelist, but whatever
		var/static/list/area_whitelist = list(
			/area/ms13 = TRUE,
			/area/ms13/desert = TRUE,
			/area/ms13/legioncamp = TRUE,
			/area/ms13/drylanders = TRUE,
			/area/ms13/rangeroutpost = TRUE,
			/area/ms13/water_baron = TRUE,
			/area/ms13/snow = TRUE,
			/area/ms13/snow/forest = TRUE,
			/area/ms13/snow/lightforest = TRUE,
			/area/ms13/snow/deepforest = TRUE,
		)
		if(area_whitelist[area_check.type])
			amount_to_scrub *= SSvapour.vapour_dissipation_outdoor_multiplier
	amount_to_scrub *= SSvapour.vapour_dissipation_multiplier
	amount_to_scrub *= area_check.dissipation_rate
	//check if we can survive the scrubbing
	if(amount_to_scrub >= total_amount)
		//it's over
		qdel(src)
		return
	for(var/type in vapours_t)
		vapours_t[type] -= amount_to_scrub * (vapours_t[type] / total_amount)
	total_amount -= amount_to_scrub
	UpdateHeight()
	HandleOverlay()
	if(update_active)
		my_turf.UpdateAdjacentVapours()

/datum/vapour/proc/AddVapours(vapours_type, amount)
	if(!vapours_t[vapours_type])
		vapours_t[vapours_type] = 0
	vapours_t[vapours_type] += amount
	total_amount += amount
	UpdateHeight()
	HandleOverlay()
	SET_ACTIVE_VAPOUR(src)

/datum/vapour/proc/AddVapoursList(list/passed_vapours)
	for(var/vapours_type in passed_vapours)
		if(!vapours_t[vapours_type])
			vapours_t[vapours_type] = 0
		vapours_t[vapours_type] += passed_vapours[vapours_type]
		total_amount += passed_vapours[vapours_type]
	UpdateHeight()
	HandleOverlay()
	SET_ACTIVE_VAPOUR(src)

/datum/vapour/proc/UpdateHeight()
	height = CalculateHeight(total_amount)

/datum/vapour/proc/CalculateHeight(passed_amount)
	return CEILING(passed_amount / VAPOUR_HEIGHT_DIVISOR, 1)

/datum/vapour/Destroy()
	if(managed_overlay)
		if(my_turf)
			my_turf.underlays -= managed_overlay
		qdel(managed_overlay)
		managed_overlay = null
	REMOVE_VAPOUR_CURRENTRUN(src)
	SET_UNACTIVE_VAPOUR(src)
	UNREGISTER_VAPOUR(src)
	if(my_turf)
		my_turf.vapour = null
	return ..()


/datum/vapour/proc/ProcessCell()
	if(height <= 1)
		SET_UNACTIVE_VAPOUR(src)
		return
	var/list/sharing_turfs = list()
	var/list/already_processed_cache = SSvapour.processed_this_run
	var/list/potential_activers = list()
	for(var/turf/open/open_turf as anything in my_turf.atmos_adjacent_turfs)
		if(!already_processed_cache[open_turf] && prob(SPREAD_PROBABILITY))
			if(CanShareWith(open_turf))
				sharing_turfs[open_turf] = TRUE
			else
				potential_activers[open_turf] = TRUE
	if(!sharing_turfs.len)
		for(var/turf/open/open_turf as anything in potential_activers)
			if(open_turf.vapour?.CanShareWith(my_turf))
				SET_ACTIVE_VAPOUR(open_turf.vapour)
		SET_UNACTIVE_VAPOUR(src)
		return
	sharing_turfs[my_turf] = TRUE
	//Now we've gotten all the turfs that should share vapour. Gather their total vapours and split evenly
	var/list/total_share_vapours = list()
	var/total_share_amount = 0
	for(var/turf/open/open_turf as anything in sharing_turfs)
		if(!open_turf.vapour)
			continue
		var/datum/vapour/cached_vapour = open_turf.vapour
		for(var/type in cached_vapour.vapours_t)
			if(!total_share_vapours[type])
				total_share_vapours[type] = 0
			total_share_vapours[type] += cached_vapour.vapours_t[type]
			total_share_amount += cached_vapour.vapours_t[type]

	for(var/type in total_share_vapours)
		total_share_vapours[type] /= sharing_turfs.len
	total_share_amount /= sharing_turfs.len
	var/new_heights = CalculateHeight(total_share_amount)
	var/mutable_appearance/new_overlay = GetOverlay(total_share_vapours, total_share_amount)
	for(var/turf/open/open_turf as anything in sharing_turfs)
		AssertVapour(open_turf)
		var/datum/vapour/cached_vapour = open_turf.vapour
		if(cached_vapour.managed_overlay)
			cached_vapour.my_turf.underlays -= cached_vapour.managed_overlay
		cached_vapour.managed_overlay = new_overlay
		if(new_overlay)
			cached_vapour.my_turf.underlays += new_overlay
		cached_vapour.vapours_t = total_share_vapours.Copy()
		cached_vapour.total_amount = total_share_amount
		cached_vapour.height = new_heights
		SET_ACTIVE_VAPOUR(cached_vapour)
	for(var/turf/open/open_turf as anything in potential_activers)
		if(open_turf.vapour?.CanShareWith(my_turf))
			SET_ACTIVE_VAPOUR(open_turf.vapour)

/datum/vapour/proc/CanShareWith(turf/open/shareto)
	if(!shareto.vapour)
		return TRUE
	if(shareto.vapour.height + 1 < height)
		return TRUE
	return FALSE

/datum/vapour/proc/AssertVapour(turf/open/to_assert)
	if(!to_assert.vapour)
		new /datum/vapour(to_assert)

/datum/vapour/proc/HandleOverlay()
	if(managed_overlay)
		my_turf.underlays -= managed_overlay
	managed_overlay = GetOverlay(vapours_t, total_amount)
	if(managed_overlay)
		my_turf.underlays += managed_overlay

///Probably the most costly thing happening here
/datum/vapour/proc/GetOverlay(list/vapours_list, total_amount)
	var/datum/vapours/vapours
	var/total_thickness
	if(vapours_list.len == 1)
		vapours = SSvapour.singletons[vapours_list[1]]
		if(!(vapours.vapours_flags & VAPOUR_APPEARANCE))
			return
		total_thickness = total_amount * vapours.thickness
	else
		var/list/vapours_cache = SSvapour.singletons
		var/datum/vapours/iterated_vapours
		var/calc_thickness
		for(var/vapours_type in vapours_list)
			iterated_vapours = vapours_cache[vapours_type]
			if(!(iterated_vapours.vapours_flags & VAPOUR_APPEARANCE))
				continue
			calc_thickness = vapours_list[vapours_type] * iterated_vapours.thickness
			if(!vapours || calc_thickness > total_thickness)
				vapours = iterated_vapours
				total_thickness = calc_thickness

	if(!total_thickness || total_thickness < VAPOUR_APPEARANCE_THICKNESS_THRESHOLD)
		return

	var/mutable_appearance/overlay = mutable_appearance('mojave/icons/effects/smoke.dmi', "smoke", VAPOUR_LAYER, VAPOUR_PLANE, appearance_flags = KEEP_APART|RESET_TRANSFORM|RESET_COLOR)
	overlay.pixel_x = -8
	overlay.pixel_y = 6
	overlay.alpha = FLOOR(vapours.alpha * total_thickness * THICKNESS_ALPHA_COEFFICIENT, 1)
	overlay.color = vapours.color
	return overlay

///Atmos adjacency has been updated on this turf, see if it affects any of our vapours
/turf/proc/UpdateAdjacentVapours()
	for(var/turf/open/open_turf as anything in atmos_adjacent_turfs)
		if(open_turf.vapour)
			SET_ACTIVE_VAPOUR(open_turf.vapour)

#undef SPREAD_PROBABILITY

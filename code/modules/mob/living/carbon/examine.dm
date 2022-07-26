/mob/living/carbon/examine(mob/user)
	var/t_He = p_they(TRUE)
	var/t_His = p_their(TRUE)
	var/t_his = p_their()
	var/t_him = p_them()
	var/t_has = p_have()
	var/t_is = p_are()

	. = list("<span class='info'>*---------*\nThis is [icon2html(src, user)] \a <EM>[src]</EM>!")
	var/obscured = check_obscured_slots()

	if (handcuffed)
		. += span_warning("[t_He] [t_is] [icon2html(handcuffed, user)] handcuffed!")
	if (head)
		. += "[t_He] [t_is] wearing [head.get_examine_string(user)] on [t_his] head. "
	if(wear_mask && !(obscured & ITEM_SLOT_MASK))
		. += "[t_He] [t_is] wearing [wear_mask.get_examine_string(user)] on [t_his] face."
	if(wear_neck && !(obscured & ITEM_SLOT_NECK))
		. += "[t_He] [t_is] wearing [wear_neck.get_examine_string(user)] around [t_his] neck."

	for(var/obj/item/I in held_items)
		if(!(I.item_flags & ABSTRACT))
			. += "[t_He] [t_is] holding [I.get_examine_string(user)] in [t_his] [get_held_index_name(get_held_index_of_item(I))]."

	if (back)
		. += "[t_He] [t_has] [back.get_examine_string(user)] on [t_his] back."
	var/appears_dead = FALSE
	if (stat == DEAD)
		appears_dead = TRUE
		if(getorgan(/obj/item/organ/brain))
			. += span_deadsay("[t_He] [t_is] limp and unresponsive, with no signs of life.")
		else if(get_bodypart(BODY_ZONE_HEAD))
			. += span_deadsay("It appears that [t_his] brain is missing...")

	var/list/msg = list("<span class='warning'>")
	var/list/missing = list(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_R_ARM, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_LEG)
	var/list/disabled = list()
	for(var/X in bodyparts)
		var/obj/item/bodypart/BP = X
		if(BP.bodypart_disabled)
			disabled += BP
		missing -= BP.body_zone
		for(var/obj/item/I in BP.embedded_objects)
			if(I.isEmbedHarmless())
				msg += "<B>[t_He] [t_has] [icon2html(I, user)] \a [I] stuck to [t_his] [BP.name]!</B>\n"
			else
				msg += "<B>[t_He] [t_has] [icon2html(I, user)] \a [I] embedded in [t_his] [BP.name]!</B>\n"
		for(var/i in BP.wounds)
			var/datum/wound/W = i
			msg += "[W.get_examine_description(user)]\n"

	for(var/X in disabled)
		var/obj/item/bodypart/BP = X
		var/damage_text
		if(!(BP.get_damage(include_stamina = FALSE) >= BP.max_damage)) //Stamina is disabling the limb
			damage_text = "limp and lifeless"
		else
			damage_text = (BP.brute_dam >= BP.burn_dam) ? BP.heavy_brute_msg : BP.heavy_burn_msg
		msg += "<B>[capitalize(t_his)] [BP.name] is [damage_text]!</B>\n"

	for(var/t in missing)
		if(t==BODY_ZONE_HEAD)
			msg += "[span_deadsay("<B>[t_His] [parse_zone(t)] is missing!</B>")]\n"
			continue
		msg += "[span_warning("<B>[t_His] [parse_zone(t)] is missing!</B>")]\n"


	var/temp = getBruteLoss()
	if(!(user == src && src.hal_screwyhud == SCREWYHUD_HEALTHY)) //fake healthy
		if(temp)
			if (temp < 25)
				msg += "[t_He] [t_has] minor bruising.\n"
			else if (temp < 50)
				msg += "[t_He] [t_has] <b>moderate</b> bruising!\n"
			else
				msg += "<B>[t_He] [t_has] severe bruising!</B>\n"

		temp = getFireLoss()
		if(temp)
			if (temp < 25)
				msg += "[t_He] [t_has] minor burns.\n"
			else if (temp < 50)
				msg += "[t_He] [t_has] <b>moderate</b> burns!\n"
			else
				msg += "<B>[t_He] [t_has] severe burns!</B>\n"

		temp = getCloneLoss()
		if(temp)
			if(temp < 25)
				msg += "[t_He] [t_is] slightly deformed.\n"
			else if (temp < 50)
				msg += "[t_He] [t_is] <b>moderately</b> deformed!\n"
			else
				msg += "<b>[t_He] [t_is] severely deformed!</b>\n"

	if(HAS_TRAIT(src, TRAIT_DUMB))
		msg += "[t_He] seem[p_s()] to be clumsy and unable to think.\n"

	if(fire_stacks > 0)
		msg += "[t_He] [t_is] covered in something flammable.\n"
	if(fire_stacks < 0)
		msg += "[t_He] look[p_s()] a little soaked.\n"

	if(pulledby?.grab_state)
		msg += "[t_He] [t_is] restrained by [pulledby]'s grip.\n"

	var/scar_severity = 0
	for(var/i in all_scars)
		var/datum/scar/S = i
		if(S.is_visible(user))
			scar_severity += S.severity

	switch(scar_severity)
		if(1 to 4)
			msg += "[span_tinynoticeital("[t_He] [t_has] visible scarring, you can look again to take a closer look...")]\n"
		if(5 to 8)
			msg += "[span_smallnoticeital("[t_He] [t_has] several bad scars, you can look again to take a closer look...")]\n"
		if(9 to 11)
			msg += "[span_notice("<i>[t_He] [t_has] significantly disfiguring scarring, you can look again to take a closer look...</i>")]\n"
		if(12 to INFINITY)
			msg += "[span_notice("<b><i>[t_He] [t_is] just absolutely fucked up, you can look again to take a closer look...</i></b>")]\n"

	msg += "</span>"

	. += msg.Join("")

	if(!appears_dead)
		switch(stat)
			if(SOFT_CRIT)
				. += "[t_His] breathing is shallow and labored."
			if(UNCONSCIOUS, HARD_CRIT)
				. += "[t_He] [t_is]n't responding to anything around [t_him] and seems to be asleep."

	var/trait_exam = common_trait_examine()
	if (!isnull(trait_exam))
		. += trait_exam

	var/datum/component/mood/mood = src.GetComponent(/datum/component/mood)
	if(mood)
		switch(mood.shown_mood)
			if(-INFINITY to MOOD_LEVEL_SAD4)
				. += "[t_He] look[p_s()] depressed."
			if(MOOD_LEVEL_SAD4 to MOOD_LEVEL_SAD3)
				. += "[t_He] look[p_s()] very sad."
			if(MOOD_LEVEL_SAD3 to MOOD_LEVEL_SAD2)
				. += "[t_He] look[p_s()] a bit down."
			if(MOOD_LEVEL_HAPPY2 to MOOD_LEVEL_HAPPY3)
				. += "[t_He] look[p_s()] quite happy."
			if(MOOD_LEVEL_HAPPY3 to MOOD_LEVEL_HAPPY4)
				. += "[t_He] look[p_s()] very happy."
			if(MOOD_LEVEL_HAPPY4 to INFINITY)
				. += "[t_He] look[p_s()] ecstatic."
	. += "*---------*</span>"

	SEND_SIGNAL(src, COMSIG_PARENT_EXAMINE, user, .)
	// MOJAVE SUN EDIT BEGIN
	if(on_examined_check(user, FALSE))
		user.on_examine_atom(src, FALSE)
	//MOJAVE SUN EDIT END
/mob/living/carbon/examine_more(mob/user)
	// MOJAVE SUN EDIT BEGIN

	var/msg = list("<span class='notice'><i>You examine [src] closer, and note the following...</i></span>") // ORIGINAL IS - if(!all_scars)
	var/t_His = p_their(TRUE) // ORIGINAL IS - 	return ..()
	var/t_He = p_they(TRUE)
	var/t_Has = p_have()

	var/any_bodypart_damage = FALSE
	for(var/X in bodyparts)
		var/obj/item/bodypart/LB = X
		if(LB.is_pseudopart)
			continue
		var/limb_max_damage = LB.max_damage
		var/status = ""
		var/brutedamage = round(LB.brute_dam/limb_max_damage*100)
		var/burndamage = round(LB.burn_dam/limb_max_damage*100)
		switch(brutedamage)
			if(20 to 50)
				status = LB.light_brute_msg
			if(51 to 75)
				status = LB.medium_brute_msg
			if(76 to 100)
				status += LB.heavy_brute_msg

		if(burndamage >= 20 && status)
			status += "and "
			switch(burndamage)
				if(20 to 50)
					status += LB.light_burn_msg
				if(51 to 75)
					status += LB.medium_burn_msg
				if(76 to 100)
					status += LB.heavy_burn_msg

		if(status)
			any_bodypart_damage = TRUE
			msg += "\t<span class='warning'>[t_His] [LB.name] is [status].</span>"

		for(var/thing in LB.wounds)
			any_bodypart_damage = TRUE
			var/datum/wound/W = thing
			switch(W.severity)
				if(WOUND_SEVERITY_TRIVIAL)
					msg += "\t<span class='warning'>[t_His] [LB.name] is suffering [W.a_or_from] [W.get_topic_name(user)].</span>"
				if(WOUND_SEVERITY_MODERATE)
					msg += "\t<span class='warning'>[t_His] [LB.name] is suffering [W.a_or_from] [W.get_topic_name(user)]!</span>"
				if(WOUND_SEVERITY_SEVERE)
					msg += "\t<span class='warning'><b>[t_His] [LB.name] is suffering [W.a_or_from] [W.get_topic_name(user)]!</b></span>"
				if(WOUND_SEVERITY_CRITICAL)
					msg += "\t<span class='warning'><b>[t_His] [LB.name] is suffering [W.a_or_from] [W.get_topic_name(user)]!!</b></span>"
		if(LB.current_gauze)
			var/datum/bodypart_aid/current_gauze = LB.current_gauze
			msg += "\t<span class='notice'><i>[t_His] [LB.name] is [current_gauze.desc_prefix] with <a href='?src=[REF(current_gauze)];remove=1'>[current_gauze.get_description()]</a>.</i></span>"
		if(LB.current_splint)
			var/datum/bodypart_aid/current_splint = LB.current_splint
			msg += "\t<span class='notice'><i>[t_His] [LB.name] is [current_splint.desc_prefix] with <a href='?src=[REF(current_splint)];remove=1'>[current_splint.get_description()]</a>.</i></span>"

	if(!any_bodypart_damage)
		msg += "\t<span class='smallnotice'><i>[t_He] [t_Has] no significantly damaged bodyparts.</i></span>"

	// MOJAVE SUN EDIT BEGIN
	var/list/visible_scars
	if(all_scars) // ORIGINAL IS for(var/i in all_scars)
		for(var/i in all_scars) // ORIGINAL IS 	var/datum/scar/S = i
			var/datum/scar/S = i // ORIGINAL IS 	if(S.is_visible(user))
			if(S.is_visible(user)) // ORIGINAL IS 		LAZYADD(visible_scars, S)
				LAZYADD(visible_scars, S)
	if(!visible_scars)
		msg |= "\t<span class='smallnotice'><i>[t_He] [t_Has] no visible scars.</i></span>" // ORIGINAL IS	return ..()
	else
		for(var/i in visible_scars)
			var/datum/scar/S = i
			var/scar_text = S.get_examine_description(user)
			if(scar_text)
				msg += "[scar_text]"

	//var/msg = list(span_notice("<i>You examine [src] closer, and note the following...</i>"))
	//for(var/i in visible_scars)
	//	var/datum/scar/S = i
	//	var/scar_text = S.get_examine_description(user)
	//	if(scar_text)
	//		msg += "[scar_text]"

	if(on_examined_check(user, TRUE))
		user.on_examine_atom(src, TRUE)
	// MOJAVE SUN EDIT END
	return msg

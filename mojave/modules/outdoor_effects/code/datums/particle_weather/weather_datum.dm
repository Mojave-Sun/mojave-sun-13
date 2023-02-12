#define GLE_STAGE_NONE		FALSE
#define GLE_STAGE_FIRST		1
#define GLE_STAGE_SECOND	2
#define GLE_STAGE_THIRD		3
#define GLE_STAGE_FOUR		4
#define GLE_TAGE_FIVE		5
#define GLE_STAGE_SIX		6

//SPECIAL EVENTS
/datum/weather_event
	var/name = ""
	var/affecting_value
	var/duration = 0
	var/started_at = 0
	var/repeats = 0
	var/max_stages = 0
	var/stage = GLE_STAGE_NONE
	var/stage_processing = FALSE
	var/datum/particle_weather/initiator_ref

/datum/weather_event/New(datum/particle_weather/particle_weather)
	..()
	initiator_ref = particle_weather
	start_process()

/datum/weather_event/proc/start_process()
	return

/datum/weather_event/proc/stage_process()
	return

/datum/weather_event/thunder
	name = "Thunder"
	duration = 1 SECONDS
	affecting_value = list("#74DFF7", "#81A7DB", "#7997FC")
	max_stages = 3
	stage = GLE_STAGE_FIRST
	var/sound_effects = list(
		'sound/weather/rain/thunder_1.ogg', 'sound/weather/rain/thunder_2.ogg', 'sound/weather/rain/thunder_3.ogg', 'sound/weather/rain/thunder_4.ogg',
		'sound/weather/rain/thunder_5.ogg', 'sound/weather/rain/thunder_6.ogg', 'sound/weather/rain/thunder_7.ogg',
	)

/datum/weather_event/thunder/start_process()
	repeats = prob(30) ? 2 : 1
	affecting_value = pick(affecting_value)
	stage_processing = TRUE
	stage_process()
	duration = duration + rand(-duration*5, duration*10)/10
	SSoutdoor_effects.weather_light_affecting_event = src
	spawn(duration - rand(0, duration*10)/10)
		playsound_z(SSmapping.levels_by_trait(ZTRAIT_STATION), pick(sound_effects))

/datum/weather_event/thunder/stage_process()
	var/color_animating
	var/animate_flags = CIRCULAR_EASING
	switch(stage)
		if(GLE_STAGE_FIRST)
			color_animating = affecting_value
			animate_flags = ELASTIC_EASING | EASE_IN | EASE_OUT
		if(GLE_STAGE_THIRD)
			color_animating = SSoutdoor_effects.current_color
			animate_flags = CIRCULAR_EASING | EASE_IN

	if(color_animating)
		animate(SSoutdoor_effects.sun_color, color = color_animating, easing = animate_flags, time = duration)
		sleep(5)

	sleep(duration)
	stage++
	if(repeats)
		repeats--
		stage = initial(stage)
		start_process()
		return

	else if(stage > max_stages)
		SSoutdoor_effects.weather_light_affecting_event = null
		SSoutdoor_effects.transition_sunlight_color()
		qdel(src)
		return

	stage_process()

/datum/weather_event/wind
	name = "Wind"
	duration = 10 SECONDS
	affecting_value = list("min_value" = 20, "max_value" = 80)
	max_stages = 2
	stage = GLE_STAGE_FIRST

/datum/weather_event/wind/start_process()
	duration = duration + rand(-duration, duration)
	stage_processing = TRUE
	stage_process()

/datum/weather_event/wind/stage_process()
	switch(stage)
		if(GLE_STAGE_FIRST)
			initiator_ref.wind_severity = rand(affecting_value["min_value"], affecting_value["max_value"])
		if(GLE_STAGE_SECOND)
			initiator_ref.wind_severity = rand(0, affecting_value["max_value"])
		if(GLE_STAGE_THIRD)
			initiator_ref.wind_severity = rand(0, affecting_value["min_value"])

	initiator_ref.change_severity(FALSE)

	sleep(duration)
	stage++
	if(repeats)
		repeats--
		stage = initial(stage)
		start_process()
		return

	else if(stage > max_stages)
		SSoutdoor_effects.weather_light_affecting_event = null
		SSoutdoor_effects.transition_sunlight_color()
		initiator_ref.wind_severity = 0
		qdel(src)
		return

	stage_process()


/datum/weather_effect
	var/name = "effect"
	var/probability = 0
	var/datum/particle_weather/initiator_ref

/datum/weather_effect/proc/create_effect(turf/target_turf)
	return FALSE

/datum/weather_effect/snow
	name = "snow effect"
	probability = 10

/datum/weather_effect/snow/create_effect(turf/target_turf)
	if(prob(probability))
		target_turf.snow = new /obj/structure/snow(target_turf)


/obj/structure/snow
	name = "Snow"
	desc = "Big pile of snow"
//	icon = 'icons/effects/snow.dmi'
	icon_state = "snow_1"
	var/icon_prefix = "snow"
	anchored = TRUE
	density = FALSE
	var/throwpass = TRUE //You can throw objects over this, despite its density.
	plane = GAME_PLANE
	layer = LOW_OBJ_LAYER
	flags_1 = ON_BORDER_1
	smoothing_flags = SMOOTH_BITMASK|SMOOTH_BORDER
	smoothing_groups = list(SMOOTH_GROUP_SNOW, SMOOTH_GROUP_TURF_OPEN)
	canSmoothWith = list(SMOOTH_GROUP_SNOW, SMOOTH_GROUP_TURF_OPEN)
	var/list/obj/structure/snow/connected_snow = list()
	var/bleed_layer = 1
	var/pts = 0
	var/list/layer_name = list("Snow", "Snow", "Snow", "Snow", "Snow", "Snow")
	var/list/overlays_by_mob = list()
	var/list/corners_overlays = list()
	var/atom/movable/overlay
	var/list/diged = list(SOUTH = FALSE, NORTH = FALSE, WEST = FALSE, EAST = FALSE)

/obj/structure/snow/New()
	setDir(pick(GLOB.alldirs))
	QUEUE_SMOOTH(src)
	for(var/direction in GLOB.alldirs)
		var/turf/T = get_step(get_turf(src), direction)
		if(T)
			connected_snow += T.snow
	update_icon()
/obj/structure/snow/CanPass(atom/movable/mover, border_dir)
	. = ..()
	return throwpass

/obj/structure/snow/update_icon()
	icon_state = "[icon_prefix]_[bleed_layer]"
	setDir(pick(NORTH,SOUTH,EAST,WEST,NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST))

	var/name_to_set = layer_name[bleed_layer]
	throwpass = bleed_layer < 4 ? TRUE : FALSE
	density = bleed_layer < 5 ? FALSE : TRUE
	layer = bleed_layer < 4 ? LOW_OBJ_LAYER : OBJ_LAYER
//	overlay = GLOB.tall_overlays[bleed_layer]

	name = name_to_set

	update_corners()
	update_overlays()

	..()

/obj/structure/snow/update_overlays()
	. = ..()
	if(overlays)
		overlays.Cut()

	var/new_overlay = ""
	for(var/i in diged)
		new_overlay += i
	overlays += "[new_overlay]"

	for(var/image/i in corners_overlays)
		overlays += corners_overlays

/obj/structure/snow/proc/update_corners()
	for(var/dirn in GLOB.alldirs)
		var/turf/turf = get_step(get_turf(src), dirn)
		if(!turf)
			continue
		var/obj/structure/snow/turf_snow = turf.snow
		if(!turf_snow || turf_snow.bleed_layer < bleed_layer)
			var/image/I = new(icon, "snow_[(dirn & (dirn-1)) ? "outercorner" : pick("innercorner", "outercorner")]", dir = dirn)
			switch(dirn)
				if(NORTH)
					I.pixel_y = 32
				if(SOUTH)
					I.pixel_y = -32
				if(EAST)
					I.pixel_x = 32
				if(WEST)
					I.pixel_x = -32
				if(NORTHEAST)
					I.pixel_x = 32
					I.pixel_y = 32
				if(SOUTHEAST)
					I.pixel_x = 32
					I.pixel_y = -32
				if(NORTHWEST)
					I.pixel_x = -32
					I.pixel_y = 32
				if(SOUTHWEST)
					I.pixel_x = -32
					I.pixel_y = -32

			I.layer = layer + 0.001 + bleed_layer * 0.0001
			corners_overlays += I

/obj/structure/snow/proc/weathered(datum/weather_effect/effect)
	if(pts < bleed_layer * 4)
		pts++
		for(var/i in diged)
			diged[i] = FALSE
		update_overlays()
	else
		pts = 0
		changing_layer(min(bleed_layer + 1, MAX_LAYER_CUTTING_LEVELS))

/obj/structure/snow/proc/changing_layer(var/new_layer)
	if(isnull(new_layer) || new_layer == bleed_layer)
		return

	bleed_layer = max(0, new_layer)
	for(var/obj/structure/snow/snow in connected_snow)
		snow.update_icon()

	for(var/mob/living/carbon/carbon in overlays_by_mob)
		carbon.overlays -= overlays_by_mob[carbon]
		overlays_by_mob[carbon] = overlay
		carbon.overlays += overlays_by_mob[carbon]

	if(!bleed_layer)
		qdel(src)

	update_icon()

/obj/structure/snow/ex_act(severity)
	switch(severity)
		if(0 to 100)
			if(prob(20) && bleed_layer)
				var/new_bleed_layer = min(0, bleed_layer - 1)
				addtimer(CALLBACK(src, .proc/changing_layer, new_bleed_layer), 1)
		if(100 to 200)
			if(prob(60) && bleed_layer)
				var/new_bleed_layer = max(bleed_layer - 2, 0)
				addtimer(CALLBACK(src, .proc/changing_layer, new_bleed_layer), 1)
		if(300 to INFINITY)
			if(bleed_layer)
				addtimer(CALLBACK(src, .proc/changing_layer, 0), 1)

/obj/structure/snow/Entered(atom/movable/arrived)
	if(iscarbon(arrived))
		var/mob/living/carbon/carbon = arrived
		if(bleed_layer > 1)
			overlays_by_mob[carbon] = overlay
			carbon.overlays += overlays_by_mob[carbon]
	//		var/slow_amount = 0.35
	//		var/can_stuck = 1
	//		var/new_slowdown = carbon.next_move_slowdown + (slow_amount * bleed_layer)
			if(prob(2))
				to_chat(carbon, span_warning("Moving through [src] slows you down.")) //Warning only
			else if(bleed_layer == 4 && prob(2))
				to_chat(carbon, span_warning("You get stuck in [src] for a moment!"))
	//			new_slowdown += 10
	//		carbon.next_move_slowdown = new_slowdown
		set_diged_ways(REVERSE_DIR(carbon.dir))
	..()

/obj/structure/snow/Exited(atom/movable/gone, direction)
	if(iscarbon(gone))
		var/mob/living/carbon/carbon = gone
		carbon.overlays -= overlays_by_mob[carbon]
		set_diged_ways(direction)
	..()

/obj/structure/snow/proc/set_diged_ways(dir)
	diged[dir] = TRUE
	update_overlays()

/datum/particle_weather
	var/name = "set this"
	var/display_name = "set this"
	var/desc = "set this"

	var/list/weather_messages = list()
	var/list/weather_warnings = list("siren" = null, "message" = TRUE)
	var/list/weather_sounds = list()
	var/list/wind_sounds = list(/datum/looping_sound/wind)
	var/scale_vol_with_severity = TRUE

	var/particles/weather/particle_effect_type = /particles/weather/rain

	var/weather_duration_lower = 5 MINUTES
	var/weather_duration_upper = 20 MINUTES

	var/damage_type = null
	var/damage_per_tick = 0
	var/wind_severity = 0
	var/min_severity = 1
	var/max_severity = 100
	var/max_severity_change = 20
	var/severity_steps = 5
	var/immunity_type = TRAIT_WEATHER_IMMUNE
	var/probability = 0

	var/target_trait = PARTICLEWEATHER_RAIN
	var/severity_steps_taken = 0
	var/running = FALSE
	var/severity = 0
	var/barometer_predictable = FALSE

	COOLDOWN_DECLARE(time_left)
	var/weather_duration = 0
	var/weather_start_time = 0

	var/weather_special_effect
	var/list/weather_additional_events = list()
	var/list/datum/weather_event/weather_additional_ongoing_events = list()
	var/list/messaged_mobs = list()
	var/list/current_sounds = list()
	var/list/current_wind_sounds = list()
	var/list/affected_zlevels = list()
	var/fire_smothering_strength = 0

	var/last_message = ""

/datum/particle_weather/proc/severity_mod()
	return severity / max_severity

/datum/particle_weather/proc/tick()
	if(weather_additional_events)
		for(var/event in weather_additional_events)
			if(!prob(weather_additional_events[event][1]))
				continue
			var/str = weather_additional_events[event][2]
			weather_additional_ongoing_events += new str(src)

/datum/particle_weather/Destroy()
	for(var/S in current_sounds)
		var/datum/looping_sound/looping_sound = current_sounds[S]
		looping_sound.stop()
		qdel(looping_sound)

	for(var/S in current_wind_sounds)
		var/datum/looping_sound/looping_sound = current_wind_sounds[S]
		looping_sound.stop()
		qdel(looping_sound)

	return ..()

/datum/particle_weather/proc/start()
	if(running)
		return
	weather_duration = rand(weather_duration_lower, weather_duration_upper)
	COOLDOWN_START(src, time_left, weather_duration)
	weather_start_time = world.time
	running = TRUE
	addtimer(CALLBACK(src, .proc/wind_down), weather_duration)
	weather_warnings()
	if(particle_effect_type)
		SSparticle_weather.set_particle_effect(new particle_effect_type);

	SSparticle_weather.weather_special_effect = new weather_special_effect(src)

	change_severity()


/datum/particle_weather/proc/change_severity(as_step = TRUE)
	if(!running)
		return
	if(as_step)
		severity_steps_taken++

	if(max_severity_change == 0)
		severity = rand(min_severity, max_severity)
	else
		var/new_severity = severity + rand(-max_severity_change,max_severity_change)
		new_severity = min(max(new_severity,min_severity), max_severity)
		severity = new_severity

	severity += wind_severity

	if(SSparticle_weather.particle_effect)
		SSparticle_weather.particle_effect.animate_severity(severity_mod())

	if(last_message != scale_range_pick(min_severity, max_severity, severity, weather_messages))
		messaged_mobs = list()

	if(severity_steps_taken < severity_steps && as_step)
		addtimer(CALLBACK(src, .proc/change_severity), weather_duration / severity_steps)

/datum/particle_weather/proc/wind_down()
	severity = 0
	if(SSparticle_weather.particle_effect)
		SSparticle_weather.particle_effect.animate_severity(severity_mod())

		//Wait for the last particle to fade, then qdel yourself
		addtimer(CALLBACK(src, .proc/end), SSparticle_weather.particle_effect.lifespan + SSparticle_weather.particle_effect.fade)

/datum/particle_weather/proc/end()
	running = FALSE
	SSparticle_weather.stop_weather()

/datum/particle_weather/proc/can_weather(mob/living/mob_to_check)
	var/turf/mob_turf = get_turf(mob_to_check)

	if(!mob_turf)
		return

	if(mob_turf.turf_flags & TURF_WEATHER)
		return TRUE

	return FALSE

/datum/particle_weather/proc/can_weather_effect(mob/living/mob_to_check)

	//If mob is not in a turf
	var/turf/mob_turf = get_turf(mob_to_check)
	var/atom/loc_to_check = mob_to_check.loc
	while(loc_to_check != mob_turf)
		if((immunity_type && HAS_TRAIT(loc_to_check, immunity_type)) || HAS_TRAIT(loc_to_check, TRAIT_WEATHER_IMMUNE))
			return
		loc_to_check = loc_to_check.loc

	return TRUE

/datum/particle_weather/proc/process_mob_effect(mob/living/L, delta_time)
	if(can_weather(L) && running)
		weather_sound_effect(L)
		if(can_weather_effect(L))
			if((last_message || weather_messages) && (!messaged_mobs[L] || world.time > messaged_mobs[L]))
				weather_message(L)
			affect_mob_effect(L, delta_time)
	else
		stop_weather_sound_effect(L)
		messaged_mobs[L] = 0

/datum/particle_weather/proc/affect_mob_effect(mob/living/L, delta_time, calculated_damage)
	if(damage_per_tick)
		calculated_damage = damage_per_tick * delta_time
		L.apply_damage(calculated_damage, damage_type)

/datum/particle_weather/proc/weather_sound_effect(mob/living/L)
	var/datum/looping_sound/current_sound = current_sounds[L]
	if(current_sound)
		//SET VOLUME
		if(scale_vol_with_severity)
			current_sound.volume = initial(current_sound.volume) * severity_mod()
		if(!current_sound.loop_started) //don't restart already playing sounds
			current_sound.start()
		return

	var/temp_sound = scale_range_pick(min_severity, max_severity, severity, weather_sounds)
	if(temp_sound)
		current_sound = new temp_sound(L, FALSE, TRUE, FALSE, CHANNEL_WEATHER)
		current_sounds[L] = current_sound
		//SET VOLUME
		if(scale_vol_with_severity)
			current_sound.volume = initial(current_sound.volume) * severity_mod()
		current_sound.start()

	if(wind_severity && weather_sounds)
		var/datum/looping_sound/current_wind_sound = current_wind_sounds[L]
		if(current_wind_sound)
			//SET VOLUME
			if(scale_vol_with_severity)
				current_wind_sound.volume = initial(current_wind_sound.volume) * severity_mod()
			if(!current_wind_sound.loop_started) //don't restart already playing sounds
				current_wind_sound.start()
			return

		var/temp_wind_sound = scale_range_pick(min_severity, max_severity, severity, wind_sounds)
		if(temp_wind_sound)
			current_wind_sound = new temp_wind_sound(L, FALSE, TRUE, FALSE, CHANNEL_WEATHER)
			current_wind_sounds[L] = current_wind_sound
			//SET VOLUME
			if(scale_vol_with_severity)
				current_wind_sound.volume = initial(current_wind_sound.volume) * severity_mod()
			current_wind_sound.start()


/datum/particle_weather/proc/stop_weather_sound_effect(mob/living/L)
	var/datum/looping_sound/current_sound = current_sounds[L]
	if(current_sound)
		current_sound.stop()
	var/datum/looping_sound/current_wind_sound = current_wind_sounds[L]
	if(current_wind_sound)
		current_wind_sound.stop()

/datum/particle_weather/proc/weather_message(mob/living/L)
	messaged_mobs[L] = world.time + WEATHER_MESSAGE_DELAY
	last_message = scale_range_pick(min_severity, max_severity, severity, weather_messages)
	if(last_message)
		to_chat(L, span_danger(last_message))

/datum/particle_weather/proc/weather_warnings()
	switch(weather_warnings)
		if("siren")
			for(var/obj/machinery/siren/weather/weather_siren in GLOB.siren_objects["weather"])
				if(weather_siren.z in affected_zlevels)
					weather_siren.siren_warning(weather_warnings["siren"])
		if("message")
			var/message = "Incoming [display_name]"
			if(length(weather_warnings["message"]))
				var/weather_message = weather_warnings["message"]
				message += weather_message
			for(var/mob/living/carbon/human/affected_human in GLOB.alive_mob_list)
				if(!affected_human.stat && affected_human.client && (affected_human.z in affected_zlevels))
					affected_human.playsound_local('sound/effects/radiostatic.ogg', affected_human.loc, 25, FALSE)
					affected_human.play_screen_text("<span class='langchat' style=font-size:16pt;text-align:center valign='top'><u>Weather Alert:</u></span><br>" + message["human"], /atom/movable/screen/text/screen_text/command_order, rgb(103, 214, 146))
    return FALSE

/datum/looping_sound/dust_storm
	mid_sounds = 'sound/weather/dust/weather_dust.ogg'
	mid_length = 80
	volume = 150

/datum/looping_sound/rain
	mid_sounds = 'sound/weather/rain/weather_rain.ogg'
	mid_length = 40 SECONDS
	volume = 200

/datum/looping_sound/storm
	mid_sounds = 'sound/weather/rain/weather_storm.ogg'
	mid_length = 30 SECONDS
	volume = 150

/datum/looping_sound/snow
	mid_sounds = 'sound/weather/snow/weather_snow.ogg'
	mid_length = 50 SECONDS
	volume = 150

/datum/looping_sound/wind
	mid_sounds = 'sound/weather/rain/wind_1.ogg'
	mid_sounds = list(
		'sound/weather/rain/wind_1.ogg'=1,
		'sound/weather/rain/wind_2.ogg'=1,
		'sound/weather/rain/wind_3.ogg'=1,
		'sound/weather/rain/wind_4.ogg'=1,
		'sound/weather/rain/wind_5.ogg'=1,
		'sound/weather/rain/wind_6.ogg'=1
		)
	mid_length = 30 SECONDS
	volume = 150

/obj/machinery/siren
	name = "Siren"
	desc = "A siren used to play warnings."
	icon = 'icons/obj/loudspeaker.dmi'
	icon_state = "loudspeaker"
	density = 0
	anchored = 1
	use_power = 0
	var/message = "WARNING, AMOGUS"
	var/sound = 'sound/effects/weather_warning.ogg'
	var/siren_lt = "siren"

/obj/machinery/siren/Initialize()
	. = ..()
	GLOB.siren_objects["[siren_lt]"] += list(src)

/obj/machinery/siren/proc/siren_warning(var/msg = "WARNING, AMOGUS.", var/sound_ch = 'sound/effects/weather_warning.ogg')
	playsound(loc, sound_ch, 80, 0)
	visible_message(span_danger("[src] make signal. [msg]."))

/obj/machinery/siren/proc/siren_warning_start(var/msg, var/sound_ch = 'sound/effects/weather_warning.ogg')
	if(!msg)
		return
	message = msg
	sound = sound_ch
	START_PROCESSING(SSprocessing, src)

/obj/machinery/siren/proc/siren_warning_stop()
	STOP_PROCESSING(SSprocessing, src)

/obj/machinery/siren/process()
	if(prob(2))
		playsound(loc, sound, 80, 0)
		visible_message(span_danger("[src] make signal. [message]."))

/obj/machinery/siren/weather
	name = "Weather Siren"
	desc = "A siren used to play weather warnings for the colony."
	siren_lt = "weather"

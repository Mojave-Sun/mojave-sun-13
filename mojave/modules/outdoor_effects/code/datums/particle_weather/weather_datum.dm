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
	duration = 1.5 SECONDS
	affecting_value = list("#74DFF7", "#81A7DB", "#7997FC", "#5b73c3", "#2e5fff")
	max_stages = 3
	stage = GLE_STAGE_FIRST
	var/sound_effects = list(
		'sound/weather/rain/thunder_1.ogg', 'sound/weather/rain/thunder_2.ogg', 'sound/weather/rain/thunder_3.ogg', 'sound/weather/rain/thunder_4.ogg',
		'sound/weather/rain/thunder_5.ogg', 'sound/weather/rain/thunder_6.ogg', 'sound/weather/rain/thunder_7.ogg',
	)

/datum/weather_event/thunder/start_process()
	repeats = rand(1, 3)
	duration = duration + rand(-duration*5, duration*10)/10
	SSoutdoor_effects.weather_light_affecting_event = src
	stage_processing = TRUE
	stage_process()

/datum/weather_event/thunder/stage_process()
	var/color_animating
	var/animate_flags = CIRCULAR_EASING
	switch(stage)
		if(GLE_STAGE_FIRST)
			color_animating = pick(affecting_value)
			animate_flags = ELASTIC_EASING | EASE_IN | EASE_OUT
			spawn(duration - rand(0, duration*10)/10)
				playsound_z(SSmapping.levels_by_trait(ZTRAIT_STATION), pick(sound_effects))
		if(GLE_STAGE_THIRD)
			color_animating = SSoutdoor_effects.current_color
			animate_flags = CIRCULAR_EASING | EASE_IN

	if(color_animating)
		animate(SSoutdoor_effects.sun_color, color = color_animating, easing = animate_flags, time = duration)

	sleep(duration)
	stage++
	if(repeats && stage > max_stages)
		repeats--
		stage = GLE_STAGE_FIRST
		sleep(duration)

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

/datum/weather_effect/proc/effect_affect(turf/target_turf)
	return FALSE

/datum/weather_effect/rain
	name = "rain effect"
	probability = 20

/datum/weather_effect/rain/effect_affect(turf/target_turf)
	for(var/obj/effect/decal/cleanable/decal in target_turf)
		qdel(decal)

/datum/weather_effect/snow
	name = "snow effect"
	probability = 10

/datum/weather_effect/snow/effect_affect(turf/target_turf)
	if(!target_turf.snow)
		target_turf.snow = new /obj/structure/snow(target_turf)
	else
		target_turf.snow.weathered(src)

/obj/structure/snow
	name = "Snow"
	desc = "Big pile of snow"
	icon = 'icons/effects/snow.dmi'
	icon_state = "snow_1"
	var/icon_prefix = "snow"
	anchored = TRUE
	density = FALSE
	plane = GAME_PLANE
	layer = LOW_OBJ_LAYER
	alpha = 0
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = .proc/on_entered,
		COMSIG_ATOM_EXIT = .proc/on_exit,
	)
	var/bleed_layer = 1
	var/pts = 0
	var/list/image/snow_corners_overlays = list()
	var/list/obj/structure/snow/border_snows = list()
	var/list/diged = list("2" = FALSE, "1" = FALSE, "8" = FALSE, "4" = FALSE)

/obj/structure/snow/Initialize()
	. = ..()
	animate(src, alpha = 255, time = rand(10 SECONDS, 40 SECONDS), easing = ELASTIC_EASING)
	for(var/direction in GLOB.alldirs)
		var/turf/turf = get_step(loc, direction)
		if(!turf || !turf.snow)
			continue
		border_snows += turf.snow
		turf.snow.border_snows += src

	var/turf/my_turf = get_turf(loc)
	if(my_turf)
		ADD_TRAIT(my_turf, TRAIT_ADD_SLOWDOWN, SNOW_ON_TURF)

	AddElement(/datum/element/connect_loc, loc_connections)

	AddElement(/datum/element/icon_cutter)

	update_icon()

/obj/structure/snow/Destroy()
	var/turf/my_turf = get_turf(loc)
	if(my_turf)
		REMOVE_TRAIT(my_turf, TRAIT_REMOVE_SLOWDOWN, SNOW_ON_TURF)
	return ..()

/obj/structure/snow/update_icon()
	set waitfor = FALSE
	. = ..()
	icon_state = "[icon_prefix]_[bleed_layer]"
	density = bleed_layer < 5 ? FALSE : TRUE
	layer = bleed_layer < 4 ? LOW_OBJ_LAYER : OBJ_LAYER

	update_corners()
	update_overlays()

/obj/structure/snow/proc/update_corners()
	snow_corners_overlays.Cut()
	for(var/direction in GLOB.alldirs)
		var/turf/turf = get_step(loc, direction)
		if(!turf)
			continue
		var/obj/structure/snow/turf_snow = turf.snow
		if(!turf_snow || turf_snow.bleed_layer < bleed_layer)
			var/image/I = new(icon, "snow_[(direction & (direction-1)) ? "outercorner" : pick("innercorner", "outercorner")]", dir = direction)
			switch(direction)
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
			snow_corners_overlays += I

/obj/structure/snow/update_overlays()
	. = ..()
	if(overlays)
		overlays.Cut()

	var/new_overlay = ""
	for(var/i in diged)
		if(diged[i])
			new_overlay += i
	overlays += "[new_overlay]"

	for(var/image/i in snow_corners_overlays)
		overlays += snow_corners_overlays

/obj/structure/snow/proc/weathered(datum/weather_effect/effect)
	if(pts < bleed_layer * 4)
		pts++
	else
		pts = 0
		if(bleed_layer >= MAX_LAYER_CUTTING_LEVELS)
			for(var/direction in GLOB.alldirs)
				var/turf/turf = get_step(loc, direction)
				if(!turf)
					continue
				if(!turf.snow)
					effect.effect_affect(turf)
					break
			for(var/obj/structure/snow/turf_snow in border_snows)
				if(bleed_layer < MAX_LAYER_CUTTING_LEVELS)
					turf_snow.pts++
					break
		else
			changing_layer(min(bleed_layer + 1, MAX_LAYER_CUTTING_LEVELS))

/obj/structure/snow/proc/changing_layer(var/new_layer)
	if(isnull(new_layer) || new_layer == bleed_layer)
		return

	bleed_layer = max(0, new_layer)

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

/obj/structure/snow/proc/on_entered(datum/source, atom/movable/arrived)
	SIGNAL_HANDLER
	if(isliving(arrived))
		var/mob/living/living = arrived
		if(bleed_layer > 1)
			if(prob(2))
				to_chat(living, span_warning("Moving through [src] slows you down."))
		set_diged_ways(REVERSE_DIR(dir))
		SEND_SIGNAL(src, COMSIG_OVERLAY_CUTTER_FIRST, arrived, bleed_layer)

/obj/structure/snow/proc/on_exit(datum/source, atom/movable/leaving, direction)
	SIGNAL_HANDLER
	if(isliving(leaving))
		set_diged_ways(leaving.dir)
		SEND_SIGNAL(src, COMSIG_OVERLAY_CUTTER_SECOND, leaving, bleed_layer)

/obj/structure/snow/proc/set_diged_ways(dir)
	diged["[dir]"] = TRUE
	update_overlays()
	spawn(1 MINUTES)
		reset_diged()

/obj/structure/snow/proc/reset_diged(dir)
	diged["[dir]"] = FALSE
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

	if(weather_special_effect)
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
		var/new_severity = severity + rand(-max_severity_change, max_severity_change)
		new_severity = min(max(new_severity, min_severity), max_severity)
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

//IDK WHERE SUPPOSED TO PUT
/obj/machinery/siren
	name = "Siren"
	desc = "A siren used to play warnings for the colony."
	icon = 'icons/obj/machines/loudspeaker.dmi'
	icon_state = "loudspeaker"
	density = 0
	anchored = 1
	use_power = 0
	machine_stat = NOPOWER
	var/message = "BLA BLA BLA"
	var/sound = 'sound/effects/weather_warning.ogg'

/obj/machinery/siren/proc/siren_warning(var/msg = "WARNING, bla bla bla bluh.", var/sound_ch = 'sound/effects/weather_warning.ogg')
	playsound(loc, sound_ch, 80, 0)
	visible_message(span_danger("[src] make signal. [msg]."))

/obj/machinery/siren/proc/siren_warning_start(var/msg, var/sound_ch = 'sound/effects/weather_warning.ogg')
	if(!msg)
		return
	message = msg
	sound = sound_ch
	START_PROCESSING(SSmachines, src)

/obj/machinery/siren/proc/siren_warning_stop()
	STOP_PROCESSING(SSmachines, src)

/obj/machinery/siren/process()
	if(prob(2))
		playsound(loc, sound, 80, 0)
		visible_message(span_danger("[src] make signal. [message]."))


/obj/machinery/siren/weather
	name = "Weather Siren"
	desc = "A siren used to play weather warnings for the city."

/datum/particle_weather
	var/name = "set this"
	var/display_name = "set this"
	var/desc = "set this"

	var/list/weather_messages = list()
	var/list/weather_warnings = list("siren" = null, "message" = TRUE)
	var/list/weather_sounds = list()
	var/scale_vol_with_severity = TRUE

	var/particles/weather/particle_effect_type = /particles/weather/rain

	var/weather_duration_lower = 5 MINUTES
	var/weather_duration_upper = 20 MINUTES

	var/damage_type = null
	var/damage_per_tick = 0
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

	var/next_hit_time = 0
	var/weather_duration = 0
	var/weather_start_time = 0

	var/list/weather_additional_events = list()
	var/list/messaged_mobs = list()
	var/list/current_sounds = list()
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
			new str()

/datum/particle_weather/Destroy()
	for(var/S in current_sounds)
		var/datum/looping_sound/looping_sound = current_sounds[S]
		looping_sound.stop()
		qdel(looping_sound)
	return ..()

/datum/particle_weather/proc/start()
	if(running)
		return
	weather_duration = rand(weather_duration_lower, weather_duration_upper)
	weather_start_time = world.time
	running = TRUE
	addtimer(CALLBACK(src, .proc/wind_down), weather_duration)

	if(particle_effect_type)
		SSparticle_weather.set_particle_effect(new particle_effect_type);

	change_severity()


/datum/particle_weather/proc/change_severity()
	if(!running)
		return
	severity_steps_taken++

	if(max_severity_change == 0)
		severity = rand(min_severity, max_severity)
	else
		var/new_severity = severity + rand(-max_severity_change,max_severity_change)
		new_severity = min(max(new_severity,min_severity), max_severity)
		severity = new_severity


	if(SSparticle_weather.particle_effect)
		SSparticle_weather.particle_effect.animateSeverity(severity_mod())

	if(last_message != scale_range_pick(min_severity, max_severity, severity, weather_messages))
		messaged_mobs = list()

	if(severity_steps_taken < severity_steps)
		addtimer(CALLBACK(src, .proc/change_severity), weather_duration / severity_steps)

/datum/particle_weather/proc/wind_down()
	severity = 0
	if(SSparticle_weather.particle_effect)
		SSparticle_weather.particle_effect.animateSeverity(severity_mod())

		//Wait for the last particle to fade, then qdel yourself
		addtimer(CALLBACK(src, .proc/end), SSparticle_weather.particle_effect.lifespan + SSparticle_weather.particle_effect.fade)

/datum/particle_weather/proc/end()
	running = FALSE
	SSparticle_weather.stop_weather()

/datum/particle_weather/proc/can_weather(mob/living/mob_to_check)
	var/turf/mob_turf = get_turf(mob_to_check)

	if(!mob_turf)
		return

	if(mob_turf.flags_turf & TURF_WEATHER)
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
		L.last_damage_data = create_cause_data("погодных условий")

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
		current_sound = new temp_sound(L, FALSE, TRUE, FALSE, SOUND_CHANNEL_WEATHE)
		current_sounds[L] = current_sound
		//SET VOLUME
		if(scale_vol_with_severity)
			current_sound.volume = initial(current_sound.volume) * severity_mod()
		current_sound.start()

/datum/particle_weather/proc/stop_weather_sound_effect(mob/living/L)
	var/datum/looping_sound/current_sound = current_sounds[L]
	if(current_sound)
		current_sound.stop()

/datum/particle_weather/proc/weather_message(mob/living/L)
	messaged_mobs[L] = world.time + WEATHER_MESSAGE_DELAY
	last_message = scale_range_pick(min_severity, max_severity, severity, weather_messages)
	if(last_message)
		to_chat(L, SPAN_DANGER(last_message))

/datum/particle_weather/proc/weather_warnings()
	switch(weather_warnings)
		if("siren")
			for(var/obj/structure/machinery/siren/weather/weather_siren in GLOB.siren_objects["weather"])
				if(weather_siren.z in affected_zlevels)
					weather_siren.siren_warning(weather_warnings["siren"])
		if("message")
			var/list/message = list("xenomorph" = "Incoming [display_name]", "human" = "Incoming [display_name]")
			if(length(weather_warnings["message"]))
				var/weather_message = weather_warnings["message"]
				for(var/msg in weather_message)
					message[msg] += weather_message[msg]
			for(var/mob/living/carbon/human/affected_human in GLOB.alive_human_list)
				if(!affected_human.stat && affected_human.client && (affected_human.z in affected_zlevels))
					playsound_client(affected_human.client, 'sound/effects/radiostatic.ogg', affected_human.loc, 25, FALSE)
					affected_human.play_screen_text("<span class='langchat' style=font-size:16pt;text-align:center valign='top'><u>Weather Alert:</u></span><br>" + message["human"], /atom/movable/screen/text/screen_text/command_order, rgb(103, 214, 146))
			for(var/mob/living/carbon/Xenomorph/affected_xeno in GLOB.living_xeno_list)
				if(!affected_xeno.stat && affected_xeno.client && (affected_xeno.z in affected_zlevels))
					playsound_client(affected_xeno.client, 'sound/voice/alien_distantroar_3.ogg', affected_xeno.loc, 25, FALSE)
					affected_xeno.play_screen_text("<span class='langchat' style=font-size:16pt;text-align:center valign='top'><u>The Hivemind Senses:</u></span><br>" + message["xenomorph"], /atom/movable/screen/text/screen_text/command_order, rgb(175, 0, 175))
    return FALSE


/datum/looping_sound/dust_storm
	mid_sounds = 'sound/weather/dust/weather_dust.ogg'
	mid_length = 80
	volume = 150

/datum/looping_sound/rain
	mid_sounds = 'sound/weather/rain/weather_rain.ogg'
	mid_length = 40 SECONDS
	volume = 150

/datum/looping_sound/snow
	mid_sounds = 'sound/weather/snow/weather_snow.ogg'
	mid_length = 50 SECONDS
	volume = 150

/datum/looping_sound/storm
	mid_sounds = 'sound/weather/rain/weather_storm.ogg'
	mid_length = 30 SECONDS
	volume = 150

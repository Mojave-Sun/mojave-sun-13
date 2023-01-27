SUBSYSTEM_DEF(particle_weather)
	name = "Particle Weather"
	flags = SS_BACKGROUND
	wait = 10
	runlevels = RUNLEVEL_GAME
	var/list/elligble_weathers = list()
	var/datum/particle_weather/next_hit
	COOLDOWN_DECLARE(next_weather_start)

	var/datum/particle_weather/running_weather
	var/particles/weather/particle_effect
	var/obj/weather_effect

/datum/controller/subsystem/particle_weather/stat_entry(msg)
	if(running_weather?.running)
		var/time_left = COOLDOWN_TIMELEFT(running_weather, time_left)
		if(running_weather?.display_name)
			msg = "P:Current event: [running_weather.display_name] - [time_left] seconds left"
		else if(running_weather)
			msg = "P:Current event of unknown type ([running_weather]) - [time_left] seconds left"
	else if(running_weather)
		var/time_left = COOLDOWN_TIMELEFT(src, next_weather_start)
		if(running_weather?.display_name)
			msg = "P:Next event: [running_weather.display_name] hit in [time_left] seconds"
		else if(running_weather)
			msg = "P:Next event of unknown type ([running_weather]) hit in [time_left] seconds"
	else
		msg = "P:No event"
	return ..()

/datum/controller/subsystem/particle_weather/Initialize(start_timeofday)
	for(var/i in subtypesof(/datum/particle_weather))
		var/datum/particle_weather/particle_weather = new i
		if(particle_weather.target_trait in SSmapping.config.particle_weathers)
			elligble_weathers[i] = particle_weather.probability
	return ..()

/datum/controller/subsystem/particle_weather/fire()
	if(!running_weather && next_hit && COOLDOWN_FINISHED(src, next_weather_start))
		run_weather(next_hit)

	if(!running_weather && !next_hit && length(elligble_weathers))
		for(var/our_event in pick(elligble_weathers))
			if(our_event && rand(1, 1000) < elligble_weathers[our_event])
				next_hit = new our_event()
				COOLDOWN_START(src, next_weather_start, rand(-3000, 3000) + initial(next_hit.weather_duration_upper) / 5)
				break

/datum/controller/subsystem/particle_weather/proc/run_weather(datum/particle_weather/weather_datum_type, force = 0)
	if(running_weather)
		if(force)
			running_weather.end()
		else
			return

	if(!istype(weather_datum_type, /datum/particle_weather))
		CRASH("run_weather called with invalid weather_datum_type: [weather_datum_type || "null"]")
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_WEATHER_CHANGE)
	running_weather = weather_datum_type
	running_weather.start()
	weather_datum_type = null

/datum/controller/subsystem/particle_weather/proc/make_eligible(possible_weather, probability = 10)
	elligble_weathers[possible_weather] = probability

/datum/controller/subsystem/particle_weather/proc/get_weather_effect()
	if(!weather_effect)
		weather_effect = new /obj()
		weather_effect.particles = particle_effect
		weather_effect.filters += filter(type="alpha", render_source=WEATHER_RENDER_TARGET)
		weather_effect.mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	return weather_effect

/datum/controller/subsystem/particle_weather/proc/set_particle_effect(particles/P)
	particle_effect = P
	weather_effect.particles = particle_effect

/datum/controller/subsystem/particle_weather/proc/stop_weather()
	QDEL_NULL(running_weather)
	QDEL_NULL(particle_effect)

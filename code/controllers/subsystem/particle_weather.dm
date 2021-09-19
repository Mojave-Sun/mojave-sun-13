#define STARTUP_STAGE 1
#define MAIN_STAGE 2
#define WIND_DOWN_STAGE 3
#define END_STAGE 4

//Used for all kinds of weather, ex. lavaland ash storms.
SUBSYSTEM_DEF(ParticleWeather)
	name = "Particle Weather"
	flags = SS_BACKGROUND
	wait = 10
	runlevels = RUNLEVEL_GAME
	var/list/processing = list()
	var/list/elligble_weather = list()
	// var/list/next_hit = list() //Used by barometers to know when the next storm is coming

	var/particles/weather/particleEffect
	var/obj/weatherEffect

/datum/controller/subsystem/ParticleWeather/fire()
	// process active weather
	for(var/V in processing)
		var/datum/particle_weather/our_event = V
		for(var/mob/act_on as anything in GLOB.mob_living_list)
			if(our_event.can_weather_act(act_on))
				our_event.weather_act(act_on)

	// start random weather on relevant levels
	var/possible_weather = elligble_weather
	var/datum/particle_weather/our_event = pickweight(elligble_weather) //possible_weather
	if(our_event)
		run_weather(our_event)
		elligble_weather -= our_event
		var/randTime = rand(3000, 6000)
		next_hit = addtimer(CALLBACK(src, .proc/make_eligible, possible_weather), randTime + initial(our_event.weather_duration_upper), TIMER_UNIQUE|TIMER_STOPPABLE) //Around 5-10 minutes between weathers


//This has been mangled - currently only supports 1 weather effect serverwide so I can finish this
/datum/controller/subsystem/ParticleWeather/Initialize(start_timeofday)
	for(var/V in subtypesof(/datum/particle_weather))
		var/datum/particle_weather/W = V
		var/probability = initial(W.probability)
		var/target_trait = initial(W.target_trait)

		// any weather with a probability set may occur at random
		if (probability && SSmapping.config.particle_weather[target_trait])
			LAZYINITLIST(elligble_weather)
			elligble_weather[W] = probability
	return ..()

/datum/controller/subsystem/ParticleWeather/proc/run_weather(datum/particle_weather/weather_datum_type)
	if (istext(weather_datum_type))
		for (var/V in subtypesof(/datum/particle_weather))
			var/datum/particle_weather/W = V
			if (initial(W.name) == weather_datum_type)
				weather_datum_type = V
				break
	if (!ispath(weather_datum_type, /datum/particle_weather))
		CRASH("run_weather called with invalid weather_datum_type: [weather_datum_type || "null"]")

	var/datum/particle_weather/W = new weather_datum_type()
	W.start()
	if(W.particleEffectType)
		SetparticleEffect(new W.particleEffectType);

/datum/controller/subsystem/ParticleWeather/proc/make_eligible(possible_weather)
	elligble_weather = possible_weather
// 	next_hit = null

/datum/controller/subsystem/ParticleWeather/proc/getweatherEffect()
	if(!weatherEffect)
		weatherEffect = new /obj()
		weatherEffect.particles = particleEffect
		weatherEffect.filters += filter(type="alpha", render_source=WEATHER_RENDER_TARGET)
	return weatherEffect

/datum/controller/subsystem/ParticleWeather/proc/SetparticleEffect(particles/P)
	particleEffect = P
	weatherEffect.particles = particleEffect

/datum/particle_weather/rain_gentle
	name = "Rain"
	desc = "Gentle Rain, la la description."
	particleEffectType = /particles/weather/rain

	// weather_duration = 1200
	// weather_duration_lower = 1200
	// weather_duration_upper = 1500

	minSeverity = 1
	maxSeverity = 50
	maxSeverityChange = 10
	severitySteps = 5
	immunity_type = WEATHER_STORM
	probability = 1
	target_trait = PARTICLEWEATHER_RADS

//Makes you a little chilly
/datum/particle_weather/rain_gentle/weather_act(mob/living/L)
	L.adjust_bodytemperature(-rand(1,3))


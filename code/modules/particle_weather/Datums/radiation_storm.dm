/datum/particle_weather/radiation_storm
	name = "Rain"
	desc = "Gentle Rain, la la description."
	particleEffectType = /particles/weather/rads

	// weather_duration = 1200
	// weather_duration_lower = 1200
	// weather_duration_upper = 1500

	minSeverity = 1
	maxSeverity = 100
	maxSeverityChange = 0
	severitySteps = 50
	immunity_type = WEATHER_STORM
	probability = 1
	target_trait = PARTICLEWEATHER_RADS

//STOLEN
/datum/particle_weather/radiation_storm/weather_act(mob/living/L)
	var/resist = L.getarmor(null, RAD)
	if(prob(40))
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.dna && !HAS_TRAIT(H, TRAIT_GENELESS))
				if(prob(max(0,100-resist)))
					H.random_mutate_unique_identity()
					H.random_mutate_unique_features()
					if(prob(50))
						if(prob(90))
							H.easy_random_mutate(NEGATIVE+MINOR_NEGATIVE)
						else
							H.easy_random_mutate(POSITIVE)
						H.domutcheck()
		L.rad_act(20)


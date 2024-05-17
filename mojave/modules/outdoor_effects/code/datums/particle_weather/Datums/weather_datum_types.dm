
/datum/particle_weather/dust_storm
	name = "dust storm"
	desc = "Dust carried by wind. Blinding!"
	particleEffectType = /particles/weather/dust

	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/dust_storm)
	//weather_messages = list("The whipping sand grates against you!", "The intense sandstorm makes it harder to see!")

	minSeverity = 20
	maxSeverity = 80
	maxSeverityChange = 40
	severitySteps = 8
	immunity_type = TRAIT_DUSTSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_DUST

/datum/particle_weather/dust_storm/weather_act(mob/living/carbon/L)
	if(HAS_TRAIT(L, TRAIT_WEARING_GAS_MASK))
		return

	if(ishuman(L) && !L.is_eyes_covered())
		L.adjust_blurriness(6.5)

/datum/particle_weather/radiation_storm
	name = "radiation storm"
	desc = "Brutal radiation storm!!!"
	particleEffectType = /particles/weather/rads

	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/rad_storm)
	weather_messages = list("Your skin feels tingly", "Something feels off.")

	minSeverity = 1
	maxSeverity = 100
	maxSeverityChange = 0
	severitySteps = 50
	immunity_type = TRAIT_RADSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_RADS

//STOLEN
/datum/particle_weather/radiation_storm/weather_act(mob/living/L)
	if(HAS_TRAIT(L, TRAIT_WEARING_GAS_MASK))
		return

	var/resist = L.getsubarmor()
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

/datum/particle_weather/rain_gentle
	name = "rain"
	desc = "Gentle Rain, la la description."
	particleEffectType = /particles/weather/rain

	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/rain)
	//weather_messages = list("The rain cools your skin.")

	minSeverity = 1
	maxSeverity = 10
	maxSeverityChange = 5
	severitySteps = 5
	immunity_type = TRAIT_RAINSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_RAIN

/datum/particle_weather/rain_gentle/weather_act(mob/living/L)
	if(HAS_TRAIT(L, TRAIT_WEARING_GAS_MASK))
		L.adjust_blurriness(1)
		if(prob(10))
			to_chat(L, "The [src] obscures your gas mask!")
		return

/datum/particle_weather/rain_storm
	name = "rain storm"
	desc = "Intense rain."
	particleEffectType = /particles/weather/rain

	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/storm)
	//weather_messages = list("The rain cools your skin.", "The storm is really picking up!")

	minSeverity = 4
	maxSeverity = 100
	maxSeverityChange = 50
	severitySteps = 50
	immunity_type = TRAIT_RAINSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_RAIN

/datum/particle_weather/rain_storm/weather_act(mob/living/L)
	if(HAS_TRAIT(L, TRAIT_WEARING_GAS_MASK))
		L.adjust_blurriness(1.5)
		if(prob(10))
			to_chat(L, "The [src] obscures your gas mask!")
		return

/datum/particle_weather/snow_gentle
	name = "snow"
	desc = "Light snowfall."
	particleEffectType = /particles/weather/snow

	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/snow)
	//weather_messages = list("It's snowing!","You feel a chill")

	minSeverity = 1
	maxSeverity = 10
	maxSeverityChange = 5
	severitySteps = 5
	immunity_type = TRAIT_SNOWSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_SNOW

/datum/particle_weather/snow_gentle/weather_act(mob/living/L)
	if(HAS_TRAIT(L, TRAIT_WEARING_GAS_MASK))
		L.adjust_blurriness(2.5)
		if(prob(10))
			to_chat(L, "The [src] obscures your gas mask!")
		return

/datum/particle_weather/snow_storm
	name = "snow storm"
	desc = "Intense snowstorm that impairs vision."
	particleEffectType = /particles/weather/snowstorm

	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/snow)
	//weather_messages = list("You feel a chill", "The cold wind is freezing you to the bone", "How can a man who is warm, understand a man who is cold?")

	minSeverity = 40
	maxSeverity = 100
	maxSeverityChange = 60
	severitySteps = 10
	immunity_type = TRAIT_SNOWSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_SNOW

//Makes you a lot little chilly
/datum/particle_weather/snow_storm/weather_act(mob/living/L)
	if(HAS_TRAIT(L, TRAIT_WEARING_GAS_MASK))
		L.adjust_blurriness(3.5) // Snow sticks to your mask even worse than it gets into your mf eyes
		if(prob(10))
			to_chat(L, "The [src] obscures your gas mask!")
		return

	if(ishuman(L) && !L.is_eyes_covered())
		L.adjust_blurriness(2.5)


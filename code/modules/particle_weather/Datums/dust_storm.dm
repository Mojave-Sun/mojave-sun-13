/datum/particle_weather/dust_storm
	name = "Rain"
	desc = "Gentle Rain, la la description."
	particleEffectType = /particles/weather/dust

	// weather_duration = 1200
	// weather_duration_lower = 1200
	// weather_duration_upper = 1500

	minSeverity = 1
	maxSeverity = 50
	maxSeverityChange = 10
	severitySteps = 5
	immunity_type = WEATHER_STORM
	probability = 1
	target_trait = PARTICLEWEATHER_DUST

//Makes you a little chilly
/datum/particle_weather/dust_storm/weather_act(mob/living/L)
	if ishuman(L)
		var/mob/living/carbon/human/H = L
		var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
		eyes?.applyOrganDamage(severityMod() * rand(1,3) - H.get_eye_protection())



/datum/reagent/toxin/ms13
	name = "generic MS13 toxin"
	description = "Don't breathe this in."
	color = "#42330a"
	taste_description = "burning chemical taste"

/datum/reagent/toxin/ms13/fiberglass
	name = "fiberglass"
	description = "Literally just incredibly small particles of glass."
	color = "#00eeff4e"
	taste_description = "sharp particles"
	toxpwr = 0.5

/datum/reagent/toxin/ms13/fiberglass/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	. = ..()
	var/static/list/valid_organ_slots = list(
		ORGAN_SLOT_STOMACH,
		ORGAN_SLOT_LUNGS,
	)
	var/obj/item/organ/current_organ
	for(var/organ_slot in valid_organ_slots)
		current_organ = M.getorganslot(organ_slot)
		if(current_organ)
			current_organ.applyOrganDamage(2 * REM * normalise_creation_purity() * delta_time)
	M.apply_damage(0.75 * REM * normalise_creation_purity() * delta_time, BRUTE, def_zone = BODY_ZONE_CHEST, sharpness = SHARP_EDGED)
	if(DT_PROB(10, delta_time))
		M.emote("cough")
		//can also make u cough up blood sometimes
		if(prob(50))
			M.bleed(8)

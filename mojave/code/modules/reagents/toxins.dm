/datum/reagent/toxin/ms13
	name = "generic MS13 chem"
	description = "Don't breathe this in."
	color = "#42330a"
	taste_description = "burning chemical taste"

/datum/reagent/toxin/ms13/fiberglass
	name = "fiberglass"
	description = "Literally just incredibly small particles of glass."
	color = "#00eeff4e"
	taste_description = "sharp particles"
	toxpwr = 1

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
			current_organ.applyOrganDamage(rand(2,4))
	M.apply_damage(rand(1,2), BRUTE, def_zone = BODY_ZONE_CHEST)
	if(DT_PROB(5, delta_time))
		M.emote("cough")

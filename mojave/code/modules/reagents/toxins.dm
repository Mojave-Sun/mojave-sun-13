/datum/reagent/toxin/ms13
	name = "generic MS13 chem"
	description = "Don't breathe this in."
	color = "#42330a"
	taste_description = "burning chemical taste"

/datum/reagent/toxin/ms13/glass_powder
	name = "glass powder"
	description = "Literally just some fucking broken chunks of glass."
	color = "#00eeff4e"
	toxpwr = 1

/datum/reagent/toxin/ms13/glass_powder/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	. = ..()
	for(var/obj/item/organ/organ as anything in M.internal_organs)
		organ.applyOrganDamage(rand(0,3))
	M.take_bodypart_damage(rand(1,2))

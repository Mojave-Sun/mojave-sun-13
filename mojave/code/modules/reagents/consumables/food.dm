/datum/reagent/consumable/nutriment/protein/prions
	name = "Prions"
	description = "Malformed proteins. Eating this won't do you any good."
	color = "#ff93e2"
	brute_heal = 0

/datum/reagent/consumable/nutriment/protein/prions/on_mob_metabolize(mob/living/carbon/M)
	. = ..()
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
	M.ForceContractDisease(new /datum/disease/kuru)

/datum/reagent/consumable/nutriment/protein/prions/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	. = ..()
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)

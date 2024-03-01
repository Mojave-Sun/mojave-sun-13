/datum/reagent/consumable/nutriment/protein/prions
	name = "Prions"
	description = "Malformed proteins. Eating this won't do you any good."
	color = "#ff93e2"
	brute_heal = 0

/datum/reagent/consumable/nutriment/protein/prions/on_mob_metabolize(mob/living/carbon/M)
	. = ..()
	addtimer(CALLBACK(src, .proc/mrelectrickillthisguy), rand(5,10) MINUTES) //Drain every 15 seconds

/datum/reagent/consumable/nutriment/protein/prions/proc/mrelectrickillthisguy(mob/living/carbon/M) // Delay the kuru... it's funnier this way prolly
	M.ForceContractDisease(new /datum/disease/kuru)

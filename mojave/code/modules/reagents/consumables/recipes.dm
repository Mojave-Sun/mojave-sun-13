//////////////////////////////////////// DRINK RECIPE BASE ////////////////////////////////

/datum/chemical_reaction/drink/ms13
	optimal_temp = 250
	temp_exponent_factor = 1
	optimal_ph_min = 2
	optimal_ph_max = 10
	thermic_constant = 0
	H_ion_release = 0
	rate_up_lim = 60
	purity_min = 0
	reaction_tags = REACTION_TAG_DRINK | REACTION_TAG_EASY

////////////////////////////////////////// COCKTAILS //////////////////////////////////////


/datum/chemical_reaction/drink/ms13/rum_nuka
	results = list(/datum/reagent/consumable/ethanol/ms13/rum_nuka = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/ms13/rum = 1, /datum/reagent/consumable/ms13/nuka_cola = 1)
	reaction_tags = REACTION_TAG_DRINK | REACTION_TAG_EASY

/datum/chemical_reaction/drink/ms13/radstorm
	results = list(/datum/reagent/consumable/ethanol/ms13/radstorm = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/ms13/whiskey = 1, /datum/reagent/consumable/ms13/nuka_cola = 1)
	reaction_tags = REACTION_TAG_DRINK | REACTION_TAG_EASY

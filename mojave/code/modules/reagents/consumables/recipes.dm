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

//// Drink Mix Zone!! ////

// Fun for all //

/datum/chemical_reaction/drink/ms13/nuka_frutti
	results = list(/datum/reagent/consumable/ms13/nuka_frutti = 3)
	required_reagents = list(/datum/reagent/consumable/ms13/nuka_grape = 1, /datum/reagent/consumable/ms13/nuka_orange = 1, /datum/reagent/consumable/ms13/nuka_cherry = 1)

/datum/chemical_reaction/drink/ms13/nuka_love
	results = list(/datum/reagent/consumable/ms13/nuka_love = 2)
	required_reagents = list(/datum/reagent/consumable/ms13/nuka_quartz = 1, /datum/reagent/consumable/ms13/nuka_cherry = 1)

/datum/chemical_reaction/drink/ms13/nuka_rush
	results = list(/datum/reagent/consumable/ms13/nuka_rush = 2)
	required_reagents = list(/datum/reagent/consumable/ms13/nuka_victory = 1, /datum/reagent/consumable/ms13/nuka_wild = 1)

/datum/chemical_reaction/drink/ms13/nuka_free
	results = list(/datum/reagent/consumable/ms13/nuka_free = 2)
	required_reagents = list(/datum/reagent/consumable/ms13/nuka_cola = 1, /datum/reagent/consumable/ms13/water = 1)

/*/datum/chemical_reaction/drink/ms13/nuka_black					// Need COFFEEEEE
	results = list(/datum/reagent/consumable/ms13/nuka_free = 2)
	required_reagents = list(/datum/reagent/consumable/ms13/nuka_cola = 1, /datum/reagent/consumable/ms13/water = 1) */

// Alcohols //

/datum/chemical_reaction/drink/ms13/rum_nuka
	results = list(/datum/reagent/consumable/ethanol/ms13/rum_nuka = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/ms13/rum = 1, /datum/reagent/consumable/ms13/nuka_cola = 1)

/datum/chemical_reaction/drink/ms13/whiskey_nuka
	results = list(/datum/reagent/consumable/ethanol/ms13/whiskey_nuka = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/ms13/whiskey = 1, /datum/reagent/consumable/ms13/nuka_cola = 1)

/datum/chemical_reaction/drink/ms13/commie_bomb
	results = list(/datum/reagent/consumable/ethanol/ms13/commie_bomb = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/ms13/vodka = 1, /datum/reagent/consumable/ms13/nuka_quantum = 2)

/*/datum/chemical_reaction/drink/ms13/mammoth_bait                  //Soot flower + Prickly Pear juice needed
	results = list(	/datum/reagent/consumable/ethanol/ms13/mammoth_bait = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/ms13/vodka = 1, /datum/reagent/consumable/ethanol/ms13/champagne = 1)

/datum/chemical_reaction/drink/ms13/atomic_cocktail                //Mentat Powder needed
	results = list(	/datum/reagent/consumable/ethanol/ms13/atomic_cocktail  = 3)
	required_reagents = list(/datum/reagent/consumable/ms13/nuka_victory = 1, /datum/reagent/consumable/ethanol/ms13/vodka = 2)*/

/datum/chemical_reaction/drink/ms13/necromancer                     //Ash blossom powder needed
	results = list(/datum/reagent/consumable/ethanol/ms13/necromancer = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/ms13/rum = 1, /datum/reagent/consumable/ethanol/ms13/vodka = 1)

/datum/chemical_reaction/drink/ms13/dirty_wastelander 				// Mutfruit juice needed, too
	results = list(	/datum/reagent/consumable/ethanol/ms13/dirty_wastelander = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/ms13/whiskey = 1, /datum/reagent/consumable/ms13/nuka_cola = 1)

/datum/chemical_reaction/drink/ms13/nawlins_sazerac 				// Tobacco powder needed
	results = list(/datum/reagent/consumable/ethanol/ms13/nawlins_sazerac = 2)
	required_reagents = list(	/datum/reagent/consumable/ethanol/ms13/absinthe = 1, /datum/reagent/consumable/ethanol/ms13/cognac = 1)

/datum/chemical_reaction/drink/ms13/clogged_pump
	results = list(/datum/reagent/consumable/ethanol/ms13/clogged_pump = 3)
	required_reagents = list(/datum/reagent/consumable/ethanol/ms13/rad_ant_lager = 1, /datum/reagent/consumable/ms13/nuka_cola = 2)

//// "Custom brews". IE: Just mixed drinks with a different vibe to it. Theoretically being made less in the bar itself. ////

/*/datum/chemical_reaction/drink/ms13/ballistic_bock 					// Need Gunpowder reagent or alternative
	results = list(/datum/reagent/consumable/ethanol/ms13/ballistic_bock = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/ms13/waster_beer = 1, /datum/reagent/consumable/ms13/nuka_cola = 1)

/datum/chemical_reaction/drink/ms13/rad_ant_lager						// Ground up ant matter REQUIRED.
	results = list(	/datum/reagent/consumable/ethanol/ms13/rad_ant_lager = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/ms13/rum = 1, /datum/reagent/consumable/ms13/nuka_cola = 1)

/datum/chemical_reaction/drink/ms13/swift_recovery						// Brain fungus and Tato
	results = list(/datum/reagent/consumable/ethanol/ms13/swift_recovery = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/ms13/rum = 1, /datum/reagent/consumable/ms13/nuka_cola = 1)*/

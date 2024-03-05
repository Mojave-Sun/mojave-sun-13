/obj/item/seeds/ms13
	growing_icon = 'mojave/icons/hydroponics/growing.dmi'
	icon = 'mojave/icons/hydroponics/seeds.dmi'
	icon_state = "seed"
	potency = 40
	growthstages = 5
	w_class = WEIGHT_CLASS_TINY
	grid_height = 32
	grid_width = 32
	//vars added here to stop compilation issues.  Removed from base botany and will need to be refactored.
	var/growing_color = ""
	var/harvest_icon = 1
	var/wholeiconcolor = TRUE

	//The type of nutrient the plant consumes, 'N' 'P' or 'K'.
	var/nutrient_type

/obj/item/seeds/ms13/examine(mob/user)
	. = ..()
	if(nutrient_type == "N")
		. += span_info("Required Nutrient: N")
	if(nutrient_type == "P")
		. += span_info("Required Nutrient: P")
	if(nutrient_type == "K")
		. += span_info("Required Nutrient: K")

/obj/item/food/grown/ms13
	icon = 'mojave/icons/hydroponics/harvest/harvest_world.dmi'
	inhand_icon_state = "plant"
	lefthand_file = 'mojave/icons/mob/inhands/equipment/hydroponics_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/equipment/hydroponics_righthand.dmi'
	can_distill = TRUE
	w_class = WEIGHT_CLASS_TINY
	grid_height = 32
	grid_width = 32
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/brew_sludge
	decomp_type = /obj/item/food/badrecipe/moldy/ms13
	var/can_dry = FALSE //used for drying racks
	var/dry_time = 600 // 10 Minutes
	var/dried_type //the thing it dries into
	var/time_drying = 0 //how long has this been drying

/obj/item/food/grown/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/hydroponics/harvest/harvest_inventory.dmi')

/////////////////////////////////////////////////////////////
//////////////////////// FRUIT //////////////////////////////
/////////////////////////////////////////////////////////////

///////////////////// BARREL CACTUS /////////////////////////

/obj/item/seeds/ms13/barrelcactus
	name = "barrel cactus seeds"
	desc = "These seeds grow into a barrel cactus."
	species = "cactus2"
	growing_color =  "#a6b115"
	plantname = "Barrel Cactus"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/barrelcactus
	mutatelist = list(/obj/item/seeds/ms13/pricklypear)
	lifespan = 200 //Good for roughly 4 harvests
	endurance = 45
	yield = 3 //12 fruit/seed
	growthstages = 4
	production = 30 //produces every 10 minutes
	maturation = 60 //20 minutes to mature
	reagents_add = list(/datum/reagent/toxin = 0.04, /datum/reagent/consumable/nutriment = 0.2)
	nutrient_type = "K"

/obj/item/food/grown/ms13/barrelcactus
	seed = /obj/item/seeds/ms13/barrelcactus
	name = "barrel cactus fruit"
	desc = "Barrel cactus fruit are found on spherical barrel cacti. Fairly firm to the touch."
	bite_consumption_mod = 2
	foodtypes = FRUIT | TOXIC
	icon_state = "barrelcactus"
	filling_color = "#a6b115"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/barrel_wine
	tastes = list("sourness"= 10, "burning"= 1)

///////////////////// MUTFRUIT /////////////////////////

/obj/item/seeds/ms13/mutfruit
	name = "mutfruit seeds"
	desc = "These seeds grow into a mutfruit sapling."
	species = "bush"
	growing_color =  "#59496d"
	plantname = "Mutfruit Sapling"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest, /datum/plant_gene/trait/squash)
	product = /obj/item/food/grown/ms13/mutfruit
	mutatelist = list(/obj/item/seeds/ms13/cmutfruit)
	lifespan = 164 //Good for roughly 4 harvests
	endurance = 45
	yield = 3 //12 fruit/seed
	growthstages = 4
	production = 24 //produces every 8 minutes
	maturation = 55 //18m 20s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/mutfruit
	seed = /obj/item/seeds/ms13/mutfruit
	name = "mutfruit"
	desc = "A squishy and juicy mutfruit. It warms your hand to the touch."
	bite_consumption_mod = 2
	foodtypes = FRUIT
	icon_state = "mutfruit"
	filling_color = "#5f035f"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/mutfruit_wine
	tastes = list("warmth"= 5, "sweetness"= 2)

//CRUNCHY MUTFRUITx

/obj/item/seeds/ms13/cmutfruit
	name = "crunchy mutfruit husks"
	desc = "These husks grow crunchy mutfruits from the ground."
	species = "vines"
	growing_color =  "#da9249"
	plantname = "Crunchy Mutfruits"
	harvest_icon = 1
	product = /obj/item/food/grown/ms13/cmutfruit
	mutatelist = list()
	lifespan = 75
	endurance = 35
	yield = 4
	growthstages = 3
	production = 14 //4m 40s to produce
	maturation = 32 //10m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/cmutfruit
	seed = /obj/item/seeds/ms13/cmutfruit
	name = "crunchy mutfruit"
	desc = "A firm and stiff mutfruit. Producted a sort of hollow sound when tapped."
	foodtypes = FRUIT
	bite_consumption_mod = 2
	icon_state = "cmutfruit"
	filling_color = "#7c3e04"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/mutfruit_wine
	tastes = list("sourness"= 5, "sweetness"= 1)

//APPLEx

/obj/item/seeds/ms13/apple
	name = "apple seeds"
	desc = "Some mutated apple shrub seeds."
	species = "tree"
	growing_color =  "#9b3434"
	plantname = "Apple Shrub"
	harvest_icon = 1
	product = /obj/item/food/grown/ms13/apple
	mutatelist = list(/obj/item/seeds/ms13/cmutfruit)
	lifespan = 96
	endurance = 40
	yield = 5
	growthstages = 5
	production = 20 //6m 40s to produce
	maturation = 48 //16m to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/apple
	seed = /obj/item/seeds/ms13/apple
	name = "apple"
	desc = "A common apple. It is firm to the touch and hardy."
	bite_consumption_mod = 1
	foodtypes = FRUIT
	icon_state = "apple"
	filling_color = "#9b7470"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/apple_cider
	tastes = list("apple"= 1)

///////////////////// PRICKLY PEAR /////////////////////////

/obj/item/seeds/ms13/pricklypear
	name = "prickly pear seeds"
	desc = "These seeds grow into a prickly pear cactus."
	species = "cactus"
	growing_color =  "#8a0483"
	plantname = "Prickly Pear Cactus"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest,/datum/plant_gene/trait/stinging) //could be a bad idea idk
	product = /obj/item/food/grown/ms13/pricklypear
	mutatelist = list(/obj/item/seeds/ms13/barrelcactus)
	lifespan = 118 //Good for roughly 3 harvests
	endurance = 35
	yield = 3 //9 fruit/seed
	growthstages = 4
	production = 16 //5m 20s to produce
	maturation = 64 //21m 20s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/pricklypear
	seed = /obj/item/seeds/ms13/pricklypear
	name = "prickly pear fruit"
	desc = "A menacing fruit filled with spines. The flesh feels thin and easy to peel otherwise."
	icon_state = "prickly"
	filling_color = "#8a0483"
	foodtypes = FRUIT
	bite_consumption_mod = 2
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/pricklypear_wine
	tastes = list("sweetness"= 1)

/obj/item/food/grown/ms13/pricklypear/pickup(mob/living/user)
	..()
	if(!iscarbon(user))
		return FALSE
	var/mob/living/carbon/C = user
	if(C.gloves)
		return FALSE
	if(HAS_TRAIT(C, TRAIT_PIERCEIMMUNE))
		return FALSE
	var/hit_zone = (C.held_index_to_dir(C.active_hand_index) == "l"? "l_":"r_") + "arm"
	var/obj/item/bodypart/affecting = C.get_bodypart(hit_zone)
	if(affecting)
		if(affecting.receive_damage(brute = 10))
			C.update_damage_overlays()
	to_chat(C, "<span class='userdanger'>The spines pierce your bare hand!</span>")
	return TRUE

///////////////////// PUNGA /////////////////////////

/obj/item/seeds/ms13/punga
	name = "punga pits"
	desc = "These small black pits grow into a punga bush"
	species = "bush"
	growing_color =  "#695d19"
	plantname = "Punga Bush"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism, /datum/plant_gene/trait/repeated_harvest, /datum/plant_gene/trait/squash)
	product = /obj/item/food/grown/ms13/pungafruit
	lifespan = 215 //Good for roughly 5 harvests
	endurance = 50
	yield = 3 //15 fruit/seed
	growthstages = 4
	production = 21 //7m to produce
	maturation = 90 //30m to mature
	reagents_add = list(/datum/reagent/toxin = 0.04, /datum/reagent/consumable/nutriment = 0.2)
	nutrient_type = "P"

/obj/item/food/grown/ms13/pungafruit
	seed = /obj/item/seeds/ms13/punga
	name = "pungafruit"
	desc = "A fleshy fruit with a yellowish-brown, thick skin. Puts off a strange smell."
	icon_state = "punga"
	bite_consumption_mod = 2
	foodtypes = FRUIT | TOXIC
	filling_color = "#695d19"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/punga_wine
	tastes = list("sourness"= 6, "warmth"= 1)

//refined punga

/obj/item/seeds/ms13/geigpunga
	name = "geiger punga pits"
	desc = "These small glowing green pits grow into a punga bush"
	species = "bush"
	growing_color =  "#55ff06"
	plantname = "Geigerpunga Bush"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism, /datum/plant_gene/trait/repeated_harvest, /datum/plant_gene/trait/squash)
	product = /obj/item/food/grown/ms13/geigpungafruit
	lifespan = 125 //Good for roughly 2 harvests
	endurance = 25
	yield = 4 //8 fruit/seed
	growthstages = 4
	production = 20 //6m 40s to produce
	maturation = 78 //26m to mature
	reagents_add = list(/datum/reagent/toxin = 0.08, /datum/reagent/consumable/nutriment = 0.2)
	nutrient_type = "P"

/obj/item/food/grown/ms13/geigpungafruit
	seed = /obj/item/seeds/ms13/geigpunga
	name = "geiger pungafruit"
	desc = "A glowing fleshy fruit with a pulsing green skin. Has a harsh acidic smell."
	icon_state = "geigpunga"
	bite_consumption_mod = 2
	foodtypes = FRUIT | TOXIC
	filling_color = "#55ff06"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/geigpunga_wine
	tastes = list("acid"= 6, "burning"= 5)

///////////////////// SNAPTAIL /////////////////////////x

/obj/item/seeds/ms13/snaptail
	name = "snaptail grains"
	desc = "These waxy grains grow into the sugary snaptail plant."
	species = "stalk"
	growing_color =  "#bda75f"
	wholeiconcolor = TRUE
	plantname = "Snaptail Reeds"
	product = /obj/item/food/grown/ms13/snaptail
	lifespan = 75
	endurance = 50
	yield = 5
	growthstages = 5
	production = 18 //6m to produce
	maturation = 42 //14m to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1, /datum/reagent/consumable/sugar = 0.1)
	nutrient_type = "K"

/obj/item/food/grown/ms13/snaptail
	seed = /obj/item/seeds/ms13/snaptail
	name = "snaptail"
	desc = "A lengthy cane. Very stiff and firm."
	icon_state = "snaptail"
	bite_consumption_mod = 1
	foodtypes = SUGAR | GROSS
	filling_color = "#caa3a3"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/snaptail_rum
	tastes = list("sugar"= 5, "reed"= 5)

///////////////////// TARBERRY /////////////////////////x

/obj/item/seeds/ms13/tarberry
	name = "tarberry seeds"
	desc = "These seeds grow into a tarberry bush."
	species = "vines"
	growing_color =  "#2f2525ff"
	plantname = "Tarberry Bush"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/squash)
	product = /obj/item/food/grown/ms13/tarberry
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/ms13/blackberry)
	lifespan = 118 //Good for roughly 4 harvests
	endurance = 35
	yield = 2 //8 fruit/seed
	growthstages = 3
	production = 16 //5m 20s to produce
	maturation = 50 //16m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/tarberry
	seed = /obj/item/seeds/ms13/tarberry
	name = "tarberry"
	desc = "A dark and sticky berry. It leaves a sap behind on your hands."
	bite_consumption_mod = 1
	foodtypes = FRUIT | GROSS
	icon_state = "tarberry"
	filling_color = "#2f2525ff"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/tarberry_wine
	tastes = list("oil"= 5, "stale berries"= 1)

//BLACKBERRYx

/obj/item/seeds/ms13/blackberry
	name = "blackberry seeds"
	desc = "These seeds grow into a mutated blackberry bush."
	species = "bush"
	growing_color =  "#351b3d"
	plantname = "Blackberry Bush"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/squash)
	product = /obj/item/food/grown/ms13/blackberry
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/ms13/radberry, /obj/item/seeds/ms13/tarberry)
	lifespan = 96 //Good for roughly 4 harvests
	endurance = 15
	yield = 2 //8 fruit/seed
	growthstages = 4
	production = 12 //4m to produce
	maturation = 45 //15m to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.02, /datum/reagent/consumable/nutriment = 0.08)
	nutrient_type = "P"

/obj/item/food/grown/ms13/blackberry
	seed = /obj/item/seeds/ms13/blackberry
	name = "blackberry"
	desc = "A squishy bundle of blackberries. Bubbly and round. It gives off a faint sweet aroma"
	bite_consumption_mod = 1
	foodtypes = FRUIT
	icon_state = "blackberry"
	filling_color = "#15172a"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/blackberry_wine
	tastes = list("berries"= 5, "juice"= 1)

//RADBERRYx

/obj/item/seeds/ms13/radberry
	name = "radberry pips"
	desc = "The seeds grow into the radioactive radberry."
	species = "bush2"
	growing_color =  "#00ff2a"
	plantname = "Radberry Shrub"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/squash)
	product = /obj/item/food/grown/ms13/radberry
	lifespan = 36
	endurance = 30
	instability = 90
	yield = 4
	growthstages = 3
	production = 12 //4m to produce
	maturation = 24 //8m to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.02, /datum/reagent/consumable/nutriment = 0.08)
	nutrient_type = "P"

/obj/item/food/grown/ms13/radberry
	seed = /obj/item/seeds/ms13/radberry
	name = "radberry"
	desc = "A glowing and warm radberry. The skin fringes off and exposes the squishy core."
	icon_state = "radberry"
	bite_consumption_mod = 1
	foodtypes = FRUIT | GROSS
	filling_color = "#00ff2a"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/radberry_wine
	tastes = list("metal"= 5, "sweetness"= 1)

///////////////////// YUCCA /////////////////////////

/obj/item/seeds/ms13/yucca
	name = "yucca seeds"
	desc = "These seeds grow into an yucca plant."
	species = "yucca"
	plantname = "yucca plant"
	product = /obj/item/food/grown/ms13/yucca
	lifespan = 105 //Good for roughly 3 harvests
	endurance = 45
	yield = 3 //9 fruit/seed
	growthstages = 4
	production = 13 //4m 20s to produce
	maturation = 64 //21m 20s to mature
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.08, /datum/reagent/consumable/nutriment = 0.15)
	nutrient_type = "K"

/obj/item/food/grown/ms13/yucca
	seed = /obj/item/seeds/ms13/yucca
	name = "yucca fruit"
	desc = "The fleshy long fruit. It gives off a faint sweet starch smell."
	icon_state = "yucca"
	bite_consumption_mod = 4
	foodtypes = FRUIT
	filling_color = "#b4a031ff"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/yucca_wine
	tastes = list("sweet" = 5, "starch" = 2)

//TOMATO

/obj/item/seeds/ms13/tomato
	name = "tomato seeds"
	desc = "Some strange seeds."
	species = "bush"
	growing_color =  "#a7200e"
	plantname = "Tomato Plant"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/squash, /datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/tomato
	mutatelist = list(/obj/item/seeds/ms13/tato, /datum/plant_gene/trait/repeated_harvest)
	lifespan = 72 //Good for roughly 3 harvests
	endurance = 20
	yield = 2 //6 tomatoes/seed
	growthstages = 4
	production = 10 //3m 20s to produce
	maturation = 40 //13m 20s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/tomato
	seed = /obj/item/seeds/ms13/tomato
	name = "tomato"
	desc = "A strange red, round fruit with a semi-thick skin. It is squishy."
	bite_consumption_mod = 2
	foodtypes = FRUIT | VEGETABLES
	icon_state = "tomato"
	filling_color = "#8d1d1d"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/tomato_wine
	tastes = list("sweetness" = 3, "tangy acid" = 2)

/////////////////////////////////////////////////////////////
/////////////////////  VEGETABLES ///////////////////////////
/////////////////////////////////////////////////////////////

//////////////////////// TATO /////////////////////////////

/obj/item/seeds/ms13/tato
	name = "tato sprouts"
	desc = "These tato sprouts replicate the disgusting tato plant."
	species = "bush2"
	growing_color =  "#703e2e"
	plantname = "Tato Plant"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/tato
	mutatelist = list(/obj/item/seeds/ms13/tomato, /obj/item/seeds/ms13/potato)
	lifespan = 88 //Good for roughly 3 harvests
	endurance = 60
	yield = 3 //9 tatos/seed
	growthstages = 3
	production = 12 //4m to produce
	maturation = 50 //16m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/tato
	seed = /obj/item/seeds/ms13/tato
	name = "tato"
	desc = "An oblong and hard red plant. It smells disgusting."
	bite_consumption_mod = 3
	foodtypes = VEGETABLES | GROSS
	icon_state = "tato"
	filling_color = "#4b2727"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/tato_liquor
	tastes = list("raw eggs"= 5)

//POTATO

/obj/item/seeds/ms13/potato
	name = "potato sprouts"
	desc = "Pre-war potato sprouts, grow into clusters of potatos in the soil, highly resistant."
	species = "root"
	plantname = "Potatos"
	product = /obj/item/food/grown/ms13/potato
	mutatelist = list(/obj/item/seeds/ms13/tato)
	lifespan = 50
	endurance = 60
	yield = 4
	growthstages = 3
	production = 9 //3m to produce
	maturation = 28 //9m 20s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.25)
	nutrient_type = "K"

/obj/item/food/grown/ms13/potato
	seed = /obj/item/seeds/ms13/potato
	name = "potato"
	desc = "A strange and round vegetable. Has a faint starchy hint to it, and is seemingly rock hard."
	bite_consumption_mod = 2
	foodtypes = VEGETABLES | GROSS
	icon_state = "potato"
	filling_color = "#ada876"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/waster_vodka
	tastes = list("starch"= 5)

////////////////////// JALEPENO /////////////////////////////

/obj/item/seeds/ms13/jalepeno
	name = "jalapeno seeds"
	desc = "These seeds grow into long spicy desert-proof peppers."
	species = "bush"
	growing_color =  "#233b29"
	plantname = "Jalepeno Plant"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/jalepeno
	mutatelist = list(/obj/item/seeds/ms13/radpepper)
	lifespan = 90 //Good for roughly 4 harvests
	endurance = 35
	yield = 3 //12 peppers/seed
	growthstages = 4
	production = 13 //4m 20s to produce
	maturation = 35 //11m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.01, /datum/reagent/consumable/nutriment = 0.05, /datum/reagent/consumable/capsaicin = 0.025)
	nutrient_type = "P"

/obj/item/food/grown/ms13/jalepeno
	seed = /obj/item/seeds/ms13/jalepeno
	name = "jalapeno"
	desc = "A moderately sized thin green pepper. Has no smell to it."
	bite_consumption_mod = 1
	foodtypes = VEGETABLES
	icon_state = "jalepeno"
	filling_color = "#233b29"
	tastes = list("spicy"= 5)

//RADPEPPER

/obj/item/seeds/ms13/radpepper
	name = "radpepper seeds"
	desc = "The seeds grow into an even spicier and radioactive jalepeno variant."
	species = "bush"
	growing_color =  "#fffb02"
	plantname = "Radpepper Bush"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/squash, /datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/radpepper
	mutatelist = list(/obj/item/seeds/ms13/jalepeno)
	lifespan = 88 //Good for roughly 4 harvests
	instability = 90
	endurance = 30
	yield = 3 //12 peppers/seed
	growthstages = 4
	production = 11 //3m 40s to produce
	maturation = 42 //14m to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.01, /datum/reagent/consumable/nutriment = 0.05, /datum/reagent/consumable/capsaicin = 0.25)
	nutrient_type = "P"

/obj/item/food/grown/ms13/radpepper
	seed = /obj/item/seeds/ms13/radpepper
	name = "radpepper"
	desc = "A glowing thin green pepper. Has a palpable heat to its aroma."
	bite_consumption_mod = 1
	foodtypes = VEGETABLES | TOXIC
	icon_state = "radpepper"
	filling_color = "#837e3c"
	tastes = list("death"= 5, "pain"= 5)

//////////////////////// ONION //////////////////////////////

/obj/item/seeds/ms13/onion
	name = "onion sprouts"
	desc = "The sprouts grow into a hardy onion plant."
	species = "root"
	plantname = "Onions"
	product = /obj/item/food/grown/ms13/onion
	mutatelist = list(/obj/item/seeds/ms13/garlic)
	lifespan = 40
	endurance = 50
	yield = 4
	growthstages = 3
	production = 10 //3m 20s to produce
	maturation = 24 //8m to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/onion
	seed = /obj/item/seeds/ms13/onion
	name = "onion"
	desc = "A hardy and aromatic root vegetable. Seems to have layers."
	bite_consumption_mod = 4
	foodtypes = VEGETABLES | GROSS
	icon_state = "onion"
	filling_color = "#5d5151"
	tastes = list("sour"= 5)

//GARLIC

/obj/item/seeds/ms13/garlic
	name = "garlic seeds"
	desc = "These seeds grow into garlic"
	species = "root"
	plantname = "Garlic Plant"
	product = /obj/item/food/grown/ms13/garlic
	mutatelist = list(/obj/item/seeds/ms13/onion)
	lifespan = 60
	endurance = 50
	maturation = 38 //12m 40s to mature
	production = 9 //3m to produce
	yield = 4
	instability = 15
	growthstages = 3
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/garlic
	seed = /obj/item/seeds/ms13/garlic
	name = "garlic"
	desc = "A hard and potent smelling vegetable"
	bite_consumption_mod = 1
	foodtypes = VEGETABLES
	icon_state = "garlic"
	filling_color = "#707070"
	tastes = list("garlic"= 5, "burning" = 5)

//////////////////////// XANDER /////////////////////////////

/obj/item/seeds/ms13/xander
	name = "xander roots"
	desc = "These xander roots grow in size, producing denser and healing Xander roots."
	species = "root"
	plantname = "Xander Roots"
	product = /obj/item/food/grown/ms13/xander
	lifespan = 75
	endurance = 50
	maturation = 48 //16m to mature
	production = 12 //4m to produce
	yield = 4
	growthstages = 3
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/xander
	seed = /obj/item/seeds/ms13/xander
	name = "xander root"
	desc = "A dark root, it is rather hard. There is no obvious smell to it."
	bite_consumption_mod = 4
	foodtypes = VEGETABLES | GROSS
	icon_state = "xander"
	filling_color = "#2f2424"
	tastes = list("bitterness"= 5)

/obj/item/food/grown/ms13/xander/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/grown/ms13/xander/cut, 1, 30)

/obj/item/food/grown/ms13/xander/cut
	name = "sliced xander root"
	desc = "A xander root that has been cut into thinner parts, you think you could hang this to dry."
	icon_state = "cut_xander"
	can_dry = TRUE
	dry_time = 900 // 15 Minutes
	dried_type = /obj/item/ms13/dried/xander

//////////////////////// CARROT /////////////////////////////

/obj/item/seeds/ms13/carrot
	name = "carrot seeds"
	desc = "Some carrot seeds."
	species = "root"
	plantname = "Carrots"
	product = /obj/item/food/grown/ms13/carrot
	lifespan = 48
	endurance = 40
	yield = 4
	growthstages = 3
	production = 9 //3m to produce
	maturation = 35 //11m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "K"

/obj/item/food/grown/ms13/carrot
	seed = /obj/item/seeds/ms13/carrot
	name = "carrot"
	desc = "A root vegetable, long and orange. Smells faintly sweet."
	bite_consumption_mod = 2
	foodtypes = VEGETABLES
	icon_state = "carrot"
	filling_color = "#815c1f"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/carrot_wine
	tastes = list("sweetness"= 1)

//////////////////////// RAZORGRAIN /////////////////////////

/obj/item/seeds/ms13/razorgrain
	name = "razorgrain grains"
	desc = "Some hardy mutated wheat grains, a staple plant in the wasteland."
	species = "stalk"
	growing_color = "#644e2c"
	wholeiconcolor = TRUE
	plantname = "Razorgrain Stalks"
	product = /obj/item/food/grown/ms13/razorgrain
	lifespan = 70
	endurance = 60
	yield = 4
	growthstages = 5
	production = 13 //4m 20s to produce
	maturation = 38 //12m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/razorgrain
	seed = /obj/item/seeds/ms13/razorgrain
	name = "razorgrain"
	desc = "Some razorgrain. It is very bushy and flakes off dust as you brush it."
	bite_consumption_mod = 1
	foodtypes = GRAIN | GROSS
	icon_state = "razorgrain"
	filling_color = "#8f905b"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/waster_beer
	tastes = list("chalky grain"= 5)

//////////////////////// BAIFAN /////////////////////////////

/obj/item/seeds/ms13/baifan
	name = "baifan grains"
	desc = "Some hardy mutated rice grains"
	species = "stalk"
	growing_color = "#688265"
	wholeiconcolor = TRUE
	plantname = "Baifan Stalks"
	product = /obj/item/food/grown/ms13/baifan
	lifespan = 75
	endurance = 65
	yield = 5
	growthstages = 5
	production = 14 //4m 40s to produce
	maturation = 44 //14m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/baifan
	seed = /obj/item/seeds/ms13/baifan
	name = "baifan"
	desc = "A tuft-topped stalk of baifan. Yields a rice-like grain."
	bite_consumption_mod = 1
	foodtypes = GRAIN | GROSS
	icon_state = "baifan"
	filling_color = "#505749"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/waster_sake
	tastes = list("chalky grain"= 2, "raw rice"= 5)

/////////////////////// CABBAGE /////////////////////////////

/obj/item/seeds/ms13/cabbage
	name = "cabbage seeds"
	desc = "Some hardy cabbage seeds."
	species = "vines"
	growing_color =  "#334632"
	plantname = "Cabbage Plant"
	harvest_icon = 1
	product = /obj/item/food/grown/ms13/cabbage
	lifespan = 65
	endurance = 60
	yield = 4
	growthstages = 3
	production = 15 //5m to produce
	maturation = 33 //11m to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/cabbage
	seed = /obj/item/seeds/ms13/cabbage
	name = "cabbage"
	desc = "A resilient leaf plant, only green thing out here."
	bite_consumption_mod = 4
	foodtypes = VEGETABLES
	icon_state = "cabbage"
	filling_color = "#2d382a"
	tastes = list("cabbage"= 5)

//////////////////////// PINYON /////////////////////////////

/obj/item/seeds/ms13/pinyon
	name = "pinyon nuts"
	desc = "Some pinyon nuts, grows into a pinyon pine"
	species = "tree"
	growing_color =  "#7b7c68"
	plantname = "Pinyon Pine"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/pinyon
	lifespan = 150 //Good for roughly 3 harvests
	endurance = 55
	yield = 4 //12 nuts/seed
	growthstages = 5
	production = 18 //6m to produce
	maturation = 90 //30m to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "K"

/obj/item/food/grown/ms13/pinyon
	seed = /obj/item/seeds/ms13/pinyon
	name = "pinyon nuts"
	desc = "Small pinyon nuts."
	bite_consumption_mod = 2
	foodtypes = VEGETABLES
	icon_state = "pinyon"
	filling_color = "#7b7c68"
	tastes = list("nutty"= 4, "sourness"= 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/vitamin = 1)

///////////////////////// MESQUITE //////////////////////////

/obj/item/seeds/ms13/mesquite
	name = "mesquite seeds"
	desc = "Some honey mesquite seeds."
	species = "bush"
	growing_color =  "#525011"
	plantname = "Mesquite Plant"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/mesquite
	lifespan = 85 //Good for roughly 2 harvests
	endurance = 40
	yield = 3 //6 pods/seed
	growthstages = 4
	production = 16 //5m 20s to produce
	maturation = 50 //16m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "K"

/obj/item/food/grown/ms13/mesquite
	seed = /obj/item/seeds/ms13/mesquite
	name = "mesquite"
	desc = "Long honey mesquite pods. The pod itself has the texture of old leather."
	bite_consumption_mod = 2
	foodtypes = VEGETABLES
	icon_state = "mesquite"
	filling_color = "#223a24"
	tastes = list("sour"= 5, "sweet"= 5)

/////////////////////// BUFFALO /////////////////////////////

/obj/item/seeds/ms13/buffalo
	name = "buffalo seeds"
	desc = "Some buffalo gourd seeds."
	species = "vines"
	growing_color =  "#cadca3"
	plantname = "Buffalo Vines"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/squash)
	product = /obj/item/food/grown/ms13/buffalo
	lifespan = 80
	endurance = 45
	yield = 5
	growthstages = 3
	production = 13 //4m 20s to produce
	maturation = 54 //18m to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/buffalo
	seed = /obj/item/seeds/ms13/buffalo
	name = "buffalo"
	desc = "A buffalo gourd, a decent ingredient, but nasty when raw."
	bite_consumption_mod = 6
	foodtypes = VEGETABLES | GROSS
	icon_state = "buffalo"
	filling_color = "#2b3325"
	tastes = list("wood"= 5)

//////////////////////// MAIZE //////////////////////////////

/obj/item/seeds/ms13/maize
	name = "maize seeds"
	desc = "Some maize seeds."
	species = "corn"
	plantname = "Maize Stalks"
	product = /obj/item/food/grown/ms13/maize
	lifespan = 70
	endurance = 50
	yield = 4
	growthstages = 3
	production = 12 //4m to produce
	maturation = 44 //14m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "K"

/obj/item/food/grown/ms13/maize
	seed = /obj/item/seeds/ms13/maize
	name = "maize"
	desc = "A hardy maize crop. Has a thick husk around it."
	bite_consumption_mod = 4
	foodtypes = VEGETABLES | GRAIN
	icon_state = "maize"
	filling_color = "#bbb81c"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/waster_whiskey
	tastes = list("corn"= 5)

/////////////////////////////////////////////////////////////
///////////////////// FLOWER/HERBS //////////////////////////
/////////////////////////////////////////////////////////////

///////////////////////// ASH ROSE //////////////////////////

/obj/item/seeds/ms13/ashrose
	name = "ash rose seeds"
	desc = "Some ash rose seeds."
	species = "flower2"
	growing_color =  "#612a20"
	plantname = "Ash Roses"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/ashrose
	lifespan = 144 //Good for roughly 3 harvests
	endurance = 25
	yield = 3 //9 flowers/seed
	growthstages = 3
	production = 18 //6m to produce
	maturation = 84 //28m to mature
	instability = 25
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/ashrose
	seed = /obj/item/seeds/ms13/ashrose
	name = "ash rose"
	desc = "A pretty red colored flower. Its petals are layered with a dense core."
	bite_consumption_mod = 1
	foodtypes = GROSS
	icon_state = "ashrose"
	filling_color = "#411c19"
	tastes = list("sourness"= 5)

//radrose

/obj/item/seeds/ms13/radrose
	name = "rad rose seeds"
	desc = "Some rad rose seeds."
	species = "flower2"
	growing_color =  "#18f2fa"
	plantname = "Rad Roses"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/radrose
	lifespan = 118 //Good for roughly 3 harvests
	endurance = 18
	yield = 3 //9 flowers/seed
	growthstages = 3
	production = 12 //4m to produce
	maturation = 78 //26m to mature
	instability = 90
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/radrose
	seed = /obj/item/seeds/ms13/radrose
	name = "rad rose"
	desc = "A vibrant cyan colored flower. It seemingly begs for your attention."
	bite_consumption_mod = 1
	foodtypes = GROSS | TOXIC
	icon_state = "radrose"
	filling_color = "#579797"
	tastes = list("warmth"= 5, "sourness"= 5, "pain"= 5)

/////////////////////////// SOOT ////////////////////////////

/obj/item/seeds/ms13/soot
	name = "soot seeds"
	desc = "Some soot seeds."
	species = "flower"
	growing_color =  "#7c2292"
	plantname = "Soot Flowers"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/soot
	lifespan = 142 //Good for roughly 4 harvests
	endurance = 35
	yield = 3 //12 flowers/seed
	growthstages = 3
	production = 11 //3m 40s to produce
	maturation = 90 //30m to mature
	instability = 25
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "K"

/obj/item/food/grown/ms13/soot
	seed = /obj/item/seeds/ms13/soot
	name = "soot flower"
	desc = "A vibrant purple flower with a strange shape."
	bite_consumption_mod = 1
	foodtypes = GROSS | TOXIC
	icon_state = "soot"
	filling_color = "#462050"
	tastes = list("bitterness"= 5)

//toxicsoot

/obj/item/seeds/ms13/toxicsoot
	name = "toxic soot seeds"
	desc = "Some mutated soot seeds."
	species = "flower"
	growing_color =  "#229235"
	plantname = "Toxic Soot Flowers"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/toxicsoot
	lifespan = 136 //Good for roughly 3 harvests
	endurance = 35
	yield = 3 //9 flowers/seed
	growthstages = 3
	production = 18 //6m to produce
	maturation = 66 //22m to mature
	instability = 50
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "K"

/obj/item/food/grown/ms13/toxicsoot
	seed = /obj/item/seeds/ms13/toxicsoot
	name = "toxic soot flower"
	desc = "A glowing flower. It has a strange shape, with multiple points sticking forward."
	bite_consumption_mod = 1
	foodtypes = GROSS | TOXIC
	icon_state = "toxsoot"
	filling_color = "#34773f"
	tastes = list("bitterness"= 10)

////////////////////////// DATURA ///////////////////////////

/obj/item/seeds/ms13/datura
	name = "datura seeds"
	desc = "Some datura seeds."
	species = "flower2"
	growing_color =  "#dddddd"
	plantname = "Datura Flowers"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/datura
	lifespan = 118 //Good for roughly 3 harvests
	endurance = 20
	yield = 3 //9 flowers/seed
	growthstages = 3
	production = 14 //4m 40s to produce
	maturation = 70 //23m 20s to mature
	instability = 25
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/datura
	seed = /obj/item/seeds/ms13/datura
	name = "datura flower"
	desc = "An unstained white flower. Has a strange smell to it."
	bite_consumption_mod = 1
	foodtypes = GROSS
	icon_state = "datura"
	filling_color = "#a7a7a7"
	tastes = list("bitterness"= 5)

//radtura

/obj/item/seeds/ms13/radtura
	name = "radtura seeds"
	desc = "Some radtura seeds."
	species = "flower2"
	growing_color =  "#e8bf28"
	plantname = "Radtura Flowers"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/radtura
	lifespan = 114 //Good for roughly 3 harvests
	endurance = 25
	yield = 3 //9 flowers/seed
	growthstages = 3
	production = 17 //5m 40s to produce
	maturation = 58 //19m 20m to mature
	instability = 50
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/radtura
	seed = /obj/item/seeds/ms13/radtura
	name = "radtura flower"
	desc = "A pulsing yellow cup shaped flower. Has a very strange smell. You can feel a warmth resonating from it."
	bite_consumption_mod = 1
	foodtypes = GROSS
	icon_state = "radtura"
	filling_color = "#a2a36c"
	tastes = list("bitterness"= 5, "warmth"= 5)

////////////////////////// COYOTE ///////////////////////////

/obj/item/seeds/ms13/coyote
	name = "coyote tobacco stems"
	desc = "Some seeds that grow into a potent native tobacco plant, it has many uses."
	species = "root"
	plantname = "Coyote Tobacco"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/coyote
	lifespan = 152 //Good for roughly 5 harvests
	endurance = 18
	yield = 2 //10 leaves/seed
	growthstages = 3
	production = 12 //4m to produce
	maturation = 85 //28m 20s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/coyote
	seed = /obj/item/seeds/ms13/coyote
	name = "coyote tobacco"
	desc = "A coyote tobacco leaf. Smells quite nice."
	bite_consumption_mod = 1
	foodtypes = GROSS
	icon_state = "tobacco"
	filling_color = "#1d3821"
	can_dry = TRUE
	dried_type = /obj/item/ms13/dried/tobacco

////////////////////////// ASTER ////////////////////////////

/obj/item/seeds/ms13/aster
	name = "aster seeds"
	desc = "Some aster seeds."
	species = "flower"
	growing_color =  "#3f4c72"
	plantname = "Aster Flowers"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/aster
	lifespan = 158 //Good for roughly 3 harvests
	endurance = 35
	yield = 4 //12 flowers/seed
	growthstages = 3
	production = 18 //6m to produce
	maturation = 96 //32m to mature
	instability = 25
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/aster
	seed = /obj/item/seeds/ms13/aster
	name = "aster flower"
	desc = "A wide blue flower with a vibrant red and yellow core. Seems to have dust on it."
	bite_consumption_mod = 1
	icon_state = "aster"
	filling_color = "#1e2b2c"
	tastes = list("salt"= 5, "pepper"= 5)

/////////////////////// ASH BLOSSOM /////////////////////////

/obj/item/seeds/ms13/ashblossom
	name = "ash blossom seeds"
	desc = "Some ash blossom seeds."
	species = "flower2"
	growing_color =  "#232b44"
	plantname = "Ash Blossoms"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/ashblossom
	lifespan = 142 //Good for roughly 3 harvests
	endurance = 40
	yield = 4 //12 flowers/seed
	growthstages = 3
	production = 15 //5m to produce
	maturation = 90 //30m to mature
	instability = 25
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "K"

/obj/item/food/grown/ms13/ashblossom
	seed = /obj/item/seeds/ms13/ashblossom
	name = "ash blossom"
	desc = "A long purple and blue flower. Has a nice aroma to it."
	bite_consumption_mod = 1
	foodtypes = GROSS
	icon_state = "ashblossom"
	filling_color = "#213436"

///////////////////////// THISTLE ///////////////////////////

/obj/item/seeds/ms13/thistle //unused for now
	name = "thistle seeds"
	desc = "Some thistle seeds"
	species = "vines"
	growing_color =  "#a64e5a"
	plantname = "Thistles"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest,/datum/plant_gene/trait/stinging)
	product = /obj/item/food/grown/ms13/thistle
	lifespan = 25
	endurance = 10
	maturation = 6
	production = 3
	yield = 5
	instability = 25
	growthstages = 3
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/thistle
	seed = /obj/item/seeds/ms13/thistle
	name = "thistle"
	desc = "A purple star shaped pickly weed."
	bite_consumption_mod = 1
	foodtypes = GROSS
	icon_state = "thistle"
	filling_color = "#a64e5a"
	tastes = list("pain"= 5)

/obj/item/food/grown/ms13/thistle/pickup(mob/living/user)
	..()
	if(!iscarbon(user))
		return FALSE
	var/mob/living/carbon/C = user
	if(C.gloves)
		return FALSE
	if(HAS_TRAIT(C, TRAIT_PIERCEIMMUNE))
		return FALSE
	var/hit_zone = (C.held_index_to_dir(C.active_hand_index) == "l"? "l_":"r_") + "arm"
	var/obj/item/bodypart/affecting = C.get_bodypart(hit_zone)
	if(affecting)
		if(affecting.receive_damage(burn = 5))
			C.update_damage_overlays()
	to_chat(C, "<span class='userdanger'>The thistles sting your bare hand!</span>")
	return TRUE

////////////////////////// AGAVE ////////////////////////////

/obj/item/seeds/ms13/agave
	name = "agave spines"
	desc = "These seeds grow into the burn healing agave plant."
	species = "cactus2"
	growing_color =  "#37524e"
	plantname = "Agave"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/agave
	lifespan = 170 //Good for roughly 4 harvests
	endurance = 55
	yield = 3 //12 spines/seed
	growthstages = 4
	production = 16 //5m 20s to produce
	maturation = 99 //33m to mature
	instability = 25
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/agave
	seed = /obj/item/seeds/ms13/agave
	name = "agave"
	desc = "A fleshy blade of plant matter. Quite firm and feels as if it will snap easily."
	bite_consumption_mod = 1
	icon_state = "agave"
	filling_color = "#37524e"
	distill_reagent = /datum/reagent/consumable/ethanol/ms13/waster_tequila
	tastes = list("bitterness"= 5)

/////////////////////// BROC FLOWER /////////////////////////

/obj/item/seeds/ms13/brocflower
	name = "broc flower seeds"
	desc = "These seeds grow into broc flowers."
	species = "flower"
	growing_color =  "#88561c"
	plantname = "Broc Flowers"
	harvest_icon = 1
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	product = /obj/item/food/grown/ms13/brocflower
	lifespan = 148 //Good for roughly 4 harvests
	endurance = 30
	maturation = 84 //28m to mature
	production = 14 //4m 40s to produce
	yield = 2 //8 flowers/seed
	growthstages = 3
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/brocflower
	seed = /obj/item/seeds/ms13/brocflower
	name = "broc flower"
	desc = "A vibrant, orange flower. Very soft to the touch and easy to damage."
	bite_consumption_mod = 1
	icon_state = "brocflower"
	filling_color = "#493d28"
	tastes = list("broc"= 5)
	can_dry = TRUE
	dry_time = 480 //8 minutes
	dried_type = /obj/item/ms13/dried/broc

/////////////////////////////////////////////////////////////
//////////////////////// FUNGUS /////////////////////////////
/////////////////////////////////////////////////////////////

//////////////////////// CAVEFUNG ///////////////////////////

/obj/item/seeds/ms13/cavefungus
	name = "cave fungus spores"
	desc = "These spores grow into cave fungi."
	species = "mushroom"
	icon_harvest = "mushroom-grow4"
	growing_color =  "#cd6c4b"
	wholeiconcolor = TRUE
	plantname = "Cave Fungus Mushrooms"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	product = /obj/item/food/grown/ms13/cavefungus
	lifespan = 60
	endurance = 65
	yield = 3
	growthstages = 4
	production = 9 //3m to produce
	maturation = 38 //12m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "K"

/obj/item/food/grown/ms13/cavefungus
	seed = /obj/item/seeds/ms13/cavefungus
	name = "cave fungus"
	desc = "A rather plain looking mushroom. Nothing about it stands out in particular."
	bite_consumption_mod = 1
	icon_state = "cavefungus"
	foodtypes = VEGETABLES
	filling_color = "#64553b"
	tastes = list("mushroom"= 5)

//GLOWCAVEFUNG

/obj/item/seeds/ms13/glowfungus
	name = "glow fungus spores"
	desc = "These spores grow into glowing cave fungi."
	species = "mushroom"
	icon_harvest = "mushroom-grow4"
	growing_color =  "#98b752"
	wholeiconcolor = TRUE
	plantname = "Glowfungus Mushrooms"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism, /datum/plant_gene/trait/glow/ms13green)
	product = /obj/item/food/grown/ms13/cavefungus
	lifespan = 45
	endurance = 40
	yield = 3
	growthstages = 4
	production = 12 //4m to produce
	maturation = 30 //10m to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "K"

/obj/item/food/grown/ms13/glowfungus
	seed = /obj/item/seeds/ms13/glowfungus
	name = "glow fungus"
	desc = "A glowing mushroom. Gives off a strange warmth even just looking at it."
	bite_consumption_mod = 1
	icon_state = "glowfungus"
	foodtypes = TOXIC
	filling_color = "#357944"
	tastes = list("mushroom"= 5, "warmth"= 5)
	light_range = 2
	light_power = 0.25

/datum/plant_gene/trait/glow/ms13green
	//oh no, now i'm radioactive
	name = "Radioactive Bioluminescence"
	rate = 0.01
	glow_color = "#50e650"

//////////////////////// BLIGHT /////////////////////////////

/obj/item/seeds/ms13/blight
	name = "blight spores"
	desc = "These spores grow into the blight mushroom."
	species = "blight"
	icon_harvest = "blight-grow4"
	plantname = "Blight Fungus"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	product = /obj/item/food/grown/ms13/blight
	lifespan = 75
	endurance = 65
	yield = 4
	growthstages = 4
	production = 11 //3m 40s to produce
	maturation = 46 //15m 20s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/blight
	seed = /obj/item/seeds/ms13/blight
	name = "blight mushroom"
	desc = "A dark, strange spotted mushroom. Has a thick trunk and is firm."
	bite_consumption_mod = 1
	icon_state = "blight"
	foodtypes = GROSS | TOXIC
	filling_color = "#575c2a"
	tastes = list("spice"= 5, "gunk"= 5)

////////////////////// BRAIN FUNGUS /////////////////////////

/obj/item/seeds/ms13/brainfung
	name = "brain fungus spores"
	desc = "These spores grow into the brain fungus."
	species = "brainfung"
	icon_harvest = "brainfung-grow4"
	plantname = "Brain Fungus"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	product = /obj/item/food/grown/ms13/brainfung
	lifespan = 48
	endurance = 35
	yield = 3
	growthstages = 4
	production = 12 //4m to produce
	maturation = 30 //10m to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/brainfung
	seed = /obj/item/seeds/ms13/brainfung
	name = "brain fungus"
	desc = "An asymmetrically shaped flesh colored mushroom. Upon close examination, it looks like it has spines."
	bite_consumption_mod = 1
	foodtypes = GROSS | TOXIC
	icon_state = "brainfung"
	filling_color = "#c87070"
	tastes = list("illness"= 5)

/obj/item/food/grown/ms13/brainfung/pickup(mob/living/user)
	..()
	if(!iscarbon(user))
		return FALSE
	var/mob/living/carbon/C = user
	if(C.gloves)
		return FALSE
	if(HAS_TRAIT(C, TRAIT_PIERCEIMMUNE))
		return FALSE
	else
		C.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
	to_chat(C, "<span class='userdanger'>The brainfungus pierces your hand!</span>")
	return TRUE

//////////////////////// FIRECAP ////////////////////////////

/obj/item/seeds/ms13/firecap
	name = "firecap spores"
	desc = "These spores grow into the firecap mushroom."
	species = "mushroom"
	icon_harvest = "mushroom-grow4"
	growing_color =  "#eb9320"
	wholeiconcolor = TRUE
	plantname = "Firecap Cluster"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	product = /obj/item/food/grown/ms13/firecap
	lifespan = 48
	endurance = 35
	yield = 3
	growthstages = 4
	production = 9 //3m to produce
	maturation = 36 //12m to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/firecap
	seed = /obj/item/seeds/ms13/firecap
	name = "firecap"
	desc = "A red bubbly mushroom cap. You can almost see fluid moving in the boils."
	bite_consumption_mod = 1
	foodtypes = TOXIC
	icon_state = "firecap"
	filling_color = "#3f2e0f"
	tastes = list("fire"= 5, "mushroom"= 1)

/obj/item/food/grown/ms13/firecap/pickup(mob/living/user)
	..()
	if(!iscarbon(user))
		return FALSE
	var/mob/living/carbon/C = user
	if(C.gloves)
		return FALSE
	if(HAS_TRAIT(C, TRAIT_PIERCEIMMUNE))
		return FALSE
	var/hit_zone = (C.held_index_to_dir(C.active_hand_index) == "l"? "l_":"r_") + "arm"
	var/obj/item/bodypart/affecting = C.get_bodypart(hit_zone)
	if(affecting)
		if(affecting.receive_damage(burn = 25))
			C.update_damage_overlays()
	to_chat(C, "<span class='userdanger'>The firecap juice rubs off on your hand!</span>")
	return TRUE

//////////////////////// GUTSHROOM ////////////////////////////

/obj/item/seeds/ms13/gutshroom
	name = "gutshroom spores"
	desc = "These spores grow into gutshrooms."
	species = "longshroom"
	icon_harvest = "longshroom-grow4"
	growing_color =  "#a33b0c"
	wholeiconcolor = TRUE
	plantname = "Gutshroom Cluster"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	product = /obj/item/food/grown/ms13/gutshroom
	lifespan = 60
	endurance = 50
	yield = 3
	growthstages = 4
	production = 10 //3m 20s to produce
	maturation = 38 //12m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/gutshroom
	seed = /obj/item/seeds/ms13/gutshroom
	name = "gutshroom"
	desc = "A red button shaped mushroom. Has visible secretion and appears to be filled with juice."
	bite_consumption_mod = 1
	foodtypes = GROSS | TOXIC
	icon_state = "gutshroom"
	filling_color = "#38372a"
	tastes = list("pain"= 5)

/obj/item/food/grown/ms13/gutshroom/pickup(mob/living/user)
	..()
	if(!iscarbon(user))
		return FALSE
	var/mob/living/carbon/C = user
	if(C.gloves)
		return FALSE
	if(HAS_TRAIT(C, TRAIT_PIERCEIMMUNE))
		return FALSE
	else
		C.adjustOrganLoss(ORGAN_SLOT_STOMACH, 100)
	to_chat(C, "<span class='userdanger'>The gutshroom secretes onto you!</span>")
	return TRUE

//////////////////////// LURE WEED //////////////////////////

/obj/item/seeds/ms13/lureweed
	name = "lureweed spores"
	desc = "These spores grow into the invasive lureweed."
	species = "lureweed"
	icon_harvest = "lureweed-grow4"
	growing_color = "#735d32"
	wholeiconcolor = TRUE
	plantname = "Lureweeds"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	product = /obj/item/food/grown/ms13/lureweed
	lifespan = 75
	endurance = 55
	yield = 4
	growthstages = 4
	production = 10 //3m 20s to produce
	maturation = 50 //16m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/lureweed
	seed = /obj/item/seeds/ms13/lureweed
	name = "lureweed"
	desc = "A long and hard, fungus. It has a leather-like appearance."
	bite_consumption_mod = 8
	icon_state = "lureweed"
	filling_color = "#383322"
	tastes = list("lureweed"= 5)

////////////////////////// NARA /////////////////////////////

/obj/item/seeds/ms13/nara
	name = "nara spores"
	desc = "These spores grow into the nara fungus."
	species = "longshroom"
	icon_harvest = "longshroom-grow4"
	growing_color =  "#3c729e"
	wholeiconcolor = TRUE
	plantname = "Nara Fungus"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	product = /obj/item/food/grown/ms13/nara
	lifespan = 60
	endurance = 50
	yield = 3
	growthstages = 4
	production = 7 //2m 20s to produce
	maturation = 38 //12m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/nara
	seed = /obj/item/seeds/ms13/nara
	name = "nara fungus"
	desc = "A dark and fleshy mushroom. It has a strange stench to it."
	bite_consumption_mod = 2
	icon_state = "nara"
	filling_color = "#770d0d"
	tastes = list("blood"= 5)

////////////////////// FLY AMANITA //////////////////////////

/obj/item/seeds/ms13/flyamanita
	name = "fly amanita spores"
	desc = "These spores grow into the poisonous fly amanita."
	species = "flyamanita"
	icon_harvest = "flyamanita-grow4"
	growing_color =  "#672d13"
	wholeiconcolor = TRUE
	plantname = "Fly Amanita"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	product = /obj/item/food/grown/ms13/flyamanita
	lifespan = 48
	endurance = 35
	yield = 3
	growthstages = 4
	production = 12 //4m to produce
	maturation = 30 //10m to mature
	reagents_add = list(/datum/reagent/toxin = 0.08, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/flyamanita
	seed = /obj/item/seeds/ms13/flyamanita
	name = "fly amanita"
	desc = "A dark red mushroom with white spots looking like nib sugar."
	bite_consumption_mod = 1
	foodtypes = TOXIC
	icon_state = "flyamanita"
	filling_color = "#c87070"
	tastes = list("illness"= 5, "bitterness"= 5)

/////////////////////// PENNY BUN ///////////////////////////

/obj/item/seeds/ms13/pennybun
	name = "penny bun spores"
	desc = "These spores grow into the tasty penny bun."
	species = "pennybun"
	icon_harvest = "pennybun-grow4"
	growing_color =  "#672d13"
	wholeiconcolor = TRUE
	plantname = "Penny Bun"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	product = /obj/item/food/grown/ms13/pennybun
	lifespan = 30
	endurance = 25
	yield = 3
	growthstages = 4
	production = 14 //4m 40s to produce
	maturation = 38 //12m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "K"

/obj/item/food/grown/ms13/pennybun
	seed = /obj/item/seeds/ms13/pennybun
	name = "penny bun"
	desc = "A fungus with a large brown cap and prized as an ingredient in various culinary dishes."
	bite_consumption_mod = 1
	foodtypes = VEGETABLES
	icon_state = "pennybun"
	filling_color = "#c87070"
	tastes = list("succulent"= 5, "mushroom"= 5)

////////////////////// CHANTERELLE //////////////////////////

/obj/item/seeds/ms13/chanterelle
	name = "chanterelle spores"
	desc = "These spores grow into the tasty penny bun."
	species = "chanterelle"
	icon_harvest = "chanterelle-grow4"
	growing_color =  "#672d13"
	wholeiconcolor = TRUE
	plantname = "Chanterelle"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	product = /obj/item/food/grown/ms13/chanterelle
	lifespan = 48
	endurance = 35
	yield = 4
	growthstages = 4
	production = 12 //4m to produce
	maturation = 38 //12m 40s to mature
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "K"

/obj/item/food/grown/ms13/chanterelle
	seed = /obj/item/seeds/ms13/chanterelle
	name = "chanterelle"
	desc = "A funnel-shaped yellowish mushroom which emits a fruity aroma."
	bite_consumption_mod = 1
	foodtypes = VEGETABLES
	icon_state = "chanterelle"
	filling_color = "#c87070"
	tastes = list("savory"= 5, "fruity"= 5)

/////////////////////// MINDSHROOM //////////////////////////

/obj/item/seeds/ms13/mindshroom
	name = "mindshroom spores"
	desc = "These spores grow into the glowing mindshroom."
	species = "mindshroom"
	icon_harvest = "mindshroom-grow4"
	growing_color =  "#672d13"
	wholeiconcolor = TRUE
	plantname = "Mindshroom"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism, /datum/plant_gene/trait/glow/ms13blue)
	product = /obj/item/food/grown/ms13/mindshroom
	lifespan = 40
	endurance = 30
	yield = 3
	growthstages = 4
	production = 18 //6m to produce
	maturation = 45 //15m to mature
	reagents_add = list(/datum/reagent/drug/mushroomhallucinogen = 0.1, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "N"

/obj/item/food/grown/ms13/mindshroom
	seed = /obj/item/seeds/ms13/mindshroom
	name = "mindshroom"
	desc = "A glowing mushroom. You feel something at the back of your mind just looking at it."
	bite_consumption_mod = 1
	foodtypes = TOXIC
	icon_state = "mindshroom"
	filling_color = "#c87070"
	tastes = list("spicy"= 5, "mint"= 5)
	light_range = 2
	light_power = 0.25

/datum/plant_gene/trait/glow/ms13blue
	name = "Psionic Bioluminescence"
	rate = 0.01
	glow_color = "#50e650"

///////////////////// GREMLIN STOOL /////////////////////////

/obj/item/seeds/ms13/gremlinstool
	name = "gremlinstool spores"
	desc = "These spores grow into the invigorating gremling stool."
	species = "gremlinstool"
	icon_harvest = "gremlinstool-grow4"
	growing_color =  "#672d13"
	wholeiconcolor = TRUE
	plantname = "gremlinstool"
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	product = /obj/item/food/grown/ms13/gremlinstool
	lifespan = 48
	endurance = 35
	yield = 3
	growthstages = 4
	production = 15 //5m to produce
	maturation = 30 //10m to mature
	reagents_add = list(/datum/reagent/drug/methamphetamine = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	nutrient_type = "P"

/obj/item/food/grown/ms13/gremlinstool
	seed = /obj/item/seeds/ms13/gremlinstool
	name = "gremlinstool"
	desc = "A yellow-doted mushroom that oozes a clear liquid."
	bite_consumption_mod = 1
	foodtypes = TOXIC
	icon_state = "gremlinstool"
	filling_color = "#c87070"
	tastes = list("creamy"= 5, "fire"= 5)

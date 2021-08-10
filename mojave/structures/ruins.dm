#define RUIN_BODIES list("coupe" = 10, "muscle" = 3, "sport" = 3, "van" = 2)

/////////////////////////////////////////////////////////////
////////////// MOJAVE SUN RUINS/TRASH ///////////////////////
/////////////////////////////////////////////////////////////

///Place here semi-functional structures that are basically for scrapping/joonking///

//Cars//

/obj/structure/ms13/vehicle_ruin
	name = "vehicle ruin"
	desc = "A base class unrandomised vehicle, if you see it, report it foo."
	icon = 'mojave/icons/structure/wrecks.dmi'
	icon_state = "helper"
	bound_width = 96
	density = TRUE
	layer = FLY_LAYER
	anchored = TRUE
	max_integrity = 10000
	custom_materials = list(/datum/material/iron = 10000) //probably gonna be one of the main sources of scrap
	var/body_state = null

/obj/structure/ms13/vehicle_ruin/coupe
	body_state = "coupe"

/obj/structure/ms13/vehicle_ruin/muscle
	body_state = "muscle"

/obj/structure/ms13/vehicle_ruin/sport
	body_state = "sport"

/obj/structure/ms13/vehicle_ruin/van
	body_state = "van"

/obj/structure/ms13/vehicle_ruin/Initialize()
	. = ..()
	var/randomiser = rand(1,5)
	if(!body_state)
		body_state = pickweight(RUIN_BODIES)
	switch(body_state)
		if("coupe")
			name = "coupe car wreck"
			desc = "An old pre-war coupe car, scrapped and destroyed beyond repair. You may be able to salvage something from it."
			icon_state = "coupe-[randomiser]"
			add_overlay(image(icon, "coupe-tires-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "coupe-bumper-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "coupe-part-1-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "coupe-part-2-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "coupe-part-3-[randomiser]", FLOAT_LAYER, dir))
			return
		if("muscle")
			name = "muscle car wreck"
			desc = "An old pre-war muscle car, scrapped and destroyed beyond repair, legend says it has an interior capable of accommodating as much as seven people, including a super mutant, robobrain, and a deathclaw. You may be able to salvage something from it."
			icon_state = "muscle-[randomiser]"
			add_overlay(image(icon, "muscle-tires-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "muscle-bumper-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "muscle-part-1-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "muscle-part-2-[randomiser]", FLOAT_LAYER, dir))
			return
		if("sport")
			name = "sport car wreck"
			desc = "An old pre-war sport car, scrapped and destroyed beyond repair. You may be able to salvage something from it."
			icon_state = "sport-[randomiser]"
			add_overlay(image(icon, "sport-tires-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "sport-bumper-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "sport-part-1-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "sport-part-2-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "sport-part-3-[randomiser]", FLOAT_LAYER, dir))
			return
		if("van")
			name = "van wreck"
			desc = "An old pre-war van, scrapped and destroyed beyond repair. You may be able to salvage something from it."
			icon_state =  "van-[randomiser]"
			add_overlay(image(icon, "van-tires-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "van-bumper-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "van-part-1-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "van-part-2-[randomiser]", FLOAT_LAYER, dir))
			return

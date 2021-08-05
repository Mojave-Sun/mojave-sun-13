GLOBAL_LIST_EMPTY(water_wells_in_world)

//Fallout 13 water production well
//Produces a certain amount of water based on the number of currently alive human players

/obj/structure/well
	name = "water well"
	desc = "A structure that somehow brings up water from somewhere in the ground."
	icon_state = "well"
	icon = 'mojave/icons/structure/well_pump.dmi'
	var/alive_humans //Amount of alive humans in the world at time of processing

	/*
	The (water_ratio * 100)% of humans that will be sustained by the water production of all wells
	If this was = 2, then all wells will produce enough water together so that the current alive
	human population * 2 will be able to live without dying of thirst (provided it's all distributed)
	This will assume the thirst component negates (1 / 24) u of water per second per human, 10 minutes = 25u, 20 minutes = 50u etc.

	When var editing this value, call UpdateAllWells() to apply the ratio to all other wells unless you want this well
	to produce more water and not distribute
	*/
	var/water_ratio = 2
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF // N O

/obj/structure/well/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	GLOB.water_wells_in_world += src
	create_reagents(2000000, OPENCONTAINER | REFILLABLE)

/obj/structure/well/Destroy(force)
	GLOB.water_wells_in_world -= src
	..()

/obj/structure/well/process()

	alive_humans = 0
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H.stat == DEAD)
			continue
		if(!H.GetComponent(/datum/component/thirst))
			continue
		alive_humans++

	//Each human will consume about (1 / SECONDS_OF_LIFE_PER_WATER_U) per second, because this is process(), we need to * 2 the amount of water generated as process() here is per 2 seconds
	//We'll also have a minimum amount of water for super low pop, don't need to go to different faction bases just to get enough water when there's too many wells
	reagents.add_reagent(/datum/reagent/water, max(0.5, (((1 / SECONDS_OF_LIFE_PER_WATER_U) * 2 * water_ratio * alive_humans) / length(GLOB.water_wells_in_world))))

/obj/structure/well/proc/UpdateAllWells()
	for(var/obj/structure/well/well in GLOB.water_wells_in_world)
		well.water_ratio = water_ratio

/obj/structure/ms13/toilet
	name = "toilet"
	desc = "An old toilet. It's obviously seen better years, alas you think you can still see some water in it. Care for a drink?"
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "toilet"
	density = FALSE
	anchored = TRUE
	var/buildstacktype = /obj/item/stack/sheet/ms13/ceramic
	var/buildstackamount = 1

/obj/structure/ms13/toilet/deconstruct()
	if(!(flags_1 & NODECONSTRUCT_1))
		for(var/obj/toilet_item in contents)
			toilet_item.forceMove(drop_location())
		if(buildstacktype)
			new buildstacktype(loc,buildstackamount)
		else
			for(var/i in custom_materials)
				var/datum/material/M = i
				new M.sheet_type(loc, FLOOR(custom_materials[M] / MINERAL_MATERIAL_AMOUNT, 1))
	..()

/obj/structure/sink/ms13
	name = "sink"
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "sink"
	desc = "An old sink, typically dispensing clean water. Hard to really tell if it's the case anymore, though."
	dispensedreagent = /datum/reagent/consumable/ms13/water/unfiltered
	buildstacktype = /obj/item/stack/sheet/ms13/ceramic
	has_water_reclaimer = TRUE
	reclaim_rate = 0.1

/obj/structure/sink/ms13/vile
	desc = "An old sink. There doesn't seem to be any water flow. Whatever is in it... is probably disgusting and old."
	dispensedreagent = /datum/reagent/consumable/ms13/water/dirty

/obj/structure/sink/ms13/functional
	name = "sink"
	icon_state = "sink"
	desc = "A sink. This one looks pretty alright, and might even give you some decent water!"
	dispensedreagent = /datum/reagent/consumable/ms13/water
	has_water_reclaimer = TRUE
	reclaim_rate = 1

/obj/structure/sink/ms13/functional/tainted // For Barony scrub locations.
	name = "sink"
	icon_state = "sink"
	desc = "A sink. This one seems to function well, but there's a gross buildup around the faucet end."
	dispensedreagent = /datum/reagent/consumable/ms13/water/unfiltered

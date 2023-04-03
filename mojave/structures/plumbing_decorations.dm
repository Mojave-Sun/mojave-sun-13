/obj/structure/toilet/ms13
	name = "toilet"
	desc = "An old toilet. It's obviously seen better years, alas you think you can still see some water in it. Care for a drink?"
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "toilet"
	density = FALSE
	anchored = TRUE
	buildstacktype = /obj/item/stack/sheet/ms13/ceramic

/obj/structure/toilet/ms13/attack_hand()
	return

/obj/structure/sink/ms13
	name = "sink"
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "sink"
	desc = "An old sink, typically dispensing clean water. Hard to really tell if it's the case anymore, though."
	dispensedreagent = /datum/reagent/consumable/ms13/unfiltered_water
	buildstacktype = /obj/item/stack/sheet/ms13/ceramic
	has_water_reclaimer = TRUE
	reclaim_rate = 0.1

/obj/structure/sink/ms13/functional
	name = "sink"
	icon_state = "sink"
	desc = "A sink. This one looks pretty alright, and might even give you some decent water!"
	dispensedreagent = /datum/reagent/consumable/ms13/water
	buildstacktype = /obj/item/stack/sheet/ms13/ceramic
	has_water_reclaimer = TRUE
	reclaim_rate = 0.5

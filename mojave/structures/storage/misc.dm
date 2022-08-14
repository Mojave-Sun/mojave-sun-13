/obj/structure/closet/ms13/wall
	name = "wasteland wall storage"
	desc = "Holds wastelands, while being attatched to a wall, presumably."
	pixel_y = 32
	density = FALSE

/obj/structure/closet/ms13/wall/Initialize()
	. = ..()
	AddElement(/datum/element/wall_mount)

/obj/structure/closet/ms13/wall/firstaid
	name = "emergency aid kit"
	desc = "A first aid kit, mounted to the wall. Commonly used for emergencies before the war."
	icon_state = "firstaid"
	anchored = TRUE
	anchorable = FALSE
	wall_mounted = TRUE
	max_mob_size = MOB_SIZE_TINY
	mob_storage_capacity = 1

/obj/structure/closet/ms13/wall/firstaid/update_icon()
	. = ..()
	layer = ON_EDGED_TURF_LAYER

////Sneaky Storage////

/obj/structure/ms13/storage/vent
	name = "vent"
	desc = "A vent used to move air to and from places."
	icon = 'mojave/icons/structure/storage.dmi'
	icon_state = "vent"
	flags_1 = INDESTRUCTIBLE | ACID_PROOF | FIRE_PROOF
	pixel_y = 24
	density = FALSE

/obj/structure/ms13/storage/vent/Initialize()
	. = ..()
	if(prob(50))
		icon_state = "[initial(icon_state)]-damaged"

/obj/structure/ms13/storage/washingmachine
	name = "washing machine"
	desc = "An old washing machine, before the war this did all the washing for you! But now it washes nothing."
	icon = 'mojave/icons/structure/storage.dmi'
	icon_state = "normwasher"
	flags_1 = ACID_PROOF | FIRE_PROOF
	density = TRUE
	anchored = TRUE
	var/closed = TRUE

/obj/structure/ms13/storage/washingmachine/CtrlClick(mob/living/user)
	if(closed)
		to_chat(user, span_notice("You open the washing machine."))
		icon_state = "[initial(icon_state)]_open"
		closed = FALSE
	else
		to_chat(user, span_notice("You close the washing machine."))
		icon_state = "[initial(icon_state)]"
		closed = TRUE

/obj/structure/ms13/storage/washingmachine/industrial
	name = "industrial washing machine"
	desc = "A large washing machine, for when you need to wash a lot of clothes! Unfortunately, it's been broken for a long time."
	icon_state = "industwasher"

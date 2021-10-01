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

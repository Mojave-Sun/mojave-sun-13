/obj/structure/ms13/bridge
	name = "makeshift bridge"
	desc = "A durable catwalk used mainly in industrial areas"
	icon = 'mojave/icons/structure/catwalk.dmi'
	icon_state = "bridge"
	density = FALSE
	anchored = TRUE
	armor = list(MELEE = 50, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 80, ACID = 50)
	max_integrity = 100
	layer = ABOVE_OPEN_TURF_LAYER
	plane = FLOOR_PLANE
	obj_flags = CAN_BE_HIT | BLOCK_Z_OUT_DOWN | BLOCK_Z_IN_UP

/obj/structure/ms13/bridge/atom_break(damage_flag)
	. = ..()
	if(!broken && !(flags_1 & NODECONSTRUCT_1))
		broken = TRUE
		obj_flags = CAN_BE_HIT // You will go through if you walk over a broken bridge
		update_appearance(UPDATE_OVERLAYS)

/obj/structure/ms13/bridge/proc/repair_bridge()
	atom_integrity = max_integrity
	if(broken)
		broken = FALSE
		obj_flags = initial(obj_flags)
		update_appearance(UPDATE_OVERLAYS)

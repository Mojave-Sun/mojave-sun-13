/////////////////////////////////////////////////////////////
////////////////// MOJAVE SUN GLASS "FLOORS" ////////////////
/////////////////////////////////////////////////////////////

  ////Glass floors////

/obj/structure/ms13/glassfloor
	name = "glass floor"
	desc = ""
	icon = 'icons/turf/floors/glass.dmi'
	icon_state = "glass-0"
	base_icon_state = "glass"
	density = FALSE
	anchored = TRUE
	armor = list(MELEE = 90, BULLET = 90, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 80, ACID = 50)
	max_integrity = 50
	layer = CATWALK_LAYER
	plane = FLOOR_PLANE
	obj_flags =  BLOCK_Z_OUT_DOWN | BLOCK_Z_IN_UP
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_GLASS)
	canSmoothWith = list(SMOOTH_GROUP_MS13_GLASS, SMOOTH_GROUP_OPEN_FLOOR, SMOOTH_GROUP_WALLS)
	weatherproof = TRUE

/obj/structure/ms13/glassfloor/reinforced //unbreakable variant
	icon = 'icons/turf/floors/reinf_glass.dmi'
	icon_state = "reinf_glass-0"
	base_icon_state = "reinf_glass"

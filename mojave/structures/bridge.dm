/obj/structure/ms13/bridge
	name = "makeshift bridge"
	desc = "A durable catwalk used mainly in industrial areas"
	icon = 'mojave/icons/structure/bridge.dmi'
	icon_state = "planks_1"
	density = FALSE
	anchored = TRUE
	armor = list(MELEE = 50, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 80, ACID = 50)
	max_integrity = 100
	layer = ABOVE_OPEN_TURF_LAYER
	plane = GAME_PLANE
	obj_flags = CAN_BE_HIT | BLOCK_Z_OUT_DOWN | BLOCK_Z_IN_UP

	var/base_icon  /// Remember initial sprite
	var/is_end = FALSE  /// If this bridge turf is one of the two ends

/obj/structure/ms13/bridge/Initialize(mapload)
	. = ..()
	if(dir == EAST || dir == WEST)
		pixel_y = -7
	base_icon = "planks_[rand(1, 5)]"
	icon_state = base_icon
	check_bridge_end()
	update_icon()

/obj/structure/ms13/bridge/update_icon_state()
	if(broken)
		icon_state = "planks_broken"
	else
		icon_state = base_icon
	return ..()


	// #define NORTH 1
// #define SOUTH 2
// #define EAST 4
// #define WEST 8

/obj/structure/ms13/bridge/update_overlays()
	. = ..()
	// Have to use image instead of mutable_appearance as it does not support dir
	var/dx_end = 0
	var/dy_end = 0
	var/dy_main = 0



	// Add additional sprites if this is the end of the bridge (stakes and ropes)
	if(is_end)
		if(dir == SOUTH)
			dy_end = -32
		else if(dir == NORTH)
			dy_end = 32
		else if(dir == EAST)
			dx_end = 32
			dy_end = 0
		else if(dir == WEST)
			dx_end = -32
			dy_end = 0
		// Ropes and planks sprites (end of bridge)
		. += image(icon, "rope_underplanks_end", layer=TURF_DECAL_LAYER, dir=REVERSE_DIR(dir), pixel_x=dx_end, pixel_y=dy_end)
		. += image(icon, "rope_underchar_end", layer=BELOW_MOB_LAYER, dir=REVERSE_DIR(dir), pixel_x=dx_end, pixel_y=dy_end)
		. += image(icon, "rope_overchar_end", layer=ABOVE_MOB_LAYER, dir=REVERSE_DIR(dir), pixel_x=dx_end, pixel_y=dy_end)


	// Ropes and planks sprites
	if(dir == EAST || dir == WEST)
		dy_main = 0
	. += image(icon, "rope_underplanks", layer=TURF_DECAL_LAYER, dir=dir)
	. += image(icon, "rope_underchar", layer=BELOW_MOB_LAYER, dir=dir)
	. += image(icon, "rope_overchar", plane = GAME_PLANE_UPPER, layer=ABOVE_MOB_LAYER, dir=dir)

/obj/structure/ms13/bridge/proc/check_bridge_end()

	var/turf/T1 = get_step(src, dir)
	var/turf/T2 = get_step(src, REVERSE_DIR(dir))
	var/end1 = locate(/obj/structure/ms13/bridge) in T1
	var/end2 = locate(/obj/structure/ms13/bridge) in T2
	if(!end2)
		// Reverse direction to point towards missing end (for sprites)
		dir = REVERSE_DIR(dir)
	if(!end1 || !end2)
		is_end = TRUE

/obj/structure/ms13/bridge/atom_break(damage_flag)
	. = ..()
	if(!broken && !(flags_1 & NODECONSTRUCT_1))
		broken = TRUE
		obj_flags = CAN_BE_HIT // You will go through if you walk over a broken bridge
		update_icon(UPDATE_ICON_STATE)

/obj/structure/ms13/bridge/proc/repair_bridge()
	atom_integrity = max_integrity
	if(broken)
		broken = FALSE
		obj_flags = initial(obj_flags)
		update_icon(UPDATE_ICON_STATE)

/// Stakes at the end of a makeshift bridge
/obj/structure/ms13/bridge_stakes
	name = "makeshift bridge stakes"
	desc = "A durable catwalk used mainly in industrial areas"
	icon = 'mojave/icons/structure/bridge_stakes.dmi'
	icon_state = "stake_default"
	density = FALSE
	anchored = TRUE
	armor = list(MELEE = 50, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 80, ACID = 50)
	max_integrity = 100
	layer = ABOVE_OPEN_TURF_LAYER
	plane = GAME_PLANE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/structure/ms13/bridge/Initialize(mapload)
	. = ..()
	// The default sprite is just for mappers
	// Stakes will be displayed with overlays to handle the layering
	icon_state = ""
	update_icon()

/obj/structure/ms13/bridge_stakes/update_overlays()
	. = ..()

	// Ropes and planks sprites (end of bridge)
	. += mutable_appearance("mojave/icons/structure/bridge.dmi", "rope_underplanks_end", layer=TURF_DECAL_LAYER, dir=REVERSE_DIR(dir))
	. += mutable_appearance("mojave/icons/structure/bridge.dmi", "rope_underchar_end", layer=BELOW_MOB_LAYER, dir=REVERSE_DIR(dir))
	. += mutable_appearance("mojave/icons/structure/bridge.dmi", "rope_overchar_end", plane = GAME_PLANE_UPPER, layer=ABOVE_MOB_LAYER, dir=REVERSE_DIR(dir))

	// Stakes sprites
	. += mutable_appearance(icon, "stake_subjective", layer=BELOW_MOB_LAYER, dir=REVERSE_DIR(dir))
	. += mutable_appearance(icon, "stake_underchar", layer=BELOW_MOB_LAYER, dir=REVERSE_DIR(dir))
	. += mutable_appearance(icon, "stake_overchar", plane = GAME_PLANE_UPPER, layer=ABOVE_MOB_LAYER, dir=REVERSE_DIR(dir))

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

/obj/structure/ms13/bridge/Initialize(mapload)
	. = ..()
	if(dir == EAST || dir == WEST)
		pixel_y = -7
	base_icon = "planks_[rand(1, 5)]"
	icon_state = base_icon
	update_icon()

/obj/structure/ms13/bridge/update_icon_state()
	if(broken)
		icon_state = "planks_broken"
	else
		icon_state = base_icon
	return ..()

/obj/structure/ms13/bridge/update_overlays()
	. = ..()

	// Ropes and planks sprites
	. += mutable_appearance(icon, "rope_underplanks_[dir]", layer=TURF_DECAL_LAYER)
	. += mutable_appearance(icon, "rope_underchar_[dir]", layer=BELOW_MOB_LAYER)
	. += mutable_appearance(icon, "rope_overchar_[dir]", plane = GAME_PLANE_UPPER, layer=ABOVE_MOB_LAYER)

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

/obj/structure/ms13/bridge_stakes/Initialize(mapload)
	. = ..()
	// The default sprite is just for mappers
	// Stakes will be displayed with overlays to handle the layering
	icon_state = ""
	if(dir == EAST || dir == WEST)
		pixel_y = -7
	update_icon()

/obj/structure/ms13/bridge_stakes/update_overlays()
	. = ..()

	// Mutable appearances do not support dir so we have to use one sprite for each dir

	// Ropes and planks sprites (end of bridge)
	. += mutable_appearance('mojave/icons/structure/bridge.dmi', "rope_underplanks_end_[dir]", layer=TURF_DECAL_LAYER)
	. += mutable_appearance('mojave/icons/structure/bridge.dmi', "rope_underchar_end_[dir]", layer=BELOW_MOB_LAYER)
	. += mutable_appearance('mojave/icons/structure/bridge.dmi', "rope_overchar_end_[dir]", plane = GAME_PLANE_UPPER, layer=ABOVE_MOB_LAYER)

	// Stakes sprites
	. += mutable_appearance(icon, "stake_subjective_[dir]", layer=BELOW_MOB_LAYER)
	. += mutable_appearance(icon, "stake_underchar_[dir]", layer=BELOW_MOB_LAYER)
	. += mutable_appearance(icon, "stake_overchar_[dir]", plane = GAME_PLANE_UPPER, layer=ABOVE_MOB_LAYER)

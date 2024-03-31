/obj/structure/ms13/bridge
	name = "makeshift bridge"
	desc = "A makeshift bridge made of half-rotten planks held together by rusted nails. At least the ropes seem to be of decent quality."
	icon = 'mojave/icons/structure/bridge.dmi'
	icon_state = "planks_1"
	density = FALSE
	anchored = TRUE
	armor = list(MELEE = 50, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	max_integrity = 100
	layer = ABOVE_OPEN_TURF_LAYER
	plane = GAME_PLANE
	obj_flags = CAN_BE_HIT | BLOCK_Z_OUT_DOWN | BLOCK_Z_IN_UP

	/// Remember initial sprite
	var/base_icon

/obj/structure/ms13/bridge/Initialize(mapload)
	. = ..()
	// Shift sprite down when going east/west so that people properly walk on the bridge
	if(dir == EAST || dir == WEST)
		pixel_y = -7
	// Choosing one of the sprite variants
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

	// Mutable appearances do not support dir so we have to use one sprite for each dir
	// Images support dir but do not support "plane="

	// Ropes and planks sprites
	. += mutable_appearance(icon, "rope_underplanks_[dir]", layer=TURF_DECAL_LAYER)
	. += mutable_appearance(icon, "rope_underchar_[dir]", layer=BELOW_MOB_LAYER)

	// Because of the layering, we need to use a special sprite when there are bridge stakes on the next turf south
	if (dir == WEST || dir == EAST)
		. += mutable_appearance(icon, "rope_overchar_[dir]", plane = GAME_PLANE_UPPER, layer=ABOVE_MOB_LAYER)
	else
		var/turf/turf_south = get_step(src, SOUTH)
		var/end = locate(/obj/structure/ms13/bridge_stakes) in turf_south
		if(end)
			. += mutable_appearance(icon, "rope_overchar_special", plane = GAME_PLANE_UPPER, layer=ABOVE_MOB_LAYER)
		else
			. += mutable_appearance(icon, "rope_overchar_[dir]", plane = GAME_PLANE_UPPER, layer=ABOVE_MOB_LAYER)

/// What happens when the bridge integrity reaches zero.
/obj/structure/ms13/bridge/atom_destruction(damage_flag)
	if(!broken)
		broken = TRUE
		obj_flags = 0 // You will go through if you walk over a broken bridge
		update_icon(UPDATE_ICON_STATE)  // No need to update overlays

/obj/structure/ms13/bridge/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = TRUE, attack_dir)
	// Avoid taking damage when integrity is already at 0
	if(broken)
		return
	. = ..()

/// Repairing a damaged bridge section back to full health
/obj/structure/ms13/bridge/proc/repair_bridge()
	atom_integrity = max_integrity  // Back at max health
	if(broken)
		broken = FALSE  // Not broken anymore
		obj_flags = initial(obj_flags)  // so we set back initial flags
		update_icon(UPDATE_ICON_STATE)  // No need to update overlays

/// Possibility to repair damaged bridge sections using wood planks or wood scrap
/obj/structure/ms13/bridge/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/stack/sheet/ms13/wood/plank) || istype(I, /obj/item/stack/sheet/ms13/wood/scrap_wood))
		var/obj/item/stack/S = I
		var/stackamount = S.get_amount()
		if(istype(I, /obj/item/stack/sheet/ms13/wood/plank))
			if(stackamount < 2)
				to_chat(user, span_notice("You do not have enough [I] to repair [src]!"))
			else
				if(do_after(user, 3 SECONDS, target = src))
					user.visible_message(span_warning("[user] repairs [src]."),\
							span_notice("You use 2 [I] to repair [src].")) // for "wood planks"
					S.use(2)
					repair_bridge()
		else
			if(stackamount < 4)
				to_chat(user, span_notice("You do not have enough [I] to repair [src]!"))
			else
				if(do_after(user, 3 SECONDS, target = src))
					user.visible_message(span_warning("[user] repairs [src]."),\
							span_notice("You use 4 pieces of [I] to repair [src]."))  // for "scrap wood"
					S.use(4)
					repair_bridge()
		return
	. = ..()

/// Stakes at the end of a makeshift bridge
/obj/structure/ms13/bridge_stakes
	name = "makeshift bridge stakes"
	desc = "Two crude wooden poles that have been hammered down into the ground."
	icon = 'mojave/icons/structure/bridge_stakes.dmi'
	icon_state = "stake_default"
	density = FALSE
	anchored = TRUE
	armor = list(MELEE = 50, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
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
	// Images support dir but do not support "plane="

	// Ropes and planks sprites (end of bridge)
	. += mutable_appearance('mojave/icons/structure/bridge.dmi', "rope_underplanks_end_[dir]", layer=TURF_DECAL_LAYER)
	. += mutable_appearance('mojave/icons/structure/bridge.dmi', "rope_underchar_end_[dir]", layer=BELOW_MOB_LAYER)
	. += mutable_appearance('mojave/icons/structure/bridge.dmi', "rope_overchar_end_[dir]", plane = GAME_PLANE_UPPER, layer=ABOVE_MOB_LAYER)

	// Stakes sprites
	. += mutable_appearance(icon, "stake_subjective_[dir]", layer=BELOW_MOB_LAYER)
	. += mutable_appearance(icon, "stake_underchar_[dir]", layer=BELOW_MOB_LAYER)
	. += mutable_appearance(icon, "stake_overchar_[dir]", plane = GAME_PLANE_UPPER, layer=ABOVE_MOB_LAYER)

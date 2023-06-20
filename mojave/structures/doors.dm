/obj/machinery/door/unpowered/ms13
	icon = 'mojave/icons/structure/doors.dmi'
	name = "base state ms13 door"
	pixel_x = -16
	pixel_y = -8
	plane = GAME_PLANE_FOV_HIDDEN
	layer = ABOVE_MOB_LAYER
	density = TRUE
	assemblytype = null
	can_crush = FALSE
	spark_system = null
	max_integrity = 1000
	armor = list(MELEE = 50, BULLET = 80, LASER = 90, ENERGY = 90, BOMB = 30, BIO = 100, FIRE = 80, ACID = 100)
	damage_deflection = 15
	sparks = FALSE
	ms13_flags_1 = LOCKABLE_1
	var/door_type = null
	var/solidity = SOLID
	var/frametype = "metal"
	var/opensound = 'sound/machines/door_open.ogg'
	var/closesound = 'sound/machines/door_close.ogg'
	//used for attack checks
	var/open = FALSE
	//used for damage overlays
	var/has_damage_overlay = TRUE
	//used for mirrored overlays
	var/mirrored = FALSE

/obj/machinery/door/unpowered/ms13/Initialize()
	. = ..()
	if(dir == NORTH)
		pixel_y = 8

	if(dir == SOUTH)
		pixel_y = -8

	if(dir == EAST)
		pixel_x = -3
		pixel_y = 16
		add_overlay(image(icon,icon_state="[frametype]_frame_vertical_overlay", layer = ABOVE_ALL_MOB_LAYER))

	if(dir == WEST)
		pixel_x = -28
		pixel_y = 16
		add_overlay(image(icon,icon_state="[frametype]_frame_vertical_overlay", layer = ABOVE_ALL_MOB_LAYER))

/obj/machinery/door/unpowered/ms13/update_overlays()
	. = ..()

	cut_overlays()

	if(dir == EAST)
		add_overlay(image(icon,icon_state="[frametype]_frame_vertical_overlay", layer = ABOVE_ALL_MOB_LAYER))

	if(dir == WEST)
		add_overlay(image(icon,icon_state="[frametype]_frame_vertical_overlay", layer = ABOVE_ALL_MOB_LAYER))

	if(has_damage_overlay) //stunning code, code of the year
		switch(open)
			if(TRUE)
				switch(mirrored)
					if(TRUE)
						switch(dir)
							if(EAST)
								if(atom_integrity < (0.25 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_3", layer = FLOAT_LAYER, pixel_x = 17, pixel_y = -2))
								else if(atom_integrity < (0.50 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_2", layer = FLOAT_LAYER, pixel_x = 17, pixel_y = -2))
								else if(atom_integrity < (0.75 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_1", layer = FLOAT_LAYER, pixel_x = 17, pixel_y = -2))
							if(WEST)
								if(atom_integrity < (0.25 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_3", layer = FLOAT_LAYER, pixel_x = -17, pixel_y = -2))
								else if(atom_integrity < (0.50 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_2", layer = FLOAT_LAYER, pixel_x = -17, pixel_y = -2))
								else if(atom_integrity < (0.75 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_1", layer = FLOAT_LAYER, pixel_x = -17, pixel_y = -2))
					if(FALSE)
						switch(dir)
							if(EAST)
								if(atom_integrity < (0.25 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_3", layer = FLOAT_LAYER, pixel_x = -17, pixel_y = -2))
								else if(atom_integrity < (0.50 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_2", layer = FLOAT_LAYER, pixel_x = -17, pixel_y = -2))
								else if(atom_integrity < (0.75 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_1", layer = FLOAT_LAYER, pixel_x = -17, pixel_y = -2))
							if(WEST)
								if(atom_integrity < (0.25 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_3", layer = FLOAT_LAYER, pixel_x = 17, pixel_y = -2))
								else if(atom_integrity < (0.50 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_2", layer = FLOAT_LAYER, pixel_x = 17, pixel_y = -2))
								else if(atom_integrity < (0.75 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_1", layer = FLOAT_LAYER, pixel_x = 17, pixel_y = -2))
			if(FALSE)
				switch(dir)
					if(NORTH)
						if(atom_integrity < (0.25 * max_integrity))
							cut_overlays()
							add_overlay(image(icon, icon_state = "damage_closed_3", layer = FLOAT_LAYER, pixel_y = -8))
						else if(atom_integrity < (0.50 * max_integrity))
							cut_overlays()
							add_overlay(image(icon, icon_state = "damage_closed_2", layer = FLOAT_LAYER, pixel_y = -8))
						else if(atom_integrity < (0.75 * max_integrity))
							cut_overlays()
							add_overlay(image(icon, icon_state = "damage_closed_1", layer = FLOAT_LAYER, pixel_y = -8))
					if(SOUTH)
						if(atom_integrity < (0.25 * max_integrity))
							cut_overlays()
							add_overlay(image(icon, icon_state = "damage_closed_3", layer = FLOAT_LAYER))
						else if(atom_integrity < (0.50 * max_integrity))
							cut_overlays()
							add_overlay(image(icon, icon_state = "damage_closed_2", layer = FLOAT_LAYER))
						else if(atom_integrity < (0.75 * max_integrity))
							cut_overlays()
							add_overlay(image(icon, icon_state = "damage_closed_1", layer = FLOAT_LAYER))


/obj/machinery/door/unpowered/ms13/open()
	if(!density)
		return TRUE
	if(operating)
		return
	operating = TRUE
	set_opacity(0)
	set_density(FALSE)
	flags_1 &= ~PREVENT_CLICK_UNDER_1
	open = TRUE
	update_appearance()
	set_opacity(0)
	operating = FALSE
	update_freelook_sight()
	playsound(src, (opensound), 50, TRUE)
	return TRUE

/obj/machinery/door/unpowered/ms13/close()
	if(density)
		return TRUE
	if(operating)
		return
	if(safe)
		for(var/atom/movable/M in get_turf(src))
			if(M.density && M != src) //something is blocking the door
				return
	operating = TRUE
	set_density(TRUE)
	flags_1 |= PREVENT_CLICK_UNDER_1
	open = FALSE
	update_appearance()
	if(visible && !glass)
		set_opacity(1)
	operating = FALSE
	update_freelook_sight()
	playsound(src, (closesound), 50, TRUE)
	return TRUE

/obj/machinery/door/unpowered/ms13/update_appearance(updates)
	. = ..()
	if(density)
		icon_state = "[door_type]_closed"
	else
		icon_state = "[door_type]_open"

/obj/machinery/door/unpowered/ms13/try_to_activate_door(mob/living/M)
	add_fingerprint(M)
	if(density)
		open()
	else
		close()
	return TRUE

/obj/machinery/door/unpowered/ms13/attack_hand(mob/living/M)
	if(locked)
		to_chat(M, "<span class='warning'> The [name] is locked.</span>")
		playsound(src, 'mojave/sound/ms13effects/door_locked.ogg', 50, TRUE)
		return
	if(.)
		return
	if(ms13_flags_1 & LOCKABLE_1 && lock_locked)
		to_chat(M, span_warning("The [name] is locked."))
		playsound(src, 'mojave/sound/ms13effects/door_locked.ogg', 50, TRUE)
		return
	if(do_after(M, 0.5 SECONDS, interaction_key = DOAFTER_SOURCE_DOORS))
		try_to_activate_door(M)

/obj/machinery/door/unpowered/ms13/attackby(obj/item/I, mob/living/M, params)
	. = ..()
	if(locked && !(M.combat_mode))
		to_chat(M, "<span class='warning'> The [name] is locked.</span>")
		playsound(src, 'mojave/sound/ms13effects/door_locked.ogg', 50, TRUE)
		return
	if(!(I.item_flags & NOBLUDGEON || LOCKING_ITEM) && !(M.combat_mode) && do_after(M, 1.5 SECONDS, interaction_key = DOAFTER_SOURCE_DOORS))
		open = TRUE
		try_to_activate_door(M)
		return TRUE
	if(!open)
		update_appearance()
		return ((obj_flags & CAN_BE_HIT) && I.attack_atom(src, M, params))

/obj/machinery/door/unpowered/ms13/do_animate(animation)
	return

/obj/machinery/door/unpowered/ms13/Bumped(atom/movable/AM)
	return

/obj/machinery/door/unpowered/ms13/metal
	name = "metal door"
	icon_state = "metal_closed"
	door_type = "metal"
	assemblytype = /obj/item/stack/sheet/ms13/scrap
	max_integrity = 2000 //its metal
	armor = list(MELEE = 80, BULLET = 90, LASER = 60, ENERGY = 90, BOMB = 30, BIO = 100, FIRE = 80, ACID = 100)
	damage_deflection = 25
	hitted_sound = 'mojave/sound/ms13effects/metal_door_hit.ogg'

/obj/machinery/door/unpowered/ms13/metal/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		playsound(src, 'mojave/sound/ms13effects/metal_door_break.ogg', 100, TRUE)
		new /obj/item/stack/sheet/ms13/scrap/two(loc)
		for(var/obj/item/I in src)
			I.forceMove(loc)
	qdel(src)

/obj/machinery/door/unpowered/ms13/metal/mirrored
	icon_state = "metal_mirrored_closed"
	door_type = "metal_mirrored"
	mirrored = TRUE

/obj/machinery/door/unpowered/ms13/metal/alt
	icon_state = "metal_alt_closed"
	door_type = "metal_alt"

/obj/machinery/door/unpowered/ms13/metal/mirrored/alt
	icon_state = "metal_alt_mirrored_closed"
	door_type = "metal_alt_mirrored"

/obj/machinery/door/unpowered/ms13/metal/red
	icon_state = "metal_red_closed"
	door_type = "metal_red"

/obj/machinery/door/unpowered/ms13/metal/mirrored/red
	icon_state = "metal_red_mirrored_closed"
	door_type = "metal_red_mirrored"

// Wood doors //
/obj/machinery/door/unpowered/ms13/wood
	name = "wood door"
	icon_state = "wood_closed"
	door_type = "wood"
	frametype = "wood"
	assemblytype = /obj/item/stack/sheet/ms13/wood/scrap_wood
	hitted_sound = 'mojave/sound/ms13effects/wood_door_hit.ogg'

/obj/machinery/door/unpowered/ms13/wood/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		playsound(src, 'mojave/sound/ms13effects/wood_door_break.ogg', 100, TRUE)
		new /obj/item/stack/sheet/ms13/wood/scrap_wood/two(loc)
		for(var/obj/item/I in src)
			I.forceMove(loc)
	qdel(src)

/obj/machinery/door/unpowered/ms13/wood/mirrored
	icon_state = "wood_mirrored_closed"
	door_type = "wood_mirrored"
	mirrored = TRUE

/obj/machinery/door/unpowered/ms13/wood/red
	icon_state = "wood_red_closed"
	door_type = "wood_red"

/obj/machinery/door/unpowered/ms13/wood/mirrored/red
	icon_state = "wood_red_mirrored_closed"
	door_type = "wood_red_mirrored"

/obj/machinery/door/unpowered/ms13/wood/blue
	icon_state = "wood_blue_closed"
	door_type = "wood_blue"

/obj/machinery/door/unpowered/ms13/wood/mirrored/blue
	icon_state = "wood_blue_mirrored_closed"
	door_type = "wood_blue_mirrored"

/obj/machinery/door/unpowered/ms13/wood/green
	icon_state = "wood_green_closed"
	door_type = "wood_green"

/obj/machinery/door/unpowered/ms13/wood/mirrored/green
	icon_state = "wood_green_mirrored_closed"
	door_type = "wood_green_mirrored"

/obj/machinery/door/unpowered/ms13/wood/white
	icon_state = "wood_white_closed"
	door_type = "wood_white"

/obj/machinery/door/unpowered/ms13/wood/mirrored/white
	icon_state = "wood_white_mirrored_closed"
	door_type = "wood_white_mirrored"

// Window/Open doors //

/obj/machinery/door/unpowered/ms13/seethrough
	name = "generic ms13 see-through door"
	glass = TRUE
	opacity = 0
	assemblytype = /obj/item/stack/sheet/ms13/scrap
	var/passthrough_chance = 80

/obj/machinery/door/unpowered/ms13/seethrough/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	if(locate(/obj/machinery/door/unpowered/ms13/seethrough) in get_turf(mover))
		return TRUE
	else if(istype(mover, /obj/projectile))
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob((passthrough_chance)))
			return TRUE
		return FALSE

/obj/machinery/door/unpowered/ms13/seethrough/metal
	name = "metal door"
	icon_state = "metal_window_closed"
	door_type = "metal_window"
	passthrough_chance = 40 //Small window!
	max_integrity = 1500 //its metal
	armor = list(MELEE = 80, BULLET = 90, LASER = 60, ENERGY = 90, BOMB = 30, BIO = 100, FIRE = 80, ACID = 100)
	damage_deflection = 25
	hitted_sound = 'mojave/sound/ms13effects/metal_door_hit.ogg'

/obj/machinery/door/unpowered/ms13/seethrough/metal/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		playsound(src, 'mojave/sound/ms13effects/metal_door_break.ogg', 100, TRUE)
		new /obj/item/stack/sheet/ms13/scrap/two(loc)
		for(var/obj/item/I in src)
			I.forceMove(loc)
	qdel(src)

/obj/machinery/door/unpowered/ms13/seethrough/mirrored/metal
	name = "metal door"
	icon_state = "metal_window_mirrored_closed"
	door_type = "metal_window_mirrored"
	mirrored = TRUE

/obj/machinery/door/unpowered/ms13/seethrough/bar
	name = "barred door"
	icon_state = "metal_bar_closed"
	door_type = "metal_bar"
	has_damage_overlay = FALSE

/obj/machinery/door/unpowered/ms13/seethrough/mirrored/bar
	name = "barred door"
	icon_state = "metal_bar_mirrored_closed"
	door_type = "metal_bar_mirrored"
	has_damage_overlay = FALSE

/obj/machinery/door/unpowered/ms13/seethrough/grate
	name = "grated door"
	icon_state = "metal_grate_closed"
	door_type = "metal_grate"
	has_damage_overlay = FALSE

/obj/machinery/door/unpowered/ms13/seethrough/mirrored/grate
	name = "grated door"
	icon_state = "metal_grate_mirrored_closed"
	door_type = "metal_grate_mirrored"
	has_damage_overlay = FALSE

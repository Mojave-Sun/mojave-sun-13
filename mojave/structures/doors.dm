/obj/machinery/door/unpowered/ms13/
	icon = 'mojave/icons/structure/doors.dmi'
	name = "base state ms13 door"
	pixel_x = -16
	pixel_y = -8
	layer = 4.4
	closingLayer = 4.4
	density = TRUE
	assemblytype = null
	can_crush = FALSE
	spark_system = null
	max_integrity = 650
	sparks = FALSE
	var/door_type = null
	var/solidity = SOLID
	var/frametype = "metal"
	var/opensound = 'sound/machines/door_open.ogg'
	var/closesound = 'sound/machines/door_close.ogg'

/obj/machinery/door/unpowered/ms13/Initialize()
	. = ..()
	if(dir == NORTH)
		pixel_y = 8

	if(dir == SOUTH)
		pixel_y = -8

	if(dir == EAST)
		pixel_x = -3
		pixel_y = 16
		add_overlay(image(icon,icon_state="[frametype]_frame_vertical_overlay", layer = 4.5))

	if(dir == WEST)
		pixel_x = -28
		pixel_y = 16
		add_overlay(image(icon,icon_state="[frametype]_frame_vertical_overlay", layer = 4.5))

/obj/machinery/door/unpowered/ms13/open()
	if(!density)
		return TRUE
	if(operating)
		return
	operating = TRUE
	set_opacity(0)
	set_density(FALSE)
	flags_1 &= ~PREVENT_CLICK_UNDER_1
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
	if(do_after(M, 1 SECONDS))
		try_to_activate_door(M)

/obj/machinery/door/unpowered/ms13/attackby(obj/item/I, mob/living/M, params)
	if(do_after(M, 1.5 SECONDS))
		try_to_activate_door(M)
		return TRUE

/obj/machinery/door/unpowered/ms13/do_animate(animation)
	return

/obj/machinery/door/unpowered/ms13/Bumped(atom/movable/AM)
	return

/obj/machinery/door/unpowered/ms13/metal
	name = "metal door"
	icon_state = "metal_closed"
	door_type = "metal"

/obj/machinery/door/unpowered/ms13/metal/alt
	icon_state = "metal_alt_closed"
	door_type = "metal_alt"

/obj/machinery/door/unpowered/ms13/metal/red
	icon_state = "metal_red_closed"
	door_type = "metal_red"

// Wood doors //
/obj/machinery/door/unpowered/ms13/wood
	name = "wood door"
	icon_state = "wood_closed"
	door_type = "wood"
	frametype = "wood"

/obj/machinery/door/unpowered/ms13/wood/red
	icon_state = "wood_red_closed"
	door_type = "wood_red"

/obj/machinery/door/unpowered/ms13/wood/blue
	icon_state = "wood_blue_closed"
	door_type = "wood_blue"

/obj/machinery/door/unpowered/ms13/wood/green
	icon_state = "wood_green_closed"
	door_type = "wood_green"

/obj/machinery/door/unpowered/ms13/wood/white
	icon_state = "wood_white_closed"
	door_type = "wood_white"

// Window/Open doors //

#define ALL_PROJ /obj/projectile

#define LASER_PROJ /obj/projectile/beam

/obj/machinery/door/unpowered/ms13/seethrough
	name = "generic ms13 see-through door"
	glass = TRUE
	opacity = 0
	var/allowed_projectile = null
	var/passthrough_chance = 80

/obj/machinery/door/unpowered/ms13/seethrough/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	if(locate(/obj/machinery/door/unpowered/ms13/seethrough) in get_turf(mover))
		return TRUE
	else if(istype(mover,(allowed_projectile)))
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
	allowed_projectile = LASER_PROJ
	passthrough_chance = 40 //Small window!

/obj/machinery/door/unpowered/ms13/seethrough/bar
	name = "barred door"
	icon_state = "metal_bar_closed"
	door_type = "metal_bar"
	allowed_projectile = ALL_PROJ

/obj/machinery/door/unpowered/ms13/seethrough/bar/grate
	name = "grated door"
	icon_state = "metal_grate_closed"
	door_type = "metal_grate"

#undef ALL_PROJ
#undef LASER_PROJ

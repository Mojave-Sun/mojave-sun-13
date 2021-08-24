/obj/machinery/door/unpowered/ms13/
	icon = 'mojave/icons/structure/doors.dmi'
	name = "base state ms13 door"
	pixel_x = -16
	layer = 4.4
	closingLayer = 4.4
	density = TRUE
	assemblytype = null
	can_crush = FALSE
	var/door_type = null

/obj/machinery/door/unpowered/ms13/Initialize()
	. = ..()
	if(dir == EAST || dir == WEST)
		pixel_y = 16
		add_overlay(image(icon,icon_state="metal_frame_vertical_overlay", layer = 4.45))

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

/obj/machinery/door/unpowered/ms13/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	if(locate(/obj/machinery/door/unpowered/ms13) in get_turf(mover))
		return TRUE
	else if(istype(mover, /obj/projectile))
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob(80))
			return TRUE
		return FALSE

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

/obj/machinery/door/unpowered/ms13/metal/window
	icon_state = "metal_window_closed"
	door_type = "metal_window"
	opacity = 0
	glass = TRUE

/obj/machinery/door/unpowered/ms13/metal/bar
	name = "barred door"
	icon_state = "metal_bar_closed"
	door_type = "metal_bar"
	opacity = 0
	glass = TRUE

/obj/machinery/door/unpowered/ms13/metal/bar/grate
	name = "grated door"
	icon_state = "metal_grate_closed"
	door_type = "metal_grate"
	opacity = 0
	glass = TRUE

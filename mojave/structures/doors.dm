/obj/machinery/door/unpowered/ms13/
	icon = 'mojave/icons/structure/doors.dmi'
	name = "base state ms13 door"
	opacity = 1
	pixel_x = -16
	layer = 4.4
	density = TRUE
	explosion_block = 1
	closingLayer = 4.4
	assemblytype = null
	can_crush = FALSE /// Whether or not the door can crush mobs.
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
	layer = initial(layer)
	update_appearance()
	air_update_turf(TRUE, FALSE)
	update_freelook_sight()
	return TRUE

/obj/machinery/door/unpowered/ms13/close()
	if(density)
		return TRUE
	if(operating || welded)
		return
	if(safe)
		for(var/atom/movable/M in get_turf(src))
			if(M.density && M != src) //something is blocking the door
				return TRUE
	operating = TRUE

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

/obj/machinery/door/unpowered/ms13/do_animate(animation)
	return

/obj/machinery/door/unpowered/ms13/Bumped(atom/movable/AM)
	return

/obj/machinery/door/unpowered/ms13/update_appearance(updates)
	. = ..()
	if(density)
		icon_state = "[door_type]_closed"
	else
		icon_state = "[door_type]_open"

/obj/machinery/door/unpowered/ms13/metal
	name = "metal door"
	icon_state = "metal_door_closed"
	door_type = "metal_door"

// Wallening-Tier doors //

/*
/obj/machinery/door/unpowered/ms13/rustic
	icon = 'mojave/icons/structure/talldoor.dmi'
	icon_state = "rustic_closed"
	name = "log door"
	opacity = 1
	density = TRUE
	explosion_block = 1
	layer = ABOVE_MOB_LAYER

/obj/machinery/door/unpowered/ms13/rustic/update_icon()
	switch(dir)
		if(NORTH)
			pixel_y = 8
		if(EAST)
			pixel_x = -6
		if(SOUTH)
			pixel_y = -8
		if(WEST)
			pixel_x = 6
*/// in slumber until the wallening arrives

/obj/machinery/door/unpowered/ms13/
	icon = 'mojave/icons/structure/wasteland_doors.dmi'
	name = "base state ms13 door"
	opacity = 1
	density = TRUE
	explosion_block = 1
	var/door_type = null

/obj/machinery/door/unpowered/ms13/do_animate(animation)
	switch(animation)
		if("opening")
			flick("(door_type)_opening", src)
		if("closing")
			flick("(door_type)_closing", src)


/obj/machinery/door/unpowered/ms13/update_icon()
	. = ..()
	if(density)
		icon_state = "(door_type)_closed"
	else
		icon_state = "(door_type)_open"

// Wooden door PLACEHOLDER //

/obj/machinery/door/unpowered/ms13/wooddoor
	name = "wooden door"
	icon_state = "house_closed"
	door_type = "house"

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

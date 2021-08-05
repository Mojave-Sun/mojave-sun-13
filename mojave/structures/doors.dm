/obj/machinery/door/unpowered/wooddoor
	icon = 'mojave/icons/structure/wasteland_doors.dmi'
	name = "wooden door"
	icon_state = "room1"
	opacity = 1
	density = TRUE
	explosion_block = 1

/obj/machinery/door/unpowered/wooddoor/update_icon()
	if(density)
		icon_state = "room1"
	else
		icon_state = "room0"

/obj/machinery/door/unpowered/wooddoor/do_animate(animation)
	switch(animation)
		if("opening")
			flick("roomc0", src)
		if("closing")
			flick("roomc1", src)
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

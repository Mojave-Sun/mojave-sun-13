/obj/structure/ladder/ms13
	name = "ladder"
	desc = "A questionable metal ladder. There's got to be stairs around, right?"
	icon = 'mojave/icons/structure/ladders.dmi'
	resistance_flags = INDESTRUCTIBLE

/obj/structure/ladder/ms13/manhole
	name = "manhole"

/obj/structure/ladder/ms13/manhole/update_icon_state()
	. = ..()
	if(down)
		name = "manhole entry"
		desc = "A heavy stamped manhole. You could probably pry it up with a crowbar to access the lower town systems."
		icon_state = "manhole_closed"
	else
		icon_state = "ladder10"

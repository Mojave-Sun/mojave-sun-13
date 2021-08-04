/obj/structure/window/fulltile/ms13
	name = "base class window"
	desc = "Scream at the coders"
	smoothing_flags = SMOOTH_BITMASK
	layer = EDGED_TURF_LAYER

/obj/structure/window/fulltile/ms13/glass
	name = "glass window"
	desc = ""
	icon = 'mojave/icons/turf/walls/glass.dmi'
	icon_state = "glass-0"
	base_icon_state = "glass"
	smoothing_groups = list(SMOOTH_GROUP_MS13_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_MS13_WINDOW,SMOOTH_GROUP_MS13_WALL)

/obj/structure/window/reinforced/fulltile/ms13
	name = "base class reinforced window"
	desc = "Scream at the coders"
	smoothing_flags = SMOOTH_BITMASK
	layer = EDGED_TURF_LAYER

/obj/structure/window/reinforced/fulltile/ms13/glass
	name = "reinforced glass window"
	desc = ""
	icon = 'mojave/icons/turf/walls/glass.dmi' //Waiting for a proper sprite, the old one looks dumb as a placeholder.
	icon_state = "glass-0"
	base_icon_state = "glass"
	smoothing_groups = list(SMOOTH_GROUP_MS13_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_MS13_WINDOW,SMOOTH_GROUP_MS13_WALL)

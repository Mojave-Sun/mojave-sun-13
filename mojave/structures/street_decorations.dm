/obj/machinery/power/ms13/streetlamp
	name = "\improper street lamp"
	desc = "A pre-war street lamp, what more is there to say?"
	icon = 'mojave/icons/structure/streetpoles.dmi'
	icon_state = "streetlight"
	anchored = TRUE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	max_integrity = 2000
	pixel_x = -32
	pixel_y = 8

/obj/machinery/power/ms13/streetlamp/Initialize()
	. = ..()
	AddComponent(/datum/component/largetransparency, 1, 1, 1, 1)

/obj/machinery/power/ms13/streetlamp/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(locate(/obj/machinery/power/ms13/streetlamp) in get_turf(mover))
		return TRUE
	else if(istype(mover, /obj/projectile))
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob(85)) // These things are pretty thin
			return TRUE
		return FALSE

/obj/machinery/power/ms13/streetlamp
	name = "\improper street lamp"
	desc = "A pre-war street lamp, what more is there to say?"
	icon_state = "streetlight"

/obj/machinery/power/ms13/streetlamp/corner
	name = "\improper street lamp"
	desc = "A pre-war street lamp, what more is there to say?"
	icon_state = "streetlightcorner"

/obj/machinery/power/ms13/streetlamp/double
	name = "\improper street lamp"
	desc = "A pre-war street lamp, what more is there to say?"
	icon_state = "streetlightduo"

/obj/machinery/power/ms13/trafficlight
	name = "\improper traffic light"
	desc = "A relic of a more civilized time, where people for some reason weren't alright with plowing over a family while going ninety down a road."
	icon = 'mojave/icons/structure/streetpoles.dmi'
	anchored = TRUE
	max_integrity = 2000
	pixel_x = -32
	icon_state = "trafficlightright"

/obj/machinery/power/ms13/trafficlight/alt
	icon_state = "trafficlightleft"

/obj/effect/mine/ms13
	icon = 'mojave/icons/objects/ms_traps.dmi'

	var/visiblity_on = list(/turf/open/floor/plating/ms13/ground/road,
							/turf/open/floor/plating/ms13/ground/sidewalk)

/obj/effect/mine/ms13/Initialize(mapload)
	var/turf/open/location = get_turf(src)
	for(var/i in visiblity_on)
		if(istype(location, i))
			hidden_for_look = FALSE
			break
	. = ..()

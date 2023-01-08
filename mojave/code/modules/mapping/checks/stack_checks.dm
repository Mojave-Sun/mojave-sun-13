/// MOJAVE SUN SAMETYPE STACK CHECKS FOR BAD MAPPERS

//checks if sametype objects/structures are on itself on mapload when the code is applied, add here if you want this on something
//there is no better way to do it with byondcode, I tried - but it is more robust now, picks up stuff it wasnt before

/obj/Initialize(mapload, ...)
	if(istype(src, /obj/structure/table)) //tables and low walls
		for(var/obj/structure/table/DUPE1 in get_turf(src))
			if(DUPE1 == src)
				continue
			stack_trace("multiple stacked [src.name] found in ([loc.x], [loc.y], [loc.z])")
			return INITIALIZE_HINT_QDEL
	if(istype(src, /obj/machinery/door/unpowered)) //normal doors - split from the others because shutters are used on doors
		for(var/obj/machinery/door/unpowered/DUPE2 in get_turf(src))
			if(DUPE2 == src)
				continue
			stack_trace("multiple stacked [src.name] found in ([loc.x], [loc.y], [loc.z])")
			return INITIALIZE_HINT_QDEL
	if(istype(src, /obj/machinery/door/airlock)) //machine doors
		for(var/obj/machinery/door/airlock/DUPE2 in get_turf(src))
			if(DUPE2 == src)
				continue
			stack_trace("multiple stacked [src.name] found in ([loc.x], [loc.y], [loc.z])")
			return INITIALIZE_HINT_QDEL
	if(istype(src, /obj/machinery/door/poddoor/shutters)) //shutters
		for(var/obj/machinery/door/poddoor/shutters/DUPE2 in get_turf(src))
			if(DUPE2 == src)
				continue
			stack_trace("multiple stacked [src.name] found in ([loc.x], [loc.y], [loc.z])")
			return INITIALIZE_HINT_QDEL
	if(istype(src, /obj/structure/lattice)) //lattices
		for(var/obj/structure/lattice/DUPE3 in get_turf(src))
			if(DUPE3 == src)
				continue
			stack_trace("multiple stacked [src.name] found in ([loc.x], [loc.y], [loc.z])")
			return INITIALIZE_HINT_QDEL
	if(istype(src, /obj/structure/ms13/glassfloor)) //glass floors
		for(var/obj/structure/ms13/glassfloor/DUPE4 in get_turf(src))
			if(DUPE4 == src)
				continue
			stack_trace("multiple stacked [src.name] found in ([loc.x], [loc.y], [loc.z])")
			return INITIALIZE_HINT_QDEL
	if(istype(src, /obj/structure/ms13/foundation)) //foundations
		for(var/obj/structure/ms13/foundation/LAT in loc)
			if(LAT == src)
				continue
			stack_trace("multiple foundations found in ([loc.x], [loc.y], [loc.z])")
			return INITIALIZE_HINT_QDEL
	. = ..()

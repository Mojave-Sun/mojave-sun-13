/// MOJAVE SUN INWALL CHECKS FOR BAD MAPPERS

//checks if things are in walls when they shouldnt be, add the thing here if you dont want it to be placed in walls during mapping

/obj/Initialize(mapload, ...)
	if(istype(src, /obj/machinery/door)) //doors and airlocks
		if(istype(get_turf(src), /turf/closed/wall))
			stack_trace("[src.name] found inside a wall at ([loc.x], [loc.y], [loc.z])")
			return INITIALIZE_HINT_QDEL
	if(istype(src, /obj/structure/table)) //tables and low walls
		if(istype(get_turf(src), /turf/closed/wall))
			stack_trace("[src.name] found inside a wall at ([loc.x], [loc.y], [loc.z])")
			return INITIALIZE_HINT_QDEL
	if(istype(src, /obj/structure/window/fulltile/ms13)) //windows
		if(istype(get_turf(src), /turf/closed/wall))
			stack_trace("[src.name] found inside a wall at ([loc.x], [loc.y], [loc.z])")
			return INITIALIZE_HINT_QDEL
	. = ..()

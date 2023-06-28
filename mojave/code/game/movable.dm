/atom/movable/proc/get_displacement_map(displacement_map_type)
	if(!displacement_map_type)
		return
	return LAZYACCESS(displacement_maps, displacement_map_type)

/atom/movable/proc/add_displacement_map(displacement_map_type)
	if(!displacement_map_type)
		return
	var/map = new displacement_map_type(null, src)
	return map

/atom/movable/proc/remove_displacement_map(displacement_map_type)
	if(!displacement_map_type)
		return
	var/map = get_displacement_map(displacement_map_type)
	if(map)
		qdel(map)
		return TRUE
	return FALSE

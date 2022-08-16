/proc/cmp_path_step(datum/path_step/a, datum/path_step/b)
	return a.distance_to_goal + a.distance_walked - b.distance_to_goal - b.distance_walked

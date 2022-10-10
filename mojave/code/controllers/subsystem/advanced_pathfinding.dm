#define NODE_PATHING "node_pathing" //Looking through the network of nodes the best node path
#define TILE_PATHING "tile_pathing" //Looking the best tile path

///Basic implementation of A* using atoms. Very cheap, at max it will do about 50-100 distance check for a whole path, but typically it will do 10-20
/datum/path_step
	///Euclidian distance to the goal atom
	var/distance_to_goal
	///Sum of euclidian distances to get from the starting atom to this atom, if you follow the current optimal path
	var/distance_walked
	///What atom this path reached
	var/atom/current_atom
	///What atom was right before current atom in the path
	var/atom/previous_atom

/datum/path_step/New(atom/previous_atom, atom/current_atom, atom/goal_atom, old_distance_walked)
	..()
	distance_to_goal = get_dist_euclide_square(current_atom, goal_atom)
	distance_walked = old_distance_walked + get_dist_euclide_square(current_atom, previous_atom)
	src.current_atom = current_atom
	src.previous_atom = previous_atom

///Returns the most optimal path to get from starting atom to goal atom
/proc/get_path(atom/starting_atom, atom/goal_atom, pathing_type = NODE_PATHING)
	if(starting_atom.z != goal_atom.z || starting_atom == goal_atom)
		return
	var/list/datum/path_step/paths_to_check = list()
	var/atom/current_atom = starting_atom
	var/list/datum/path_step/paths_checked = list()
	var/datum/path_step/current_path
	var/list/list_of_direction
	//Have we reached our goal atom yet?
	while(current_atom != goal_atom)
		//Check all possible next atoms, create an atom path for all of them
		switch(pathing_type)
			if(NODE_PATHING)
				var/obj/effect/ai_node/current_node = current_atom
				list_of_direction = current_node.adjacent_nodes
			if(TILE_PATHING)
				list_of_direction = GLOB.alldirs
		var/atom_to_check
		for(var/direction in list_of_direction)
			switch(pathing_type)
				if(NODE_PATHING)
					var/obj/effect/ai_node/current_node = current_atom
					atom_to_check = current_node.adjacent_nodes[direction]
				if(TILE_PATHING)
					var/turf/turf_to_check = get_step(current_atom, direction)
					if(turf_to_check.density)
						continue
					atom_to_check = turf_to_check
			if(paths_to_check[atom_to_check] || paths_checked[atom_to_check] || !atom_to_check) //We already found a better path to get to this atom
				continue
			paths_to_check[atom_to_check] = new/datum/path_step(current_atom, atom_to_check, goal_atom, current_path?.distance_walked)
		paths_checked[current_atom] = current_path
		paths_to_check -= current_atom
		//We looked through all atoms, we didn't find a way to get to our end points
		if(!length(paths_to_check) || length(paths_checked) > PATHFINDER_MAX_TRIES)
			return
		//We created a atom path for each adjacent atom, we sort every atoms by their heuristic score
		sortTim(paths_to_check, /proc/cmp_path_step, TRUE) //Very cheap cause almost sorted
		current_path = paths_to_check[paths_to_check[1]] //We take the atom with the smaller heuristic score (distance to goal + distance already made)
		current_atom = current_path.current_atom
	paths_checked[current_atom] = current_path
	var/list/atom/atoms_path = list()
	//We can go back our track, making the path along the way
	while(current_atom != starting_atom)
		atoms_path += current_atom
		#ifdef TESTING
		new /obj/effect/temp_visual/telekinesis(current_atom)
		#endif
		current_atom = paths_checked[current_atom].previous_atom
	return atoms_path

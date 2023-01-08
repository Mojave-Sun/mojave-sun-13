/*
An element that makes simple animals patrol whenever they're "AI_IDLE" or other kinds of AI status defined
Not recommended to run with stop_automated_movement = FALSE; hostile mob's LoseAggro() will reenable it to TRUE
The simple animal this is attached to should also be able to destroy obstacles should it get stuck for a while
*/

/datum/element/generic_patrol_animal
	element_flags = ELEMENT_DETACH
	var/list/attached_animals = list()
	///Weights that the animal will prefer when choosing the next node to patrol towards
	var/list/animal_node_weights = list()
	///Current "node" the animal is at
	var/list/animal_current_node = list()
	///The "node" the animal wants to walk towards
	var/list/animal_target_node = list()
	///A list of nodes to walk through to make it to the first node in the list
	var/list/list/animal_nodes_to_walk = list()
	///The identifier associated with the weights
	var/list/animal_identifier = list()
	///The move delay for patrolling with
	var/list/patrol_move_delay = list()

/datum/element/generic_patrol_animal/New()
	START_PROCESSING(SSdcs, src)

/datum/element/generic_patrol_animal/Attach(mob/living/simple_animal/animal, _animal_node_weights = list(), _animal_identifier = IDENTIFIER_GENERIC_SIMPLE, _patrol_move_delay = 3)
	. = ..()
	if(!istype(animal))
		return ELEMENT_INCOMPATIBLE

	for(var/obj/effect/ai_node/node in range(7, animal))
		animal_current_node[animal] = node
		node.make_adjacents()
		break

	if(!animal_current_node[animal])
		log_mapping("[animal] was to be attached with a patrol element but no nodes nearby were located near [AREACOORD(animal)]; removing element from self.")
		Detach(animal)
		return
	attached_animals[animal] = animal
	animal_node_weights[animal] = _animal_node_weights
	animal_identifier[animal] = _animal_identifier
	patrol_move_delay[animal] = _patrol_move_delay
	var/obj/effect/ai_node/linted_current_node = animal_current_node[animal]
	animal_target_node[animal] = linted_current_node.get_best_adj_node(animal_node_weights[animal], animal_identifier[animal])
	RegisterSignal(animal, COMSIG_AI_SET_GOAL_NODE, .proc/set_goal_node)

/datum/element/generic_patrol_animal/Detach(mob/living/simple_animal/animal)
	attached_animals -= animal
	animal_node_weights -= animal
	animal_current_node -= animal
	animal_target_node -= animal
	animal_nodes_to_walk -= animal
	animal_identifier -= animal
	patrol_move_delay -= animal

/datum/element/generic_patrol_animal/proc/set_goal_node(datum/source, obj/effect/ai_node/new_node_target)
	if(!new_node_target)
		return
	animal_nodes_to_walk[source] = get_path(starting_atom = animal_current_node[source], goal_atom = new_node_target, pathing_type = NODE_PATHING)
	animal_target_node[source] = animal_nodes_to_walk[source[length(animal_nodes_to_walk[source])]]
	var/mob/living/simple_animal/animal = attached_animals[source]
	animal.Goto(target = animal_target_node[source], delay = patrol_move_delay[source], minimum_distance = 0)

//We'll just do a Process() and look at whenever the simple mob is on or not
/datum/element/generic_patrol_animal/process(delta_time)
	for(var/the_animal in attached_animals)
		var/mob/living/simple_animal/animal = attached_animals[the_animal]
		if(animal.AIStatus == AI_IDLE)
			if(get_dist(animal, animal_target_node[animal]) < 3)
				animal_current_node[animal] = animal_target_node[animal]
				var/obj/effect/ai_node/linted_current_node = animal_current_node[animal]
				linted_current_node.set_weight(animal_identifier[animal], NODE_LAST_VISITED, world.time)
				if(length(animal_nodes_to_walk[animal]))
					animal_nodes_to_walk[animal].len--
					animal_target_node[animal] = animal_nodes_to_walk[animal[length(animal_nodes_to_walk[the_animal])]]
				else
					animal_target_node[animal] = linted_current_node.get_best_adj_node(animal_node_weights[animal], animal_identifier[animal])
				SEND_SIGNAL(animal, COMSIG_AI_NODE_REACHED)
			animal.Goto(target = animal_target_node[animal], delay = patrol_move_delay[animal], minimum_distance = 0)

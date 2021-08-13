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
	///The identifier associated with the weights
	var/list/animal_identifier = list()
	///The move delay for patrolling with
	var/list/patrol_move_delay = list()

/datum/element/generic_patrol_animal/Attach(mob/living/simple_animal/animal, _animal_node_weights = list(), _animal_identifier = IDENTIFIER_GENERIC_SIMPLE, _patrol_move_delay = 3)
	. = ..()
	if(!istype(animal))
		return ELEMENT_INCOMPATIBLE

	for(var/obj/effect/ai_node/node in range(7))
		animal_current_node[animal] = node
		break

	if(!animal_current_node[animal])
		return ELEMENT_INCOMPATIBLE

	attached_animals[animal] = animal
	animal_node_weights[animal] = _animal_node_weights
	animal_identifier[animal] = _animal_identifier
	patrol_move_delay[animal] = _patrol_move_delay
	if(!length(attached_animals))
		START_PROCESSING(SSprocessing, src)
	animal_target_node[animal] = animal_current_node[animal].get_best_adj_node(animal_node_weights[animal], animal_identifier[animal])

/datum/element/generic_patrol_animal/Detach(mob/living/simple_animal/animal)
	attached_animals -= animal
	if(!length(attached_animals))
		STOP_PROCESSING(SSprocessing, src)

//We'll just do a Process() and look at whenever the simple mob is on or not
/datum/element/generic_patrol_animal/process(delta_time)
	for(var/the_animal in attached_animals)
		var/mob/living/simple_animal/animal = attached_animals[the_animal]
		if(animal.AIStatus == AI_IDLE)
			if(get_dist(animal, animal_target_node[animal]) < 3)
				animal_current_node[animal] = animal_target_node[animal]
				animal_current_node[animal].set_weight(animal_identifier[animal], NODE_LAST_VISITED, world.time)
				animal_target_node[animal] = animal_current_node[animal].get_best_adj_node(animal_node_weights[animal], animal_identifier[animal])
			walk_to(animal, animal_target_node[animal], 0, patrol_move_delay[animal])

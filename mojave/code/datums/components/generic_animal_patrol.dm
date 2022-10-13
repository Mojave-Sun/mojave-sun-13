/datum/component/generic_animal_patrol
	///Weights that the animal will prefer when choosing the next node to patrol towards
	var/list/node_weights = list()
	///Current "node" the animal is at
	var/obj/effect/ai_node/current_node
	///The "node" the animal wants to walk towards
	var/obj/effect/ai_node/target_node
	///A of nodes to walk through to make it to the first node in the list
	var/list/nodes_to_walk = list()
	///The identifier associated with the weights
	var/identifier
	///The move delay for patrolling with
	var/move_delay

/datum/component/generic_animal_patrol/Initialize(_animal_node_weights = list(), _animal_identifier = IDENTIFIER_GENERIC_SIMPLE, _patrol_move_delay = 3)
	if(!isanimal(parent))
		var/atom/movable/movable_parent = parent
		log_mapping("Tried to initialize generic_animal_patrol on a incompatible mob of type [movable_parent.type] at [AREACOORD(movable_parent)]")
		return COMPONENT_INCOMPATIBLE
	for(var/obj/effect/ai_node/node in range(7, parent))
		current_node = node
		node.make_adjacents()
		break
	if(!current_node)
		var/atom/movable/atom_parent = parent
		log_mapping("[atom_parent] was to be attached with a patrol component but no nodes nearby were located near [AREACOORD(atom_parent)]; removing component from self.")
		return COMPONENT_INCOMPATIBLE
	START_PROCESSING(SSdcs, src)
	node_weights = _animal_node_weights
	identifier = _animal_identifier
	move_delay = _patrol_move_delay
	var/obj/effect/ai_node/linted_current_node = current_node //For linter
	target_node = linted_current_node.get_best_adj_node(node_weights, identifier)
	RegisterSignal(parent, COMSIG_AI_SET_GOAL_NODE, .proc/set_goal_node)

/datum/component/generic_animal_patrol/Destroy(force, silent)
	UnregisterSignal(parent, COMSIG_AI_SET_GOAL_NODE)
	return ..()

/datum/component/generic_animal_patrol/proc/set_goal_node(datum/source, obj/effect/ai_node/new_node_target)
	if(!new_node_target)
		return
	nodes_to_walk = get_path(starting_atom = current_node, goal_atom = new_node_target, pathing_type = NODE_PATHING)
	target_node = nodes_to_walk[length(nodes_to_walk)]
	var/mob/living/simple_animal/animal = source
	animal.Goto(target = target_node, delay = move_delay, minimum_distance = 0)

/datum/component/generic_animal_patrol/process()
	var/mob/living/simple_animal/animal = parent
	if(animal.AIStatus == AI_IDLE)
		if(get_dist(parent, target_node) < 3)
			current_node = target_node
			var/obj/effect/ai_node/linted_current_node = current_node
			linted_current_node.set_weight(identifier, NODE_LAST_VISITED, world.time)
			if(length(nodes_to_walk))
				nodes_to_walk.len--
				if(length(nodes_to_walk)) //AI will resend a signal
					target_node = nodes_to_walk[length(nodes_to_walk)]
			else
				target_node = linted_current_node.get_best_adj_node(node_weights, identifier)
			SEND_SIGNAL(parent, COMSIG_AI_NODE_REACHED)
		animal.Goto(target = target_node, delay = move_delay, minimum_distance = 0)

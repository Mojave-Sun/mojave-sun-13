//The node with a physical presence on the map; mainly exists as a actual object to be able to be highlighted easily for easy debugging and viewing purposes
//It also holds the datum ai_node, containing getter procs and handle info like weights

/obj/effect/ai_node //A effect that has a ai_node datum in it, used by AIs to pathfind over long distances as well as knowing what's happening at it
	name = "AI Node"
	icon = 'mojave/icons/effects/landmarks_static.dmi'
	icon_state = "x6" //Pure white 'X' with black borders
	anchored = TRUE //No pulling those nodes yo
	invisibility = INVISIBILITY_MAXIMUM //Why was this visible towrds ghosts, just change it if testing
	//mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	///Assoc list of adjacent landmark nodes by dir
	var/list/adjacent_nodes = list()
	var/trader_restock_destination = FALSE

	///List of weights for scoring stuff happening here; ultilizes "identifiers" to differentiate different kinds of AI types looking at the same node.
	var/list/weights = list(
		IDENTIFIER_GENERIC_SIMPLE = list(NODE_LAST_VISITED = 0, NODE_TRADER_STAYS_THIS_LONG = 8 SECONDS),
		IDENTIFIER_EYEBOT = list(NODE_LAST_VISITED = 0, NODE_TRADER_STAYS_THIS_LONG = 8 SECONDS)
		)
	//TODO: MAKE DYNAMICALLY INITIALIZED WHEN REQUESTED

/obj/effect/ai_node/Initialize()
	..()
	GLOB.allnodes += src
	return INITIALIZE_HINT_LATELOAD

/obj/effect/ai_node/LateInitialize()
	make_adjacents()
	if(trader_restock_destination)
		GLOB.nodes_trader_destination += src

///Adds to the specific weight of a specific identifier of this node
/obj/effect/ai_node/proc/increment_weight(identifier, name, amount)
	weights[identifier][name] += amount

///Sets the specific weight of a specific identifier of this node
/obj/effect/ai_node/proc/set_weight(identifier, name, amount)
	weights[identifier][name] = amount

/obj/effect/ai_node/Destroy()
	GLOB.allnodes -= src
	//Remove our reference to self from nearby adjacent node's adjacent nodes
	for(var/nodes in adjacent_nodes)
		var/obj/effect/ai_node/node = nodes
		node.adjacent_nodes -= src
	return ..()

///Returns a node that is in the direction of this node; must be in the src's adjacent node list
/obj/effect/ai_node/proc/get_node_in_dir_in_adj(dir)
	if(!length(adjacent_nodes))
		return

	for(var/i in adjacent_nodes)
		var/obj/effect/ai_node/node = i
		if(get_dir(src, node) != dir)
			continue
		return node

/**
 * A proc that gets the "best" adjacent node in src based on score
 * The score is calculated by what weights are inside of the list/weight_modifiers
 * The highest number after multiplying each list/weight by the ones in the above parameter will be the node that's chosen; any nodes that have the same score won't override that node
 * Generally the number that the weight has before being multiplied by weight modifiers is the "user friendly" edition; NODE_LAST_VISITED represents in deciseconds the time before
 * the node has been visited by a particular thing, while something like NODE_ENEMY_COUNT represents the amount of enemies
 * Parameter call example
 * GetBestAdjNode(list(NODE_LAST_VISITED = -1), IDENTIFIER_XENO)
 * Returns an adjacent node that was last visited; when a AI visits a node, it will set NODE_LAST_VISITED to world.time
 */
/obj/effect/ai_node/proc/get_best_adj_node(list/weight_modifiers, identifier)
	//No weight modifiers, return a adjacent random node
	if(!length(weight_modifiers) || !identifier)
		return adjacent_nodes[pick(adjacent_nodes)]

	var/obj/effect/ai_node/node_to_return
	var/current_best_node_score = -INFINITY
	var/current_score = 0
	for(var/direction in adjacent_nodes) //We keep a score for the nodes and see which one is best
		var/obj/effect/ai_node/node = adjacent_nodes[direction]
		current_score = 0
		for(var/weight in weight_modifiers)
			current_score += NODE_GET_VALUE_OF_WEIGHT(identifier, node, weight) * weight_modifiers[weight]

		if(current_score >= current_best_node_score)
			current_best_node_score = current_score
			node_to_return = node

	if(node_to_return)
		return node_to_return
	return adjacent_nodes[pick(adjacent_nodes)]

///Clears the adjacencies of src and repopulates it, it will consider nodes "adjacent" to src should it be less 15 turfs away
/obj/effect/ai_node/proc/make_adjacents(bypass_diagonal_check = FALSE)
	for(var/obj/effect/ai_node/node in GLOB.allnodes)
		if(node == src || node.z != z || get_dist(src, node) > MAX_NODE_RANGE || (!bypass_diagonal_check && !Adjacent(node) && ISDIAGONALDIR(get_dir(src, node))))
			continue
		if(get_dist(src, adjacent_nodes["[get_dir(src, node)]"]) < get_dist(src, node))
			continue
		if(!is_in_line_of_sight(get_turf(node)))
			continue
		adjacent_nodes["[get_dir(src, node)]"] = node
		node.adjacent_nodes["[get_dir(node, src)]"] = src

///Returns true if the turf in argument is in line of sight
/obj/effect/ai_node/proc/is_in_line_of_sight(turf/target_loc)
	var/turf/turf_to_check = get_turf(src)

	while(turf_to_check != target_loc)
		if(turf_to_check.density)
			return FALSE
		turf_to_check = get_step(turf_to_check, get_dir(turf_to_check, target_loc))

	return TRUE

/obj/effect/ai_node/debug //A debug version of the AINode; makes it visible to allow for easy var editing
	icon_state = "x6" //Pure white 'X' with black borders
	color = "#ffffff"
	invisibility = 0

/obj/effect/ai_node/restock
	name = "Trader Restock AI Node"
	trader_restock_destination = TRUE


/obj/effect/ai_node/wait
	name = "Trader Waiting AI Node"
	weights = list(
		IDENTIFIER_GENERIC_SIMPLE = list(NODE_LAST_VISITED = 0, NODE_TRADER_STAYS_THIS_LONG = 100 SECONDS),
		IDENTIFIER_EYEBOT = list(NODE_LAST_VISITED = 0, NODE_TRADER_STAYS_THIS_LONG = 100 SECONDS)
		)

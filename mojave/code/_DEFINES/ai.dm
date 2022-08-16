//If this conflicts with future upstream merge, contact ma44

#define STOP_MOVING (1<<1)
#define STOP_MOVING_DURING_DO_AFTER (1<<2)

#define MAX_NODE_RANGE 15
#define PATHFINDER_MAX_TRIES 500

///A define for a node variable which is the last world.time that a AI visited it
#define NODE_LAST_VISITED "node_last_visited"
///If traders will go to this node for restocking
#define NODE_TRADER_RESTOCK "node_trader_restock_spot"
///Set a new node to path towards; usually over multiple nodes
#define COMSIG_AI_SET_GOAL_NODE "ai_set_goal_node"
///Element sends this signal upon being close enough to a node
#define COMSIG_AI_NODE_REACHED "ai_node_reached"

/**
 * Identifier tags
 * Ultilized for having AI look at weights based on if they're a "marine human" or a "xenomorph" or something else
 * This is mainly used for deciding what weights are to be looked at when determing a node waypoint of going towards
 */
#define IDENTIFIER_GENERIC_SIMPLE "identifies_generic_simple"
#define IDENTIFIER_EYEBOT "identifies_eyebot"

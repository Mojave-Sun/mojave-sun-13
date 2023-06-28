//If this conflicts with future upstream merge, contact ma44

#define STOP_MOVING (1<<1)
#define STOP_MOVING_DURING_DO_AFTER (1<<2)

#define MAX_NODE_RANGE 15
#define PATHFINDER_MAX_TRIES 500

///A define for a node variable which is the last world.time that a AI visited it
#define NODE_LAST_VISITED "node_last_visited"
///If traders will go to this node for restocking
#define NODE_TRADER_RESTOCK "node_trader_restock_spot"

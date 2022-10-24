/// The subtractible armor system will never subtract enough damage to go below this percentage of the original damage
#define MAXIMUM_ARMOR_REDUCTION 0.2

// ~armor flags
/// The armor is flexible, and suffers mild blunt damage even if no damage penetrates
#define SUBARMOR_FLEXIBLE (1<<0)

// Armor class defines

#define CLASS1_CRUSH 10
#define CLASS2_CRUSH 25
#define CLASS3_CRUSH 40
#define CLASS4_CRUSH 50
#define CLASS5_CRUSH 65

#define CLASS1_CUT 10
#define CLASS2_CUT 25
#define CLASS3_CUT 40
#define CLASS4_CUT 50
#define CLASS5_CUT 65

#define CLASS1_STAB 10
#define CLASS2_STAB 25
#define CLASS3_STAB 40
#define CLASS4_STAB 50
#define CLASS5_STAB 65

#define CLASS1_PIERCE 15 //Pierce will mostly just be used for bullets for now
#define CLASS2_PIERCE 30
#define CLASS3_PIERCE 50
#define CLASS4_PIERCE 60
#define CLASS5_PIERCE 75

#define CLASS1_LASER 10
#define CLASS2_LASER 25
#define CLASS3_LASER 40
#define CLASS4_LASER 50
#define CLASS5_LASER 60

#define CLASS1_PLASMA 15
#define CLASS2_PLASMA 25
#define CLASS3_PLASMA 45
#define CLASS4_PLASMA 50

#define CLASS1_FIRE 10
#define CLASS2_FIRE 25
#define CLASS3_FIRE 40
#define CLASS4_FIRE 50
#define CLASS5_FIRE 65

#define CLASS1_EDGE 10
#define CLASS2_EDGE 15
#define CLASS3_EDGE 25
#define CLASS4_EDGE 35

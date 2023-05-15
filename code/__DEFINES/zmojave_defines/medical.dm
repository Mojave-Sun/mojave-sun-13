// ~germ defines
/// Medical equipment should start out as this, absolutely no germs
#define GERM_LEVEL_STERILE 0
/// Standard germ level for most atoms
#define GERM_LEVEL_AMBIENT 250
/// Maximum germ level any atom can normally achieve
#define GERM_LEVEL_MAXIMUM 1000

/// Germ level per unit of blood exposed to
#define GERM_LEVEL_PER_UNIT_BLOOD 2

// ~sanitization defines, related to lowering germ level
/// Sterilizine sanitization per unit
#define SANITIZATION_PER_UNIT_STERILIZINE 50
/// Space cleaner sanitization per unit
#define SANITIZATION_PER_UNIT_SPACE_CLEANER 25
/// Water sanitization per unit
#define SANITIZATION_PER_UNIT_WATER 10
/// CE_ANTIBIOTIC bodypart/organ sanitization per CE unit
#define SANITIZATION_ANTIBIOTIC 0.1
/// Bodypart/organ sanitization for laying down, so lying down helps infections go away
#define SANITIZATION_LYING 1

// ~infection levels
/// infections grow from ambient to one in ~5 minutes
#define INFECTION_LEVEL_ONE 250
/// infections grow from ambient to two in ~10 minutes
#define INFECTION_LEVEL_TWO 500
/// infections grow from two to three in ~15 minutes
#define INFECTION_LEVEL_THREE 1000

/// Maximum amount of germs surgery can cause
#define SURGERY_GERM_MAXIMUM 800

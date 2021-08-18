// Generic Areas //

/area/ms13
	name = "wasteland"
	icon = 'mojave/icons/turf/areas.dmi'
	icon_state = "wasteland"
	requires_power = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	outdoors = TRUE
	has_gravity = STANDARD_GRAVITY
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED
	ambientsounds = list('mojave/sound/ms13ambience/general/wasteland.ogg')
	flags_1 = NONE

/area/ms13/admeme
	icon_state = "secret"
	requires_power = FALSE

/area/ms13/town
	name = "Abandoned town"
	icon_state = "town"
	requires_power = FALSE
	power_environ = TRUE
	power_equip = TRUE
	power_light = TRUE
	ambientsounds = list('mojave/sound/ms13ambience/general/building.ogg')

/area/ms13/farmhouse
	name = "Farmhouse"
	icon_state = "farmhouse"
	requires_power = TRUE

/area/ms13/powerplant
	name = "Power Plant"
	icon_state = "powerplant"
	requires_power = TRUE
	ambientsounds = AMBIENCE_ENGI

/area/ms13/factory
	name = "Factory"
	icon_state = "factory"

/area/ms13/underground/vault_atrium_upper
	name = "Vault Atrium Upper"
	icon_state = "vault_atrium_upper"
	requires_power = TRUE

/area/ms13/underground/vault_atrium_Lower
	name = "Vault Atrium Lower"
	icon_state = "vault_atrium_lower"
	requires_power = TRUE

/area/ms13/supermarket
	name = "Supermarket"
	icon_state = "supermarket"

/area/ms13/supermarket/basement
	name = "Supermarket Basement"
	icon_state = "supermarket_basement"

/area/ms13/underground/enclave_base
	name = "Enclave Base"
	icon_state = "enclave"

// Generic Underground Areas //

/area/ms13/underground
	requires_power = FALSE
	outdoors = FALSE
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED

/area/ms13/underground/mountain
	name = "mountain"
	ambientsounds = list('mojave/sound/ms13ambience/cave/cave_idle.ogg', 'mojave/sound/ms13ambience/cave/cave_spooky.ogg')
	icon_state = "mountain"
	requires_power = TRUE

/area/ms13/underground/mountain_bunker
	name = "Mountain Bunker"
	icon_state = "mountain_bunker"
	requires_power = TRUE

/area/ms13/underground/sewer
	name = "Sewers"
	icon_state = "sewer"
	outdoors = FALSE

/area/ms13/underground/subway
	name = "Subway"
	outdoors = FALSE
	icon_state = "subway"

/area/ms13/underground/underground_town
	name = "Lower Town"
	icon_state = "underground_town"
	outdoors = FALSE

/area/ms13/underground/tunnel
	name = "Tunnel"
	outdoors = FALSE
	icon_state = "tunnels"

/area/ms13/underground/tunnel/maintenance
	name = "Maintenance Passages"
	icon_state = "maintenance"

// Mammoth Areas //

/area/ms13/ncr
	name = "NCR Mainbase"
	icon_state = "NCR"
	requires_power = FALSE

/area/ms13/ncr/building
	name = "NCR building"
	icon_state = "NCR_building"

/area/ms13/underground/bos
	name = "BoS"
	icon_state = "brotherhood"

/area/ms13/raiders
	name = "Raider stronghold"
	icon_state = "raiders"
	requires_power = FALSE

/area/ms13/raiders/building
	name = "Raider building"
	icon_state = "raiders_building"

// Drought Areas //

/area/ms13/desert
	name = "Desert"
	icon_state = "desert"
	requires_power = FALSE
	power_environ = FALSE
	power_equip = FALSE
	outdoors = TRUE
	flags_1 = NONE

/area/ms13/legioncamp
	name = "Legion Camp"
	icon_state = "legioncamp"

/area/ms13/legioncamp/building
	name = "Legion Building"
	icon_state = "legion_building"
	outdoors = FALSE

/area/ms13/rangeroutpost
	name = "Desert Ranger Outpost"
	icon_state = "ranger_outpost"
	requires_power = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = TRUE
	outdoors = FALSE

// Mall/Eagle Lakes Areas //

/area/ms13/mall
	name = "Mall"
	icon_state = "mall"

/area/ms13/mall/convenience
	name = "Convenience Store"
	icon_state = "convenience"

/area/ms13/mall/clothing
	name = "Clothing Store"
	icon_state = "clothing"

/area/ms13/mall/pawnshop
	name = "Pawn Shop"
	icon_state = "pawn"

/area/ms13/mall/food
	name = "Eatery/Takeout"
	icon_state = "food"

/area/ms13/mall/hardware
	name = "Hardware Store"
	icon_state = "hardware"

/area/ms13/mall/trinket
	name = "Trinket/Other Store"
	icon_state = "trinket"

/area/ms13/mall/furniture
	name = "Furniture/Appliance Store"
	icon_state = "furniture"

/area/ms13/mall/cosmetic
	name = "Cosmetic/Health Store"
	icon_state = "health"

/area/ms13/mall/storage
	name = "Storage/Utility"
	icon_state = "storage"

/area/ms13/mall/office
	name = "Office"
	icon_state = "office"

/area/ms13/mall/restroom
	name = "Restroom"
	icon_state = "restroom"

/area/ms13/mall/bank
	name = "Bank"
	icon_state = "bank"

/area/ms13/mall/entertainment
	name = "Entertainment"
	icon_state = "entertainment"

// Combat Test Map

/area/ms13/combattest
	name = "combat arena"
	icon_state = "combatarena_open"
	requires_power = FALSE
	power_environ = TRUE
	power_equip = TRUE
	power_light = TRUE
	mood_bonus = 2
	mood_message = "<span class='cultlarge'>LETS GOOOOOOOOOO\n"

/area/ms13/combattest/building
	name = "combat arena building"
	icon_state = "combatarena_building"
	outdoors = FALSE

/area/ms13/combattest/tunnels
	name = "combat arena tunnel"
	icon_state = "combatarena_tunnels"
	outdoors = FALSE
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED

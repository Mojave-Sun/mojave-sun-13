/obj/item/ms13/hammer
	name = "claw hammer"
	desc = "A standard, small claw hammer. Can be used to hammer a nail and pry a nail!"
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "hammer"
	inhand_icon_state = "hammer"
	hitsound = 'mojave/sound/ms13weapons/meleesounds/genericblunt_hit.ogg'
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/general_pickup.ogg'
	force = 20
	throwforce = 10
	subtractible_armour_penetration = 5
	wound_bonus = 0
	bare_wound_bonus = 0
	attack_verb_continuous = list("smacks", "deconstructs", "pounds", "beats", "bonks", "hammers", "nails")
	attack_verb_simple = list("smack", "deconstruct", "pound", "beat", "bonk", "hammer", "nail")
	sharpness = NONE
	slot_flags = ITEM_SLOT_BELT
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
	w_class = WEIGHT_CLASS_SMALL
	tool_behaviour = TOOL_CROWBAR
	toolspeed = 2
	log_pickup_and_drop = TRUE
	grid_width = 32
	grid_height = 64
	mining_mult = 0.75

/obj/item/ms13/hammer/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/ms13/handsaw
	name = "hand saw"
	desc = "An old handsaw. Useful for cutting wood to length. Also useful for compacting corpses down to a bag sized package."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "handsaw"
	inhand_icon_state = "handsaw"
	hitsound = 'mojave/sound/ms13weapons/meleesounds/hatchet_hit.ogg'
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/general_pickup.ogg'
	force = 25
	subtractible_armour_penetration = 0
	wound_bonus = 5
	bare_wound_bonus = 0
	attack_verb_continuous = list("saws", "slashes", "tears", "rips")
	attack_verb_simple = list("saw", "slash", "tear", "rip")
	sharpness = SHARP_EDGED | SHARP_AXE // Cut down da TREE. Cut down da WOOD.
	tool_behaviour = TOOL_SAW
	slot_flags = ITEM_SLOT_BELT
	resistance_flags = FIRE_PROOF
	w_class = WEIGHT_CLASS_NORMAL
	toolspeed = 2 // axe tomfoolery
	log_pickup_and_drop = TRUE
	grid_width = 96
	grid_height = 32
	mining_mult = -0.5

/obj/item/ms13/handsaw/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/ms13/handdrill
	name = "hand drill"
	desc = "A manual operated drill. Put the spinny bit on what you want to drill, and then just crank it!"
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "handdrill"
	inhand_icon_state = "handdrill"
	hitsound = 'mojave/sound/ms13weapons/meleesounds/stab_hit.ogg'
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/general_pickup.ogg'
	force = 25
	subtractible_armour_penetration = 0
	wound_bonus = 5
	bare_wound_bonus = 3
	attack_verb_continuous = list("drills", "pierces", "stabs", "impales", "jabs")
	attack_verb_simple = list("drill", "pierce", "stab", "impale", "jab")
	sharpness = SHARP_IMPALING
	slot_flags = ITEM_SLOT_BELT
	tool_behaviour = TOOL_DRILL
	resistance_flags = FIRE_PROOF
	w_class = WEIGHT_CLASS_NORMAL
	log_pickup_and_drop = TRUE
	grid_width = 64
	grid_height = 64
	mining_mult = 1.2

/obj/item/ms13/handdrill/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/crowbar/ms13
	name = "crowbar"
	desc = "A formidible weapon, and a useful tool. The ultimate slayer of boarded structures."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "crowbar"
	inhand_icon_state = "crowbar"
	hitsound = 'mojave/sound/ms13weapons/meleesounds/pipe_hit.ogg'
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/general_pickup.ogg'
	force = 25
	throwforce = 10
	subtractible_armour_penetration = 5
	wound_bonus = 0
	bare_wound_bonus = 0
	sharpness = NONE
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_NORMAL
	toolspeed = 1
	log_pickup_and_drop = TRUE
	grid_width = 32
	grid_height = 96

/obj/item/crowbar/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/weldingtool/ms13
	name = "welding tool"
	desc = "An old welding torch. Useful for cutting metal and welding things together alike. Don't touch the flame!"
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "torch"
	inhand_icon_state = "torch"
	force = 10
	throwforce = 10
	subtractible_armour_penetration = 10
	wound_bonus = 5
	bare_wound_bonus = 0
	max_fuel = 40
	light_color = "#7c84a7"
	w_class = WEIGHT_CLASS_NORMAL
	log_pickup_and_drop = TRUE
	change_icons = FALSE
	grid_width = 64
	grid_height = 64

/obj/item/weldingtool/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/weldingtool/ms13/update_icon_state()
	. = ..()
	if(welding)
		inhand_icon_state = "[initial(inhand_icon_state)]-lit"
		icon_state = "[initial(icon_state)]-lit"
		force = 25
		damtype = BURN
	else
		inhand_icon_state = "[initial(inhand_icon_state)]"
		icon_state = "[initial(icon_state)]"
		force = 10
		damtype = BRUTE

/obj/item/weldingtool/ms13/update_overlays()
	. = ..()
	if(welding)
		. += "empty"

/obj/item/wrench/ms13
	name = "wrench"
	desc = "An old and slightly rusted wrench. Still filled with uses even today."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "wrench"
	inhand_icon_state = "wrench"
	hitsound = 'mojave/sound/ms13weapons/meleesounds/genericblunt_hit.ogg'
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/general_pickup.ogg'
	force = 15
	throwforce = 15
	sharpness = NONE
	wound_bonus = -5
	bare_wound_bonus = 0
	w_class = WEIGHT_CLASS_SMALL
	log_pickup_and_drop = TRUE
	grid_width = 32
	grid_height = 64

/obj/item/wrench/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/wirecutters/ms13
	name = "pliers"
	desc = "A portable set of multi-use pliers. Has a section that can be used to cut cable."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "wirecutter"
	inhand_icon_state = "wirecutter"
	force = 5
	sharpness = SHARP_POINTY
	wound_bonus = CANT_WOUND
	w_class = WEIGHT_CLASS_TINY
	random_color = FALSE
	log_pickup_and_drop = TRUE
	grid_width = 32
	grid_height = 32

/obj/item/wirecutters/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/screwdriver/ms13
	name = "screwdriver"
	desc = "A thin screwdriver. Keep it close, you'll never know when you need to remove someone's eye- or a screw."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "screwdriver"
	inhand_icon_state = "screwdriver"
	flags_1 = CONDUCT_1
	force = 15
	sharpness = SHARP_IMPALING
	wound_bonus = 0
	bare_wound_bonus = 0
	throwforce = 10
	random_color = FALSE
	log_pickup_and_drop = TRUE
	grid_width = 32
	grid_height = 32

/obj/item/screwdriver/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/shovel/ms13
	name = "shovel"
	desc = "A shovel for digging up the ground, commonly used for farming or gravedigging."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "shovel"
	inhand_icon_state = "shovel"
	hitsound = 'mojave/sound/ms13weapons/meleesounds/genericblunt_hit.ogg'
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/wooden_pickup.ogg'
	force = 25
	throwforce = 15
	subtractible_armour_penetration = 15
	wound_bonus = 5
	bare_wound_bonus = 0
	attack_verb_continuous = list("smacks", "slashes", "jabs", "slaps", "pounds", "beats", "bonks", "digs")
	attack_verb_simple = list("smack", "slash", "jab", "slap", "pound", "beat", "bonk", "dig")
	sharpness = NONE
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	log_pickup_and_drop = TRUE
	grid_width = 64
	grid_height = 128

/obj/item/shovel/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/shovel/ms13/spade
	name = "spade"
	desc = "A small, compact spade for digging up the ground. It's smaller size makes it not as efficent as using a full sized shovel."
	icon_state = "spade"
	inhand_icon_state = "spade"
	force = 20
	throwforce = 10
	subtractible_armour_penetration = 15
	wound_bonus = 5
	bare_wound_bonus = 0
	toolspeed = 2
	sharpness = NONE
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	grid_width = 64
	grid_height = 64
	mining_mult = -0.5

/obj/item/shovel/ms13/snow
	name = "snow shovel"
	desc = "A shovel primarily meant for clearing snow, but could be used to dig somewhat inefficiently."
	icon_state = "shovel_snow"
	inhand_icon_state = "shovel_snow"
	force = 25
	throwforce = 10
	subtractible_armour_penetration = 0
	wound_bonus = -2
	bare_wound_bonus = 0
	throwforce = 10
	toolspeed = 1.5

/obj/item/shovel/ms13/rake
	name = "rake"
	desc = "A rake used for raking. You could try to dig with it, but it won't do you much good."
	icon_state = "rake"
	inhand_icon_state = "rake"
	hitsound = 'mojave/sound/ms13weapons/meleesounds/stab_hit.ogg'
	force = 25
	throwforce = 10
	subtractible_armour_penetration = 0
	wound_bonus = 0
	bare_wound_bonus = 5
	toolspeed = 2.5
	attack_verb_continuous = list("smacks", "slashes", "jabs", "slaps", "pounds", "beats", "bonks", "rakes", "assaults")
	attack_verb_simple = list("smack", "slash", "jabb", "slap", "pound", "beat", "bonk", "rake", "assault")
	sharpness = SHARP_IMPALING

/obj/item/pickaxe/ms13
	name = "pickaxe"
	desc = "An old pickaxe. Ideally, you can use this to break through loose stone."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	icon_state = "pickaxe"
	hitsound = 'mojave/sound/ms13weapons/meleesounds/stab_hit.ogg'
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/wooden_pickup.ogg'
	slot_flags = NONE
	force = 25
	throwforce = 15
	subtractible_armour_penetration = 5
	sharpness = SHARP_IMPALING
	wound_bonus = 5
	bare_wound_bonus = 5
	w_class = WEIGHT_CLASS_BULKY
	grid_width = 64
	grid_height = 128
	custom_materials = null
	toolspeed = 1.5 //grim
	mining_mult = 5

/obj/item/ms13/brick
	name = "brick"
	desc = "A literal brick. Nothing more."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "brick"
	inhand_icon_state = "brick"
	hitsound = 'mojave/sound/ms13weapons/meleesounds/genericblunt_hit.ogg'
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/general_grip.ogg'
	attack_verb_continuous = list("clonks", "smacks", "clocks", "nails", "bludgeons", "whacks", "bonks", "bricks")
	attack_verb_simple = list("clonk", "smack", "clock", "nail", "bludgeon", "whack", "bonk", "brick")
	force = 20
	throwforce = 20 //brick
	subtractible_armour_penetration = 5
	wound_bonus = 0
	bare_wound_bonus = 5
	sharpness = NONE
	w_class = WEIGHT_CLASS_SMALL
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_BELT
	log_pickup_and_drop = TRUE
	grid_width = 64
	grid_height = 32
	mining_mult = 0.75 //funny brick utility

/obj/item/ms13/brick/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

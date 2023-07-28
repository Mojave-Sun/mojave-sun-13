/obj/item/clothing/suit/ms13
	name = "generic ms13 suit"
	desc = "You shouldn't be seeing this. It do be lookin' kinda clean doe."
	icon = 'mojave/icons/objects/clothing/clothing_world/suits_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/suit.dmi'
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	body_parts_covered = CHEST|ARMS|LEGS|GROIN
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 0, ACID = 0, WOUND = 0)
	max_integrity = 325
	///Icon file for left inhand overlays
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	///Icon file for right inhand overlays
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS
	grid_width = 64
	grid_height = 96

/obj/item/clothing/suit/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clothing/clothing_inventory/suits_inventory.dmi')

/obj/item/clothing/suit/toggle/ms13
	name = "generic ms13 toggleable"
	desc = "Don't look. Don't look. NIGHTMARE NIGHTMARE NIGHTMARE."
	icon_state = "winterjacketorange"
	inhand_icon_state = "winter"
	icon = 'mojave/icons/objects/clothing/clothing_world/suits_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/suit.dmi'
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	body_parts_covered = CHEST|ARMS|LEGS|GROIN
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 0, ACID = 0, WOUND = 0)
	///Icon file for left inhand overlays
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	///Icon file for right inhand overlays
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS
	grid_width = 64
	grid_height = 96

/obj/item/clothing/suit/toggle/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clothing/clothing_inventory/suits_inventory.dmi')

// wasteland //

/obj/item/clothing/suit/ms13/vest
	name = "leather vest"
	desc = "A vest made of tanned leather."
	icon_state = "leather_vest"
	inhand_icon_state = "duster"
	body_parts_covered = CHEST
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/large

/obj/item/clothing/suit/ms13/vest/brown
	name = "brown vest"
	desc = "A brown vest, commonly worn by wannabe cowboys and prospectors."
	icon_state = "brown_vest"
	inhand_icon_state = "bos_jumpsuit"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/suit/ms13/vest/black
	name = "black vest"
	desc = "A black, fancy looking vest."
	icon_state = "black_vest"
	inhand_icon_state = "bos_jumpsuit_o"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/suit/ms13/ljacket
	name = "leather jacket"
	desc = "A typical leather jacket. Nothing too special about it."
	icon_state = "leatherjacket"
	inhand_icon_state = "leatherjacket"
	body_parts_covered = CHEST|LEGS|GROIN|ARM_LEFT
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/large

/obj/item/clothing/suit/ms13/veteran_coat
	name = "merc veteran coat"
	desc = "A blue padded coat adorned with war medals. Common attire for mercenaries."
	icon_state = "veteran_coat"
	inhand_icon_state = "leatherjacket"
	body_parts_covered = CHEST|GROIN
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = 0, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/large

/obj/item/clothing/suit/ms13/veteran_coat/black
	name = "black veteran coat"
	desc = "A black, sleeveless padded coat."
	icon_state = "veteran_coat_b"

/obj/item/clothing/suit/ms13/veteran_coat/reinf
	name = "reinforced veteran coat"
	desc = "A blue padded coat with additional leather and crude metal reinforcements. Common attire for hardened, dangerous mercenaries."
	icon_state = "reinf_veteran_coat"
	body_parts_covered = CHEST|GROIN|ARMS
	slowdown = 0.15
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	max_integrity = 400
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 35, acid = 0, wound = 0)
	equip_delay_self = 2.5 SECONDS
	equip_delay_other = 4 SECONDS
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/med

/obj/item/clothing/suit/ms13/ljacket/reinforced
	name = "reinforced leather jacket"
	desc = "An atypical leather jacket reinforced with extra leather padding to make it into an actual makeshift suit of armor."
	icon_state = "reinfljacket"
	inhand_icon_state = "reinforcedjacket"
	body_parts_covered = CHEST|LEGS|GROIN|ARMS
	slowdown = 0.15
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	max_integrity = 400
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 50, acid = 0, wound = 0)
	equip_delay_self = 2.5 SECONDS
	equip_delay_other = 4 SECONDS
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/med

// winter jackets //

/obj/item/clothing/suit/toggle/ms13/wjacket
	name = "DO NOT USE ME - base type winter jacket"
	desc = "If you are seeing this, someone fucked up."
	inhand_icon_state = "winter"
	body_parts_covered = CHEST|GROIN|ARMS
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/large

/obj/item/clothing/suit/toggle/ms13/wjacket/orange
	name = "orange winter jacket"
	desc = "A plain orange winter jacket. Nice and warm."
	icon_state = "winterjacketorange"

/obj/item/clothing/suit/toggle/ms13/wjacket/orange/reinforced
	name = "reinforced orange winter jacket"
	desc = "A reinforced and padded orange winter jacket."
	icon_state = "reinforcedwinterorange"
	slowdown = 0.15
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	max_integrity = 400
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 35, acid = 0, wound = 0)
	equip_delay_self = 2.5 SECONDS
	equip_delay_other = 4 SECONDS
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/med

/obj/item/clothing/suit/toggle/ms13/wjacket/orange/armored
	name = "armored orange winter jacket"
	desc = "An heavily reinforced orange winter jacket with the addition of bulky metal plates."
	icon_state = "armoredwinterorange"
	slowdown = 0.3
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS2_EDGE, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS3_PIERCE, \
                IMPALING = CLASS3_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = CLASS2_PLASMA, \
                FIRE = CLASS3_FIRE)
	max_integrity = 450
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 50, acid = 0, wound = 0)
	equip_delay_self = 3.5 SECONDS
	equip_delay_other = 5 SECONDS
	pocket_storage_component_path = null

/obj/item/clothing/suit/toggle/ms13/wjacket/brown
	name = "brown winter jacket"
	desc = "A very plain brown winter jacket. Nice and warm."
	icon_state = "winterjacketbrown"

/obj/item/clothing/suit/toggle/ms13/wjacket/brown/reinforced
	name = "reinforced brown jacket"
	desc = "A reinforced and padded brown winter jacket."
	icon_state = "reinforcedwinterbrown"
	slowdown = 0.15
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	max_integrity = 400
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 35, acid = 0, wound = 0)
	equip_delay_self = 2.5 SECONDS
	equip_delay_other = 4 SECONDS
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/med

/obj/item/clothing/suit/toggle/ms13/wjacket/brown/armored
	name = "armored brown jacket"
	desc = "An armored and sturdily reinforced brown winter jacket."
	icon_state = "armoredwinterbrown"
	slowdown = 0.15
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS3_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS3_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS3_FIRE)
	max_integrity = 450
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 50, acid = 0, wound = 0)
	equip_delay_self = 3.5 SECONDS
	equip_delay_other = 5 SECONDS
	pocket_storage_component_path = null

/obj/item/clothing/suit/toggle/ms13/wjacket/blue
	name = "blue winter jacket"
	desc = "A blue winter jacket."
	icon_state = "winterjacketblue"

/obj/item/clothing/suit/toggle/ms13/wjacket/blue/reinforced
	name = "reinforced blue winter jacket"
	desc = "A reinforced and padded blue winter jacket."
	icon_state = "reinforcedwinterblue"
	slowdown = 0.15
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	max_integrity = 400
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 35, acid = 0, wound = 0)
	equip_delay_self = 2.5 SECONDS
	equip_delay_other = 4 SECONDS
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/med

/obj/item/clothing/suit/toggle/ms13/wjacket/blue/armored
	name = "armored blue winter jacket"
	desc = "An armored and sturdily reinforced blue winter jacket."
	icon_state = "armoredwinterblue"
	slowdown = 0.15
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS3_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS3_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS3_FIRE)
	max_integrity = 450
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 50, acid = 0, wound = 0)
	equip_delay_self = 3.5 SECONDS
	equip_delay_other = 5 SECONDS
	pocket_storage_component_path = null

/obj/item/clothing/suit/toggle/ms13/wjacket/black
	name = "black winter jacket"
	desc = "A dark, black winter jacket."
	icon_state = "winterjacketblack"

/obj/item/clothing/suit/toggle/ms13/wjacket/black/reinforced
	name = "reinforced black winter jacket"
	desc = "A reinforced and padded black winter jacket."
	icon_state = "reinforcedwinterblack"
	slowdown = 0.15
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	max_integrity = 400
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 35, acid = 0, wound = 0)
	equip_delay_self = 2.5 SECONDS
	equip_delay_other = 4 SECONDS
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/med

/obj/item/clothing/suit/toggle/ms13/wjacket/black/armored
	name = "armored black winter jacket"
	desc = "An armored and sturdily reinforced black winter jacket."
	icon_state = "armoredwinterblack"
	slowdown = 0.15
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS3_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS3_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS3_FIRE)
	max_integrity = 450
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 50, acid = 0, wound = 0)
	equip_delay_self = 3.5 SECONDS
	equip_delay_other = 5 SECONDS
	pocket_storage_component_path = null

// jackets //

/obj/item/clothing/suit/ms13/ljacket/moleskin
	name = "ratskin jacket"
	desc = "A durable jacket made from pigrat hide."
	icon_state = "moleskinjacket"
	inhand_icon_state = "duster"
	body_parts_covered = CHEST|ARMS
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/suit/ms13/ljacket/wanderer
	name = "wanderer jacket"
	desc = "An old, worn jacket that has no doubt seen it's fair share of places."
	icon_state = "wanderer"
	inhand_icon_state = "duster"
	body_parts_covered = CHEST|ARMS
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/suit/ms13/ljacket/military
	name = "military jacket"
	desc = "An old school military jacket."
	icon_state = "militaryjacket"
	inhand_icon_state = "greenjump"
	body_parts_covered = CHEST|ARMS
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = 0, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/suit/ms13/ljacket/musty
	name = "musty jacket"
	desc = "A musty, old jacket full of holes. Better than nothing."
	icon_state = "mustyjacket"
	inhand_icon_state = "duster"
	body_parts_covered = CHEST|ARMS
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/med

/obj/item/clothing/suit/ms13/ljacket/biker
	name = "biker jacket"
	desc = "A classic tough and durable leather jacket, for riding the highways in badass style."
	icon_state = "bikerjacket"
	inhand_icon_state = "leatherjacket"
	body_parts_covered = CHEST|ARMS
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/suit/ms13/vest/letterman
	name = "letterman jacket"
	desc = "A high school letterman jacket. For showing off your achievements in the post apocalypse."
	icon_state = "letterman"
	inhand_icon_state = "shirt"
	body_parts_covered = CHEST|ARMS
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/suit/ms13/ljacket/bomber
	name = "bomber jacket"
	desc = "A fur-lined bomber jacket. Warm and stylish."
	icon_state = "bomberjacket"
	body_parts_covered = CHEST|ARMS
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)

// trenchcoats //

/obj/item/clothing/suit/ms13/trench
	name = "tan trenchcoat"
	desc = "A heavy tan trenchcoat."
	icon_state = "tantrench"
	inhand_icon_state = "duster"
	body_parts_covered = CHEST|ARMS|GROIN|LEGS
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/large

/obj/item/clothing/suit/ms13/trench/detective
	name = "detective's trenchcoat"
	desc = "A trenchcoat normally worn by pre-war detectives."
	icon_state = "detective"
	body_parts_covered = CHEST|ARMS|GROIN
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = 0, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/suit/ms13/trench/brown
	name = "brown overcoat"
	desc = "A slightly dirty brown overcoat."
	icon_state = "brownover"
	body_parts_covered = CHEST|ARMS|GROIN|LEGS
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/suit/ms13/trench/leather
	name = "leather overcoat"
	desc = "A leather overcoat. Almost a duster"
	icon_state = "bum"
	body_parts_covered = CHEST|ARMS|GROIN
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/suit/ms13/trench/black
	name = "black trenchcoat"
	desc = "An imposingblack trenchcoat."
	icon_state = "blacktrench"
	inhand_icon_state = "leatherjacket"
	body_parts_covered = CHEST|ARMS|GROIN
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/suit/ms13/trench/black/bruiser
	name = "bruiser trenchcoat"
	desc = "A beefy black trenchcoat."
	icon_state = "bruiser"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/suit/ms13/trench/black/reinf
	name = "reinforced black trenchcoat"
	desc = "A black trenchcoat with the addition of some heavy metal reinforcements and armor for added protection."
	icon_state = "reinfblacktrench"
	body_parts_covered = CHEST|ARMS|GROIN|LEGS
	slowdown = 0.3
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS2_FIRE)
	max_integrity = 400
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 35, acid = 0, wound = 0)
	equip_delay_self = 3.5 SECONDS
	equip_delay_other = 5 SECONDS
	pocket_storage_component_path = null

/obj/item/clothing/suit/ms13/trench/black/armored
	name = "armored black trenchcoat"
	desc = "A heavily armored black trenchcoat that is a near perfect balance between maximum style and maximum protection."
	icon_state = "armorblacktrench"
	body_parts_covered = CHEST|ARMS|GROIN|LEGS
	slowdown = 0.3
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS2_EDGE, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS3_PIERCE, \
                IMPALING = CLASS3_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = CLASS2_PLASMA, \
                FIRE = CLASS3_FIRE)
	max_integrity = 450
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 50, acid = 0, wound = 0)
	equip_delay_self = 4 SECONDS
	equip_delay_other = 6 SECONDS
	pocket_storage_component_path = null

// dusters //

/obj/item/clothing/suit/ms13/duster
	name = "duster"
	desc = "A typical leather duster."
	icon_state = "duster"
	inhand_icon_state = "duster"
	body_parts_covered = CHEST|GROIN|ARMS
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/large

/obj/item/clothing/suit/ms13/duster/reinforced
	name = "reinforced duster"
	desc = "A duster with added leather and padding for some more protection."
	icon_state = "reinfduster"
	slowdown = 0.15
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	max_integrity = 400
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 35, acid = 0, wound = 0)
	equip_delay_self = 2.5 SECONDS
	equip_delay_other = 4 SECONDS
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/med

/obj/item/clothing/suit/ms13/duster/ranger
	name = "\improper Desert Ranger duster"
	desc = "A closed, padded duster used by the Desert Rangers. Commonly worn by fresh recruits and off-duty Rangers."
	icon_state = "closed_duster"
	body_parts_covered = CHEST|GROIN
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/med

/obj/item/clothing/suit/ms13/duster/ranger/chief
	name = "\improper Desert Ranger Deputy-Chief poncho"
	desc = "A well made, padded poncho known for being specially made for certain high ranking members within the Desert Rangers."
	icon_state = "deputy_chief"
	body_parts_covered = CHEST|GROIN|ARMS
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/large

// labcoats //

/obj/item/clothing/suit/toggle/labcoat/ms13
	name = "doctor's coat"
	desc = "The medical coat of a typical wasteland doctor."
	icon = 'mojave/icons/objects/clothing/clothing_world/suits_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/suit.dmi'
	icon_state = "followers"
	inhand_icon_state = "shirt"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0, wound = 0)
	body_parts_covered = CHEST|ARMS
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/large
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/suit/ms13/vaultlab
	name = "vault lab coat"
	desc = "A lab coat often worn by Vault doctors. Good for protecting your precious undersuit from rapid blood ejection from your patients."
	icon_state = "vaultlabcoat"
	inhand_icon_state = "shirt"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0, wound = 0)
	body_parts_covered = CHEST|ARMS
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

// other //

/obj/item/clothing/suit/apron/waders/ms13
	name = "leather waders"
	desc = "A pair of heavy duty leather waders, they've seen better days."
	icon_state = "hort_waders"
	inhand_icon_state = "hort_waders"
	body_parts_covered = CHEST|GROIN|LEGS
	permeability_coefficient = 0.5

/obj/item/clothing/suit/hooded/ms13/hubologist
	name = "hubologist robes"
	desc = "Long, dark, and imposing padded robes worn by Hubologists."
	icon_state = "hubologist"
	inhand_icon_state = "hostrench"
	armor = list("melee" = 25, "bullet" = 20, "laser" = 10, "energy" = 5, "bomb" = 15, "bio" = 10,  "fire" = 10, "acid" = 10, "wound" = 0)
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	hoodtype = /obj/item/clothing/head/hooded/ms13/hubologist

/obj/item/clothing/suit/ms13/manny
	name = "\improper Manny Mammoth suit"
	desc = "A perfectly preserved pre-war VINTAGE Manny Mammoth suit! It smells of crusty pizza."
	icon_state = "mannybody"
	inhand_icon_state = "mannyhead"

// Drylanders //

/obj/item/clothing/suit/ms13/drylander
	name = "base type Drylander suit"
	desc = "You shouldn't be seeing this."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	icon_state = "dry_simple"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/large

/obj/item/clothing/suit/ms13/drylander/hunter
	name = "\improper Drylander hunter padded robes"
	desc = "Lightly padded robes worn by hunters of the Drylander tribe. Light, breathable, and still somewhat protective."
	icon_state = "hunter"
	body_parts_covered = CHEST|GROIN|LEGS
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	max_integrity = 350
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 10, acid = 0, wound = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/med

/obj/item/clothing/suit/ms13/drylander/headtaker
	name = "\improper Drylander Headtaker padded robes"
	desc = "Padded robes worn by the notorious Headtakers of the Drylander tribe. A frightening sight."
	body_parts_covered = CHEST|GROIN|LEGS|ARM_RIGHT
	slowdown = 0.15
	icon_state = "headtaker"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	max_integrity = 450
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 35, acid = 0, wound = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/med

/obj/item/clothing/suit/ms13/drylander/simple
	name = "\improper Drylander simple robes"
	desc = "Basic robes worn by Drylander tribals. Nothing too special about these."
	icon_state = "dry_simple"

/obj/item/clothing/suit/ms13/drylander/poncho
	name = "\improper Drylander poncho"
	desc = "A light, loose poncho worn by Drylander tribals."
	icon_state = "dry_poncho"

/obj/item/clothing/suit/ms13/drylander/forager
	name = "\improper Drylander forager robes"
	desc = "Robes worn by Drylander tribals. Mostly used for foraging and brief excursions."
	icon_state = "dry_forager"

/obj/item/clothing/suit/ms13/drylander/bando
	name = "\improper Drylander bandolier robes"
	desc = "Light robes with a bandolier strewn across to help with storage. Doesn't seem to be very effective though."
	body_parts_covered = CHEST|GROIN|LEGS|ARM_RIGHT
	icon_state = "dry_bando"

/obj/item/clothing/suit/ms13/drylander/chief
	name = "\improper Drylander chieftain robes"
	desc = "An impressive set of robes worn by the chieftain of the Drylander tribe. This commands respect."
	body_parts_covered = CHEST|GROIN|ARMS
	icon_state = "chief"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	max_integrity = 350
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 10, acid = 0, wound = 0)

/obj/item/clothing/suit/ms13/drylander/shaman
	name = "\improper Drylander shaman robes"
	desc = "Well made robes worn by the shaman of the Drylander tribe."
	icon_state = "shaman"

// Slickbacks //

/obj/item/clothing/suit/ms13/slickback
	name = "base type Slickback suit"
	desc = "You shouldn't be seeing this."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	slowdown = 0.15
	icon_state = "slick_1"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/ms13/suit/large
	var/snatched = TRUE // For taking gold chains off the clothes n shit...
	var/has_gold_states = FALSE // Can you even put gold on it

/obj/item/clothing/suit/ms13/slickback/examine(mob/user)
	. = ..()

	if(!snatched && has_gold_states)
		. += span_yellowteamradio("Has some gold chains attached. Quite the status symbol.")
		. += span_notice("You could snatch them off with <b>Right Mouse Click</b>")

	if(snatched && has_gold_states)
		. += span_danger("An obvious empty spot where chains should be. It's <b>RUINED!</b>. Time to order a new one to be custom tailored...")


/obj/item/clothing/suit/ms13/slickback/attack_hand_secondary(mob/user, params)
	. = ..()
	if(snatched)
		return
	playsound(src, 'mojave/sound/ms13effects/jewelry_chain1.ogg', 15, TRUE)
	user.visible_message( \
		"[user] begins to irreversibly ruin \the [src].", \
		span_danger("You begin pillaging the chains off \the [src], forever stealing a part of it."),
		span_hear("You hear cloth moving around with chains rattling."))
	if(do_after(user, 5 SECONDS))
		user.visible_message( \
			"[user] finishes tearing the chains off of \the [src].", \
			span_notice("You finish tearing the chains off \the [src]. Destroying the style."),
			span_hear("You hear chains rattling with an abrupt stop."))
		playsound(src, 'mojave/sound/ms13effects/jewelry_chain2.ogg', 15, TRUE)
		icon_state = initial(icon_state)+"_snatched"
		worn_icon_state = initial(icon_state)+"_snatched"
		update_appearance(updates = UPDATE_ICON)
		user.update_inv_wear_suit()
		user.update_body()
		snatched = TRUE
		var/obj/item/stack/sheet/ms13/scrap_gold/G = new /obj/item/stack/sheet/ms13/scrap_gold
		user.put_in_hands(G)

/* Broken because of the pockets. Idk... it's here for now.
/obj/item/clothing/suit/ms13/slickback/attackby(obj/item/W, mob/user, params)
	. = ..()

	if(istype(W, /obj/item/stack/sheet/ms13/scrap_gold && snatched))
		if(!snatched && has_gold_states)
			to_chat(user, span_yellowteamradio("This thing is already blinged out!"))
			return
		else if(snatched && has_gold_states)
			user.visible_message( \
				"[user] hangs some chains from \the [src].", \
				span_notice("You hang some gains on \the [src]"),
				span_hear("You hear cloth moving around with chains rattling."))
			icon_state = initial(icon_state)
			worn_icon_state = initial(icon_state)
			update_appearance(updates = UPDATE_ICON)
			user.update_inv_wear_suit()
			user.update_body()
			snatched = FALSE
			qdel(W)
			playsound(src, 'mojave/sound/ms13effects/jewelry_chain2.ogg', 15, TRUE)
			return
*/
/obj/item/clothing/suit/ms13/slickback/loose
	name = "loose padded fur coat"
	desc = "A loose fitting, dark colored fur coat with some protective padding."
	icon_state = "slick_1"

/obj/item/clothing/suit/ms13/slickback/brown
	name = "brown padded fur coat"
	desc = "A brown and tan, comfortable looking fur coat with some protective padding."
	icon_state = "slick_2"

/obj/item/clothing/suit/ms13/slickback/white
	name = "white padded fur coat"
	desc = "A bright white padded fur coat. Perfect for blending into the snow."
	icon_state = "slick_3"

/obj/item/clothing/suit/ms13/slickback/dark
	name = "dark padded fur coat"
	desc = "A dapper looking dark fur coat with some protective padding."
	icon_state = "slick_4"

/obj/item/clothing/suit/ms13/slickback/underboss
	name = "\improper Slickback underboss fur coat"
	desc = "A well made, very fancy looking fur coat tailor made for individuals with some real clout within the Slickback gang. Even has some extra protective padding that adds some bulk."
	icon_state = "slick_underboss"
	slowdown = 0.3
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = 0)
	snatched = FALSE // For taking gold chains off the clothes n shit...
	has_gold_states = TRUE // Can you even put gold on it

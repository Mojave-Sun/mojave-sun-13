/obj/item/clothing/head/helmet/ms13
	name = "generic ms13 helmet"
	desc = "You shouldn't be seeing this helmet."
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0, wound = 5)
	dynamic_hair_suffix = "+generic"
	dynamic_fhair_suffix = "+generic"
	flags_inv = HIDEHAIR
	flags_cover = 0
	grid_width = 64
	grid_height = 64
	equip_delay_self = 1 SECONDS
	equip_delay_other = 2 SECONDS
	var/has_fov = FALSE //Whether this has a grim dark FOV or not
	var/fov_angle = 60 //What kind of FOV type it has. This should either be 60, 90, 120, or 180

/obj/item/clothing/head/helmet/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clothing/clothing_inventory/hats_inventory.dmi')
	init_fov()

/obj/item/clothing/head/helmet/ms13/proc/init_fov()
	if (has_fov)
		AddComponent(/datum/component/clothing_fov_visor, fov_angle)

/obj/item/clothing/head/ms13/hood
	name = "generic ms13 hood"
	desc = "We in this."
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0, wound = 5)
	flags_inv = HIDEHAIR
	flags_cover = 0
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	grid_width = 64
	grid_height = 64
	equip_delay_self = 1 SECONDS
	equip_delay_other = 2 SECONDS
	var/has_fov = FALSE //Whether this has a grim dark FOV or not
	var/fov_angle = 60 //What kind of FOV type it has. This should either be 60, 90, 120, or 180


/obj/item/clothing/head/ms13/hood/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clothing/clothing_inventory/hats_inventory.dmi')
	init_fov()

/obj/item/clothing/head/ms13/hood/proc/init_fov()
	if (has_fov)
		AddComponent(/datum/component/clothing_fov_visor, fov_angle)

/obj/item/clothing/head/hooded/ms13
	name = "generic ms13 suit hood"
	desc = "Gamer phone home. Something is wrong."
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0, wound = 5)
	flags_inv = HIDEHAIR
	flags_cover = 0
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/soft/ms13
	name = "generic ms13 flip cap"
	desc = "Now you flipped dawg."
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0, wound = 5)
	grid_width = 32
	grid_height = 64

/obj/item/clothing/head/soft/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clothing/clothing_inventory/hats_inventory.dmi')

/obj/item/clothing/head/helmet/ms13/tall
	worn_icon = 'mojave/icons/mob/clothing/32x64.dmi'
	worn_x_dimension = 32
	worn_y_dimension = 32

// Helmets //

/obj/item/clothing/head/helmet/ms13/assaultron
	name = "assaultron helmet"
	desc = "A hollowed out and re-fitted head of an assaultron robot, being made of metal won't help it at all in protecting from lasers."
	icon_state = "assaultron"
	inhand_icon_state = "metalhelmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS4_CUT, \
                PIERCING = CLASS3_PIERCE, \
                IMPALING = CLASS4_STAB, \
                LASER = 0, \
                ENERGY = CLASS2_PLASMA, \
                FIRE = CLASS3_FIRE)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	has_fov = TRUE
	fov_angle = 120
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/flight
	name = "brown flight helmet"
	desc = "A good looking brown pre-war flight helmet in decent condition."
	icon_state = "flightbrown"
	inhand_icon_state = "combathelmet_mk2"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES // Built in protection from the dust. yippie.
	has_fov = TRUE
	fov_angle = 90
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/flight/yellow
	name = "yellow flight helmet"
	desc = "A yellow flight helmet theorized to be used by test dummies before the war."
	icon_state = "flightyellow"

/obj/item/clothing/head/helmet/ms13/flight/red
	name = "red flight helmet"
	desc = "A red and white pre-war flight helmet. All it's missing is some blue."
	icon_state = "flightred"

/obj/item/clothing/head/helmet/ms13/bladed
	name = "bladed helmet"
	desc = "A menancing metal helmet, adorned with two huge blades on the side."
	icon_state = "bladed"
	inhand_icon_state = "metalhelmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = 0, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS3_FIRE)
	has_fov = TRUE
	fov_angle = 120
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/junk
	name = "junk helmet"
	desc = "An intimidating helmet crudely made from metal scrap."
	icon_state = "junk"
	inhand_icon_state = "combathelmet_mk2"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = 0, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS3_FIRE)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	has_fov = TRUE
	fov_angle = 120
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/skull
	name = "radstag skull helmet"
	desc = "The skull of a radstag with some padding to be used as a makeshift helmet."
	icon_state = "radstag"
	inhand_icon_state = "w_shoes"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = 0, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	has_fov = TRUE
	fov_angle = 60
	flags_inv = HIDEEARS|HIDEFACE
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/helmet/ms13/skull/muffalo
	name = "brahmiluff skull helmet"
	desc = "The skull of a brahmiluff with some padding to be used as a makeshift helmet."
	icon_state = "muffalo"

/obj/item/clothing/head/helmet/ms13/eyebot
	name = "eyebot helmet"
	desc = "A hollowed out eyebot drone converted into a metal helmet."
	icon_state = "eyebot"
	inhand_icon_state = "weldingoff"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = 0, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS3_FIRE)
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES // Built in protection from the dust. yippie.
	has_fov = TRUE
	fov_angle = 120
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/medical
	name = "medical helmet"
	desc = "A protective helmet likely used by pre-war doctors in the event of emergency or in dangerous areas."
	icon_state = "medical"
	inhand_icon_state = "combathelmet_mk2"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	flags_inv = HIDEEARS|HIDEHAIR
	has_fov = TRUE
	fov_angle = 60
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/helmet/ms13/batter
	name = "batters helmet"
	desc = "A dark pre-war baseball batters helmet, helps protect your noggin a little."
	icon_state = "batter"
	inhand_icon_state = "combathelmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	has_fov = TRUE
	fov_angle = 60
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/helmet/ms13/batter/red
	name = "red batters helmet"
	desc = "A red pre-war baseball batters helmet, helps protect your noggin a little."
	icon_state = "batterred"

/obj/item/clothing/head/helmet/ms13/batter/blue
	name = "blue batters helmet"
	desc = "A blue pre-war baseball batters helmet, helps protect your noggin a little."
	icon_state = "batterblue"

/obj/item/clothing/head/helmet/ms13/hardhat
	name = "hardhat"
	desc = "A blue pre-war construction hat."
	icon_state = "hardhat"
	inhand_icon_state = "vaultvanarmor"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/hardhat/ms13/mining
	name = "mining hardhat"
	desc = "A sturdy hard hat with a built in light."
	icon_state = "hardhat0_mining" //holy fuck this code is garbage
	hat_type = "mining"
	light_power = 0.75
	light_range = 3.75
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	inhand_icon_state = "hazmat"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/welding/ms13
	name = "welding helmet"
	desc = "A durable and fireproof face shield to help keep your eyes when welding."
	icon_state = "welding"
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	inhand_icon_state = "welding"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = CLASS4_FIRE)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/army
	name = "army helmet"
	desc = "An old pre-war helmet. Seems someone added quite a bit of ballistic padding on the inside, likely to try and modernize it."
	icon_state = "armyhelmet"
	inhand_icon_state = "combathelmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS3_EDGE, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS4_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS2_FIRE)
	has_fov = TRUE
	fov_angle = 60
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/helmet/ms13/army/civildefence
	name = "civil defense helmet"
	desc = "A pre-war helmet intended for 'civil defense'. Whatever that is supposed to mean."
	icon_state = "civildefence"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS2_EDGE, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS3_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)

// Hoods //

/obj/item/clothing/head/hooded/ms13/hubologist
	name = "hubologist hood"
	desc = "A mysterious hood worn by Hubologists."
	icon_state = "hubologist"
	inhand_icon_state = "hubologist"
	armor = list("melee" = 25, "bullet" = 20, "laser" = 10, "energy" = 5, "bomb" = 15, "bio" = 10,  "fire" = 10, "acid" = 10, "wound" = 0)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/ms13/hood/banded
	name = "banded helmet"
	desc = "A crude helmet made by placing various banded metal sheets over a hood. Not very comfortable, but offers decent protection from conventional threats."
	icon_state = "banded"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = 0, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS3_FIRE)
	inhand_icon_state = "harmorkit"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES // Built in protection from the dust. yippie.
	has_fov = TRUE
	fov_angle = 120
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/ms13/hood/plated
	name = "plated cowl"
	desc = "A cloth cowl with plated metal reinforcements."
	icon_state = "plated"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = 0, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS3_FIRE)
	inhand_icon_state = "armorkit"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	has_fov = TRUE
	fov_angle = 120
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/ms13/hood/cowl
	name = "cowl"
	desc = "A plain cloth cowl."
	icon_state = "cowl"
	inhand_icon_state = "winterglovesbrown"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/ms13/hood/inquisitor
	name = "inquisitors helm"
	desc = "A strange looking piece of armored metal religious headgear. The brass, gold, and iron have a strange shine to them despite the apocalyptic conditions."
	icon_state = "inquisitor"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS4_CUT, \
                PIERCING = CLASS3_PIERCE, \
                IMPALING = CLASS4_STAB, \
                LASER = 0, \
                ENERGY = CLASS2_PLASMA, \
                FIRE = CLASS3_FIRE)
	inhand_icon_state = "headdress_l"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES // Built in protection from the dust. yippie.
	has_fov = TRUE
	fov_angle = 120
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/ms13/hood/sack
	name = "sack hood"
	desc = "A simple sack with some holes poked in it, for concealing your identity as you pillage the wasteland."
	icon_state = "sack"
	inhand_icon_state = "tribalrag"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/ms13/hood/sack/padded
	name = "padded sack hood"
	desc = "A sack hood with the addition of some padding and leather strips for extra protection."
	icon_state = "sackstrap"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	has_fov = TRUE
	fov_angle = 60
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/ms13/hood/sack/metal
	name = "reinforced sack hood"
	desc = "A sack hood reinforced with metal and crude spikes. Looks quite intimidating... for a sack."
	icon_state = "sackmetal"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = 0, \
                CUTTING = CLASS2_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS2_FIRE)
	has_fov = TRUE
	fov_angle = 60
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/ms13/hood/green
	name = "green hood"
	desc = "A simple green leather hood."
	icon_state = "hood"
	inhand_icon_state = "winterglovesblack"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/ms13/hood/hunter
	name = "hunter hood"
	desc = "A tactical hunting hood with some additional padding and a leather face guard. Commonly used by radstag hunters."
	icon_state = "hunter"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	inhand_icon_state = "winterglovesbrown"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	has_fov = TRUE
	fov_angle = 60
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

// Brimmed Hats //

/obj/item/clothing/head/helmet/ms13/sheriff
	name = "sheriff's hat"
	desc = "A dark, wide brimmed, padded hat normally used by sheriffs of the wastes."
	icon_state = "sheriffhat"
	inhand_icon_state = "sheriffhat"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/fedora
	name = "gray fedora"
	desc = "An old gray fedora."
	icon_state = "fedold"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/fedora/blue
	name = "blue fedora"
	desc = "A fanciful and classy blue fedora."
	icon_state = "fedblue"

/obj/item/clothing/head/helmet/ms13/fedora/brown
	name = "brown fedora"
	desc = "A brooding and mysterious brown fedora."
	icon_state = "fedbrown"

/obj/item/clothing/head/helmet/ms13/fedora/yellow
	name = "yellow fedora"
	desc = "A bright and cheerful yellow fedora."
	icon_state = "fedyellow"

/obj/item/clothing/head/helmet/ms13/fedora/treasure
	name = "scavengers hat"
	desc = "A typical treasure seekers hat, for those that roam the wastes picking clean the scraps of old."
	icon_state = "treasure"
	inhand_icon_state = "sheriffhat"

/obj/item/clothing/head/helmet/ms13/bowler
	name = "bowler hat"
	desc = "A classy gentleman's bowler hat."
	icon_state = "bowler"
	inhand_icon_state = "sheriffhat"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/cowboy
	name = "cowboy hat"
	desc = "A classic cowboy hat. Perhaps worn by lawmen of old."
	icon_state = "cowboy"
	inhand_icon_state = "sheriffhat"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/cowboy/black
	name = "black cowboy hat"
	desc = "A black cowboy hat. Perhaps worn by desperados of old."
	icon_state = "cowboyblack"

/obj/item/clothing/head/helmet/ms13/prospector
	name = "prospector's hat"
	desc = "A hat worn commonly by post-war prospectors. Has some added padding for braving the dangers of the wastes."
	icon_state = "prospector"
	inhand_icon_state = "sheriffhat"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/prospector/brown
	icon_state = "prospectorbrown"
	inhand_icon_state = "sheriffhat"

/obj/item/clothing/head/helmet/ms13/militia
	name = "militia hat"
	desc = "A sturdy leather wide-brimmed militia hat, the common garb of free men."
	icon_state = "militia"
	inhand_icon_state = "fedora"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/tricorn
	name = "tricorn"
	desc = "A fanciful leather tricorn, how traditional."
	icon_state = "tricorn"
	inhand_icon_state = "fedora"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/tricorn/pirate
	name = "pirate hat"
	desc = "Y'arr."
	icon_state = "pirate"

// Tall Helmet //

/obj/item/clothing/head/helmet/ms13/tall/regal
	name = "fancy bicorn"
	desc = "This fanciful hat belongs to a leader or in a museum. The gold and navy silk embroidery is classy and regal, conferring to those who wear it a bearing far beyond what is usually seen in the post-war wastelands."
	icon_state = "regal"
	inhand_icon_state = "fedora"
	armor = list(melee = 20, bullet = 15, laser = 15, energy = 10, bomb = 0, bio = 0,  fire = 10, acid = 10)

/obj/item/clothing/head/helmet/ms13/tall/manny
	name = "\improper Manny Mammoth head"
	desc = "A perfectly preserved pre-war VINTAGE Manny Mammoth head! It smells of crusty pizza."
	icon_state = "manny"
	inhand_icon_state = "duster"

/obj/item/clothing/head/helmet/ms13/tall/tophat
	name = "top hat"
	desc = "The truest statement of class one can get in this hell."
	icon_state = "tophat"
	inhand_icon_state = "that"

/obj/item/clothing/head/helmet/ms13/tall/cone
	desc = "A once bright warning device, now a staple of wasteland fashion."
	name = "warning cone"
	icon_state = "cone"
	inhand_icon_state = "cone"
	force = 1
	throwforce = 5
	throw_speed = 2
	throw_range = 5
	attack_verb_continuous = list("warns", "cautions", "smashes")
	attack_verb_simple = list("warn", "caution", "smash")
	resistance_flags = NONE
	flags_inv = HIDEHAIR
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5,  fire = 5, acid = 5, wound = 0)
	dynamic_hair_suffix = ""

/obj/item/clothing/head/helmet/ms13/tall/cone/attack_self(mob/user)
	weldingvisortoggle(user)

// Caps //

/obj/item/clothing/head/helmet/ms13/baseball
	name = "baseball cap"
	desc = "A classic baseball cap. A relic from pre-nuclear America."
	icon_state = "baseball"
	inhand_icon_state = "fedora"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/deputy
	name = "deputy's cap"
	desc = "A refurbished, good looking pre-war police cap normally in use by the new law enforcers of the cold wastes."
	icon_state = "deputycap"
	inhand_icon_state = "deputycap"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = 0, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/military
	name = "military hat"
	desc = "A military hat for off-duty soldiers."
	icon_state = "military"
	inhand_icon_state = "general"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = 0, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/military/officer
	name = "officer's hat"
	desc = "A pre-war military hat likely worn by an officer."
	icon_state = "captain"

/obj/item/clothing/head/helmet/ms13/military/officer/white
	name = "white officer's hat"
	desc = "A pre-war military hat likely worn by an officer. This one is white."
	icon_state = "captainwhite"

/obj/item/clothing/head/helmet/ms13/military/officer/chinese
	name = "\improper Chinese officer's hat"
	desc = "A pre-war strange military hat, likely used by Chinese communists."
	icon_state = "captaincommie"

/obj/item/clothing/head/helmet/ms13/sailor
	name = "sailor cap"
	desc = "A light cap used by pre-war sailors."
	icon_state = "sailor"
	inhand_icon_state = "fedora"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/postman
	name = "postman hat"
	desc = "A soft cap for old-school couriers of pre-war America."
	icon_state = "postman"
	inhand_icon_state = "fedora"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/police
	name = "police hat"
	desc = "A lightly padded hat used by pre-war police officers."
	icon_state = "policeman"
	inhand_icon_state = "fedora"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = 0, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/fisher
	name = "angler hat"
	desc = "A waterproof angler's hat. About a quarter of what you need to get fishing!"
	icon_state = "fisher"
	inhand_icon_state = "fedora"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/fisher/technobug
	desc = "A waterproof angler's hat. About a quarter of what you need to get fishing! The name 'T. bugg' is crudely written on the inside."

/obj/item/clothing/head/helmet/ms13/bandanacap
	name = "bandana cap"
	desc = "A piece of cloth tied around a cap. A sense of gang activity radiates from this hat."
	icon_state = "bandanacap"
	inhand_icon_state = "fedora"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/bandanacap/ms13
	desc = "A piece of cloth tied around a cap. A sense of gang activity radiates from this hat. The letters and numbers 'MS13' are inscribed on the inside."

/obj/item/clothing/head/helmet/ms13/beret
	name = "gray beret"
	desc = "A plain gray beret."
	icon_state = "beret"
	inhand_icon_state = "fedora"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/newsboy
	name = "newsboy cap"
	desc = "A cap made famous by newsboys, come read all about it!"
	icon_state = "newsboy"
	inhand_icon_state = "fedora"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/trilby
	name = "trilby hat"
	desc = "A yellow trilby hat."
	icon_state = "trilby"
	inhand_icon_state = "fedora"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/beanie
	name = "beanie"
	desc = "A typical, dark beanie."
	icon_state = "beanie"
	inhand_icon_state = "fedora"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

// Misc Hats //

/obj/item/clothing/head/helmet/ms13/chef
	name = "chef hat"
	desc = "A professional chef hat, hopefully there is no rat inside."
	icon_state = "chef"
	inhand_icon_state = "chefhat"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/ushanka
	name = "ushanka hat"
	desc = "Thick, warm ushanka hat. The makings of a true slav."
	icon_state = "ushankared"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

/obj/item/clothing/head/helmet/ms13/ushanka/blue
	name = "blue ushanka hat"
	desc = "A dark blue thick ushanka hat."
	icon_state = "ushankablue"

/obj/item/clothing/head/helmet/ms13/ushanka/green
	name = "green ushanka hat"
	desc = "A dark green thick ushanka hat."
	icon_state = "ushankagreen"

// Wasteland helmets //

/obj/item/clothing/head/helmet/ms13/metal
	name = "heavy metal helmet"
	desc = "A sturdy and robust metal helmet offering excellent conventional protection."
	icon_state = "metalhelmet"
	inhand_icon_state = "metalhelmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS2_EDGE, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS4_CUT, \
                PIERCING = CLASS3_PIERCE, \
                IMPALING = CLASS4_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = CLASS3_PLASMA, \
                FIRE = CLASS4_FIRE)
	has_fov = TRUE
	fov_angle = 90
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

// Raider Helmets //

// Combat Helmets //

/obj/item/clothing/head/helmet/ms13/combat
	name = "combat helmet"
	desc = "A standard pre-war combat helmet. Good overall protection."
	icon_state = "combathelm"
	inhand_icon_state = "combathelmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS2_EDGE, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS3_PIERCE, \
                IMPALING = CLASS3_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = CLASS2_PLASMA, \
                FIRE = CLASS3_FIRE)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES // Built in protection from the dust. yippie.
	has_fov = TRUE
	fov_angle = 90
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/combat/advanced
	name = "advanced combat helmet"
	desc = "An advanced combat helmet offering even better protection."
	icon_state = "adv_combathelm"
	inhand_icon_state = "combathelmet_mk2"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS2_EDGE, \
                CRUSHING = CLASS3_CRUSH, \
                CUTTING = CLASS4_CUT, \
                PIERCING = CLASS3_PIERCE, \
                IMPALING = CLASS3_STAB, \
                LASER = CLASS3_LASER, \
                ENERGY = CLASS3_PLASMA, \
                FIRE = CLASS3_FIRE)

// Special Helmets //

/obj/item/clothing/head/helmet/ms13/tesla
	name = "tesla helmet"
	desc = "An experimental helmet specialized to protect from laser weaponry."
	icon_state = "tesla_helmet"
	inhand_icon_state = "tesla_helmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS4_LASER, \
                ENERGY = CLASS2_PLASMA, \
                FIRE = CLASS3_FIRE)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES // Built in protection from the dust. yippie.
	has_fov = TRUE
	fov_angle = 90
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/eliteriot
	name = "elite riot helmet"
	desc = "An advanced helmet originally used by elite pre-war riot control units."
	icon_state = "riotgearhelmet"
	inhand_icon_state = "riotgearhelmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS2_EDGE, \
                CRUSHING = CLASS4_CRUSH, \
                CUTTING = CLASS4_CUT, \
                PIERCING = CLASS3_PIERCE, \
                IMPALING = CLASS3_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = CLASS2_PLASMA, \
                FIRE = CLASS3_FIRE)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES // Built in protection from the dust. yippie.
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	has_fov = TRUE
	fov_angle = 90
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/vaulthelmet
	name = "vault security helmet"
	desc = "A rather pristine vault-tec security helmet with the addition of some ballistic fiber padding for the changing, post apocalypse world."
	icon_state = "vaulthelmet"
	inhand_icon_state = "helmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS2_EDGE, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS2_FIRE)
	flags_inv = HIDEEARS|HIDEHAIR
	flags_cover = HEADCOVERSEYES // Built in protection from the dust. yippie.
	has_fov = TRUE
	fov_angle = 60
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/helmet/ms13/eliteriot/bountyhunter
	name = "bounty hunter's helmet"
	desc = "A highly customized advanced Riot helmet. Featuring a thick furred hat slipped over the helmet to keep insulation at an all-time high."
	icon_state = "bountyhunter"
	inhand_icon_state = "riotgearhelmet"
	armor = list(melee = 50, bullet = 40, laser = 35, energy = 25, bomb = 50, bio = 25,  fire = 50, acid = 25)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/ms13/enforcer
	name = "padded black hat and mask"
	desc = "A black hat and mask with quite a bit of extra padding for protection. Something about this is quite intimidating."
	icon_state = "enforcer"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/metal/baron
	name = "\improper Baron's Visage"
	desc = "A cold, insidious metal mask belonging to a very particular and very feared man."
	icon_state = "baron"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = 0, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS3_FIRE)
	has_fov = TRUE
	fov_angle = 90
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES // Built in protection from the dust. yippie.
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

// Enviro Helmets //

/obj/item/clothing/head/helmet/ms13/firehood
	name = "fireproof hood"
	desc = "The hood to a near completely fire resistent suit. Pretty heavy, but not so bad once it's on."
	icon_state = "firehood"
	inhand_icon_state = "firehood"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = CLASS5_FIRE)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	heat_protection = HEAD
	resistance_flags = FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	has_fov = TRUE
	fov_angle = 90
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/radiationhood
	name = "radiation suit hood"
	desc = "A hood to go along with your radiation suit. It's got a broken geiger counter mounted near the filter."
	icon_state = "radsuithood"
	inhand_icon_state = "radsuithood"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = 0, \
                CUTTING = CLASS2_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS2_FIRE)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	has_fov = TRUE
	fov_angle = 90
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/radiationhood/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/radiation_protected_clothing)

/obj/item/clothing/head/hooded/ms13/hazmat
	name = "hazmat hood"
	desc = "The hood to a hazmat suit. You'll want to keep this close if you want the suit to actually do anything for you."
	icon_state = "hazmathood"
	inhand_icon_state = "hazmat"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 75,  fire = 5, acid = 75, wound = 0)
	resistance_flags = ACID_PROOF

/obj/item/clothing/head/helmet/space/ms13
	name = "space helmet"
	desc = "A near pristine space helmet. Not a single crack in the glass found. It's probably still good to go!"
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	icon_state = "spacehelmet"
	inhand_icon_state = "spacehelmet"
	armor = list(melee = 15, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 75,  fire = 5, acid = 75)
	flags_inv = HIDEHAIR
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

// NCR Helmets //

/obj/item/clothing/head/helmet/ms13/ncr
	name = "\improper NCR infantry helmet"
	desc = "A standard issue NCR infantry helmet adapted for arctic environments."
	icon_state = "ncr_infantry_helmet"
	inhand_icon_state = "ncr_infantry_helmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	flags_cover = NONE
	has_fov = TRUE
	fov_angle = 60
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/helmet/ms13/ncr/medic
	name = "\improper NCR medic helmet"
	desc = "A standard NCR infantry helmet with the addition of a blue cross for identifying the soldier as a medic."
	icon_state = "ncr_medic_helmet"
	inhand_icon_state = "ncr_medic_helmet"

/obj/item/clothing/head/helmet/ms13/ncr/engineer
	name = "\improper NCR engineer helmet"
	desc = "A standard NCR infantry helmet with the addition of a firm chin strap and some added welding goggles. Used almost exclusively by NCR engineers."
	icon_state = "ncr_engi_helmet"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flash_protect = FLASH_PROTECTION_WELDER
	tint = 2
	flags_inv = HIDEEARS|HIDEEYES
	toggle_message = "You pull the welding goggles down on"
	alt_toggle_message = "You push the welding goggles up on"
	actions_types = list(/datum/action/item_action/toggle)
	visor_flags_inv = HIDEEARS|HIDEEYES
	visor_flags_cover = HEADCOVERSEYES | PEPPERPROOF
	resistance_flags = FIRE_PROOF
	clothing_flags = SNUG_FIT | PLASMAMAN_HELMET_EXEMPT

/obj/item/clothing/head/helmet/ms13/ncr/engineer/attack_self(mob/user)
	weldingvisortoggle(user)

/obj/item/clothing/head/helmet/ms13/ncr/goggles
	name = "\improper NCR goggles helmet"
	desc = "An NCR helmet with added goggles and a heartier internal padding."
	icon_state = "ncr_goggles_helmet"
	inhand_icon_state = "ncr_goggles_helmet"
	can_toggle = 1
	toggle_message = "You pull the goggles down on"
	alt_toggle_message = "You push the goggles up on"
	actions_types = list(/datum/action/item_action/toggle)
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS2_FIRE)

/obj/item/clothing/head/helmet/ms13/ncr/beret
	name = "\improper NCR beret"
	desc = "A standard padded NCR beret. Normally reserved for NCOs."
	icon_state = "ncr_officer_beret"
	inhand_icon_state = "ncr_officer_beret"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	has_fov = FALSE
	equip_delay_self = 1 SECONDS
	equip_delay_other = 2 SECONDS

/obj/item/clothing/head/helmet/ms13/ncr/beret/officer
	name = "\improper NCR officer beret"
	desc = "A brown NCR officer's beret. Minimal protection, maximum style and authority."
	icon_state = "ncr_officer_brberet"
	inhand_icon_state = "ncr_officer_brberet"

// Legion Helmets //

/obj/item/clothing/head/helmet/ms13/legion/vexillarius
	name = "vexillarius headdress"
	desc = "A padded headdress used by only the loudest message relayers and heartiest morale boosters of the Legion"
	icon_state = "leg_vex"
	inhand_icon_state = "owl_mask"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = 0, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = CLASS1_FIRE)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/helmet/ms13/legion/recruit
	name = "\improper Legion recruit helmet"
	desc = "A dark leather helmet fashioned from old sports gear, worn by Legion recruits."
	icon_state = "leg_rec"
	inhand_icon_state = "owl_mask"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	flags_inv = HIDEEARS|HIDEHAIR
	has_fov = TRUE
	fov_angle = 60
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/helmet/ms13/legion/prime
	name = "\improper Legion prime helmet"
	desc = "A red helmet used by Prime Legionaries. Has additional padding for added protection."
	icon_state = "leg_prime"
	inhand_icon_state = "owl_mask"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	flags_inv = HIDEEARS|HIDEHAIR
	has_fov = TRUE
	fov_angle = 60
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/helmet/ms13/legion/veteran
	name = "\improper Legion veteran helmet"
	desc = "A red helmet used by Veteran Legionaries with an added face guard. Only the best protection for the Legion's finest."
	icon_state = "leg_vet"
	inhand_icon_state = "owl_mask"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS3_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS3_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS3_FIRE)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	has_fov = TRUE
	fov_angle = 90
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/legion/decanus
	name = "\improper Legion recruit decanus helmet"
	desc = "A feathery, quite protective helmet used by recruit decanii of the Legion. It's got brown feathers to signify lesser leadership."
	icon_state = "leg_decr"
	inhand_icon_state = "owl_mask"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS3_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS3_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS3_FIRE)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES // Built in protection from the dust. yippie.
	has_fov = TRUE
	fov_angle = 90
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/legion/decanus/prime
	name = "\improper Legion prime decanus helmet"
	desc = "A feathery, quite protective helmet used by prime decanii of the Legion. It's got black feathers to signify a moderate rank."
	icon_state = "leg_decp"

/obj/item/clothing/head/helmet/ms13/legion/decanus/veteran
	name = "\improper Legion veteran decanus helmet"
	desc = "A feathery helmet used by only the most experienced decanii of the Legion. It's got striped feathers to signify superior rank."
	icon_state = "leg_decv"

/obj/item/clothing/head/helmet/ms13/legion/centurion
	name = "\improper Legion centurion helmet"
	desc = "A strong helmet donned by Centurions in the Legion. Some reinforcements on the helmet no doubt came from fallen enemies."
	icon_state = "leg_cent"
	inhand_icon_state = "owl_mask"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS2_EDGE, \
                CRUSHING = CLASS3_CRUSH, \
                CUTTING = CLASS4_CUT, \
                PIERCING = CLASS3_PIERCE, \
                IMPALING = CLASS4_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = CLASS2_PLASMA, \
                FIRE = CLASS3_FIRE)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	has_fov = TRUE
	fov_angle = 120
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS
	worn_y_offset = 16

/obj/item/clothing/head/helmet/ms13/legion/praetorian
	name = "\improper Legion praetorian helmet"
	desc = "A skillfuly forged helmet for a skill endowed man. Only the highest of guards may wear this."
	icon_state = "leg_prae"
	inhand_icon_state = "owl_mask"
	armor = list("melee" = 65, "bullet" = 50, "laser" = 45, "energy" = 20, "bomb" = 65, "bio" = 20,  "fire" = 25, "acid" = 20)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/legion/scout
	name = "\improper Legion scout bandana"
	desc = "A red bandana, often seen tied aroudn the heads of Legion scouts."
	icon_state = "leg_scout"
	inhand_icon_state = "owl_mask"
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 20, "bomb" = 35, "bio" = 20,  "fire" = 25, "acid" = 20)
	flags_inv = HIDEEARS

/obj/item/clothing/head/helmet/ms13/legion/explorer
	name = "\improper Legion explorer hood"
	desc = "A lightly padded hood worn by Legion Explorers."
	icon_state = "leg_exp"
	inhand_icon_state = "owl_mask"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor
	equip_delay_self = 1 SECONDS
	equip_delay_other = 2 SECONDS

// Brotherhood Helmets //

/obj/item/clothing/head/helmet/ms13/initiate
	name = "\improper Brotherhood kevlar helmet"
	desc = "A light kevlar helmet in use by the Brotherhood of Steel, usually seen accompanying the kevlar vests of the Initiates."
	icon_state = "bos_kevlar_helmet"
	inhand_icon_state = "bos_helmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS2_FIRE)
	has_fov = TRUE
	fov_angle = 60
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/head/helmet/ms13/combat/bos
	name = "\improper Brotherhood combat helmet"
	desc = "A hard, custom built helmet issued to Brotherhood troops."
	icon_state = "bos_helmet"
	inhand_icon_state = "bos_helmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS2_EDGE, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS3_STAB, \
                LASER = CLASS3_LASER, \
                ENERGY = CLASS2_PLASMA, \
                FIRE = CLASS3_FIRE)
	has_fov = TRUE
	fov_angle = 90
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

// Desert Ranger Helmets/Hats //

/obj/item/clothing/head/helmet/ms13/eliteriot/ranger
	name = "\improper Desert Ranger elite helmet"
	desc = "An advanced and intimidating helmet used by equally intimidating and skilled Elite Desert Rangers."
	icon_state = "elite_ranger"
	inhand_icon_state = "riotgearhelmet"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS2_EDGE, \
                CRUSHING = CLASS3_CRUSH, \
                CUTTING = CLASS4_CUT, \
                PIERCING = CLASS3_PIERCE, \
                IMPALING = CLASS3_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = CLASS2_PLASMA, \
                FIRE = CLASS3_FIRE)
	equip_delay_self = 2 SECONDS
	equip_delay_other = 4 SECONDS

/obj/item/clothing/head/helmet/ms13/cowboy/ranger
	name = "\improper Desert Ranger hat"
	desc = "A sylish hat, often worn by Desert Rangers. Made with some thick leather and small internal layer of kevlar."
	icon_state = "ranger_hat"
	worn_icon_state = "ranger_hat"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = 0, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = 0)
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0,  fire = 0, acid = 0) //No wound armor

// Drylander Hoods //

/obj/item/clothing/head/helmet/ms13/drylander
	name = "base type drylander hood"
	desc = "You shouldn't be seeing this."
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	flags_cover = HEADCOVERSEYES // Built in protection from the dust. yippie.
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS1_CUT, \
                PIERCING = 0, \
                IMPALING = 0, \
                LASER = 0, \
                ENERGY = 0, \
                FIRE = 0)

/obj/item/clothing/head/helmet/ms13/drylander/hunter
	name = "\improper Drylander hunter hood"
	desc = "A lightly padded hood worn by Drylander hunters."
	icon_state = "hunter_dry"
	worn_icon_state = "hunter_dry"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = CLASS1_FIRE)
	has_fov = TRUE
	fov_angle = 60

/obj/item/clothing/head/helmet/ms13/drylander/headtaker
	name = "\improper Drylander Headtaker hood"
	desc = "A protective hood worn by Headtakers of the Drylander tribe. The sight alone strikes fear into the locals."
	icon_state = "headtaker"
	worn_icon_state = "headtaker"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS2_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = 0, \
                FIRE = CLASS2_FIRE)
	has_fov = TRUE
	fov_angle = 60

/obj/item/clothing/head/helmet/ms13/drylander/shaman
	name = "\improper Drylander shaman hood"
	desc = "A lightly padded hood worn by the shaman of the Drylander tribe."
	icon_state = "shaman"
	worn_icon_state = "shaman"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = 0, \
                CRUSHING = CLASS2_CRUSH, \
                CUTTING = CLASS2_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS1_STAB, \
                LASER = CLASS1_LASER, \
                ENERGY = 0, \
                FIRE = CLASS1_FIRE)
	has_fov = TRUE
	fov_angle = 60

/obj/item/clothing/head/helmet/ms13/drylander/chief
	name = "cracked Deathclaw skull helmet"
	desc = "A hollowed out Deathclaw skull with padding to be fashioned into a sturdy helmet. It has a sizeable crack over the left eye. Perhaps one day it can be returned to it's former glory."
	icon_state = "chieftain"
	worn_icon_state = "chieftain"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS1_EDGE, \
                CRUSHING = CLASS1_CRUSH, \
                CUTTING = CLASS3_CUT, \
                PIERCING = CLASS1_PIERCE, \
                IMPALING = CLASS2_STAB, \
                LASER = CLASS2_LASER, \
                ENERGY = CLASS1_PLASMA, \
                FIRE = CLASS2_FIRE)
	has_fov = TRUE
	fov_angle = 60

/obj/item/clothing/head/helmet/ms13/drylander/hood
	name = "\improper Drylander hood"
	desc = "A basic masked hood worn by the Drylander tribe."
	icon_state = "dry_hood"

/obj/item/clothing/head/helmet/ms13/drylander/wrap
	name = "\improper Drylander facewrap"
	desc = "A specific facewrap worn mostly by the Drylander tribe."
	icon_state = "dry_wrap"

/obj/item/clothing/head/helmet/ms13/drylander/goggles
	name = "\improper Drylander goggles facewrap"
	desc = "A facewrap and goggles worn by the Drylander tribe. Sometimes they hate sand, it gets everywhere."
	icon_state = "dry_goggles"

/obj/item/clothing/head/helmet/ms13/drylander/shemagh
	name = "\improper Drylander shemagh"
	desc = "A shemagh worn by the Drylander tribe. Mysterious."
	icon_state = "dry_shemagh"

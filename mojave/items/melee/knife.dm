//This folder contains all knives and children of knives, like cleavers

/obj/item/knife/ms13
	name = "kitchen knife"
	desc = "A standard kitchen knife. A decent improvised weapon."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "knife_kitchen"
	inhand_icon_state = "knife_kitchen"
	hitsound = list('mojave/sound/ms13weapons/meleesounds/knife_hit1.ogg', 'mojave/sound/ms13weapons/meleesounds/knife_hit2.ogg')
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/knife_pickup.ogg'
	force = 20
	throwforce = 15
	subtractible_armour_penetration = 5
	edge_protection_penetration = 5
	wound_bonus = 5
	bare_wound_bonus = 5
	embedding = null
	sharpness = SHARP_EDGED
	toolspeed = 1.25
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	log_pickup_and_drop = TRUE
	grid_width = 64
	grid_height = 32
	mining_mult = -0.75

/obj/item/knife/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/knife/ms13/combat
	name = "combat knife"
	desc = "A well made, serrated combat knife. Not to be underestimated."
	icon_state = "knife_bayonet"
	inhand_icon_state = "knife_bayonet"
	force = 30
	throwforce = 25
	subtractible_armour_penetration = 20
	edge_protection_penetration = 10
	wound_bonus = 10
	bare_wound_bonus = 10
	toolspeed = 1.6

/obj/item/knife/ms13/combat/soviet
	name = "\improper Soviet combat knife"
	desc = "A slick, straight back combat knife of Soviet make. Seems quite old, and has a faint engraving reading NKVD."
	icon_state = "knife_soviet"
	inhand_icon_state = "knife_soviet"

/obj/item/knife/ms13/combat/bowie
	name = "bowie knife"
	desc = "A heavy duty bowie knife. Incredibly dangerous in skilled hands."
	icon_state = "knife_bowie"
	inhand_icon_state = "knife_bowie"
	force = 35
	throwforce = 30
	subtractible_armour_penetration = 25
	edge_protection_penetration = 10
	wound_bonus = 10
	bare_wound_bonus = 5
	toolspeed = 0.65

/obj/item/knife/ms13/hunting
	name = "hunting knife"
	desc = "A standard hunting knife, a useful tool for anyone in the post apocalypse."
	icon_state = "knife_hunting"
	inhand_icon_state = "knife_hunting"
	force = 25
	throwforce = 20
	subtractible_armour_penetration = 15
	edge_protection_penetration = 5
	wound_bonus = 10
	bare_wound_bonus = 5
	toolspeed = 0.5

/obj/item/knife/ms13/hunting/unique
	name = "\improper Hunter's Pride"
	desc = "A gold rimmed hunting knife with an added finger loop to assist in grip. It is in a pristine overall condition, someone took great care of this."
	icon_state = "knife_hunting_u"
	inhand_icon_state = "knife_hunting_u"
	force = 25
	throwforce = 25
	subtractible_armour_penetration = 25
	toolspeed = 0.35

/obj/item/knife/ms13/throwingknife
	name = "throwing knife"
	desc = "A sharp, pointed knife designed to be thrown."
	icon_state = "knife_throwing"
	inhand_icon_state = "knife_throwing"
	force = 15
	throwforce = 20
	subtractible_armour_penetration = 5
	edge_protection_penetration = 5
	throw_speed = 4
	embedding = list("embedded_pain_multiplier" = 2, "embed_chance" = 35, "embedded_fall_chance" = 20)
	sharpness = SHARP_IMPALING
	tool_behaviour = TOOL_KNIFE
	toolspeed = 3
	wound_bonus = -5
	bare_wound_bonus = 0

/obj/item/knife/ms13/switchblade
	name = "switchblade"
	desc = "A slick and concealable switchblade."
	icon_state = "knife_switch_closed"
	inhand_icon_state = "knife_switch_closed"
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/general_pickup.ogg'
	wound_bonus = 10
	bare_wound_bonus = 5
	edge_protection_penetration = 5
	toolspeed = 2
	var/open = FALSE

/obj/item/knife/ms13/switchblade/attack_self(mob/user)
	open = !open
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, TRUE)
	icon_state = "knife_switch_[open ? "open" : "closed"]"
	inhand_icon_state = "knife_switch_[open ? "open" : "closed"]"

	if(open)
		attack_verb_continuous = list("slashes", "slices", "tears", "lacerates", "rips", "dices", "cuts")
		attack_verb_simple = list("slash", "slice", "tear", "lacerate", "rip", "dice", "cut")
		hitsound = list('mojave/sound/ms13weapons/meleesounds/knife_hit1.ogg', 'mojave/sound/ms13weapons/meleesounds/knife_hit2.ogg')
		force = 20
		throwforce = 15
		subtractible_armour_penetration = 10
		sharpness = SHARP_EDGED
		w_class = WEIGHT_CLASS_SMALL
		tool_behaviour = TOOL_KNIFE
		grid_width = 64
		grid_height = 32

	else
		attack_verb_continuous = list("stubs", "pokes")
		attack_verb_simple = list("stub", "poke")
		hitsound = 'sound/weapons/genhit.ogg'
		force = 5
		throwforce = 5
		subtractible_armour_penetration = 0
		sharpness = NONE
		w_class = WEIGHT_CLASS_TINY
		tool_behaviour = null
		grid_width = 32
		grid_height = 32

/obj/item/knife/ms13/switchblade/razor
	name = "straight razor"
	desc = "A men's shaving tool, now more commonly used to cut throats instead of beards."
	icon_state = "knife_razor_closed"
	inhand_icon_state = "knife_razor_closed"
	wound_bonus = 5
	bare_wound_bonus = 5
	edge_protection_penetration = 0
	toolspeed = 4

/obj/item/knife/ms13/switchblade/razor/attack_self(mob/user)
	open = !open
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, TRUE)
	icon_state = "knife_razor_[open ? "open" : "closed"]"
	inhand_icon_state = "knife_razor_[open ? "open" : "closed"]"

	if(open)
		attack_verb_continuous = list("slashes", "slices", "tears", "lacerates", "rips", "dices", "cuts")
		attack_verb_simple = list("slash", "slice", "tear", "lacerate", "rip", "dice", "cut")
		hitsound = list('mojave/sound/ms13weapons/meleesounds/knife_hit1.ogg', 'mojave/sound/ms13weapons/meleesounds/knife_hit2.ogg')
		force = 15
		throwforce = 5
		subtractible_armour_penetration = 5
		sharpness = SHARP_EDGED
		w_class = WEIGHT_CLASS_SMALL
		tool_behaviour = TOOL_KNIFE
		grid_width = 64
		grid_height = 32

	else
		attack_verb_continuous = list("stubs", "pokes")
		attack_verb_simple = list("stub", "poke")
		hitsound = 'sound/weapons/genhit.ogg'
		force = 5
		throwforce = 5
		subtractible_armour_penetration = 0
		sharpness = NONE
		w_class = WEIGHT_CLASS_TINY
		tool_behaviour = null
		grid_width = 32
		grid_height = 32

/obj/item/knife/butcher/ms13
	name = "cleaver"
	desc = "A hefty butcher's cleaver normally used for chopping limbs and meat off of animals. But it was later discovered this works just as well on other humans."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "knife_cleaver"
	inhand_icon_state = "knife_cleaver"
	hitsound = list('mojave/sound/ms13weapons/meleesounds/blade_hit1.ogg', 'mojave/sound/ms13weapons/meleesounds/blade_hit2.ogg')
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/knife_pickup.ogg'
	force = 25
	throwforce = 15
	subtractible_armour_penetration = 10
	edge_protection_penetration = 5
	wound_bonus = 15
	bare_wound_bonus = 10
	toolspeed = 1
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	sharpness = SHARP_EDGED
	log_pickup_and_drop = TRUE
	grid_width = 64
	grid_height = 64

/obj/item/knife/butcher/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/knife/butcher/ms13/unique
	name = "\improper Chopper"
	desc = "A cleaver that has definitely seen a lot of use and is heavily rusted. Though it still looks like it could chop off a limb, or give a case of tetanus while trying."
	icon_state = "knife_cleaver_rust"
	inhand_icon_state = "knife_cleaver_rust"
	force = 30
	wound_bonus = 15
	bare_wound_bonus = 15
	toolspeed = 0.75

/obj/item/knife/ms13/tribal
	name = "improvised shiv"
	desc = "A makeshift, dangerous looking shiv. No good for cutting someone, but excellent at getting a few stabs in in a pinch."
	icon_state = "tribal_knife"
	inhand_icon_state = "tribal_knife"
	force = 25
	throwforce = 15
	subtractible_armour_penetration = 10
	edge_protection_penetration = 5
	wound_bonus = 6
	bare_wound_bonus = 8
	toolspeed = 1.75
	sharpness = SHARP_IMPALING
	tool_behaviour = TOOL_KNIFE

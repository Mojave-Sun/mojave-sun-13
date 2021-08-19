//This file contains all claymores and children of claymores, like pipes and machetes.

/obj/item/claymore/ms13
	name = "base mojave sun claymore"
	desc = "You shouldn't be seeing this."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	block_chance = 0
	slot_flags = ITEM_SLOT_BELT
	wound_bonus = 0
	bare_wound_bonus = 0
	embedding = null
	log_pickup_and_drop = TRUE

/obj/item/claymore/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/claymore/ms13/machete
	name = "machete"
	desc = "A makeshift machete made of a lawn mower blade."
	icon_state = "machete_scrap"
	inhand_icon_state = "machete_scrap"
	force = 30
	armour_penetration = 0
	throw_force = 15
	wound_bonus = 6
	bare_wound_bonus = 4
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = SHARP_EDGED

/obj/item/claymore/ms13/machete/gladius
	name = "machete gladius"
	desc = "A forged steel machete, the blade has been laborously sharpened and the weight has been evenly distributed for maximum killing power. An image of a bull is burned into the wooden handle."
	icon_state = "machete_gladius"
	inhand_icon_state = "machete_gladius"
	force = 35
	armour_penetration = 5
	wound_bonus = 8
	bare_wound_bonus = 6

/obj/item/claymore/ms13/machete/katana
	name = "katana"
	desc = "A very sharp Japanese sword that is well made and has long stood the test of time."
	icon_state = "katana_black"
	inhand_icon_state = "katana_black"
	force = 35
	armour_penetration = 0
	throw_force = 15
	wound_bonus = 12
	bare_wound_bonus = 13

/obj/item/claymore/ms13/machete/katana/immortal
	name = "\improper Immortal Blade"
	desc = "A red hilted katana that seems like it has seen it's fair share of warfare and bloodshed. The blade seems to be honed to better pierce armor."
	icon_state = "katana_red"
	inhand_icon_state = "katana_red"
	armour_penetration = 10

/obj/item/claymore/ms13/pipe
	name = "lead pipe"
	desc = "A heavy rusted pipe, good for smashing heads."
	icon_state = "lead_pipe"
	inhand_icon_state = "lead_pipe"
	attack_verb_continuous = list("mashes", "bashes", "pipes", "hits", "bludgeons", "whacks", "bonks")
	attack_verb_simple = list("mash", "bash", "pipe", "hit", "bludgeon", "whack", "bonk")
	force = 25
	armour_penetration = 5
	throw_force = 10
	wound_bonus = 5
	w_class= WEIGHT_CLASS_NORMAL
	sharpness = NONE
	log_pickup_and_drop = TRUE

/obj/item/claymore/ms13/pipe/tireiron
	name = "tire iron"
	desc = "A rusty old tire iron, normally used for loosening nuts from car tires. Though now more commonly used for loosening bones in a pinch."
	icon_state = "tire_iron"
	inhand_icon_state = "tire_iron"
	force = 20
	armour_penetration = 0

/obj/item/claymore/ms13/pipe/humble
	name = "\improper Humble Cudgel"
	desc = "A unique heavier duty lead pipe with part of a T connector on the end. The prized cudgel of a humble wastelander."
	icon_state = "lead_pipe_alt"
	inhand_icon_state = "lead_pipe_alt"
	force = 30
	wound_bonus = 8

/obj/item/claymore/ms13/baton
	name = "police baton"
	desc = "Classic police baton, in the tonfa style. Great at disabling your opponent without lots of lasting damage."
	icon_state = "tonfa"
	inhand_icon_state = "tonfa"
	attack_verb_continuous = list("mashes", "bashes", "batters", "hits", "bludgeons", "whacks", "bonks")
	attack_verb_simple = list("mash", "bash", "batter", "hit", "bludgeon", "whack", "bonk")
	force = 25
	armour_penetration = 10
	wound_bonus = -8
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = NONE
	log_pickup_and_drop = TRUE

/obj/item/claymore/ms13/machete/shishkebab
	name = "shishkebab"
	desc = "A slightly dull makeshift sword, rigged up to dispense hot injustice at the flip of a switch."
	icon_state = "shishkebab_off"
	inhand_icon_state = "shishkebab_off"
	sharpness = SHARP_EDGED
	w_class = WEIGHT_CLASS_BULKY
	wound_bonus = 5
	bare_wound_bonus = 5
	throw_force = 10
	var/on = FALSE

/obj/item/claymore/ms13/machete/shishkebab/attack_self(mob/user)
	on = !on
	icon_state = "shishkebab_[on ? "on" : "off"]"
	inhand_icon_state = "shishkebab_[on ? "on" : "off"]"

	if(on)
		attack_verb_continuous = list("burned", "welded", "cauterized", "melted", "charred")
		attack_verb_simple = list("burn", "weld", "cauterize", "melt", "char")
		to_chat(user, "<span class='notice'>You open the valve and click the igniter, [src] begins to eject flames.")
		hitsound = 'sound/items/welder2.ogg'
		damtype = "burn"
		force = 35

	else
		attack_verb_continuous = list("stabs", "slices", "slashes", "cuts", "rends")
		attack_verb_simple = list("stab", "slice", "slash", "cut", "rend")
		to_chat(user, "<span class='notice'>As you close the valve on [src], the flame goes out.")
		hitsound = "swing_hit"
		damtype = "brute"
		force = 20

/obj/item/claymore/ms13/machete/ripper
	name = "ripper"
	desc = "A militarized handheld chainsaw, the sound of it alone is enough to strike fear into the hearts of many."
	icon_state = "ripper_off"
	inhand_icon_state = "ripper_off"
	wound_bonus = 8
	bare_wound_bonus = 6
	armour_penetration = 0
	throw_force = 10
	sharpness = IS_SHARP_AXE
	w_class = WEIGHT_CLASS_BULKY
	var/on = FALSE
	var/icon_prefix = "ripper"

/obj/item/claymore/ms13/machete/ripper/attack_self(mob/user)
	on = !on
	icon_state = "[icon_prefix]_[on ? "on" : "off"]"
	inhand_icon_state = "[icon_prefix]_[on ? "on" : "off"]"

	if(on)
		attack_verb_continuous = list("jabs", "slices", "slashes", "cuts", "rends", "saws", "tears")
		attack_verb_simple = list("jab", "slice", "slash", "cut", "rend", "saw", "tear")
		to_chat(user, "<span class='notice'>As you yank the starter cord on [src], it roars to life.")
		hitsound = 'sound/weapons/chainsawhit.ogg'
		force = 40
		sharpness = IS_SHARP_AXE

	else
		attack_verb_continuous = list("smacks", "beats", "slashes", "cuts", "clubs")
		attack_verb_simple = list("smack", "beat", "slash", "cut", "club")
		to_chat(user, "<span class='notice'>You flip off [src], it slows to a halt.")
		hitsound = "swing_hit"
		force = 10
		sharpness = SHARP_EDGED

/obj/item/claymore/ms13/machete/ripper/advanced
	name = "advanced ripper"
	desc = "A heavy duty ripper with a different design and heavier chains meant to eat through armor and cause even more gruesome injuries."
	icon_state = "ripper_legend_off"
	inhand_icon_state = "ripper_legend_off"
	icon_prefix = "ripper_legend"
	wound_bonus = 10
	bare_wound_bonus = 10
	armour_penetration = 15

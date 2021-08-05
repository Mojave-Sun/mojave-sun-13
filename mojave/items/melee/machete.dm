//This file contains all machetes and children of machetes, like pipes.

/obj/item/claymore/ms13/machete
	name = "machete"
	desc = "A makeshift machete made of a lawn mower blade."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "machete_scrap"
	inhand_icon_state = "machete_scrap"
	force = 30
	wound_bonus = 5
	block_chance = 0
	slot_flags = ITEM_SLOT_BELT
	sharpness = SHARP_EDGED
	log_pickup_and_drop = TRUE

/obj/item/claymore/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/claymore/ms13/machete/gladius
	name = "machete gladius"
	desc = "A forged steel machete, the blade has been laborously sharpened and the weight has been evenly distributed for maximum killing power. An image of a bull is burned into the wooden handle."
	icon_state = "machete_gladius"
	inhand_icon_state = "machete_gladius"
	force = 35
	armour_penetration = 5
	wound_bonus = 10
	bare_wound_bonus = 10

/obj/item/katana/ms13
	name = "katana"
	desc = "A katana is a japanese sword. However it ended up here is another story. Great legends surround this blade, such as being able to take a limb clean off in a single swipe"
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "katana_red"
	inhand_icon_state = "katana_red"
	force = 35
	armour_penetration = 10
	wound_bonus = 5
	bare_wound_bonus = 20

/obj/item/katana/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/katana/ms13/alt
	icon_state = "katana_black"
	inhand_icon_state = "katana_black"

/obj/item/claymore/ms13/machete/pipe
	name = "lead pipe"
	desc = "A heavy rusted pipe, good for smashing heads. "
	icon_state = "lead_pipe"
	inhand_icon_state = "lead_pipe"
	attack_verb_continuous = list("mashes", "bashes", "pipes", "hits", "bludgeons", "whacks", "bonks")
	attack_verb_simple = list("mash", "bash", "pipe", "hit", "bludgeon", "whack", "bonk")
	force = 25
	armour_penetration = 5
	wound_bonus = 5
	sharpness = SHARP_NONE

/obj/item/claymore/ms13/machete/pipe/tireiron
	name = "tire iron"
	desc = "A rusty old tire iron, normally used for loosening nuts from car tires.<br>Though it has a short reach, it has decent damage and a fast swing."
	icon_state = "tire_iron"
	inhand_icon_state = "tire_iron"
	force = 20

/obj/item/claymore/ms13/machete/pipe/baton
	name = "police baton"
	desc = "Classic police baton, in the tonfa style. A devastating weapon used to disable your opponent."
	icon_state = "tonfa"
	inhand_icon_state = "tonfa"
	force = 25
	armour_penetration = 5
	wound_bonus = 5
	sharpness = SHARP_NONE

/obj/item/claymore/ms13/machete/shishkebab
	name = "shishkebab"
	desc = "A makeshift sword, rigged up to dispense hot injustice at the flip of a switch."
	icon_state = "shishkebab_off"
	inhand_icon_state = "shishkebab_off"
	bare_wound_bonus = 10
	armour_penetration = 5
	sharpness = SHARP_EDGED
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
		force = 30

	else
		attack_verb_continuous = list("stabs", "slices", "slashes", "cuts", "rends")
		attack_verb_simple = list("stab", "slice", "slash", "cut", "rend")
		to_chat(user, "<span class='notice'>As you close the valve on [src], the flame goes out.")
		hitsound = "swing_hit"
		damtype = "brute"
		force = 25

/obj/item/claymore/ms13/machete/ripper
	name = "ripper"
	desc = "A militarized handheld chainsaw, Primarily used as a tool, secondarily used as a demonstration of brutality. It excels at ripping chunks off unarmored targets."
	icon_state = "ripper_off"
	inhand_icon_state = "ripper_off"
	bare_wound_bonus = 10
	armour_penetration = 5
	sharpness = IS_SHARP_AXE
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
		force = 25
		sharpness = IS_SHARP_AXE

	else
		attack_verb_continuous = list("smacks", "beats", "slashes", "cuts", "clubs")
		attack_verb_simple = list("smack", "beat", "slash", "cut", "club")
		to_chat(user, "<span class='notice'>You flip off [src], it slows to a halt.")
		hitsound = "swing_hit"
		force = 10
		sharpness = SHARP_EDGED

/obj/item/claymore/ms13/machete/ripper/legend
	name = "heavy ripper"
	desc = "A custom built ripper, it has a long chain fitted on it, with sharper serrations built in. Better at getting to the fleshy bits under armor"
	icon_state = "ripper_legend_off"
	inhand_icon_state = "ripper_legend_off"
	icon_prefix = "ripper_legend"
	bare_wound_bonus = 15
	armour_penetration = 15

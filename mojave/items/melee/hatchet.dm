//This file contains all hatchets and children of hatchets, like icepicks.

/obj/item/hatchet/ms13
	name = "hatchet"
	desc = "A compact but deadly axe. Useful for chopping wood or heads in a pinch."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "hatchet"
	inhand_icon_state = "hatchet"
	force = 30
	throwforce = 25
	wound_bonus = 0
	bare_wound_bonus = 0
	embedding = null
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = IS_SHARP_AXE
	log_pickup_and_drop = TRUE

/obj/item/hatchet/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/hatchet/ms13/broad
	name = "broad hatchet"
	desc = "A broad headed hatchet that is heftier and more dangerous than it's simpler cousin."
	icon_state = "hatchet_broad"
	inhand_icon_state = "hatchet_broad"
	force = 35
	armour_penetration = 5
	throwforce = 30

/obj/item/hatchet/ms13/icepick
	name = "ice pick"
	desc = "A standard ice pick that is as good at breaking up ice as it is at breaking skulls."
	icon_state = "ice_pick"
	inhand_icon_state = "ice_pick"
	force = 25
	throwforce = 20
	wound_bonus = 2
	armour_penetration = 10
	sharpness = SHARP_POINTY

/obj/item/hatchet/ms13/tomahawk
	name = "tomahawk"
	desc = "A makeshift tomahawk, primarily intended for throwing. Two long spikes protrude, used for digging into the target."
	icon_state = "tomahawk"
	inhand_icon_state = "tomahawk"
	force = 20
	throwforce = 30
	armour_penetration = 5
	embedding = list("embedded_pain_multiplier" = 3, "embed_chance" = 50, "embedded_fall_chance" = 25)
	sharpness = SHARP_POINTY
	log_pickup_and_drop = TRUE

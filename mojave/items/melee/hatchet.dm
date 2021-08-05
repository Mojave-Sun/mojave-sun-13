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
	throwforce = 30
	wound_bonus = 0
	bare_wound_bonus = 5
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = IS_SHARP_AXE
	log_pickup_and_drop = TRUE

/obj/item/hatchet/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/hatchet/ms13/broad
	name = "hatchet"
	desc = "A broad headed hatchet. Nice and hefty, could cleave just about anything in two."
	icon_state = "hatchet_broad"
	inhand_icon_state = "hatchet_broad"
	force = 25
	bare_wound_bonus = 10

/obj/item/hatchet/ms13/icepick
	name = "ice pick"
	desc = "A standard ice pick that is as good at breaking up ice as it is at breaking skulls."
	icon_state = "ice_pick"
	inhand_icon_state = "ice_pick"
	force = 25
	throwforce = 20
	bare_wound_bonus = 0
	armour_penetration = 10
	sharpness = SHARP_POINTY

/obj/item/hatchet/ms13/tomahawk
	name = "tomahawk"
	desc = "A makeshift tomahawk, primarily used for throwing. Two long spikes protrude, used for digging into the target."
	icon_state = "tomahawk"
	inhand_icon_state = "tomahawk"
	force = 20
	throwforce = 35
	armour_penetration = 5
	wound_bonus = 0
	embedding = list("embedded_pain_multiplier" = 4, "embed_chance" = 50, "embedded_fall_chance" = 10)
	sharpness = SHARP_POINTY
	log_pickup_and_drop = TRUE

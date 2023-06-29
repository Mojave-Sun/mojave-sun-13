// Stealthboy

/obj/item/clothing/ms13/stealthboy
	name = "stealthboy"
	desc = "A RobCo Industries Stealth Boy 3001, a device capable of rendering the wearer nearly transparent for a period of time."
	icon = 'mojave/items/stealth/stealthboy_world.dmi'
	worn_icon = 'mojave/items/stealth/stealthboy_worn.dmi' //Currently an empty placeholder, needs a sprite!
	icon_state = "stealthboy"
	throwforce = 5.0
	throw_speed = 1
	throw_range = 5
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_NORMAL
	equip_sound = 'sound/items/equip/toolbelt_equip.ogg'
	var/stealth_cooldown = 180
	var/stealth_time = 30
	var/visibility = 15

/obj/item/clothing/ms13/stealthboy/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/stealth)
	AddElement(/datum/element/item_scaling, 0.45, 1)
	actions_types = list(/datum/action/item_action/toggle)

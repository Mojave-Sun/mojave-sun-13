//MOJAVE SUN KEY OBJECTS AND FUNCTION FILE//
/obj/item/ms13/key
	name = "base ms13 key"
	desc = "Lock this guy up and throw this away."
	icon = 'mojave/icons/objects/tools/keys_world.dmi'
	icon_state = "brass"
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	w_class = WEIGHT_CLASS_SMALL
	item_flags = KEY_ITEM
	grid_width = 32
	grid_height = 32
	//Custom key shape for corresponding with the identical lock type pins
	//Bitts seperated into sloppy seperates so players can edit them and interaction with keys
	var/bitt_1
	var/bitt_2
	var/bitt_3
	var/bitt_4
	var/bitt_5
	var/bitt_6

/obj/item/ms13/key/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/keys_inventory.dmi')
	generate_key_order()

/obj/item/ms13/key/proc/generate_key_order()
	var/static/list/bitting_levels = list("A","B","C","D","E","F")
	bitt_1 = pick(bitting_levels)
	bitt_2 = pick(bitting_levels)
	bitt_3 = pick(bitting_levels)
	bitt_4 = pick(bitting_levels)
	bitt_5 = pick(bitting_levels)
	bitt_6 = pick(bitting_levels)

/obj/item/ms13/key/test

/obj/item/ms13/key/test/generate_key_order()
	bitt_1 = "A"
	bitt_2 = "A"
	bitt_3 = "A"
	bitt_4 = "A"
	bitt_5 = "A"
	bitt_6 = "A"

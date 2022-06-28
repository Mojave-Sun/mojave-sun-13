/obj/item/ms13/lockpick
	name = "lockpick"
	desc = "A generic brass bobby pin, perfect for pushing the pins of a lock with skill. Or you know, for hair."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	icon_state = "bobby"
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	w_class = WEIGHT_CLASS_TINY
	grid_width = 32
	grid_height = 32

/obj/item/ms13/lockpick/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

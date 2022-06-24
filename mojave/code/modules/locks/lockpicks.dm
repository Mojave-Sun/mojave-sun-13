/obj/item/ms13/lockpick
	name = "base MS13 lockpick"
	desc = "Hitmen are enroute to your location, delete this."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	icon_state = "bobby"
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"

/obj/item/ms13/lockpick/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

////////////////MOJAVE SUN CUSTOM ROLLIES STORAGE/////////////////

//rolling papers

/obj/item/ms13/rolling_paper
	name = "rolling paper"
	desc = "A clean and processed piece of paper, thin enough to roll into a fine rizzla."
	icon = 'mojave/icons/objects/smokeables/smokeables_world.dmi'
	icon_state = "rollie_paper"
	inventory_state = "rollie_paper"
	world_state = "rollie_paper"
	inhand_icon_state = "paper"
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	grid_height = 32
	grid_width = 32

/obj/item/ms13/rolling_paper/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/smokeables/smokeables_inventory.dmi', world_state, inventory_state)

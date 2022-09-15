/obj/item/clothing/accessory/armband/ms13
	icon = 'mojave/icons/objects/clothing/clothing_world/accessories_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/accessories.dmi'

/obj/item/clothing/accessory/armband/ms13/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clothing/clothing_inventory/accessories_inventory.dmi')

/obj/item/clothing/accessory/armband/ms13/red
	name = "red armband"
	desc = "A red armband, usually used for identification among groups."
	icon_state = "squad_red"
	above_suit = TRUE

/obj/item/clothing/accessory/armband/ms13/blue
	name = "blue armband"
	desc = "A blue armband, usually used for identification among groups."
	icon_state = "squad_blue"
	above_suit = TRUE

/obj/item/clothing/accessory/armband/ms13/green
	name = "green armband"
	desc = "A green armband, usually used for identification among groups."
	icon_state = "squad_green"
	above_suit = TRUE

/obj/item/clothing/accessory/armband/ms13/purple
	name = "purple armband"
	desc = "A purple armband, usually used for identification among groups."
	icon_state = "squad_purple"
	above_suit = TRUE

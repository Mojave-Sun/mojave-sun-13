/obj/item/clothing/accessory/armband/ms13
	icon = 'mojave/icons/objects/clothing/clothing_inventory/accessories_inventory.dmi'
	worn_icon = 'mojave/icons/mob/clothing/accessories.dmi'

/obj/item/clothing/accessory/armband/ms13/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clothing/clothing_world/accessories_world.dmi')

/obj/item/clothing/accessory/armband/ms13/red
	name = "red armband"
	desc = "A red armband, usually used for identification among groups."
	icon_state ='squad_red'

/obj/item/clothing/accessory/armband/ms13/red
	name = "blue armband"
	desc = "A blue armband, usually used for identification among groups."
	icon_state ='squad_blue'

/obj/item/clothing/accessory/armband/ms13/red
	name = "green armband"
	desc = "A green armband, usually used for identification among groups."
	icon_state ='squad_green'

/obj/item/clothing/accessory/armband/ms13/red
	name = "purple armband"
	desc = "A red armband, usually used for identification among groups."
	icon_state ='squad_purple'

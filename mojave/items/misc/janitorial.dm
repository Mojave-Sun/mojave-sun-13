/obj/item/mop/ms13
	name = "mop"
	desc = "An old mop. Essential for attempting to clean up the unspeakable."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	icon_state = "mop"
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	force = 10
	throwforce = 10
	throw_speed = 3
	throw_range = 7
	w_class = WEIGHT_CLASS_HUGE
	grid_width = 224
	///Maximum volume of reagents it can hold.
	max_reagent_volume = 15
	mopspeed = 3.5 SECONDS

/obj/item/mop/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/reagent_containers/glass/bucket/ms13
	name = "bucket"
	desc = "A metal bucket, great for transporting liquids such as water."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	icon_state = "bucket"
	inhand_icon_state = "bucket"
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	custom_materials = list(/datum/material/iron=200)
	w_class = WEIGHT_CLASS_NORMAL
	grid_width = 96
	grid_height = 64
	amount_per_transfer_from_this = 20
	volume = 150
	slot_flags = null

/obj/item/reagent_containers/glass/bucket/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

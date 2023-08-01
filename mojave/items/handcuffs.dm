/obj/item/restraints/handcuffs/ms13/rope
	name = "rope"
	desc = "A length of rope. Im sure you can find some use for it."
	icon_state = "rope"
	icon = 'mojave/icons/objects/crafting/materials_world.dmi'
	worn_icon_state = "rope"
	worn_icon = 'mojave/icons/mob/clothing/hands.dmi'
	inhand_icon_state = "rope"
	handcuffed_icon = 'mojave/icons/mob/clothing/hands.dmi'
	handcuffed_icon_state = "rope"
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	grid_width = 64
	grid_height = 64
	w_class = WEIGHT_CLASS_NORMAL
	cuffsound = 'mojave/sound/ms13effects/hogtie.ogg'
	cuff_time = 3 SECONDS
	cuff_verb = "hogtie"
	does_shrink = FALSE

/obj/item/restraints/handcuffs/ms13/rope/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/crafting/rope_inventory.dmi') //fix post merge
	update_icon_state()

/obj/item/restraints/legcuffs/bola/ms13
	name = "bola"
	desc = "A restraining device designed to be thrown at the target. Upon connecting with said target, it will wrap around their legs, making it difficult for them to move quickly."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "bola"
	lefthand_file = null
	righthand_file = null
	breakouttime = 35//easy to apply, easy to break out of
	gender = NEUTER
	slot_flags = ITEM_SLOT_BELT

/obj/item/restraints/handcuffs/ms13
	grid_height = 32
	grid_width = 64
	icon_state = "handcuffs"
	icon = 'mojave/icons/objects/tools/tools_inventory.dmi'
	inhand_icon_state = "handcuffs"
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	var/does_shrink = TRUE
	breakouttime = 100 SECONDS //1M 40S

/obj/item/restraints/handcuffs/ms13/Initialize(mapload)
	. = ..()
	if(does_shrink)
		AddElement(/datum/element/item_scaling, 0.45, 1)

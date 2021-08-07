/////////////////////////////////////////////////////////////
/////////////////// MOJAVE SUN BACKPACKS ////////////////////
/////////////////////////////////////////////////////////////

/obj/item/storage/ms13
	name = "generic ms13 storage"
	desc = "Da error tho, the crazy error yo!!"
	icon = 'mojave/icons/objects/clothing/backpack.dmi'
	worn_icon = 'mojave/icons/mob/clothing/back.dmi'
	icon_state = ""
	inhand_icon_state = ""
	worn_icon_state = ""
	lefthand_file = 'mojave/icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/equipment/backpack_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	resistance_flags = NONE
	max_integrity = 300

/obj/item/storage/ms13/ComponentInitialize() //backpacks are smaller but hold larger things
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 40
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 12

/obj/item/storage/ms13/sack
	name = "sack"
	desc = "A gnarly weave-sack, very abundant, useful for storage and a carvanners necessity."
	worn_icon = 'mojave/icons/mob/clothing/belt.dmi'
	icon_state = "sack"
	inhand_icon_state = "sack"
	worn_icon_state = "sack"
	slot_flags = ITEM_SLOT_BELT

/obj/item/storage/ms13/ncr
	name = "\improper NCR backpack"
	desc = "A sturdy pack used by members of the NCR. It looks like it can hold a fair bit while still keeping a low profile."
	icon_state = "ncr_pack"
	inhand_icon_state = "ncr_pack"
	worn_icon_state = "ncr_pack"

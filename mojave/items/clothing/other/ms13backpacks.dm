/////////////////////////////////////////////////////////////
/////////////////// MOJAVE SUN BACKPACKS ////////////////////
/////////////////////////////////////////////////////////////

/obj/item/storage/ms13
	name = "generic ms13 storage"
	desc = "Da error tho, the crazy error yo!!"
	icon = 'mojave/icons/objects/clothing/clothing_inventory/backpack_inventory.dmi'
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
	component_type = /datum/component/storage/concrete/ms13/grid

/obj/item/storage/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, world_sprite = 'mojave/icons/objects/clothing/clothing_world/backpack_world.dmi') //This ones flipped for the pref menu icons
	inhand_icon_state = icon_state
	worn_icon_state = icon_state

/obj/item/storage/ms13/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.max_items = 36
	STR.max_combined_w_class = 100

/obj/item/storage/ms13/sack
	name = "sack"
	desc = "A simple woven sack for storage. Easy to access, but can't carry too much."
	icon_state = "sack"
	component_type = /datum/component/storage/concrete/ms13/satchel

/obj/item/storage/ms13/sack/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 24
	STR.max_combined_w_class = 100

/obj/item/storage/ms13/ncr
	name = "\improper NCR backpack"
	desc = "A sturdy pack used by members of the NCR. It looks like it can hold a fair bit while still keeping a low profile."
	icon_state = "ncr_pack"

/obj/item/storage/ms13/military
	name = "military backpack"
	desc = "A tactical green storage device, made of sturdy materials and has enough pockets to hold anything you would ever need for wasteland combat."
	icon_state = "military"

/obj/item/storage/ms13/travel
	name = "travelpack"
	desc = "The roamer's comapanion, a tall handcrafted pack, for storing all the essentials of wasteland livin'."
	icon_state = "travel"

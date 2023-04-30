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
	storage_flags = STORAGE_NO_WORN_ACCESS
	resistance_flags = NONE
	max_integrity = 300
	drag_slowdown = 2
	component_type = /datum/component/storage/concrete/ms13/grid
	grid_height = 288 //NO BACKPACK STACKING
	grid_width = 288 //NO BACKPACK STACKING
	equip_delay_self = 0.75 SECONDS
	equip_delay_other = 2 SECONDS
	ms13_flags_1 = LOCKABLE_1

/obj/item/storage/ms13/Initialize()
	. = ..()
	//This ones flipped for the pref menu icons
	AddElement(/datum/element/world_icon, null, 'mojave/icons/objects/clothing/clothing_world/backpack_world.dmi', icon)
	inhand_icon_state = icon_state
	worn_icon_state = icon_state

/obj/item/storage/ms13/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.max_items = 36
	STR.max_combined_w_class = 100

//STANDARD BACKPACKS

/obj/item/storage/ms13/satchel
	name = "leather satchel"
	desc = "A simple leather satchel. Easy to access but can't hold much."
	icon_state = "satchel"
	storage_flags = 0
	component_type = /datum/component/storage/concrete/ms13/satchel

/obj/item/storage/ms13/satchel/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 24
	STR.max_combined_w_class = 100

/obj/item/storage/ms13/nuka_bag
	name = "\improper Nuka Cola backpack"
	desc = "A very old pre-war Nuka Cola backpack. A bit of a tight fit, perhaps this wasn't meant for fully grown adults to wear?"
	icon_state = "nuka_bag"

/obj/item/storage/ms13/corvega_bag
	name = "\improper Corvega backpack"
	desc = "A very old pre-war Corvega backpack. A bit of a tight fit, perhaps this wasn't meant for fully grown adults to wear?"
	icon_state = "corvega_bag"

/obj/item/storage/ms13/leather_backpack
	name = "leather backpack"
	desc = "A very simple, somewhat crude leather backpack. Doesn't look pretty, but it gets the job done."
	icon_state = "leather_backpack"

//FACTION BACKPACKS

/obj/item/storage/ms13/ncr
	name = "\improper NCR rucksack"
	desc = "A sturdy pack used by members of the NCR. It looks like it can hold a fair bit while still keeping a low profile."
	icon_state = "ncr_pack"

/obj/item/storage/ms13/bos
	name = "\improper Brotherhood backpack"
	desc = "A dark robust backpack used by the Brotherhood of Steel. Very well made and maintained."
	icon_state = "bos_pack"

/obj/item/storage/ms13/vault
	name = "\improper Vault-tec backpack"
	desc = "A very old pre-war Vault-tec backpack. It's rare to see these in the wastes."
	icon_state = "vault_bag"

//BIGGIE BAGS

/obj/item/storage/ms13/military
	name = "military backpack"
	desc = "A tactical green storage device, made of sturdy materials and has enough pockets to hold anything you would ever need for wasteland combat."
	icon_state = "military"
	component_type = /datum/component/storage/concrete/ms13/biggie_bag

/obj/item/storage/ms13/military/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.max_items = 42
	STR.max_combined_w_class = 100

/obj/item/storage/ms13/military_duffel
	name = "military duffel bag"
	desc = "A bulky duffel bag used by pre-war military forces. You could fit almost anything in this."
	icon_state = "military_duffel"
	drag_slowdown = 2.5
	slowdown = 0.75
	item_flags = SLOWS_WHILE_IN_HAND
	equip_delay_self = 1 SECONDS
	equip_delay_other = 2.25 SECONDS
	component_type = /datum/component/storage/concrete/ms13/big_duffel

/obj/item/storage/ms13/military_duffel/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_HUGE
	STR.max_items = 35
	STR.max_combined_w_class = 100


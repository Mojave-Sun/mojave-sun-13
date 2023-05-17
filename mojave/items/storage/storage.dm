/obj/item/storage/ms13/Initialize()
	. = ..()
	reset_grid_inventory()

// Storage code
/obj/item/storage/firstaid/ms13
	name = "first aid kit"
	desc = "A first aid kit, can be used for easy storage and access of critical medical supplies."
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	icon = 'mojave/icons/objects/medical/medical_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_misc.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "medicalkit"
	component_type = /datum/component/storage/concrete/ms13/firstaid
	grid_height = 64
	grid_width = 64
	ms13_flags_1 = LOCKABLE_1

/obj/item/storage/firstaid/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/medical/medical_inventory.dmi')

/obj/item/storage/firstaid/ms13/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.max_items = 12
	STR.max_combined_w_class = 100
	STR.set_holdable(list(
		/obj/item/reagent_containers/hypospray,
		/obj/item/stack/medical,
		/obj/item/stack/sticky_tape/surgical,
		/obj/item/reagent_containers/blood/ms13
		))

/obj/item/storage/firstaid/ms13/regular

/obj/item/storage/firstaid/ms13/regular/PopulateContents()
	. = ..()
	new /obj/item/stack/medical/gauze/ms13(src)
	new /obj/item/stack/medical/suture/ms13/eight(src)
	new /obj/item/stack/medical/ointment/ms13(src)
	new /obj/item/reagent_containers/hypospray/medipen/ms13/stimpak(src)
	new /obj/item/stack/medical/splint/ms13/wooden(src)
	new /obj/item/stack/medical/splint/ms13/wooden(src)

/obj/item/storage/firstaid/ms13/quality

/obj/item/storage/firstaid/ms13/quality/PopulateContents()
	. = ..()
	new /obj/item/stack/medical/gauze/ms13/military(src)
	new /obj/item/stack/medical/suture/ms13(src)
	new /obj/item/stack/medical/ointment/ms13/dressing(src)
	new /obj/item/reagent_containers/hypospray/medipen/ms13/stimpak/super(src)
	new /obj/item/stack/medical/splint/ms13(src)
	new /obj/item/stack/medical/splint/ms13(src)

/obj/item/storage/firstaid/ms13/bag
	name = "doctors bag"
	desc = "A bag used by doctors to hold medical supplies and tools in. Extremely handy to keep around."
	icon_state = "doctorsbag"
	slot_flags = 0
	component_type = /datum/component/storage/concrete/ms13/d_bag
	grid_height = 64
	grid_width = 96
	ms13_flags_1 = LOCKABLE_1

/obj/item/storage/firstaid/ms13/bag/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 16
	STR.max_combined_w_class = 100
	STR.set_holdable(list(
		/obj/item/stack/medical,
		/obj/item/surgical_drapes,
		/obj/item/bonesetter,
		/obj/item/retractor,
		/obj/item/cautery,
		/obj/item/hemostat,
		/obj/item/scalpel,
		/obj/item/stack/sticky_tape/surgical,
		/obj/item/ms13/handsaw/bone
		))

/obj/item/storage/firstaid/ms13/bag/filled

/obj/item/storage/firstaid/ms13/bag/filled/PopulateContents()
	new /obj/item/scalpel/ms13(src)
	new /obj/item/surgical_drapes/ms13(src)
	new /obj/item/hemostat/ms13(src)
	new /obj/item/cautery/ms13(src)
	new /obj/item/bonesetter/ms13(src)
	new /obj/item/retractor/ms13(src)
	new /obj/item/ms13/handsaw/bone(src)
	new /obj/item/stack/medical/splint/ms13/wooden(src)
	new /obj/item/stack/medical/gauze/ms13/half(src)
	new /obj/item/stack/medical/suture/ms13/four(src)
	new /obj/item/stack/medical/ointment/ms13/half(src)
	new /obj/item/stack/medical/bone_gel/ms13(src)
	new /obj/item/stack/sticky_tape/surgical/ms13(src)

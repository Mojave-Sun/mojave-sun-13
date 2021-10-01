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

/obj/item/storage/firstaid/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/medical/medical_inventory.dmi')

/obj/item/storage/firstaid/ms13/regular

/obj/item/storage/firstaid/ms13/regular/PopulateContents()
	new /obj/item/stack/medical/gauze/ms13(src)
	new /obj/item/stack/medical/suture/ms13(src)
	new /obj/item/stack/medical/ointment/ms13/cream(src)

/obj/item/storage/firstaid/ms13/quality

/obj/item/storage/firstaid/ms13/quality/PopulateContents()
	new /obj/item/stack/medical/gauze/ms13/military(src)
	new /obj/item/stack/medical/suture/ms13(src)
	new /obj/item/stack/medical/ointment/ms13(src)
	new /obj/item/reagent_containers/hypospray/medipen/ms13/stimpak(src)

/obj/item/storage/firstaid/ms13/bag
	name = "doctors bag"
	desc = "A bag used by doctors to hold medical supplies and tools in. Extremely handy to keep around."
	icon_state = "doctorsbag"
	slot_flags = 0

/obj/item/storage/firstaid/ms13/bag/filled

/obj/item/storage/firstaid/ms13/bag/filled/PopulateContents()
	new /obj/item/scalpel(src)
	new /obj/item/surgical_drapes(src)
	new /obj/item/hemostat(src)
	new /obj/item/lighter(src)
	new /obj/item/stack/medical/gauze/ms13/half(src)
	new /obj/item/stack/medical/suture/ms13/four(src)
	new /obj/item/stack/medical/ointment/ms13/cream/half(src)

// Lollipop jar

/obj/item/storage/fancy/lollijar
	name = "lollipop jar"
	desc = "It's full of sugary lollipops, perfect for well-behaved patients in a clinic."
	icon = 'mojave/icons/objects/storage.dmi'
	icon_state = "lollijar"

/obj/item/storage/fancy/lollijar/ComponentInitialize()
    . = ..()
    var/datum/component/storage/STR = GetComponent(/datum/component/storage)
    STR.max_items = 20
    STR.set_holdable(list(/obj/item/reagent_containers/food/snacks/chewable/lollipop/noheal))

/obj/item/storage/fancy/lollijar/PopulateContents()
    SEND_SIGNAL(src, COMSIG_TRY_STORAGE_FILL_TYPE, /obj/item/reagent_containers/food/snacks/chewable/lollipop/noheal)

/obj/item/storage/fancy/lollijar/update_icon_state()
	. = ..()
	if(!contents.len)
		icon_state = "[initial(icon_state)]_empty"
	else
		icon_state = initial(icon_state)

/obj/item/storage/ms13/radiopack
	name = "radiopack"
	desc = "A radio backpack primarily in use by the NCR. The peak of NCR communication, when they feel like using it."
	icon = 'mojave/icons/objects/clothing/clothing_inventory/backpack_inventory.dmi'
	icon_state = "radiopack"
	inhand_icon_state = "radiopack"
	worn_icon = 'mojave/icons/mob/clothing/back.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/equipment/backpack_righthand.dmi'

	component_type = /datum/component/storage/concrete/ms13/rad_pack
	storage_flags = 0
	var/held = 0
	var/obj/item/radio/ms13/ncr/radio

/obj/item/storage/ms13/radiopack/Initialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 16
	STR.max_combined_w_class = 100

/obj/item/storage/ms13/radiopack/PopulateContents()
	. = ..()
	radio = new(src)
	START_PROCESSING(SSobj, src)

/obj/item/storage/ms13/radiopack/Destroy()
	STOP_PROCESSING(SSobj, src)
	QDEL_NULL(radio)
	return ..()

/* Broken ""feature"". Tends to break the radio and/or delete stuff.
/obj/item/storage/ms13/radiopack/AltClick(var/mob/living/carbon/user)
	if(src.loc == user)
		if(!held)
			if(user.get_item_by_slot(ITEM_SLOT_BACK) == src)
				held = 1
				if(!user.put_in_hands(radio))
					held = 0
					to_chat(user, "<span class='warning'>You need a free hand to hold the radio!</span>")
					return
				update_icon()
				user.update_inv_back()
		else
			to_chat(user, "<span class='warning'>You are already holding the radio!</span>")
	else
		..() */

/obj/item/storage/ms13/radiopack/attackby(obj/item/W, mob/user, params)
	if(W == radio)
		user.dropItemToGround(radio, TRUE)
	else
		..()

/obj/item/storage/ms13/radiopack/dropped(mob/user)
	. = ..()
	if(held)
		user.dropItemToGround(radio, TRUE)

/obj/item/storage/ms13/radiopack/MouseDrop(atom/over_object)
	. = ..()
	if(held)
		return
	if(iscarbon(usr))
		var/mob/M = usr

		if(!over_object)
			return

		if(!M.incapacitated())

			if(istype(over_object, /atom/movable/screen/inventory/hand))
				var/atom/movable/screen/inventory/hand/H = over_object
				M.putItemFromInventoryInHandIfPossible(src, H.held_index)

/obj/item/storage/ms13/radiopack/proc/attach_radio(var/mob/user)
	if(!radio)
		radio = new(src)
	radio.forceMove(src)
	held = 0
	if(user)
		to_chat(user, "<span class='notice'>You attach the [radio.name] to the [name].</span>")
	update_icon()
	user.update_inv_back()


/obj/item/radio/ms13/ncr
	name = "walkie-talkie"
	icon = 'mojave/icons/objects/tools/tools_inventory.dmi'
	icon_state = "handradio"
	inhand_icon_state = "handradio"
	desc = "The important bit of the radiopack, this broadcasts and recieves radio messages in high quality with an amplified volume."
	canhear_range = 3
	radio_broadcast = RADIOSTATIC_LIGHT
	static = TRUE
	grid_height = 32
	grid_width = 32
	var/req_radio = TRUE
	var/obj/item/storage/ms13/radiopack/radiopack

/obj/item/radio/ms13/ncr/Initialize()
	if(istype(loc, /obj/item/storage/ms13/radiopack))
		radiopack = loc

	else
		return INITIALIZE_HINT_QDEL

	become_hearing_sensitive()

	return ..()

/obj/item/radio/ms13/ncr/Destroy()
	radiopack = null
	return ..()

/obj/item/radio/ms13/ncr/dropped(mob/user)
	. = ..()
	if(user)
		UnregisterSignal(user, COMSIG_MOVABLE_MOVED)
	if(req_radio)
		snap_back()

/obj/item/radio/ms13/ncr/proc/snap_back()
	if(!radiopack)
		return
	forceMove(radiopack)


/obj/machinery/iv_drip/ms13
	name = "\improper IV drip"
	desc = "An IV drip with an advanced infusion pump that can both drain blood into and inject liquids from attached containers, a must have for these times."
	icon = 'mojave/icons/structure/medical.dmi'
	icon_state = "iv_drip"
	base_icon_state = "iv_drip"
	max_integrity = 150

/obj/machinery/iv_drip/ms13/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap(loc)
	qdel(src)

//Anesthesia stand & tank shenanigans
/obj/machinery/ms13/anesthesia_stand
	name = "anesthesia stand"
	desc = "A stand to hold an anesthetic tank, for use during surgery."
	icon = 'mojave/icons/structure/medical.dmi'
	icon_state = "anesthesia_stand_empty"
	max_integrity = 150
	// The tank that is attached to the stand
	var/obj/item/tank
	// The person we're giving anesthetic to by mask
	var/mob/living/carbon/attached
	// The mask we're using to administer anesthetic
	var/obj/item/clothing/mask/breath/medical/ms13/mask = /obj/item/clothing/mask/breath/medical/ms13
	// Whether the internals are set or not
	var/valve
	
	var/static/list/accepted_tanks = typecacheof(list(
		/obj/item/tank/internals/anesthetic/ms13
	))

/obj/machinery/ms13/anesthesia_stand/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap(loc)
	qdel(src)

/obj/machinery/ms13/anesthesia_stand/update_overlays()
	. = ..()

	. += attached ? "mask_on" : "mask"

/obj/machinery/ms13/anesthesia_stand/MouseDrop(mob/living/target)
	if(!ishuman(usr) || !usr.canUseTopic(src, BE_CLOSE) || !isliving(target))
		return
	if(attached)
		visible_message("\The [usr] lifts the mask off \the [attached], and it falls back around the stand.")
		balloon_alert_to_viewers("\The [usr] lifts the mask off \the [attached].")
		attached = null
		mask.forceMove(mask.stand)
		update_appearance()
		return
	else
		mask_on(target, usr) // WIP


/obj/machinery/ms13/anesthesia_stand/proc/mask_on(mob/living/target, mob/user)
	if(!usr.Adjacent(target))
		return
	loc.visible_message(span_warning("[usr] begins to place the mask over [target]'s face..."), span_warning("You begin to place the mask over [target]'s face..."))
	balloon_alert_to_viewers("[usr] begins placing the mask over [target]'s face...", "You begin to place the mask over [target]'s face...")
	if(do_after(usr, 5 SECONDS, target))
		loc.visible_message(span_warning("[usr] places the mask over [target]'s face."), span_warning("You place the mask over [target]'s face."))
		balloon_alert_to_viewers("[usr] places the mask over [target]'s face.", "You place the mask over [target]'s face.")
		attached = target
		target.equip_to_slot_if_possible(mask, ITEM_SLOT_MASK, 0)
		update_appearance()

/obj/machinery/ms13/anesthesia_stand/attackby(obj/item/W, mob/user, params)
	if(is_type_in_typecache(W, accepted_tanks))
		if(tank)
			to_chat(usr, span_notice("There's already a tank in the stand."))
			return
		if(!user.transferItemToLoc(W, src))
			return
		tank = W
		to_chat(user, span_notice("You attach [W] to [src]."))
		icon_state = "anesthesia_stand"
		update_appearance()
		return
	else
		return
		
/obj/machinery/ms13/anesthesia_stand/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(tank)
		to_chat(usr, span_notice("You take [tank] off [src]."))
		tank.forceMove(drop_location())
		tank = null
		icon_state = "anesthesia_stand_empty"
		update_appearance()

/obj/item/tank/internals/anesthetic/ms13
	name = "anesthetic tank"
	desc = "A tank of N2O/O2, to keep those whining patients quiet!"
	slot_flags = null
	// Used in overriding tanks leaking when damaged
	var/gangshit = TRUE

// Prevents people from shooting anesthetic tanks to leak the contents, hopefully preventing any sort of abuse
/obj/item/tank/internals/anesthetic/ms13/atom_break(damage_flag)
	if(gangshit)
		return
	return ..()

/obj/item/clothing/mask/breath/medical/ms13
	name = "sterile mask"
	desc = "A mask, for medical purposes, probably."
	resistance_flags = INDESTRUCTIBLE
	// The stand the mask came from
	var/obj/machinery/ms13/anesthesia_stand/stand

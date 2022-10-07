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
	var/obj/item/tank
	
	var/static/list/accepted_tanks = typecacheof(list(
		/obj/item/tank/internals/anesthetic/ms13
	))

/obj/machinery/ms13/anesthesia_stand/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap(loc)
	qdel(src)

/obj/machinery/ms13/anesthesia_stand/attackby(/obj/item/W, mob/user, params)
	if(is_type_in_typecache(W, accepted_tanks))
		if(tank)
			to_chat(usr, span_notice("There's already a tank in the stand."))
			return
		if(!user.transferItemToLoc(W, src))
			return
		tank = W
		to_chat(user, span_notice("You attach [W] to [src]."))
		icon_state = "anesthesia_stand_tank"
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

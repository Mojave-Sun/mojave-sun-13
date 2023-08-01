/obj/structure/closet/ms13/wall
	name = "wasteland wall storage"
	desc = "Holds wastelands, while being attatched to a wall, presumably."
	pixel_y = 32
	density = FALSE
	hitted_sound = 'mojave/sound/ms13effects/impact/metal/metal_sheet_2.wav'

/obj/structure/closet/ms13/wall/Initialize()
	. = ..()
	AddElement(/datum/element/wall_mount)

/obj/structure/closet/ms13/wall/firstaid
	name = "emergency aid kit"
	desc = "A first aid kit, mounted to the wall. Commonly used for emergencies before the war."
	icon_state = "firstaid"
	anchored = TRUE
	anchorable = FALSE
	wall_mounted = TRUE
	max_mob_size = MOB_SIZE_TINY
	mob_storage_capacity = 1

/obj/structure/closet/ms13/wall/firstaid/update_icon()
	. = ..()
	layer = ON_EDGED_TURF_LAYER

////Sneaky Storage////

/obj/structure/ms13/storage/vent
	name = "vent"
	desc = "A vent used to move air to and from places."
	icon = 'mojave/icons/structure/storage.dmi'
	icon_state = "vent"
	flags_1 = INDESTRUCTIBLE | ACID_PROOF | FIRE_PROOF
	pixel_y = 24
	density = FALSE
	hitted_sound = 'mojave/sound/ms13effects/impact/metal/metal_sheet_2.wav'

/obj/structure/ms13/storage/vent/Initialize()
	. = ..()
	if(prob(50))
		icon_state = "[initial(icon_state)]-damaged"

/obj/structure/ms13/storage/washingmachine
	name = "washing machine"
	desc = "An old washing machine, before the war this did all the washing for you! But now it washes nothing."
	icon = 'mojave/icons/structure/storage.dmi'
	icon_state = "normwasher"
	flags_1 = ACID_PROOF | FIRE_PROOF
	density = TRUE
	anchored = TRUE
	pixel_y = 12
	var/closed = TRUE

/obj/structure/ms13/storage/washingmachine/CtrlClick(mob/living/user)
	if(closed)
		if(do_after(user, 0.5 SECONDS, interaction_key = DOAFTER_SOURCE_DOORS))
			to_chat(user, span_notice("You open the washing machine."))
			playsound(src, 'mojave/sound/ms13effects/furniture/washer_open.ogg', 50)
			icon_state = "[initial(icon_state)]_open"
			closed = FALSE
	else
		if(do_after(user, 0.5 SECONDS, interaction_key = DOAFTER_SOURCE_DOORS))
			to_chat(user, span_notice("You close the washing machine."))
			playsound(src, 'mojave/sound/ms13effects/furniture/washer_close.ogg', 50)
			icon_state = "[initial(icon_state)]"
			closed = TRUE

/obj/structure/ms13/storage/washingmachine/welder_act_secondary(mob/living/user, obj/item/I)
	if(!I.tool_start_check(user, amount=0))
		return TRUE
	if(I.use_tool(src, user, 30 SECONDS, volume=80))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/ms13/storage/washingmachine/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/rubber(loc, 1)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_alu(loc, 4)
			new /obj/item/stack/sheet/ms13/scrap(loc, 4)
		else
			new /obj/item/stack/sheet/ms13/scrap_alu(loc)
			new /obj/item/stack/sheet/ms13/scrap(loc)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc)
	qdel(src)

/obj/structure/ms13/storage/washingmachine/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/ms13/storage/washingmachine/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>welding tool</b> to take apart [src] for parts.")

/obj/structure/ms13/storage/washingmachine/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_WELDER)
			context[SCREENTIP_CONTEXT_RMB] = "Take apart"
			return CONTEXTUAL_SCREENTIP_SET

/obj/structure/ms13/storage/washingmachine/industrial
	name = "industrial washing machine"
	desc = "A large washing machine, for when you need to wash a lot of clothes! Unfortunately, it's been broken for a long time."
	icon_state = "industwasher"

/obj/structure/ms13/storage/washingmachine/industrial/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/rubber(loc, 1)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_alu(loc, 6)
			new /obj/item/stack/sheet/ms13/scrap(loc, 6)
		else
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc, 1)
			new /obj/item/stack/sheet/ms13/scrap_alu(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap(loc, 2)
	qdel(src)

/obj/structure/ms13/pa_jack
	name = "power armor hoist"
	desc = "A heavy duty hoist used to stabilize and lift the incredibly hefty power armours in order to modify and repair them."
	icon = 'mojave/icons/objects/workbench.dmi'
	icon_state = "station"
	pixel_y = -16
	pixel_x = -16
	anchored = TRUE
	var/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/obj_connected = null

/obj/structure/ms13/pa_jack/examine(mob/user)
	. = ..()
	. += "Alt+left click this to connect to power armor."

/obj/structure/ms13/pa_jack/AltClick(mob/user)
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	if(!obj_connected)
		playsound(src, 'mojave/sound/ms13effects/chain_jostle.ogg', 25, TRUE)
		if(do_after(user, 4 SECONDS, interaction_key = DOAFTER_SOURCE_PAHOIST))
			obj_connected = locate(/obj/item/clothing/suit/space/hardsuit/ms13/power_armor) in loc
			if(istype(obj_connected))
				var/icon/chains = new(icon, "chains")
				add_overlay(chains)
				obj_connected.link_to = src
				to_chat(user, span_notice("You connect the power armor to the [src]!"))
				return TRUE
			obj_connected = null
	else
		playsound(src, 'mojave/sound/ms13effects/chain_jostle.ogg', 25, TRUE)
		if(do_after(user, 4 SECONDS, interaction_key = DOAFTER_SOURCE_PAHOIST))
			cut_overlays()
			obj_connected.link_to = null
			obj_connected = null
			to_chat(user, span_notice("You disconnect the power armor to the [src]!"))
			return TRUE
	return FALSE

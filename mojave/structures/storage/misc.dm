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
	density = TRUE
	anchored = TRUE
	pixel_y = 12
	var/closed = TRUE
	var/working = FALSE
	var/busy = FALSE
	var/datum/looping_sound/ms13/washing_machine/soundloop

/obj/structure/ms13/storage/washingmachine/working
	working = TRUE

/obj/structure/ms13/storage/washingmachine/Initialize(mapload)
	. = ..()
	register_context()
	AddComponent(/datum/component/storage/concrete/ms13/washing)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.max_items = 200
	STR.max_combined_w_class = 200
	soundloop = new(src, FALSE)
	if(working)
		desc = "An old washing machine, before the war this did all the washing for you! Still a has a bit of life in it somehow."

/obj/structure/ms13/storage/washingmachine/examine(mob/user)
	. = ..()
	if(working)
		. += "<span class='notice'>Close the door and right click to wash the item inside. Ctrl-Click to open/close.</span>"

/obj/structure/ms13/storage/washingmachine/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	if(isnull(held_item) && working)
		context[SCREENTIP_CONTEXT_CTRL_LMB] = "Open/Close"
		context[SCREENTIP_CONTEXT_RMB] = "Turn On"
		return CONTEXTUAL_SCREENTIP_SET

/obj/structure/ms13/storage/washingmachine/attackby(obj/item/I, mob/living/user, params)
	if(closed)
		to_chat(user, "<span class='danger'>[src] is closed.</span>")
		return
	else
		. = ..()

/obj/structure/ms13/storage/washingmachine/MouseDrop()
	if(closed && (usr.stat != DEAD))
		to_chat(usr, "<span class='danger'>[src] is closed.</span>")
		return COMPONENT_NO_MOUSEDROP
	else
		return . = ..()

/obj/structure/ms13/storage/washingmachine/attackby_secondary(obj/item/weapon, mob/user, params)
	attackby(weapon, user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/structure/ms13/storage/washingmachine/alt_click_on_secondary(mob/user)
	attack_hand(user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/structure/ms13/storage/washingmachine/AltClick(mob/user)
	attack_hand(user)
	return

/obj/structure/ms13/storage/washingmachine/update_overlays()
	. = ..()
	if(!busy)
		cut_overlays()
	if(busy && dir == SOUTH)
		add_overlay(image(icon, icon_state = "[initial(icon_state)]_on"))

/obj/structure/ms13/storage/washingmachine/CtrlClick(mob/living/user)
	if(user.stat == DEAD)
		return
	if(busy)
		to_chat(user, span_warning("[src] is currently in use."))
		return
	if(closed)
		if(do_after(user, 0.5 SECONDS, interaction_key = DOAFTER_SOURCE_DOORS))
			to_chat(user, span_notice("You open [src]."))
			playsound(src, 'mojave/sound/ms13effects/furniture/washer_open.ogg', 50)
			icon_state = "[initial(icon_state)]_open"
			closed = FALSE
	else
		if(do_after(user, 0.5 SECONDS, interaction_key = DOAFTER_SOURCE_DOORS))
			to_chat(user, span_notice("You close [src]."))
			playsound(src, 'mojave/sound/ms13effects/furniture/washer_close.ogg', 50)
			icon_state = "[initial(icon_state)]"
			closed = TRUE

/obj/structure/ms13/storage/washingmachine/attack_hand_secondary(mob/user, modifiers)
	if(user.stat == DEAD)
		return
	if(!working)
		to_chat(user, span_warning("You press the on button and nothing happens."))
		return SECONDARY_ATTACK_CONTINUE_CHAIN
	if(busy)
		to_chat(user, span_warning("[src] is currently in use."))
		return SECONDARY_ATTACK_CONTINUE_CHAIN
	if(!closed)
		to_chat(user, span_warning("Close the door first!"))
		return SECONDARY_ATTACK_CONTINUE_CHAIN
	busy = TRUE
	to_chat(user, span_notice("You press the on button and [src] kicks to life."))
	update_overlays()
	addtimer(CALLBACK(src, PROC_REF(washed)), 20 SECONDS, TIMER_UNIQUE)
	soundloop.start()
	START_PROCESSING(SSfastprocess, src)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/structure/ms13/storage/washingmachine/proc/washed()
	busy = FALSE
	soundloop.stop()
	update_overlays()
	src.visible_message(span_notice("The [src] finishes its washing cycle."))
	for(var/X in contents)
		var/atom/movable/AM = X
		if(AM.GetComponent(/datum/component/machine_washable))
			var/datum/component/machine_washable/machine_washable = AM.GetComponent(/datum/component/machine_washable)
			machine_washable.washed = TRUE
		AM.wash(CLEAN_WASH)

/obj/structure/ms13/storage/washingmachine/process(delta_time)
	if(!busy)
		animate(src, transform=matrix(), time=2)
		return PROCESS_KILL
	if(prob(50))
		Shake(rand(-1, 1), rand(0, 1), 1)

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

/obj/structure/ms13/storage/washingmachine/Initialize(mapload)
	. = ..()
	if(working)
		desc = "A large washing machine, for when you need to wash a lot of clothes! Still a has a bit of life in it somehow."

/obj/structure/ms13/storage/washingmachine/industrial/working
	working = TRUE

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

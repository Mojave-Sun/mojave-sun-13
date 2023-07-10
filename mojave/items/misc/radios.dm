/obj/item/radio/ms13
	name = "receiver hand radio"
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	icon_state = "handradio"
	inhand_icon_state = "handradio"
	desc = "A basic handheld radio that recieves over a relatively long range, unfortunately this one can't broadcast."
	canhear_range = 2
	force = 0
	freerange = TRUE
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron=75, /datum/material/glass=25)
	radio_broadcast = 100 //Cannot broadcast. If someone manages to circumvent, it should be complete static.
	force_superspace = TRUE // ignore tcoms and zlevelsgrid_height = 64
	grid_width = 32
	var/static = FALSE //used for inventory only radios

/obj/item/radio/ms13/Initialize()
	. = ..()
	if(!static)
		AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/radio/ms13/can_receive(freq, level)
	if(!on)
		return FALSE
	if(!listening)
		return FALSE

	return TRUE //MOHAVE SUN EDIT: Changed this so that it plays only when someone is listening, but otherwhise can recieve, even when not being held.

/obj/item/radio/ms13/broadcast
	name = "broadcast hand radio"
	desc = "A handheld radio that can send as well as recieve signals. The poor quality of broadcasts makes it unpleasent to listen to, and doing so too often is a good way to get lynched."
	radio_broadcast = RADIOSTATIC_HEAVY

/obj/item/radio/ms13/broadcast/advanced
	name = "advanced hand radio"
	desc = "The best a handheld gets, this extremely rare radio can broadcast at reasonably high quality while remaining lightweight and portable."
	radio_broadcast = RADIOSTATIC_MEDIUM

/obj/item/radio/ms13/ham
	name = "ham radio"
	desc = "A basic ham radio, an amateur setup. The sound quality could be better, but it beats listening to brahmin all day. Has a working microphone, though the quality leaves something to be desired."
	icon = 'mojave/icons/objects/hamradio.dmi'
	icon_state = "radio"
	canhear_range = 5
	pixel_y = 5
	anchored = TRUE
	radio_broadcast = RADIOSTATIC_MEDIUM
	max_integrity = 250

/obj/item/radio/ms13/ham/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Use [MODE_TOKEN_INTERCOM] when nearby to speak into it.</span>"
	. += deconstruction_hints(user)

/obj/item/radio/ms13/ham/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>screwdriver</b> to carefully take apart [src] for parts.")

/obj/item/radio/ms13/ham/screwdriver_act_secondary(mob/living/user, obj/item/weapon)
	if(flags_1&NODECONSTRUCT_1)
		return TRUE
	..()
	weapon.play_tool_sound(src)
	if(do_after(user, 30 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/item/radio/ms13/ham/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/scrap(loc, 4)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 3)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc, 4)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc, 3)
			new /obj/item/stack/sheet/ms13/circuits(loc, 2)
			new /obj/item/ms13/component/vacuum_tube(loc)
			new /obj/item/ms13/component/cell(loc)
		else
			new /obj/item/stack/sheet/ms13/scrap/two(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts/two(loc)
			new /obj/item/stack/sheet/ms13/scrap_electronics/two(loc)
	qdel(src)

/obj/item/radio/ms13/ham/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_SCREWDRIVER)
			context[SCREENTIP_CONTEXT_RMB] = "Disassemble"
			return CONTEXTUAL_SCREENTIP_SET

/obj/item/radio/ms13/ham/Initialize(mapload, ndir, building)
	. = ..()
	if(building)
		setDir(ndir)
	var/area/current_area = get_area(src)
	if(!current_area)
		return
	RegisterSignal(current_area, COMSIG_AREA_POWER_CHANGE, .proc/AreaPowerCheck)
	register_context()

/obj/item/radio/ms13/ham/broadcast
	name = "high end broadcasting set"
	desc = "A high end broadcasting set used by professional radio studios. Legend has it that Mr. New Vegas himself uses this model."
	radio_broadcast = RADIOSTATIC_LIGHT
	icon_state = "highradio"

/obj/item/radio/ms13/ham/broadcast/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/scrap(loc, 6)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 6)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc, 6)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc, 5)
			new /obj/item/stack/sheet/ms13/circuits(loc, 5)
			new /obj/item/ms13/component/vacuum_tube(loc, 2)
			new /obj/item/ms13/component/cell(loc, 2)
		else
			new /obj/item/stack/sheet/ms13/scrap(loc, 4)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 4)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc, 4)
			new /obj/item/stack/sheet/ms13/circuits(loc)
	qdel(src)

/obj/item/radio/ms13/ham/receiver
	name = "receiver ham radio"
	desc = "A ham radio without a working microphone or any way to broadcast. Only good for listening in on frequencies. Maybe you could find some good tunes?"
	radio_broadcast = 100 //Cannot broadcast. If someone manages to circumvent, it should be complete static.
	icon_state = "recradio"

/obj/item/radio/ms13/ham/receiver/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/scrap(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc, 3)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc, 2)
			new /obj/item/ms13/component/cell(loc)
		else
			new /obj/item/stack/sheet/ms13/scrap(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc)
	qdel(src)

/obj/item/radio/ms13/ham/receiver/radioking
	name = "\improper Radiation King radio"
	desc = "A classic radio from before the war. A fading logo can barely be seen on the front that reads 'Radiation King'. This one is black."
	icon_state = "radioking_black"

/obj/item/radio/ms13/ham/receiver/radioking/wood
	desc = "A classic radio from before the war. A fading logo can barely be seen on the front that reads 'Radiation King'. This one has a wooden body."
	icon_state = "radioking_wood"

/obj/item/radio/ms13/ham/receiver/radioking/wood/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc, 3)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc, 2)
			new /obj/item/ms13/component/cell(loc)
		else
			new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc)
	qdel(src)

/**
 * Override attack_tk_grab instead of attack_tk because we actually want attack_tk's
 * functionality. What we DON'T want is attack_tk_grab attempting to pick up the
 * intercom as if it was an ordinary item.
 */
/obj/item/radio/ms13/ham/attack_tk_grab(mob/user)
	interact(user)
	return COMPONENT_CANCEL_ATTACK_CHAIN

/obj/item/radio/ms13/ham/attack_ai(mob/user)
	interact(user)

/obj/item/radio/ms13/ham/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	interact(user)

/obj/item/radio/ms13/ham/ui_state(mob/user)
	return GLOB.default_state

/obj/item/radio/ms13/ham/can_receive(freq, list/levels)
	if(!on)
		return FALSE
	if(wires.is_cut(WIRE_RX))
		return FALSE
	if(levels != RADIO_NO_Z_LEVEL_RESTRICTION)
		var/turf/position = get_turf(src)
		if(isnull(position) || !(position.z in levels))
			return FALSE
	if(!listening)
		return FALSE

	return TRUE


/obj/item/radio/ms13/ham/Hear(message, atom/movable/speaker, message_langs, raw_message, radio_freq, list/spans, list/message_mods = list())
	if(message_mods[RADIO_EXTENSION] == MODE_INTERCOM)
		return  // Avoid hearing the same thing twice
	return ..()

/obj/item/radio/ms13/ham/emp_act(severity)
	. = ..() // Parent call here will set `on` to FALSE.
	update_icon()

/obj/item/radio/ms13/ham/end_emp_effect(curremp)
	. = ..()
	AreaPowerCheck() // Make sure the area/local APC is powered first before we actually turn back on.

/obj/item/radio/ms13/ham/update_icon()
	. = ..()
	if(on)
		icon_state = "[initial(icon_state)]-on"
	else
		icon_state = "[initial(icon_state)]-off"

/**
 * Proc called whenever the intercom's area loses or gains power. Responsible for setting the `on` variable and calling `update_icon()`.
 *
 * Normally called after the intercom's area recieves the `COMSIG_AREA_POWER_CHANGE` signal, but it can also be called directly.
 * Arguments:
 * * source - the area that just had a power change.
 */
/obj/item/radio/ms13/ham/proc/AreaPowerCheck(datum/source)
	var/area/current_area = get_area(src)
	if(!current_area)
		on = FALSE
	else
		on = current_area.powered(AREA_USAGE_EQUIP) // set "on" to the equipment power status of our area.
	update_icon()


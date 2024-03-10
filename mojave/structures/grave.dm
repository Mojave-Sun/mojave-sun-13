/// A hole in the ground, use most of closet code
/obj/structure/closet/ms13/grave
	name = "grave"
	desc = "A man-sized hole in the ground, usually used to bury junk, treasures, corpses or your gagged and bound victim."
	icon = 'mojave/icons/structure/grave.dmi'
	icon_state = "grave"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	anchored = TRUE
	density = TRUE
	pass_flags_self = PASSSTRUCTURE | LETPASSTHROW
	projectile_passchance = 90

	/// Set up variables from closet type that we will use
	breakout_time = 2 MINUTES
	allow_objects = TRUE
	mob_storage_capacity = 1 // how many human sized mob/living can fit together inside a closet.

/obj/structure/closet/ms13/grave/closet_update_overlays(list/new_overlays)
	. = new_overlays
	if(opened)
		var/mutable_appearance/door_overlay = mutable_appearance(icon, "[icon_state]_open", alpha = src.alpha)
		. += door_overlay
		// If we don't do this the door doesn't block emissives and it looks weird.
		door_overlay.overlays += emissive_blocker(door_overlay.icon, door_overlay.icon_state, alpha = door_overlay.alpha)

/obj/structure/closet/ms13/grave/examine(mob/user)
	. = ..()
	if(welded)
		. += span_notice("It's welded shut.")
	/* // MOJAVE SUN EDIT BEGIN
	if(anchored)
		. += span_notice("It is <b>bolted</b> to the ground.")
	*/ // MOJAVE SUN EDIT END - No false reports, kids.
	if(opened && cutting_tool == /obj/item/weldingtool)
		. += span_notice("The parts are <b>welded</b> together.")
	else if(secure && !opened)
		. += span_notice("Right-click to [locked ? "unlock" : "lock"].")

	if(HAS_TRAIT(user, TRAIT_SKITTISH) && divable)
		. += span_notice("If you bump into [p_them()] while running, you will jump inside.")

/obj/structure/closet/ms13/grave/proc/can_close(mob/living/user)
	var/turf/T = get_turf(src)
	for(var/mob/living/L in T)
		if(L.anchored || horizontal && L.mob_size > MOB_SIZE_TINY && L.density)
			if(user)
				to_chat(user, span_danger("There is something too large in [src] to be buried."))
			return FALSE
	return TRUE

/obj/structure/closet/ms13/grave/proc/open(mob/living/user, force = FALSE)
	if(!can_open(user, force))
		return
	if(opened)
		return
	if(SEND_SIGNAL(src, COMSIG_CLOSET_PRE_OPEN, user, force) & BLOCK_OPEN)
		return
	welded = FALSE
	locked = FALSE
	playsound(loc, open_sound, open_sound_volume, TRUE, -3)
	opened = TRUE
	if(!dense_when_open)
		set_density(FALSE)
	dump_contents()
	animate_door(FALSE)
	update_appearance()

	after_open(user, force)
	SEND_SIGNAL(src, COMSIG_CLOSET_POST_OPEN, force)
	return TRUE

/obj/structure/closet/ms13/grave/proc/close(mob/living/user)
	if(!opened || !can_close(user))
		return FALSE
	take_contents()
	playsound(loc, close_sound, close_sound_volume, TRUE, -3)
	opened = FALSE
	set_density(TRUE)
	animate_door(TRUE)
	update_appearance()
	after_close(user)
	return TRUE

/obj/structure/closet/ms13/grave/toggle(mob/living/user)
	return FALSE

/obj/structure/closet/ms13/grave/deconstruct(disassembled = TRUE)
	dump_contents()
	qdel(src)

/obj/structure/closet/ms13/grave/proc/tool_interact(obj/item/W, mob/living/user)//returns TRUE if attackBy call shouldn't be continued (because tool was used/closet/ms13/grave was of wrong type), FALSE if otherwise
	// TODO: TOOL_SHOVEL

	. = TRUE
	if(opened)
		if(istype(W, cutting_tool))
			if(W.tool_behaviour == TOOL_WELDER)
				if(!W.tool_start_check(user, amount=0))
					return

				to_chat(user, span_notice("You begin cutting \the [src] apart..."))
				if(W.use_tool(src, user, 40, volume=50))
					if(!opened)
						return
					user.visible_message(span_notice("[user] slices apart \the [src]."),
									span_notice("You cut \the [src] apart with \the [W]."),
									span_hear("You hear welding."))
					deconstruct(TRUE)
				return
			else // for example cardboard box is cut with wirecutters
				user.visible_message(span_notice("[user] cut apart \the [src]."), \
									span_notice("You cut \the [src] apart with \the [W]."))
				deconstruct(TRUE)
				return
		if (user.combat_mode)
			return FALSE
		if(user.transferItemToLoc(W, drop_location())) // so we put in unlit welder too
			return
	else if(W.tool_behaviour == TOOL_WELDER && can_weld_shut)
		if(!W.tool_start_check(user, amount=0))
			return

		to_chat(user, span_notice("You begin [welded ? "unwelding":"welding"] \the [src]..."))
		if(W.use_tool(src, user, 40, volume=50))
			if(opened)
				return
			welded = !welded
			after_weld(welded)
			user.visible_message(span_notice("[user] [welded ? "welds shut" : "unwelded"] \the [src]."),
							span_notice("You [welded ? "weld" : "unwelded"] \the [src] with \the [W]."),
							span_hear("You hear welding."))
			log_game("[key_name(user)] [welded ? "welded":"unwelded"] closet [src] with [W] at [AREACOORD(src)]")
			update_appearance()
	else if (can_install_electronics && istype(W, /obj/item/electronics/airlock)\
			&& !secure && !electronics && !locked && (welded || !can_weld_shut) && !broken)
		user.visible_message(span_notice("[user] installs the electronics into the [src]."),\
			span_notice("You start to install electronics into the [src]..."))
		if (!do_after(user, 4 SECONDS, target = src))
			return FALSE
		if (electronics || secure)
			return FALSE
		if (!user.transferItemToLoc(W, src))
			return FALSE
		W.moveToNullspace()
		to_chat(user, span_notice("You install the electronics."))
		electronics = W
		if (electronics.one_access)
			req_one_access = electronics.accesses
		else
			req_access = electronics.accesses
		secure = TRUE
		update_appearance()
	else if (can_install_electronics && W.tool_behaviour == TOOL_SCREWDRIVER\
			&& (secure || electronics) && !locked && (welded || !can_weld_shut))
		user.visible_message(span_notice("[user] begins to remove the electronics from the [src]."),\
			span_notice("You begin to remove the electronics from the [src]..."))
		var/had_electronics = !!electronics
		var/was_secure = secure
		if (!do_after(user, 4 SECONDS, target = src))
			return FALSE
		if ((had_electronics && !electronics) || (was_secure && !secure))
			return FALSE
		var/obj/item/electronics/airlock/electronics_ref
		if (!electronics)
			electronics_ref = new /obj/item/electronics/airlock(loc)
			gen_access()
			if (req_one_access.len)
				electronics_ref.one_access = 1
				electronics_ref.accesses = req_one_access
			else
				electronics_ref.accesses = req_access
		else
			electronics_ref = electronics
			electronics = null
			electronics_ref.forceMove(drop_location())
		secure = FALSE
		update_appearance()
	else if(!user.combat_mode)
		var/item_is_id = W.GetID()
		if(!item_is_id)
			return FALSE
		if(item_is_id || !toggle(user))
			togglelock(user)
	else
		return FALSE

/obj/structure/closet/ms13/grave/wrench_act_secondary(mob/living/user, obj/item/tool)
	return TRUE

/obj/structure/closet/ms13/grave/MouseDrop_T(atom/movable/O, mob/living/user)
	if(!istype(O) || O.anchored || istype(O, /atom/movable/screen))
		return
	if(!istype(user) || user.incapacitated() || user.body_position == LYING_DOWN)
		return
	if(!Adjacent(user) || !user.Adjacent(O))
		return
	if(user == O) //try to climb onto it
		return ..()
	if(!opened)
		return
	if(!isturf(O.loc))
		return

	var/actuallyismob = 0
	if(isliving(O))
		actuallyismob = 1
	else if(!isitem(O))
		return
	var/turf/T = get_turf(src)
	var/list/targets = list(O, src)
	add_fingerprint(user)
	user.visible_message(span_warning("[user] [actuallyismob ? "tries to ":""]stuff [O] into [src]."), \
		span_warning("You [actuallyismob ? "try to ":""]stuff [O] into [src]."), \
		span_hear("You hear clanging."))
	if(actuallyismob)
		if(do_after_mob(user, targets, 40))
			user.visible_message(span_notice("[user] stuffs [O] into [src]."), \
				span_notice("You stuff [O] into [src]."), \
				span_hear("You hear a loud metal bang."))
			var/mob/living/L = O
			if(!issilicon(L))
				L.Paralyze(40)
			if(istype(src, /obj/structure/closet/ms13/grave/supplypod/extractionpod))
				O.forceMove(src)
			else
				O.forceMove(T)
				close()
	else
		O.forceMove(T)
	return 1

/// Disabled Toggle Open (will not show to anyone)
/obj/structure/closet/ms13/grave/verb/verb_toggleopen()
	set src in list()
	set category = "Object"
	set name = "Toggle Open"

/obj/structure/closet/ms13/grave/container_resist_act(mob/living/user)
	if(isstructure(loc))
		relay_container_resist_act(user, loc)
	if(opened)
		return
	if(ismovable(loc))
		user.changeNext_move(CLICK_CD_BREAKOUT)
		user.last_special = world.time + CLICK_CD_BREAKOUT
		var/atom/movable/AM = loc
		AM.relay_container_resist_act(user, src)
		return
	if(!welded && !locked)
		open()
		return

	//okay, so the closet is either welded or locked... resist!!!
	user.changeNext_move(CLICK_CD_BREAKOUT)
	user.last_special = world.time + CLICK_CD_BREAKOUT
	user.visible_message(span_warning("[src] begins to shake violently!"), \
		span_notice("You lean on the back of [src] and start pushing the door open... (this will take about [DisplayTimeText(breakout_time)].)"), \
		span_hear("You hear banging from [src]."))
	if(do_after(user,(breakout_time), target = src))
		if(!user || user.stat != CONSCIOUS || user.loc != src || opened || (!locked && !welded) )
			return
		//we check after a while whether there is a point of resisting anymore and whether the user is capable of resisting
		user.visible_message(span_danger("[user] successfully broke out of [src]!"),
							span_notice("You successfully break out of [src]!"))
		bust_open()
	else
		if(user.loc == src) //so we don't get the message if we resisted multiple times and succeeded.
			to_chat(user, span_warning("You fail to break out of [src]!"))

////////////// TOMBSTONES /////////////////

/// Generic tombstone structure, not to be placed
/obj/structure/ms13/tombstone
	name = "generic tombstone"
	desc = "A generic tombstone."
	icon = 'mojave/icons/structure/grave.dmi'
	icon_state = "cairn"
	max_integrity = 100
	anchored = TRUE
	density = TRUE
	projectile_passchance = 75

/// A pile of rocks, cannot be engraved
/obj/structure/ms13/tombstone/cairn
	name = "cairn"
	desc = "A human-made pile of stones raised as a burial mound."
	icon_state = "cairn"

/obj/structure/ms13/tombstone/cairn/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/ceramic(loc, 1)
	qdel(src)

/// Generic slab structure, not to be placed, can be engraved with a message
/obj/structure/ms13/tombstone/slab/
	/// Custom inscription on the slab
	var/inscription

/obj/structure/ms13/tombstone/slab/examine(mob/user)
	. = ..()
	if(inscription)
		if(!in_range(user, src) && !issilicon(user) && !isobserver(user))
			. += span_warning("You are too far away to properly read the inscription on [src]!")
		else
			. += span_notice("The inscription reads:")
			. += inscription

/obj/structure/ms13/tombstone/slab/Initialize()
	. = ..()
	register_context()

/// You can engrave a message using a knife-type item
/obj/structure/ms13/tombstone/slab/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_KNIFE)
			context[SCREENTIP_CONTEXT_LMB] = "Engrave message"
			return CONTEXTUAL_SCREENTIP_SET

/obj/structure/ms13/tombstone/slab/attackby(obj/item/W, mob/user, params)
	if(!user.combat_mode && W.tool_behaviour == TOOL_KNIFE)
		var/input = tgui_input_text(user, "What do you want to engrave?", "Inscription", max_length = 200, multiline = TRUE)
		if(user.canUseTopic(src, BE_CLOSE) && input)
			user.visible_message(span_notice("[user] starts carving [src]."), span_notice("You start carving [src]."))
			if(do_after(user, 15 SECONDS * W.toolspeed, target = src))
				user.visible_message(span_notice("[user] carved an inscription on [src]."), span_notice("You carved an inscription on [src]."))
				inscription = input
	else
		. = ..()

/// Wooden cross, can be engraved
/obj/structure/ms13/tombstone/slab/cross
	name = "wooden cross"
	desc = "A wooden cross haphazardly built with planks held together by rusted nails."
	icon_state = "cross"
	var/style  // Visual style of the cross

/obj/structure/ms13/tombstone/slab/cross/Initialize()
	. = ..()
	style = rand(0, 3)
	icon_state = "[icon_state]_[style]"
	register_context()

/obj/structure/ms13/tombstone/slab/cross/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	if (isnull(held_item))
		context[SCREENTIP_CONTEXT_RMB] = "Rotate"
		return CONTEXTUAL_SCREENTIP_SET

/obj/structure/ms13/tombstone/slab/cross/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return

	. = SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

	// Rotate the cross
	style = (style + 1) % 4
	icon_state = "[icon_state]_[style]"

/obj/structure/ms13/tombstone/slab/cross/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc, 2)
	qdel(src)

/// Wooden slab, can be engraved
/obj/structure/ms13/tombstone/slab/plank
	name = "wooden slab"
	desc = "A crude wooden slab marking a burial site."
	icon_state = "plank"

/obj/structure/ms13/tombstone/slab/plank/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc)
	qdel(src)

/// Stone slab, can be engraved
/obj/structure/ms13/tombstone/slab/stone
	name = "tombstone"
	desc = "A stone slab, often placed over a grave as a memorial."
	icon_state = "tombstone"

/obj/structure/ms13/tombstone/slab/stone/Initialize()
	. = ..()
	icon_state = "[icon_state]_[rand(0, 2)]"

/obj/structure/ms13/tombstone/slab/stone/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/ceramic(loc, 1)
	qdel(src)

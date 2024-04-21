/// A hole in the ground, use most of closet code
/obj/structure/closet/ms13/grave
	name = "grave"
	desc = "A man-sized hole in the ground, usually used to bury junk, treasures, corpses or your gagged and bound victim."
	icon = 'mojave/icons/structure/grave.dmi'
	icon_state = "grave"
	plane = FLOOR_PLANE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	anchored = TRUE
	density = FALSE
	pass_flags_self = PASSSTRUCTURE | LETPASSTHROW
	projectile_passchance = 90

	// Color of the soil
	var/soil_type = "light"
	/// Dirt level for icon purpose
	var/dirt_level = 0
	/// Level for which the grave is fully dug
	var/dug_level = 4
	/// Maximum dirt_level
	var/max_level = 9

	/// Set up variables from closet type that we will use
	breakout_time = 1 MINUTES
	allow_objects = TRUE
	enable_door_overlay = FALSE
	horizontal = TRUE // if there is a human in the grave, it has to be resting to be buried
	mob_storage_capacity = 1 // how many human sized mob/living can fit together inside a closet.

/obj/structure/closet/ms13/grave/Initialize()
	. = ..()
	register_context()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = .proc/on_entered,
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/// Triggered when an atom gets on top of the grave
/obj/structure/closet/ms13/grave/proc/on_entered(datum/source, atom/movable/AM, atom/old_loc)
	SIGNAL_HANDLER

	if((abs(dirt_level - dug_level) > 2) || !isturf(loc) || (AM.movement_type & FLYING) || !isliving(AM) || old_loc == src)
		return

	var/mob/living/victim = AM

	// Inspired by /mob/living/proc/ZImpactDamage
	victim.visible_message(span_danger("[victim] falls into [src] with a sickening noise!"), \
					       span_userdanger("You fall into [src] with a sickening noise!"))
	victim.adjustBruteLoss(30) // Ouch
	if(istype(src, /mob/living/carbon/human))
		var/mob/living/carbon/human/human_yeetus = src
		var/obj/item/bodypart/limb = pick(human_yeetus.bodyparts)
		var/type_wound = pick(list(/datum/wound/blunt/moderate, /datum/wound/blunt/severe))
		limb.force_wound_upwards(type_wound)
		playsound(src, 'mojave/sound/ms13effects/body_fall.ogg', 75, TRUE)
	victim.Knockdown(3 SECONDS)

/obj/structure/closet/ms13/grave/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_SHOVEL)
			context[SCREENTIP_CONTEXT_LMB] = "Dig"
			context[SCREENTIP_CONTEXT_RMB] = "Fill"
			return CONTEXTUAL_SCREENTIP_SET

/obj/structure/closet/ms13/grave/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)]_[soil_type]_[dirt_level]"

/obj/structure/closet/ms13/grave/examine(mob/user)
	. = ..()
	if(length(contents))
		. += span_notice("There is something buried here!")

/obj/structure/closet/ms13/grave/can_close(mob/living/user)
	var/turf/T = get_turf(src)
	for(var/mob/living/L in T)
		if(L.anchored || horizontal && L.mob_size > MOB_SIZE_TINY && L.density)
			if(user)
				to_chat(user, span_danger("There is something too large in [src] to be buried."))
			return FALSE
	return TRUE

/obj/structure/closet/ms13/grave/open(mob/living/user, force = FALSE)
	if(opened)
		return
	opened = TRUE
	dirt_level = dug_level  // In case it is bust open directly from a filled state
	dump_contents()
	update_appearance()
	after_open(user, force)
	SEND_SIGNAL(src, COMSIG_CLOSET_POST_OPEN, force)
	return TRUE

/obj/structure/closet/ms13/grave/insert(atom/movable/inserted, mapload = FALSE)
	. = ..()
	if(. && isliving(inserted))
		ADD_TRAIT(inserted, TRAIT_MAGIC_CHOKE, STATUS_EFFECT_TRAIT)
		var/mob/living/living_target = inserted
		living_target.RegisterSignal(living_target, COMSIG_MOB_SAY, TYPE_PROC_REF(/mob/living, handle_buried_speech))
		to_chat(living_target, span_danger("You have trouble breathing under the weight of the dirt!"))

/obj/structure/closet/ms13/grave/dump_contents()
	var/atom/L = drop_location()
	for(var/atom/movable/AM in src)
		AM.forceMove(L)
		if(isliving(AM))
			REMOVE_TRAIT(AM, TRAIT_MAGIC_CHOKE, STATUS_EFFECT_TRAIT)
			var/mob/living/living_target = AM
			living_target.UnregisterSignal(living_target, COMSIG_MOB_SAY)
	. = ..()

/obj/structure/closet/ms13/grave/close(mob/living/user)
	if(!opened || !can_close(user))
		return FALSE
	take_contents()
	opened = FALSE
	update_appearance()
	after_close(user)
	return TRUE

/obj/structure/closet/ms13/grave/toggle(mob/living/user)
	return FALSE

/obj/structure/closet/ms13/grave/deconstruct(disassembled = TRUE)
	dump_contents()
	qdel(src)

// Like /obj/structure/closet/attackby but we pass params to tool_interact
/obj/structure/closet/ms13/grave/attackby(obj/item/W, mob/user, params)
	if(user in src)
		return
	if(src.tool_interact(W, user, params))
		return 1 // No afterattack
	else
		return ..()

/// Returns TRUE if attackBy call shouldn't be continued (because shovel was used), FALSE otherwise
/obj/structure/closet/ms13/grave/tool_interact(obj/item/W, mob/living/user, params)

	. = TRUE
	if(IS_DEAD_OR_INCAP(user) || user.resting || get_turf(user) == loc)
		// Cannot dig if incapacitated or on the grave turf
		return
	if(W.tool_behaviour == TOOL_SHOVEL)
		if(dirt_level == dug_level)
			to_chat(user, span_notice("[src] is already completely dug out."))
		else
			to_chat(user, span_notice("You start digging with \the [W]."))
			if(do_after(user, 4 SECONDS * W.toolspeed, target = src))
				user.visible_message(span_notice("[user] removes some soil with \the [W] and set it aside."),
											span_notice("You remove some soil with \the [W] and set it aside."),
											span_hear("You hear soil crumbling."))
				// Digging toward "dug_level"
				dirt_level += (dirt_level < dug_level) ? 1 : -1
				if(dirt_level == dug_level)
					open(user) // update_appearance already in open()
				else
					update_appearance()
		return
	if(opened && !(W.item_flags & ABSTRACT))
		if(user.transferItemToLoc(W, drop_location(), silent = FALSE))
			var/list/modifiers = params2list(params)
			//Center the icon where the user clicked.
			if(!LAZYACCESS(modifiers, ICON_X) || !LAZYACCESS(modifiers, ICON_Y))
				return
			// Clamp it so that the icon is properly placed in the grave
			W.pixel_x = clamp(text2num(LAZYACCESS(modifiers, ICON_X)) - 16, -(world.icon_size/2), world.icon_size/2)
			W.pixel_y = clamp(text2num(LAZYACCESS(modifiers, ICON_Y)) - 16, -(world.icon_size/2), world.icon_size/2)
			return
	else
		to_chat(user, span_notice("[src] needs to be fully dug before burying items."))

/obj/structure/closet/ms13/grave/shovel_act_secondary(mob/living/user, obj/item/tool)
	. = TRUE
	if(IS_DEAD_OR_INCAP(user) || user.resting || get_turf(user) == loc)
		// Cannot dig if incapacitated or on the grave turf
		return
	if(tool.tool_behaviour == TOOL_SHOVEL)
		if(dirt_level == 0)
			to_chat(user, span_notice("You start leveling the ground with \the [tool]."))
			if(do_after(user, 3 SECONDS * tool.toolspeed, target = src))
				user.visible_message(span_notice("[user] levels the ground with \the [tool]."),
											span_notice("You level the ground with \the [tool]."))
				deconstruct(TRUE)
				return
		else if(dirt_level == max_level)
			to_chat(user, span_notice("The grave is already completely filled."))
		else
			if(dirt_level == dug_level && !can_close(user))
				return  // Stop here if there is something in the way
			to_chat(user, span_notice("You start filling [src] with \the [tool]."))
			if(do_after(user, 3 SECONDS * tool.toolspeed, target = src))
				user.visible_message(span_notice("[user] fills [src] with some soil using \the [tool]."),
											span_notice("You fill [src] with some soil using \the [tool]."),
											span_hear("You hear soil crumbling."))
				if(dirt_level == dug_level)
					if(!close(user))
						return  // Stop here if there is something in the way
				// Empty grave between 0 - dug_level
				// Filled grave between dug_level - max_level
				dirt_level += length(contents) ? 1 : -1
				update_appearance()

// Test item dropping

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

	var/actuallyismob = FALSE
	if(isliving(O))
		actuallyismob = TRUE
	else if(!isitem(O))
		return
	var/turf/T = get_turf(src)
	var/list/targets = list(O, src)
	add_fingerprint(user)
	user.visible_message(span_warning("[user] [actuallyismob ? "tries to ":""]stuff [O] into [src]."), \
		span_warning("You [actuallyismob ? "try to ":""]stuff [O] into [src]."), \
		span_hear("You hear dirt crumbling."))
	if(actuallyismob)
		if(do_after_mob(user, targets, 40))
			user.visible_message(span_notice("[user] stuffs [O] into [src]."), \
				span_notice("You stuff [O] into [src]."), \
				span_hear("You hear dirt crumbling."))
			var/mob/living/L = O
			if(!issilicon(L))
				L.Paralyze(40)
			O.forceMove(T)
	else
		O.forceMove(T)
	return TRUE

/// Disabled Toggle Open (will not show to anyone)
/obj/structure/closet/ms13/grave/verb_toggleopen()
	return

/obj/structure/closet/ms13/grave/container_resist_act(mob/living/user)
	if(isstructure(loc))
		relay_container_resist_act(user, loc)
	if(opened)
		return

	if(abs(dirt_level - dug_level) > 2)
		to_chat(user, span_warning("You struggle in vain under the weight of the soil above you!"))
	else
		// You can try to get out if there is not too much soil on you
		user.changeNext_move(CLICK_CD_BREAKOUT)
		user.last_special = world.time + CLICK_CD_BREAKOUT
		user.visible_message(span_warning("The soil of [src] begins to rumble!"), \
			span_notice("You struggle and start digging your way out upwards... (this will take about [DisplayTimeText(abs(dirt_level - dug_level) * breakout_time)].)"), \
			span_hear("You hear soil rumbling."))
		if(do_after(user,(abs(dirt_level - dug_level) * breakout_time), target = src))
			// Checking after a while whether there is a point of resisting anymore and whether the user is capable of resisting
			if(!user || user.stat != CONSCIOUS || user.loc != src || opened)
				return
			user.visible_message(span_danger("[user] successfully break out of [src]!"),
								span_notice("You successfully break out of [src]!"))
			bust_open()
		else
			if(user.loc == src) // so we do not get the message if we resisted multiple times and succeeded.
				to_chat(user, span_warning("You fail to dig your way out of [src]!"))

// TODO Use signal for falling into grave

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
	desc = "A pile of stones raised as a burial mound."
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

/obj/structure/ms13/tombstone/slab/attackby(obj/item/W, mob/living/user, params)
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
	icon_state = "[initial(icon_state)][style]"
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
	icon_state = "[initial(icon_state)][style]"

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
	icon_state = "[icon_state][rand(0, 2)]"

/obj/structure/ms13/tombstone/slab/stone/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/ceramic(loc, 1)
	qdel(src)

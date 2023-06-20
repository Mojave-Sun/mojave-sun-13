/obj/machinery/power/ms13/streetlamp
	name = "\improper street lamp"
	desc = "A pre-war street lamp, what more is there to say?"
	icon = 'mojave/icons/structure/streetpoles.dmi'
	icon_state = "streetlight"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE
	max_integrity = 2000
	pixel_x = -32
	pixel_y = 8
	resistance_flags = INDESTRUCTIBLE

/obj/machinery/power/ms13/streetlamp/Initialize()
	. = ..()
	//AddComponent(/datum/component/largetransparency, 1, 1, 1, 1) // Busted right now. After the first time it turns the icon transparent, the entire icon's dimensions block mouse clicks.

/obj/machinery/power/ms13/streetlamp/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(locate(/obj/machinery/power/ms13/streetlamp) in get_turf(mover))
		return TRUE
	else if(istype(mover, /obj/projectile))
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob(75)) // These things are pretty thin
			return TRUE
		return FALSE

/obj/machinery/power/ms13/streetlamp
	name = "\improper street lamp"
	desc = "A pre-war street lamp, what more is there to say?"
	icon_state = "streetlight"

/obj/machinery/power/ms13/streetlamp/corner
	name = "\improper street lamp"
	desc = "A pre-war street lamp, what more is there to say?"
	icon_state = "streetlightcorner"

/obj/machinery/power/ms13/streetlamp/double
	name = "\improper street lamp"
	desc = "A pre-war street lamp, what more is there to say?"
	icon_state = "streetlightduo"

/obj/machinery/power/ms13/trafficlight
	name = "\improper traffic light"
	desc = "A relic of a more civilized time, where people for some reason weren't alright with plowing over a family while going ninety down a road."
	icon = 'mojave/icons/structure/streetpoles.dmi'
	anchored = TRUE
	max_integrity = 2000
	pixel_x = -32
	icon_state = "trafficlightright"
	resistance_flags = INDESTRUCTIBLE

/obj/machinery/power/ms13/trafficlight/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(locate(/obj/machinery/power/ms13/trafficlight) in get_turf(mover))
		return TRUE
	else if(istype(mover, /obj/projectile))
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob(75)) // These things are pretty thin
			return TRUE
		return FALSE

/obj/machinery/power/ms13/trafficlight/alt
	icon_state = "trafficlightleft"

// Street Signs //

/obj/structure/ms13/street_sign
	name = "\improper street sign"
	desc = "can we get one that says something absurd that is DEFINITELY the name of a town for real?"
	icon = 'mojave/icons/structure/street_signs.dmi'
	anchored = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
	max_integrity = 500 // Hardy but not immortal
	projectile_passchance = 95

/obj/structure/ms13/street_sign/Initialize()
	. = ..()
	//AddComponent(/datum/component/largetransparency, 1, 1, 1, 1) // Busted right now. After the first time it turns the icon transparent, the entire icon's dimensions block mouse clicks.
	register_context()

/obj/structure/ms13/street_sign/welder_act_secondary(mob/living/user, obj/item/I)
	if(!I.tool_start_check(user, amount=0))
		return TRUE
	if(I.use_tool(src, user, 15 SECONDS, volume=80))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/ms13/street_sign/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 3)
			new /obj/item/stack/sheet/ms13/scrap_alu(loc, 4)
			new /obj/item/stack/sheet/ms13/scrap(loc, 4)
		else
			new /obj/item/stack/sheet/ms13/scrap_alu(loc)
			new /obj/item/stack/sheet/ms13/scrap(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
	qdel(src)

/obj/structure/ms13/street_sign/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/ms13/street_sign/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>welding tool</b> to take apart [src] for parts.")

/obj/structure/ms13/street_sign/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_WELDER)
			context[SCREENTIP_CONTEXT_RMB] = "Take apart"
			return CONTEXTUAL_SCREENTIP_SET

/obj/structure/ms13/street_sign/interstate // uh oh
	name = "\improper interstate sign"
	desc = "A pre-war interstate sign. You can get your very rough bearings on where you are from these, allegedly."
	icon_state = "interstate"

/* Probably leave this out at LEAST... This is a lore NIGHTMARE.
/obj/structure/ms13/street_sign/exit
	desc = "A pre-war sign. It's showing you where to get off!"
	icon_state = "exit" */

/obj/structure/ms13/street_sign/stop
	desc = "A pre-war stop sign, for what purpose this exists- You can't imagine."
	icon_state = "stop"

/obj/structure/ms13/street_sign/turning
	desc = "A pre-war stop sign. This one is trying to boss you around... You should inform it of the lawless nature of these lands."
	icon_state = "noturn"

/obj/structure/ms13/street_sign/parking
	desc = "A pre-war sign. No parking allowed."
	icon_state = "noparking"

/obj/structure/ms13/street_sign/street
	desc = "A pre-war street sign. As common as they are, sometimes people still get lost."
	icon_state = "street"

/obj/structure/ms13/street_sign/one_way
	desc = "A pre-war sign. Apparently you can only go one direction..."
	icon_state = "direction"

/obj/structure/ms13/street_sign/bus
	desc = "A pre-war bus sign. If you had to guess, you used to have to wait for a bus here. Now you have to find one yourself if you want scrap.atom"
	icon_state = "busstop"

/obj/structure/ms13/street_sign/railroad
	desc = "A pre-war sign. This one is a big white X. Wonder what that entails?"
	icon_state = "railcrossing"

/obj/structure/ms13/street_sign/only_direction
	desc = "A pre-war sign. It's telling you to only go this way."
	icon_state = "onlydir"

/obj/structure/ms13/street_sign/speed
	desc = "A pre-war sign. Always trying to slow you down."
	icon_state = "speed"

/obj/structure/ms13/street_sign/warnings
	desc = "A pre-war sign. You think it's trying to warn you of something."
	icon_state = "warnings"

/obj/structure/ms13/street_sign/turn
	desc = "A pre-war sign. It's pointing a direction with arrows on it. Cool."
	icon_state = "turn"

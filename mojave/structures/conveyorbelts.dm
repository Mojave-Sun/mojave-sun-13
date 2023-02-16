// Non-working, decorative conveyor belts.
// Gray conveyors
/obj/structure/table/ms13/conveyor_belt
	name = "conveyor belt"
	desc = "This used to transport all manners of goods, now it's broken."
	icon = 'mojave/icons/structure/conveyorbelts.dmi'
	icon_state = "gray_straight"
	anchored = TRUE
	density = TRUE
	smoothing_flags = NONE
	canSmoothWith = null

/obj/structure/table/ms13/conveyor_belt/wrench_act_secondary(mob/living/user, obj/item/weapon)
	if(flags_1&NODECONSTRUCT_1)
		return TRUE
	..()
	weapon.play_tool_sound(src)
	if(do_after(user, 15 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/table/ms13/conveyor_belt/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/table/ms13/conveyor_belt/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>wrench</b> to take apart [src] for parts.")

/obj/structure/table/ms13/conveyor_belt/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_WRENCH)
			context[SCREENTIP_CONTEXT_RMB] = "Disassemble"
			return CONTEXTUAL_SCREENTIP_SET

/obj/structure/table/ms13/conveyor_belt/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 3)
			new /obj/item/stack/sheet/ms13/rubber(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_alu(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap(loc, 4)
		else
			new /obj/item/stack/sheet/ms13/scrap_alu(loc)
			new /obj/item/stack/sheet/ms13/rubber(loc)
			new /obj/item/stack/sheet/ms13/scrap(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
	qdel(src)

/obj/structure/table/ms13/conveyor_belt/corners
	icon_state = "gray_corner"

/obj/structure/table/ms13/conveyor_belt/three_way
	icon_state = "gray_three_way"

/obj/structure/table/ms13/conveyor_belt/crossroad
	icon_state = "gray_cross"

// Blue conveyors
/obj/structure/table/ms13/conveyor_belt/blue
	icon_state = "blue_straight"

/obj/structure/table/ms13/conveyor_belt/blue/corners
	icon_state = "blue_corner"

/obj/structure/table/ms13/conveyor_belt/blue/three_way
	icon_state = "blue_three_way"

/obj/structure/table/ms13/conveyor_belt/blue/crossroad
	icon_state = "blue_cross"

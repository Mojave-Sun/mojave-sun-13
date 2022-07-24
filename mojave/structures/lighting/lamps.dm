// Lamps!

/obj/structure/ms13/lamp
    name = "table lamp"
    desc = "An old prewar table lamp. The fission battery inside still has juice, and it's in good condition."
    icon = 'mojave/icons/structure/lamps.dmi'
    icon_state = "tablelamp"
    light_range = 4.5
    light_power = 0
    max_integrity = 125
    var/on = FALSE

/obj/structure/ms13/lamp/Initialize()
	. = ..()
	register_context()

/obj/structure/ms13/lamp/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/ms13/lamp/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>screwdriver</b> to take apart [src] for parts.")

/obj/structure/ms13/lamp/screwdriver_act_secondary(mob/living/user, obj/item/weapon)
	if(flags_1&NODECONSTRUCT_1)
		return TRUE
	..()
	weapon.play_tool_sound(src)
	if(do_after(user, 12 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/ms13/lamp/attack_hand(mob/living/user, list/modifiers)
    if(!on)
        to_chat(user, span_notice("You switch the lamp on."))
        playsound(user, 'mojave/sound/ms13effects/buttonpush.ogg', 20)
        set_light(4.5, 1)
        on = TRUE
        icon_state = "tablelamp_on"
        return
    else
        to_chat(user, span_notice("You switch the lamp off."))
        playsound(user, 'mojave/sound/ms13effects/buttonpush.ogg', 20)
        set_light(4.5, 0)
        on = FALSE
        icon_state = "tablelamp"
        return

/obj/structure/ms13/lamp/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/scrap(loc, 3)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc, 2)
			new /obj/item/ms13/component/cell(loc)
			new /obj/item/light/ms13/bulb(loc)
		else
			new /obj/item/stack/sheet/ms13/scrap(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc)
			new /obj/item/stack/sheet/ms13/glass(loc)
	qdel(src)

/obj/structure/ms13/lamp/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_SCREWDRIVER)
			context[SCREENTIP_CONTEXT_RMB] = "Disassemble"
			return CONTEXTUAL_SCREENTIP_SET

/obj/structure/ms13/lamp/on
    on = TRUE
    icon_state = "tablelamp_on"
    light_range = 4.5
    light_power = 1


/obj/structure/ms13/lamp/makeshift
    name = "makeshift lamp"
    desc = "A makeshift lamp fashioned from a battery, a light bulb and some wires. Primitive, but functional."
    icon_state = "handmadelamp"
    density = FALSE
    anchored = TRUE
    layer = BELOW_MOB_LAYER
    light_range = 3.5
    light_power = 0
    max_integrity = 90
    on = FALSE

/obj/structure/ms13/lamp/makeshift/screwdriver_act_secondary(mob/living/user, obj/item/weapon)
	if(flags_1&NODECONSTRUCT_1)
		return TRUE
	..()
	weapon.play_tool_sound(src)
	if(do_after(user, 7.5 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/ms13/lamp/makeshift/attack_hand(mob/living/user, list/modifiers)
    if(!on)
        to_chat(user, span_notice("You hook the battery to the light, turning it on."))
        playsound(user, 'mojave/sound/ms13effects/lightson.ogg', 30)
        set_light(3.5, 0.8)
        on = TRUE
        icon_state = "handmadelamp_on"
        return
    else
        to_chat(user, span_notice("You disconnect the light from the battery, turning it off."))
        set_light(3.5, 0)
        on = FALSE
        icon_state = "handmadelamp"
        return

/obj/structure/ms13/lamp/makeshift/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/scrap_lead(loc, 3)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc, 3)
			new /obj/item/light/ms13/bulb(loc)
		else
			new /obj/item/stack/sheet/ms13/scrap_lead(loc)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc)
			new /obj/item/stack/sheet/ms13/glass(loc)
	qdel(src)

/obj/structure/ms13/lamp/makeshift/on
    icon_state = "handmadelamp_on"
    light_range = 3.5
    light_power = 0.8
    on = TRUE

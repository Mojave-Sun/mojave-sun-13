// Different fluff items to make the world feel more full

/obj/item/ms13/fluff
    name = "fluff"
    desc = "you're not supposed to be seeing this"
    icon = 'mojave/icons/objects/clutter/clutter_world.dmi'
    grid_height = 32
    grid_width = 32

/obj/item/ms13/fluff/ruined_book
    name = "ruined book"
    desc = "A book that's been rendered unreadable from decades of decay."
    icon_state = "book"

/obj/item/ms13/fluff/typewriter
    name = "typewriter"
    desc = "An old typewriter. It seems to be broken."
    icon_state = "typewriter"
    grid_height = 64
    grid_width = 64

/obj/item/ms13/fluff/typewriter/wrench_act_secondary(mob/living/user, obj/item/weapon)
    user.show_message(span_notice("You begin disassembling \the [src]."), MSG_VISUAL)
    if(do_after(user, 8 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
        user.show_message(span_notice("You disassemble \the [src] into scrap."), MSG_VISUAL)
        new /obj/item/stack/sheet/ms13/scrap/two(loc)
        new /obj/item/stack/sheet/ms13/scrap_parts/two(loc)
        qdel(src)

/obj/item/ms13/fluff/typewriter/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/item/ms13/fluff/typewriter/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>wrench</b> to take apart [src] for parts.")

/obj/item/ms13/fluff/microscope
    name = "microscope"
    desc = "A microscope, used for looking at things really, really closely."
    icon_state = "microscope"
    grid_height = 64
    grid_width = 32

/obj/item/ms13/fluff/microscope/screwdriver_act_secondary(mob/living/user, obj/item/weapon)
    user.show_message(span_notice("You begin disassembling \the [src] into scrap."), MSG_VISUAL)
    if(do_after(user, 8 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
        user.show_message(span_notice("You disassemble \the [src] into scrap and parts."), MSG_VISUAL)
        new /obj/item/stack/sheet/ms13/glass/three(loc)
        new /obj/item/stack/sheet/ms13/scrap/two(loc)
        new /obj/item/stack/sheet/ms13/scrap_electronics(loc, 2)
        qdel(src)

/obj/item/ms13/fluff/microscope/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/item/ms13/fluff/microscope/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>screwdriver</b> to take apart [src] for parts.")

/obj/item/ms13/fluff/chems
    name = "chemistry glassware"
    desc = "Some old chemistry equipment. Not very useful anymore."
    icon_state = "chems"

/obj/item/ms13/fluff/ashtray
    name = "ashtray"
    desc = "An old plastic ashtray, still good to hold cigarette butts."
    icon_state = "ashtray"

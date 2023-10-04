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
	icon_state = "book_1"
	drop_sound = 'sound/items/handling/book_drop.ogg'
	pickup_sound = 'sound/items/handling/book_pickup.ogg'

/obj/item/ms13/fluff/ruined_book/Initialize(mapload)
	. = ..()
	icon_state = pick("book_1","book_2","book_3","book_4")
	AddElement(/datum/element/craftable, /obj/item/knife/ms13, /obj/item/paper/ms13, rand(1,5), 20 SECONDS, crafting_sound_start = 'mojave/sound/ms13effects/book_open.ogg', crafting_focus_sound = list('mojave/sound/ms13effects/crafting/scissorsnip1.ogg' = 1, 'mojave/sound/ms13effects/crafting/scissorsnip2.ogg' = 1, 'mojave/sound/ms13effects/crafting/scissorsnip3.ogg' = 1))

/obj/item/ms13/fluff/bible
	name = "bible"
	desc = "A book that's seems to have a cross on it's front cover. It's filled with a bunch of verses."
	icon_state = "bible"
	drop_sound = 'sound/items/handling/book_drop.ogg'
	pickup_sound = 'sound/items/handling/book_pickup.ogg'

/obj/item/ms13/fluff/bible/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/craftable, /obj/item/knife/ms13, /obj/item/paper/ms13, rand(1,6), 20 SECONDS, crafting_sound_start = 'mojave/sound/ms13effects/book_open.ogg', crafting_focus_sound = list('mojave/sound/ms13effects/crafting/scissorsnip1.ogg' = 1, 'mojave/sound/ms13effects/crafting/scissorsnip2.ogg' = 1, 'mojave/sound/ms13effects/crafting/scissorsnip3.ogg' = 1))

/obj/item/ms13/fluff/typewriter
	name = "typewriter"
	desc = "An old typewriter. It seems to be broken."
	icon_state = "typewriter"
	grid_height = 64
	grid_width = 64

/obj/item/ms13/fluff/typewriter/Initialize()
	. = ..()
	register_context()

/obj/item/ms13/fluff/typewriter/wrench_act_secondary(mob/living/user, obj/item/weapon)
	user.show_message(span_notice("You begin disassembling \the [src]."), MSG_VISUAL)
	if(do_after(user, 8 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		var/drop_location = user.drop_location()
		user.show_message(span_notice("You disassemble \the [src] into scrap."), MSG_VISUAL)
		new /obj/item/stack/sheet/ms13/scrap(drop_location, 3)
		new /obj/item/stack/sheet/ms13/scrap_parts(drop_location, 3)
		qdel(src)

/obj/item/ms13/fluff/typewriter/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/item/ms13/fluff/typewriter/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>wrench</b> to take apart [src] for parts.")

/obj/item/ms13/fluff/typewriter/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_WRENCH)
			context[SCREENTIP_CONTEXT_RMB] = "Disassemble"
			return CONTEXTUAL_SCREENTIP_SET

/obj/item/ms13/fluff/microscope
	name = "microscope"
	desc = "A microscope, used for looking at things really, really closely."
	icon_state = "microscope"
	grid_height = 64
	grid_width = 32

/obj/item/ms13/fluff/microscope/Initialize()
	. = ..()
	register_context()

/obj/item/ms13/fluff/microscope/screwdriver_act_secondary(mob/living/user, obj/item/weapon)
	user.show_message(span_notice("You begin disassembling \the [src] into scrap."), MSG_VISUAL)
	if(do_after(user, 8 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		var/drop_location = user.drop_location()
		user.show_message(span_notice("You disassemble \the [src] into scrap and parts."), MSG_VISUAL)
		new /obj/item/stack/sheet/ms13/glass(drop_location, 3)
		new /obj/item/stack/sheet/ms13/scrap(drop_location, 2)
		new /obj/item/stack/sheet/ms13/scrap_electronics(drop_location, 2)
		qdel(src)

/obj/item/ms13/fluff/microscope/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/item/ms13/fluff/microscope/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>screwdriver</b> to take apart [src] for parts.")

/obj/item/ms13/fluff/microscope/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_SCREWDRIVER)
			context[SCREENTIP_CONTEXT_RMB] = "Disassemble"
			return CONTEXTUAL_SCREENTIP_SET

/obj/item/ms13/fluff/chems
	name = "chemistry glassware"
	desc = "Some old chemistry equipment. Not very useful anymore."
	icon_state = "chems"

/obj/item/ms13/fluff/ashtray
	name = "ashtray"
	desc = "An old plastic ashtray, still good to hold cigarette butts."
	icon_state = "ashtray"

/obj/item/ms13/fluff/ashtray/Initialize(mapload)
	. = ..()
	LoadComponent(/datum/component/storage/concrete/ms13/ashtray)
	for(var/i = 0 to rand(0,6))
		new /obj/item/ms13/cigarette/butt(src)
	for(var/i = 0 to rand(0,10))
		new /obj/item/ms13/ash(src)
	reset_grid_inventory()

/obj/item/ms13/fluff/ashtray/examine(mob/user)
	. = ..()
	. += "There are [contents.len] butts in it."

/obj/item/ms13/fluff/ashtray/attackby(obj/item/attacking_item, mob/user, params) // some REAL soul
	if(istype(attacking_item, /obj/item/ms13/cigarette))
		var/obj/item/ms13/cigarette/fella = attacking_item
		var/alright_butt
		if(fella.smoketime <= 120 && fella.lit && !fella.butt_transform)
			if(istype(fella, /obj/item/ms13/cigarette))
				alright_butt = /obj/item/ms13/cigarette/butt
			if(istype(fella, /obj/item/ms13/cigarette/rollie))
				alright_butt = /obj/item/ms13/cigarette/butt/roach
			new alright_butt(src)
			new /obj/item/ms13/ash(src)
			playsound(src, 'mojave/sound/ms13effects/smokeables/cigsnuff.ogg', 25, 1)
			user.visible_message("<span class='notice'>[user] puts out \the [attacking_item], in the [name].</span>")
			qdel(attacking_item)
			return
		if(fella.smoketime <= 60 && fella.lit && fella.butt_transform)
			fella.extinguish()
			user.visible_message("<span class='notice'>[user] puts out \the [attacking_item] in the [name].</span>")
			fella.forceMove(src)
			return
		else if(fella.lit)
			fella.smoketime -= 30
			fella.update_overlays()
			fella.update_icon_state()
			fella.extinguish()
			playsound(src, 'mojave/sound/ms13effects/smokeables/cigsnuff.ogg', 25, 1)
			user.visible_message("<span class='notice'>[user] puts out \the end of [attacking_item] in the [name].</span>")
			return
	. = ..()

/obj/item/ms13/fluff/alarmclock
	name = "alarm clock"
	desc = "An old electronic alarm clock. Not of much use now."
	icon_state = "alarm"

/obj/item/ms13/fluff/alarmclock/Initialize()
	. = ..()
	register_context()

/obj/item/ms13/fluff/alarmclock/screwdriver_act_secondary(mob/living/user, obj/item/weapon)
	user.show_message(span_notice("You begin disassembling \the [src] into scrap."), MSG_VISUAL)
	if(do_after(user, 8 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		var/drop_location = user.drop_location()
		user.show_message(span_notice("You disassemble \the [src] into scrap and parts."), MSG_VISUAL)
		new /obj/item/stack/sheet/ms13/glass(drop_location, 1)
		new /obj/item/stack/sheet/ms13/scrap(drop_location, 2)
		new /obj/item/stack/sheet/ms13/scrap_electronics(drop_location, 1)
		new /obj/item/stack/sheet/ms13/circuits(drop_location, 1)
		qdel(src)

/obj/item/ms13/fluff/alarmclock/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/item/ms13/fluff/alarmclock/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>screwdriver</b> to take apart [src] for parts.")

/obj/item/ms13/fluff/alarmclock/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_SCREWDRIVER)
			context[SCREENTIP_CONTEXT_RMB] = "Disassemble"
			return CONTEXTUAL_SCREENTIP_SET

/obj/item/ms13/fluff/trifoldflag
	name = "trifold American flag"
	desc = "A flag of old folded into a triangle and inserted a wooden box with glass to allow it to be seen, usually given to grieving families who lost someone during service or people who served during the Great War."
	icon_state = "trifold"

/obj/item/ms13/fluff/trifoldflag/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clutter/clutter_inventory.dmi')

/obj/item/ms13/fluff/trifoldflag/Initialize()
	. = ..()
	register_context()

/obj/item/ms13/fluff/trifoldflag/screwdriver_act_secondary(mob/living/user, obj/item/weapon)
	user.show_message(span_notice("You begin disassembling \the [src] into scrap."), MSG_VISUAL)
	if(do_after(user, 8 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		var/drop_location = user.drop_location()
		user.show_message(span_notice("You disassemble \the [src] into scrap and parts."), MSG_VISUAL)
		new /obj/item/stack/sheet/ms13/cloth(drop_location, 3)
		new /obj/item/stack/sheet/ms13/wood/scrap_wood(drop_location, 2)
		qdel(src)

/obj/item/ms13/fluff/trifoldflag/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/item/ms13/fluff/trifoldflag/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>screwdriver</b> to take apart [src] for parts.")

/obj/item/ms13/fluff/trifoldflag/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_SCREWDRIVER)
			context[SCREENTIP_CONTEXT_RMB] = "Disassemble"
			return CONTEXTUAL_SCREENTIP_SET

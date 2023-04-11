/obj/structure/ms13/smelter
	name = "makeshift smelter"
	desc = "A crude, makeshift smelter used to refine or melt down ingots. At least it works.... probably."
	icon = 'mojave/icons/structure/smelter.dmi'
	icon_state = "smelter"
	max_integrity = 160
	density = TRUE
	anchored = TRUE
	projectile_passchance = 75
	pixel_y = 12
	var/crafting_interface = CRAFTING_BENCH_SMELTER

/obj/structure/ms13/smelter/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Use <b>CTRL + CLICK</b> on [src] to begin smelting.</span>"

/obj/structure/ms13/smelter/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	if (isnull(held_item))
		context[SCREENTIP_CONTEXT_CTRL_LMB] = "Start smelting"
		return CONTEXTUAL_SCREENTIP_SET

/obj/structure/ms13/smelter/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/personal_crafting, crafting_interface)
	register_context()

/obj/structure/ms13/smelter/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap(loc, 4)
	qdel(src)

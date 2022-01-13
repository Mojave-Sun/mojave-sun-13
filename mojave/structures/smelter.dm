/obj/structure/ms13/smelter
	name = "makeshift smelter"
	desc = "A crude, makeshift smelter used to refine or melt down ingots. At least it works.... probably."
	icon = 'mojave/icons/structure/smelter.dmi'
	icon_state = "smelter"
	max_integrity = 160
	density = TRUE
	anchored = TRUE
	var/crafting_interface = CRAFTING_BENCH_SMELTER

/obj/structure/ms13/smelter/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Use <b>CTRL + CLICK</b> on [src] to begin smelting.</span>"

/obj/structure/ms13/smelter/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/personal_crafting, crafting_interface)

/obj/structure/ms13/smelter/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap(loc, 4)
	qdel(src)

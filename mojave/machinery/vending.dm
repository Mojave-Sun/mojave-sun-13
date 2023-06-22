/obj/machinery/vending/ms13
	name = "base class MS13 vending machine"
	desc = "Alert a coder/mapper if you see this."
	icon = 'mojave/icons/structure/vending.dmi'
	circuit = null
	light_power = 0
	active = 0

/obj/machinery/vending/ms13/can_vend(user, silent)
	return FALSE

/obj/machinery/vending/ms13/vend(list/params, list/greyscale_colors)
	return

/obj/machinery/vending/ms13/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap_steel(loc, 1)
		new /obj/item/stack/sheet/ms13/scrap_alu(loc, 2)
		new /obj/item/stack/sheet/ms13/scrap_alu(loc, 2)
	for(var/obj/item/I in src)
		I.forceMove(loc)
	qdel(src)

/obj/machinery/vending/ms13/nuka
	name = "Nuka Cola vending machine"
	desc = "An old Nuka Cola vending machine. It seem to be empty."
	icon_state = "nuka_old"

/obj/machinery/vending/ms13/nuka/pristine
	name = "Nuka Cola vending machine"
	desc = "An old Nuka Cola vending machine, either left untouched or restored to its former glory."
	icon_state = "nuka_new"

/obj/machinery/vending/ms13/sarsaparilla
	name = "Sunset Sarsaparilla vending machine"
	desc = "One of the few to challenge Nuka's dominance, this Sunset Sarsaparilla machine still stands."
	icon_state = "sarsaparilla"

/obj/machinery/vending/ms13/cigarettes
	name = "cigarette vending machine"
	desc = "Delicious cigarettes"
	icon_state = "cigarette"
	tiltable = FALSE

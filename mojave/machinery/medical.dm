/obj/machinery/iv_drip/ms13
	name = "\improper IV drip"
	desc = "An IV drip with an advanced infusion pump that can both drain blood into and inject liquids from attached containers, a must have for these times."
	icon = 'mojave/icons/structure/medical.dmi'
	icon_state = "iv_drip"
	base_icon_state = "iv_drip"
	max_integrity = 150

/obj/machinery/iv_drip/ms13/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap(loc)
	qdel(src)

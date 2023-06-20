/obj/structure/bodycontainer/ms13/morgue
	name = "morgue"
	desc = "A place to keep the dead, until they can be properly buried or cremated."
	icon = 'mojave/icons/structure/morgue.dmi'
	icon_state = "morgue"
	projectile_passchance = 65

/obj/structure/bodycontainer/ms13/morgue/Initialize(mapload)
	. = ..()
	connected = new/obj/structure/tray/ms13/m_tray(src)
	connected.connected = src

/obj/structure/bodycontainer/ms13/morgue/deconstruct(disassembled = TRUE)
	if (!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap (loc, 4)
	recursive_organ_check(src)
	qdel(src)

/obj/structure/tray/ms13/m_tray
	name = "morgue tray"
	desc = "Make sure the body is inside before closing."
	icon = 'mojave/icons/structure/morgue.dmi'
	icon_state = "morguetray"
	pass_flags_self = PASSTABLE

/obj/structure/tray/ms13/m_tray/deconstruct(disassembled = TRUE)
	new /obj/item/stack/sheet/ms13/scrap (loc, 2)
	qdel(src)

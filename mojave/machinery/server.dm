/obj/machinery/server
	name = "server"
	desc = "A cabinet-sized server from before the Great War."
	icon = 'mojave/icons/structure/racks.dmi'
	icon_state = "rack_1"
	density = TRUE

/obj/machinery/server/alt
	icon_state = "rack_2"

/obj/machinery/recorder
	name = "tape machine"
	desc = "A cabinet with magnetic tape for recording data."
	icon = 'mojave/icons/structure/racks.dmi'
	icon_state = "recorder_on"
	density = TRUE

/obj/machinery/server/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "[icon_state]_on")
	. += emissive_appearance(icon, "[icon_state]_on")

/obj/machinery/server/Initialize(mapload)
	. = ..()
	set_light(1.4,0.7,"#FF2A2A")

/obj/machinery/ms13/mainframe
	name = "mainframe"
	desc = "A large super computer. Probably the fastest looking computer you've ever seen."
	icon = 'mojave/icons/structure/mainframe.dmi'
	icon_state = "mainframe"
	bound_width = 96
	density = TRUE

/obj/machinery/ms13/mainframe/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "[icon_state]_on")
	. += emissive_appearance(icon, "[icon_state]_on")

/obj/machinery/ms13/mainframe/Initialize(mapload)
	. = ..()
	set_light(1.4,0.7,"#FF2A2A")

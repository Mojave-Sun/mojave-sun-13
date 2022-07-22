/obj/machinery/door/airlock/ms13
	name = "mechanical door"
	desc = "The very pinnacle of door technology. Even after all this time, still usually reliably opens and closes! Don't stick your head in it."
	icon = 'mojave/icons/objects/airlocks/generic.dmi'
	overlays_file = 'mojave/icons/objects/airlocks/overlays.dmi'
	normal_integrity = 800 // big metal door
	armor = list(MELEE = 100, BULLET = 100, LASER = 100, ENERGY = 100, BOMB = 100, BIO = 100, FIRE = 100, ACID = 100)
	security_level = 1
	layer = 4.5
	closingLayer = CLOSED_DOOR_LAYER
	hackProof = TRUE
	assemblytype = /obj/item/stack/sheet/ms13/scrap/two
	resistance_flags = INDESTRUCTIBLE

/obj/machinery/door/airlock/ms13/Bumped(atom/movable/AM)
	return

//// Town Doors ////

/obj/machinery/door/airlock/ms13/town

/obj/machinery/door/airlock/ms13/town/mayor
	req_access = list(ACCESS_TOWN_MAYOR)

/obj/machinery/door/airlock/ms13/town/security
	req_access = list(ACCESS_TOWN_LAW)

/obj/machinery/door/airlock/ms13/town/doctor
	req_access = list(ACCESS_TOWN_DOCTOR)

//// Brotherhood doors ////

/obj/machinery/door/airlock/ms13/brotherhood
	req_access = list(ACCESS_BROTHERHOOD)

/obj/machinery/door/airlock/ms13/brotherhood/hpaladin
	req_access = list(ACCESS_BROTHERHOOD, ACCESS_BROTHERHOOD_HPALADIN)

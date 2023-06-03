////////////////MOJAVE SUN DRYING RACK STORAGE/////////////////

/obj/structure/ms13/drying_rack
	name = "drying rack"
	desc = "A makeshift wooden herbal drying rack. For leaving plants in the sun."
	icon = 'mojave/icons/structure/drying_rack.dmi'
	icon_state = "drying_rack"
	armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 10, BIO = 100,  FIRE = 10, ACID = 100)
	density = TRUE
	anchored = TRUE
	max_integrity = 200
	var/has_rope = FALSE

/obj/structure/ms13/drying_rack/Initialize(mapload)
	. = ..()
	if(has_rope)
		icon_state = "drying_rack_roped"

/obj/structure/ms13/drying_rack/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap_wood(loc, 3)
	if(has_rope)
		new /obj/item/restraints/handcuffs/ms13/rope(loc, 1)
	qdel(src)

/obj/structure/ms13/drying_rack/examine(mob/user)
	. = ..()
	if(!has_rope)
		. += "Attach some rope to it to start hanging produce."

/obj/structure/ms13/drying_rack/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(istype(I, /obj/item/restraints/handcuffs/ms13/rope) && !has_rope && do_after)

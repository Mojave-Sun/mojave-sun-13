/obj/structure/ms13/powerlines
	name = "overhead power line"
	desc = "A suspended power line made of three thick parallel wires."
	icon = 'mojave/icons/structure/powerlines.dmi'
	icon_state = "platrailings_full"
	density = FALSE
	anchored = TRUE
	armor = list(MELEE = 60, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 80, ACID = 50)
	max_integrity = 120
	layer = LATTICE_LAYER
	plane = FLOOR_PLANE
	obj_flags = CAN_BE_HIT | BLOCK_Z_OUT_DOWN | BLOCK_Z_IN_UP
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/number_of_mats = 3
	var/build_material = /obj/item/stack/sheet/ms13/scrap_copper

/obj/structure/ms13/powerlines/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new build_material(get_turf(src), number_of_mats)
	qdel(src)

// Power line mounts

/obj/structure/ms13/powerlines/mount/navy
	icon_state = "plinemount_navy"

/obj/structure/ms13/powerlines/mount/red
	icon_state = "plinemount_red"

/obj/structure/ms13/powerlines/mount/green
	icon_state = "plinemount_green"

/obj/structure/ms13/powerlines/mount/blue
	icon_state = "plinemount_blue"

// Power line cords

/obj/structure/ms13/powerlines/cord/Initialize(mapload)
	. = ..()
	// Random chance to have a visually-intact power line
	if(prob(40))
		icon_state = "plinecord_[pcolor]"
	else
		/// pdir controls which one of the three wires is damaged
		var/pdir = pick(SOUTH, WEST, EAST)
		if(dir == WEST || dir == EAST)
			icon_state = "plinedam-hor_[pcolor]"
			dir = pdir
		else
			icon_state = "plinedam-vert_[pcolor]"
			dir = pdir

/obj/structure/ms13/powerlines/cord
	icon_state = ""
	var/pcolor

/obj/structure/ms13/powerlines/cord/navy
	icon_state = "plinecord_navy"
	pcolor = "navy"

/obj/structure/ms13/powerlines/cord/red
	icon_state = "plinecord_red"
	pcolor = "red"

/obj/structure/ms13/powerlines/cord/green
	icon_state = "plinecord_green"
	pcolor = "green"

/obj/structure/ms13/powerlines/cord/blue
	icon_state = "plinecord_blue"
	pcolor = "blue"

// Power line junctions

/obj/structure/ms13/powerlines/junction/Initialize(mapload)
	. = ..()
	// Adjacent connections will be spawned as overlays
	icon_state = "plinejunction"

	// Detecting adjacent power lines
	for(var/direction in GLOB.cardinals)
		var/turf/T = get_step(src, direction)
		var/adjacent = locate(/obj/structure/ms13/powerlines) in T
		if(adjacent)
			jdir |= direction
	// Update both icon and overlays
	update_icon()

/obj/structure/ms13/powerlines/junction/update_overlays()
	. = ..()

	// Adding connection to adjacent power lines
	for(var/direction in GLOB.cardinals)
		if(jdir & direction)
			. += image(icon, "plinecord-junction_[pcolor]", dir=REVERSE_DIR(direction))

/obj/structure/ms13/powerlines/junction
	icon_state = ""
	var/pcolor
	var/jdir

/obj/structure/ms13/powerlines/junction/navy
	icon_state = "plinejunction_navy"
	pcolor = "navy"

/obj/structure/ms13/powerlines/junction/red
	icon_state = "plinejunction_red"
	pcolor = "red"

/obj/structure/ms13/powerlines/junction/green
	icon_state = "plinejunction_green"
	pcolor = "green"

/obj/structure/ms13/powerlines/junction/blue
	icon_state = "plinejunction_blue"
	pcolor = "blue"

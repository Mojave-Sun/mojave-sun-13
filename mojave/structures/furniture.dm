/////////////////////////////////////////////////////////////
////////// MOJAVE SUN FURNITURE AND INTERIOR STUFF //////////
/////////////////////////////////////////////////////////////

//Appliances//

//Electronics//

/obj/structure/ms13/tv
	name = "\improper Radiation King Television"
	desc = "A message asking the audience to please standby appears on screen."
	icon = 'icons/obj/computer.dmi'
	icon_state = "television"
	max_integrity = 250
	density = TRUE

/obj/structure/ms13/tv/screwdriver_act_secondary(mob/living/user, obj/item/weapon)
	if(flags_1&NODECONSTRUCT_1)
		return TRUE
	..()
	weapon.play_tool_sound(src)
	if(do_after(user, 12 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/ms13/tv/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/scrap_wood(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
			new /obj/item/stack/sheet/ms13/glass(loc)
			new /obj/item/stack/sheet/ms13/scrap_electronics/two(loc)
			new /obj/item/stack/sheet/ms13/scrap_copper/two(loc)
		else
			new /obj/item/stack/sheet/ms13/scrap_wood(loc)
			new /obj/item/stack/sheet/ms13/glass(loc)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc)
	qdel(src)

/obj/structure/ms13/tv/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/ms13/tv/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>screwdriver</b> to take apart [src] for parts.")

/obj/structure/ms13/phone
	name = "payphone"
	desc = "A long unused and dead payphone, sure as hell ain't anyone to call on this thing no more."
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "payphone"
	max_integrity = 300
	density = TRUE
	anchored = TRUE

/obj/structure/ms13/phone/wrench_act_secondary(mob/living/user, obj/item/weapon)
	if(flags_1&NODECONSTRUCT_1)
		return TRUE
	..()
	weapon.play_tool_sound(src)
	if(do_after(user, 15 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/ms13/phone/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/scrap/two(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts/two(loc)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc)
			new /obj/item/stack/sheet/ms13/scrap_copper/two(loc)
		else
			new /obj/item/stack/sheet/ms13/scrap(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc)
	qdel(src)

/obj/structure/ms13/phone/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/ms13/phone/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>wrench</b> to take apart [src] for parts.")

/obj/structure/ms13/phone/withthephone
	icon_state = "payphone_alt"

//Plumbing//

//Storage//

/obj/structure/ms13/storage
	name = "generic ms13 storage"
	desc = "You place stuff on/in/or around it or it pretends to at least, pretty generic right."
	icon = 'mojave/icons/structure/32x64_tall_furniture.dmi'
	armor = list(MELEE = 30, BULLET = 40, LASER = 10, ENERGY = 10, BOMB = 25, BIO = 100,  FIRE = 80, ACID = 100)
	density = TRUE
	anchored = TRUE
	max_integrity = 225
	var/materialtype = /obj/item/stack/sheet/ms13/scrap //What it drops when being destroyed

/obj/structure/ms13/storage/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new materialtype(loc)
	qdel(src)

/obj/structure/ms13/storage/store
	name = "store shelf"
	desc = "A proud american consumerism displayer, seems commercialism wasnt fully wiped out as intended."
	icon_state = "store_shelf"
	materialtype = /obj/item/stack/sheet/ms13/scrap_wood

/obj/structure/ms13/storage/bookshelf
	name = "bookshelf"
	desc = "Holder of knowledge, master of all."
	icon_state = "bookshelf"
	materialtype = /obj/item/stack/sheet/ms13/scrap_wood

/obj/structure/ms13/storage/shelf
	name = "metal shelf"
	desc = "Used for storing just about anything you could think of, this one is in good condition."
	icon_state = "metal_shelf_thin"
	opacity = FALSE
	materialtype = /obj/item/stack/sheet/ms13/scrap

/obj/structure/ms13/storage/shelf/rust
	desc = "Used for storing just about anything you could think of."
	icon_state = "metal_shelf_thin_rust"

/obj/structure/ms13/storage/large
	name = "generic large ms13 storage"
	bound_width = 64
	icon = 'mojave/icons/structure/64x64_large_furniture.dmi'
	max_integrity = 300

/obj/structure/ms13/storage/large/Initialize()
	switch(dir)
		if(SOUTH, NORTH)
			bound_width = 64
			bound_height = 32
			bound_x = 0
		if(EAST, WEST)
			bound_width = 32
			bound_height = 64
			bound_x = 0
	. = ..()

/obj/structure/ms13/storage/large/shelf
	name = "metal shelf"
	desc = "An extra large, heavy-duty shelf, used for storing just about anything you could think of, this one is in good condition."
	icon_state = "metal_shelf"
	opacity = FALSE
	materialtype = /obj/item/stack/sheet/ms13/scrap

/obj/structure/ms13/storage/large/shelf/rust
	desc = "An extra large, heavy-duty shelf, used for storing just about anything you could think of."
	icon_state = "metal_shelf_rust"

/obj/structure/ms13/storage/large/clothing
	name = "clothing rack"
	desc = "And they say fashion is dead."
	icon_state = "clothing_rack"
	materialtype = /obj/item/stack/sheet/ms13/scrap_wood
	max_integrity = 250

// Dresser Stuff //

/obj/structure/dresser/ms13
	name = "dresser"
	desc = "A nicely-crafted steel dresser. It's filled with lots of undies."
	icon = 'mojave/icons/structure/cabinets.dmi'
	var/dresser_type = "circabinet_orange"
	max_integrity = 225

/obj/structure/dresser/ms13/attack_hand(mob/user)
	icon_state = "[dresser_type]-open"
	update_icon()
	if(!Adjacent(user))//no tele-grooming
		icon_state = "[dresser_type]"
		return
	. = ..()
	if(.)
		return
	icon_state = "[dresser_type]"
	update_icon()

/obj/structure/dresser/ms13/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap(loc)
		new /obj/item/stack/sheet/ms13/cloth(loc, 4)
		new /obj/item/stack/sheet/ms13/thread(loc, 2)
	qdel(src)

/obj/structure/dresser/ms13/torquise
	dresser_type = "circabinet_torquise"
	icon_state = "circabinet_torquise"

/obj/structure/dresser/ms13/torquise/tall
	icon_state = "circabinet_torquise_tall"
	dresser_type = "circabinet_torquise_tall"

/obj/structure/dresser/ms13/orange
	icon_state = "circabinet_orange"
	dresser_type = "circabinet_orange"

/obj/structure/dresser/ms13/orange/tall
	icon_state = "circabinet_orange_tall"
	dresser_type = "circabinet_orange_tall"

// Filing Cabinets //

/obj/structure/filingcabinet/ms13
	name = "filing cabinet"
	desc = "Perfect for filing with radioactive dust."
	icon = 'mojave/icons/structure/cabinets.dmi'
	icon_state = "filing_cabinet"
	max_integrity = 150

/obj/structure/filingcabinet/ms13/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap(loc)
		for(var/obj/item/I in src)
			I.forceMove(loc)
	qdel(src)

/obj/structure/filingcabinet/ms13/busted
	icon_state = "filing_cabinet_busted"

/obj/structure/filingcabinet/ms13/empty
	icon_state = "filing_cabinet_empty"

/obj/structure/filingcabinet/ms13/short
	icon_state = "filing_cabinet_small"
	pixel_y = -5

/obj/structure/filingcabinet/ms13/short/busted
	icon_state = "filing_cabinet_small_busted"

// Broken Jukebox //

/obj/structure/ms13/jukebox
	name = "broken jukebox"
	desc = "A very old jukebox from before the war. Broken beyond repair, but could perhaps be salvaged for parts."
	icon = 'mojave/icons/objects/hamradio.dmi'
	icon_state = "jukebox_off"
	max_integrity = 350
	density = TRUE
	anchored = TRUE

/obj/structure/ms13/jukebox/screwdriver_act_secondary(mob/living/user, obj/item/weapon)
	if(flags_1&NODECONSTRUCT_1)
		return TRUE
	..()
	weapon.play_tool_sound(src)
	if(do_after(user, 30 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/ms13/jukebox/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/scrap/two(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts/two(loc)
			new /obj/item/stack/sheet/ms13/glass/three(loc)
			new /obj/item/stack/sheet/ms13/scrap_electronics/two(loc)
			new /obj/item/stack/sheet/ms13/scrap_copper/two(loc)
			new /obj/item/ms13/component/vacuum_tube(loc)
			new /obj/item/stack/sheet/ms13/circuits(loc)
		else
			new /obj/item/stack/sheet/ms13/scrap(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
			new /obj/item/stack/sheet/ms13/glass(loc)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc)
	qdel(src)

/obj/structure/ms13/jukebox/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/ms13/jukebox/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>screwdriver</b> to carefully take apart [src] for parts.")

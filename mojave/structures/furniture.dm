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

/obj/structure/ms13/phone
	name = "payphone"
	desc = "A long unused and dead payphone, sure as hell aint anyone to call on this thing no more."
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "payphone"

/obj/structure/ms13/phone/withthephone
	icon_state = "payphone_alt"

//Plumbing//

//Storage//

/obj/structure/ms13/storage
	name = "generic ms13 storage"
	desc = "You place stuff on/in/or around it or it pretends to at least, pretty generic right."
	icon = 'mojave/icons/structure/32x64_tall_furniture.dmi'
	armor = list(MELEE = 60, BULLET = 60, LASER = 20, ENERGY = 0, BOMB = 25, BIO = 100, RAD = 100, FIRE = 80, ACID = 100)
	density = TRUE
	anchored = TRUE

/obj/structure/ms13/storage/store
	name = "store shelf"
	desc = "A proud american consumerism displayer, seems commercialism wasnt fully wiped out as intended."
	icon_state = "store_shelf"

/obj/structure/ms13/storage/bookshelf
	name = "bookshelf"
	desc = "Holder of knowledge, master of all."
	icon_state = "bookshelf"

/obj/structure/ms13/storage/shelf
	name = "metal shelf"
	desc = "Used for storing just about anything you could think of, this one is in good condition."
	icon_state = "metal_shelf_thin"
	opacity = FALSE

/obj/structure/ms13/storage/shelf/rust
	desc = "Used for storing just about anything you could think of."
	icon_state = "metal_shelf_thin_rust"

/obj/structure/ms13/storage/large
	name = "generic large ms13 storage"
	bound_width = 64
	icon = 'mojave/icons/structure/64x64_large_furniture.dmi'

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

/obj/structure/ms13/storage/large/shelf/rust
	desc = "An extra large, heavy-duty shelf, used for storing just about anything you could think of."
	icon_state = "metal_shelf_rust"

/obj/structure/ms13/storage/large/clothing
	name = "clothing rack"
	desc = "And they say fashion is dead."
	icon_state = "clothing_rack"

// Dresser Stuff //

/obj/structure/dresser/ms13
	name = "dresser"
	desc = "A nicely-crafted steel dresser. It's filled with lots of undies."
	icon = 'mojave/icons/structure/cabinets.dmi'
	var/dresser_type = "circabinet_orange"

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
	desc = "Perfect for filing with your radioactive dust."
	icon = 'mojave/icons/structure/cabinets.dmi'
	icon_state = "filing_cabinet"

/obj/structure/filingcabinet/ms13/busted
	icon_state = "filing_cabinet_busted"

/obj/structure/filingcabinet/ms13/empty
	desc = "Perfect for loosely filling with radioactive dust."
	icon_state = "filing_cabinet_empty"

/obj/structure/filingcabinet/ms13/short
	icon_state = "filing_cabinet_small"
	pixel_y = -5

/obj/structure/filingcabinet/ms13/short/busted
	icon_state = "filing_cabinet_small_busted"

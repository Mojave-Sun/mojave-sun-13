/obj/item/storage/trash_stack
	name       = "pile of garbage"
	desc       = "a pile of garbage. Smells as good, as it looks, though it may contain something useful. Or may not"
	icon       = 'mojave/icons/objects/crafting.dmi'
	icon_state = "Junk_1"
	anchored   = 1
	density    = 0

	//rustle_jimmies       = FALSE
//	w_class              = WEIGHT_CLASS_GIGANTIC
//	max_w_class          = WEIGHT_CLASS_GIGANTIC
//	max_combined_w_class = 30

	var/spawn_delay = "3000-7000" //or num
	var/spawn_next  = 0


/obj/item/storage/trash_stack/New()
	. = ..()
	icon_state = "Junk_[rand(1,12)]"

/obj/item/storage/trash_stack/MouseDrop(atom/over_object)
	if(world.time >= spawn_next)
		spawn_trash()
	. = ..()

/obj/item/storage/trash_stack/attack_hand(mob/user)
	return MouseDrop(user)
/*
/obj/item/storage/trash_stack/can_be_inserted(obj/item/W, stop_messages = 0, mob/user)
	return 0
*/
/obj/item/storage/trash_stack/proc/spawn_trash()
	for(var/obj/item/I in contents)
		qdel(I)
	if(isnum(spawn_delay))
		spawn_next = world.time + spawn_delay
	else if(istext(spawn_delay))
		var/list/rand_borders = splittext(spawn_delay,"-")
		if(length(rand_borders) == 2)
			rand_borders[1] = text2num(rand_borders[1])
			rand_borders[2] = text2num(rand_borders[2])
			if(isnum(rand_borders[1]) && isnum(rand_borders[2]))
				spawn_next = world.time + rand(rand_borders[1], rand_borders[2])
			else
				spawn_next = world.time + rand(500,5000) // if some shitter wrote bad values

	for(var/obj/item/I in generate_trash())
		I.loc = src


/obj/item/storage/trash_stack/proc/generate_trash()
	var/list/back = list()
	for(var/i=0, i<rand(1,4), i++)
		var/itemtype = pick(/obj/item/ammo_casing/ms13/a762)
		var/I = new itemtype(src)
		back += I
	return back

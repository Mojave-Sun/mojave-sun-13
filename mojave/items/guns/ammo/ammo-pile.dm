/obj/item/ammo_casing
	var/obj/item/ammo_box/magazine/stack_type = /obj/item/ammo_box/magazine/ms13/ammo_stack

/obj/item/ammo_casing/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(istype(I, /obj/item/ammo_casing))
		var/obj/item/ammo_casing/ammo_casing = I
		if(!ammo_casing.stack_type)
			to_chat(user, span_warning("[ammo_casing] can't be stacked."))
			return
		if(!stack_type)
			to_chat(user, span_warning("[src] can't be stacked."))
			return
		if(caliber != ammo_casing.caliber)
			to_chat(user, span_warning("I can't stack different calibers."))
			return
		var/obj/item/ammo_box/magazine/ms13/ammo_stack/ammo_stack = new(drop_location())
		ammo_stack.name = "[capitalize(caliber)] rounds"
		ammo_stack.caliber = caliber
		user.transferItemToLoc(src, ammo_stack, silent = TRUE)
		ammo_stack.give_round(src)
		user.transferItemToLoc(ammo_casing, ammo_stack, silent = TRUE)
		ammo_stack.give_round(ammo_casing)
		ammo_stack.update_appearance(UPDATE_OVERLAYS)
		user.put_in_hands(ammo_stack)
		to_chat(user, span_notice("[src] has been stacked with [ammo_casing]."))

/obj/item/ammo_box/magazine/ms13/ammo_stack
	name = "ammo stack"
	desc = "A stack of ammo."
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "nothing"
	max_ammo = 15
	multiple_sprites = FALSE
	start_empty = TRUE
	multiload = FALSE

/*/obj/item/ammo_box/magazine/ms13/ammo_stack/Initialize() // Yeah so turns out... Since this things generates icons on its own, this isn't really an option. For now, it smushes everything down to the world state versions. It'll have to do for the mean time
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/ammo/ammo_inventory.dmi')*/

/obj/item/ammo_box/magazine/ms13/ammo_stack/update_overlays()
	. = ..()
	for(var/casing in stored_ammo)
		var/obj/item/ammo_casing/AC = casing
		var/image/bullet_pile = image(AC.icon, src, AC.icon_state)
		bullet_pile.pixel_x = rand(0, 8)
		bullet_pile.pixel_y = rand(0, 8)
		//bullet_pile.transform = bullet_pile.transform.Turn(rand(0, 360)) // Disabled because it looks scuffed with diagonal sprites. (or in general)
		. += bullet_pile

/obj/item/ammo_box/magazine/ms13/ammo_stack/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	while(length(stored_ammo))
		var/obj/item/ammo = get_round(FALSE)
		ammo.forceMove(loc)
		ammo.throw_at(loc)
	check_for_del()

/obj/item/ammo_box/magazine/ms13/ammo_stack/get_round(keep)
	. = ..()
	update_overlays()
	check_for_del()

/obj/item/ammo_box/magazine/ms13/ammo_stack/give_round(obj/item/ammo_casing/R, replace_spent)
	. = ..()
	update_overlays()
	check_for_del()

/obj/item/ammo_box/magazine/ms13/ammo_stack/handle_atom_del(atom/A)
	. = ..()
	check_for_del()

/obj/item/ammo_box/magazine/ms13/ammo_stack/empty_magazine()
	. = ..()
	check_for_del()

/obj/item/ammo_box/magazine/ms13/ammo_stack/update_ammo_count()
	. = ..()
	check_for_del()

/obj/item/ammo_box/magazine/ms13/ammo_stack/proc/check_for_del()
	. = FALSE
	if(ammo_count() <= 0 && !QDELETED(src))
		qdel(src)
		return TRUE

/**
 * The ammo stack object itself, making this a magazine was the easiest way to handle it
 * Practically every casing type needs an associated ammo stack type, because that was the easiest
 * way for me to handle it.
 */
/obj/item/ammo_box/magazine/ammo_stack
	name = "ammo stack"
	desc = "A stack of ammo."
	icon = 'mojave/icons/objects/ammo/ammo_inventory.dmi'
	icon_state = "9mm_casing"
	base_icon_state = "9mm_casing"
	item_flags = NO_PIXEL_RANDOM_DROP
	multiple_sprites = AMMO_BOX_ONE_SPRITE
	multiload = FALSE
	start_empty = TRUE
	max_ammo = 12
	/// Max ammo amount for the baked inventory sprite
	var/max_ammo_inventory = 5
	/// World icon for this stack
	var/world_icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	/// World icon state
	var/world_icon_state = "9mm_casing"
	///Placeholder icons
	var/no_inventory_sprite = FALSE

/obj/item/ammo_box/magazine/ammo_stack/Initialize(mapload)
	. = ..()
	if(world_icon)
		AddElement(/datum/element/world_icon, .proc/update_icon_world)

/obj/item/ammo_box/magazine/ammo_stack/update_icon(updates)
	icon = initial(icon)
	cut_overlays()
	return ..()

/obj/item/ammo_box/magazine/ammo_stack/update_icon_state()
	. = ..()
	if(no_inventory_sprite)
		cut_overlays()
		icon_state = ""
		for(var/casing in stored_ammo)
			var/image/bullet = image(initial(icon), src, "[base_icon_state]-live")
			bullet.pixel_x = rand(-8, 8)
			bullet.pixel_y = rand(-8, 8)
			add_overlay(bullet)
		return UPDATE_ICON_STATE | UPDATE_OVERLAYS
	else
		icon_state = "[base_icon_state]-live-[min(ammo_count(TRUE), max_ammo_inventory)]"

/obj/item/ammo_box/magazine/ammo_stack/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
    . = ..()
    var/loc_before_del = loc
    while(LAZYLEN(stored_ammo))
        var/obj/item/ammo = get_round(FALSE)
        ammo.forceMove(loc_before_del)
        ammo.throw_at(loc_before_del)
    check_for_del()

/obj/item/ammo_box/magazine/ammo_stack/handle_atom_del(atom/A)
	. = ..()
	check_for_del()

/obj/item/ammo_box/magazine/ammo_stack/empty_magazine()
	. = ..()
	check_for_del()

/obj/item/ammo_box/magazine/ammo_stack/update_ammo_count()
	. = ..()
	check_for_del()

/obj/item/ammo_box/magazine/ammo_stack/proc/check_for_del()
	. = FALSE
	if((ammo_count(TRUE) <= 0) && !QDELETED(src))
		qdel(src)
		return TRUE

/obj/item/ammo_box/magazine/ammo_stack/proc/update_icon_world()
	cut_overlays()
	icon_state = ""
	for(var/casing in stored_ammo)
		var/image/bullet = image(world_icon, src, "[world_icon_state]-live")
		bullet.pixel_x = rand(-8, 8)
		bullet.pixel_y = rand(-8, 8)
		bullet.transform = bullet.transform.Turn(rand(0, 360))
		add_overlay(bullet)
	return UPDATE_ICON_STATE | UPDATE_OVERLAYS

/obj/item/ammo_box/magazine/ammo_stack/attackby(obj/item/A, mob/user, params, silent = FALSE, replace_spent = 0)
	var/num_loaded = 0
	if(!can_load(user))
		return
	if(istype(A, /obj/item/ammo_box))
		var/obj/item/ammo_box/AM = A
		for(var/obj/item/ammo_casing/AC in AM.stored_ammo)
			var/did_load = give_round(AC, replace_spent)
			if(did_load)
				AM.stored_ammo -= AC
				num_loaded++
			if(!did_load || !multiload)
				break
		if(num_loaded)
			AM.update_ammo_count()
	if(istype(A, /obj/item/ammo_casing))
		var/obj/item/ammo_casing/AC = A
		if(give_round(AC, replace_spent))
			user.transferItemToLoc(AC, src, TRUE)
			num_loaded++
			AC.update_appearance()

	if(num_loaded)
		if(!silent)
			to_chat(user, span_notice("You load [num_loaded] shell\s into \the [src]!"))
			playsound(src, 'sound/weapons/gun/general/mag_bullet_insert.ogg', 60, TRUE)
		update_ammo_count()

// ammo casing attackby code here
/obj/item/ammo_casing
	/**
	 * What this casing can be stacked into.
	 */
	var/obj/item/ammo_box/magazine/stack_type
	/// TRUE if the ammo stack is generic and we should give it info based on the casing
	var/generic_stacking = TRUE
	var/stack_size = 20
	/// Used if we don't have a pre-made inventory sprite. Resorts to the barbaric methods of random gen icon state
	var/no_inventory_sprite = FALSE

/obj/item/ammo_casing/attackby(obj/item/attacking_item, mob/user, params)
	. = ..()
	if(!istype(attacking_item, /obj/item/ammo_casing))
		return
	var/obj/item/ammo_casing/ammo_casing = attacking_item
	if(!ammo_casing.stack_type)
		to_chat(user, span_warning("[ammo_casing] can't be stacked."))
		return
	if(!stack_type)
		to_chat(user, span_warning("[src] can't be stacked."))
		return
	if(caliber != ammo_casing.caliber)
		to_chat(user, span_warning("I can't stack different calibers."))
		return
	if(stack_type != ammo_casing.stack_type)
		to_chat(user, span_warning("I can't stack [ammo_casing] with [src]."))
		return
	if(!loaded_projectile || !ammo_casing.loaded_projectile)
		to_chat(user, span_warning("I can't stack empty casings."))
		return
	var/obj/item/ammo_box/magazine/ammo_stack/ammo_stack = new stack_type(drop_location())
	if(generic_stacking)
		ammo_stack.name = "[capitalize(caliber)] rounds"
		ammo_stack.base_icon_state = initial(icon_state)
		if(istype(ammo_stack))
			ammo_stack.world_icon_state = initial(icon_state)
		ammo_stack.caliber = src.caliber
	ammo_stack.max_ammo = ammo_casing.stack_size
	ammo_stack.no_inventory_sprite = ammo_casing.no_inventory_sprite
	user.transferItemToLoc(src, ammo_stack, silent = TRUE)
	ammo_stack.give_round(src)
	user.transferItemToLoc(ammo_casing, ammo_stack, silent = TRUE)
	ammo_stack.give_round(ammo_casing)
	user.put_in_hands(ammo_stack)
	ammo_stack.update_appearance()
	to_chat(user, span_notice("[src] has been stacked with [ammo_casing]."))

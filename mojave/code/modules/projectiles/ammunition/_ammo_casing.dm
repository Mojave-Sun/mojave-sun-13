/obj/item/ammo_casing
	/// What this casing can be stacked into
	var/obj/item/ammo_box/magazine/stack_type
	/// TRUE if the ammo stack is generic and we should give it info based on the casing
	var/generic_stacking = TRUE
	/// Maximum size an ammo stack of this casing can reach
	var/stack_size = 20
	/// Used if we don't have a pre-made inventory sprite - Resorts to the barbaric methods of random gen icon state
	var/no_inventory_sprite = FALSE

/obj/item/ammo_casing/attackby(obj/item/attacking_item, mob/user, params)
	if(istype(attacking_item, /obj/item/ammo_box) && user.is_holding(src))
		add_fingerprint(user)
		var/obj/item/ammo_box/ammo_box = attacking_item
		var/obj/item/ammo_casing/other_casing = ammo_box.get_round(TRUE)
		if(try_stacking(other_casing, user))
			ammo_box.stored_ammo -= other_casing
			ammo_box.update_ammo_count()
		return
	else if(istype(attacking_item, /obj/item/ammo_box/magazine/ammo_stack))
		add_fingerprint(user)
		var/obj/item/ammo_box/magazine/ammo_stack = attacking_item
		if(isturf(loc))
			var/boolets = 0
			for(var/obj/item/ammo_casing/bullet in loc)
				if(bullet == src)
					continue
				if(!bullet.loaded_projectile)
					continue
				if(length(ammo_stack.stored_ammo) >= ammo_stack.max_ammo)
					break
				if(ammo_stack.give_round(bullet, FALSE))
					boolets++
					break
			if((boolets <= 0) && loaded_projectile && !(length(ammo_stack.stored_ammo) >= ammo_stack.max_ammo))
				if(ammo_stack.give_round(src, FALSE))
					boolets++
			if(boolets > 0)
				ammo_stack.update_ammo_count()
				to_chat(user, span_notice("You collect [boolets] shell\s. [ammo_stack] now contains [length(ammo_stack.stored_ammo)] shell\s."))
			else
				to_chat(user, span_warning("You fail to collect anything!"))
		return
	else if(istype(attacking_item, /obj/item/ammo_casing))
		try_stacking(attacking_item, user)
		return
	return ..()

/obj/item/ammo_casing/attackby_secondary(obj/item/weapon, mob/user, params)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(istype(weapon, /obj/item/ammo_box) || istype(weapon, /obj/item/ammo_casing))
		weapon.attackby(src, user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/ammo_casing/proc/try_stacking(obj/item/ammo_casing/other_casing, mob/living/user)
	if(user)
		add_fingerprint(user)
	if(!other_casing.stack_type)
		if(user)
			to_chat(user, span_warning("[other_casing] can't be stacked."))
		return
	if(!stack_type)
		if(user)
			to_chat(user, span_warning("[src] can't be stacked."))
		return
	if(caliber != other_casing.caliber)
		if(user)
			to_chat(user, span_warning("I can't stack different calibers."))
		return
	if(stack_type != other_casing.stack_type)
		if(user)
			to_chat(user, span_warning("I can't stack [other_casing] with [src]."))
		return
	if(!loaded_projectile || !other_casing.loaded_projectile)
		if(user)
			to_chat(user, span_warning("I can't stack empty casings."))
		return
	var/obj/item/ammo_box/magazine/ammo_stack/ammo_stack = other_casing.stack_with(src)
	if(user)
		user.put_in_hands(ammo_stack)
		to_chat(user, span_notice("[src] has been stacked with [other_casing]."))
	return ammo_stack

/obj/item/ammo_casing/proc/stack_with(obj/item/ammo_casing/other_casing)
	var/obj/item/ammo_box/magazine/ammo_stack/ammo_stack = new stack_type(drop_location())
	if(generic_stacking)
		ammo_stack.name = "[caliber] rounds"
		ammo_stack.base_icon_state = initial(icon_state)
		if(istype(ammo_stack))
			ammo_stack.world_icon_state = initial(icon_state)
		ammo_stack.caliber = caliber
	ammo_stack.max_ammo = stack_size
	ammo_stack.no_inventory_sprite = no_inventory_sprite
	ammo_stack.give_round(src)
	ammo_stack.give_round(other_casing)
	ammo_stack.update_ammo_count()
	return ammo_stack

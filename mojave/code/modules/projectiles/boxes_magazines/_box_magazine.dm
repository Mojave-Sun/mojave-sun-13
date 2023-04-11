/obj/item/ammo_box
	multiload = FALSE

/obj/item/ammo_box/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	//no gaming
	if(item_flags & IN_STORAGE)
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	add_fingerprint(user)
	var/obj/item/ammo_casing/casing = get_round(FALSE)
	if(casing)
		casing.forceMove(drop_location())
		if((user.is_holding(src) || user.Adjacent(src)) && !user.put_in_hands(casing)) //incase they're using TK
			casing.bounce_away(FALSE, NONE)
		playsound(src, 'sound/weapons/gun/general/mag_bullet_insert.ogg', 60, TRUE)
		to_chat(user, span_notice("You remove a round from [src]!"))
		update_ammo_count()
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/ammo_box/attackby_secondary(obj/item/weapon, mob/user, params)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	//no gaming
	if(item_flags & IN_STORAGE)
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	if(istype(weapon, /obj/item/ammo_box) || istype(weapon, /obj/item/ammo_casing))
		weapon.attackby(src, user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/ammo_box/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	var/obj/item/ammo_casing/casing = get_round(FALSE)
	if(casing)
		update_ammo_count()
		casing.forceMove(loc)
		user.put_in_hands(casing)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/ammo_box/attackby_secondary(obj/item/weapon, mob/user, params)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(istype(weapon, /obj/item/ammo_box) || istype(weapon, /obj/item/ammo_casing))
		weapon.attackby(src, user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

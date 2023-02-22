/obj/item/ammo_box/attackby_secondary(obj/item/weapon, mob/user, params)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(istype(weapon, /obj/item/ammo_box))
		weapon.attackby(src, user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

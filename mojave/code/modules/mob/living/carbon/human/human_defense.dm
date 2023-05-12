
/mob/living/carbon/human/damage_armor(damage_amount, damage_type = BRUTE, damage_flag = 0, def_zone)
	if(wear_suit)
		if(istype(wear_suit, /obj/item/clothing/suit/space/hardsuit/ms13/power_armor))
			return wear_suit.get_integrity() - wear_suit.take_damage(damage_amount, damage_type, damage_flag, 0, def_zone = def_zone)

	return damage_amount


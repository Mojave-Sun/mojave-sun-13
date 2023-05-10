
/mob/living/carbon/human/damage_armor(damage_amount, damage_type = BRUTE, damage_flag = 0, def_zone)
	switch(def_zone)
		if(BODY_ZONE_HEAD)
			if(head)
				if(istype(head, /obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor))
					head.take_damage(damage_amount, damage_type, damage_flag, 0)
					return head.get_integrity() <= 0
		else
			if(wear_suit)
				if(istype(wear_suit, /obj/item/clothing/suit/space/hardsuit/ms13/power_armor))
					wear_suit.take_damage(damage_amount, damage_type, damage_flag, 0)
					return wear_suit.get_integrity() <= 0

	return TRUE


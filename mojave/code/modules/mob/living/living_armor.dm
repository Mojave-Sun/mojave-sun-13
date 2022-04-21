/mob/living/proc/run_subarmor_check(def_zone = null, \
						attack_flag = MELEE, \
						absorb_text = null, \
						soften_text = null, \
						armour_penetration = null, \
						penetrated_text = null, \
						silent = FALSE, \
						weak_against_armour = FALSE, \
						sharpness = NONE)
	//We need to convert attack flags into actually useful subarmor variables
	var/static/list/conversion_table = list(MELEE, BULLET)
	if(attack_flag in conversion_table)
		attack_flag = CRUSHING
		if(sharpness & SHARP_IMPALING)
			attack_flag = IMPALING
		else if(sharpness & SHARP_POINTY)
			attack_flag = PIERCING
		else if(sharpness & SHARP_EDGED)
			attack_flag = CUTTING

	var/armor = getsubarmor(def_zone, attack_flag)
	if(armor <= 0)
		return armor

	if(weak_against_armour)
		armor *= ARMOR_WEAKENED_MULTIPLIER

	return max(0, armor - armour_penetration)

/mob/living/proc/getsubarmor(def_zone, type)
	return 0

/mob/living/proc/get_edge_protection(def_zone)
	return 0

/mob/living/proc/get_subarmor_flags(def_zone)
	return NONE

/mob/living/proc/damage_armor(damage = 0, damage_flag = MELEE, damage_type = BRUTE, sharpness = NONE, def_zone = BODY_ZONE_CHEST)
	return FALSE

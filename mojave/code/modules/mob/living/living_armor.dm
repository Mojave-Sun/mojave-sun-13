// just changing the messages here to be clearer, mkay?
/mob/living/run_armor_check(def_zone = null, attack_flag = MELEE, absorb_text = null, soften_text = null, armour_penetration, penetrated_text, silent=FALSE, weak_against_armour = FALSE)
	var/armor = getarmor(def_zone, attack_flag)

	if(armor <= 0)
		return armor

	if(weak_against_armour && (armor >= 0))
		armor *= ARMOR_WEAKENED_MULTIPLIER

	if(silent)
		return max(0, armor - armour_penetration)

	//the if "armor" check is because this is used for everything on /living, including humans
	if(armour_penetration >= armor)
		armor = max(0, armor - armour_penetration)
		if(penetrated_text)
			to_chat(src, span_userdanger("[penetrated_text]"))
		else
			to_chat(src, span_userdanger("Your DR armor was penetrated!"))
	else if(armor >= 100)
		if(absorb_text)
			to_chat(src, span_notice("[absorb_text]"))
		else
			to_chat(src, span_notice("Your DR armor absorbs the blow!"))
	else
		if(soften_text)
			to_chat(src, span_warning("[soften_text]"))
		else
			to_chat(src, span_warning("Your DR armor softens the blow!"))
	return armor

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

	if(weak_against_armour && (armor >= 0))
		armor *= ARMOR_WEAKENED_MULTIPLIER

	if(silent)
		return max(0, armor - armour_penetration)

	//the if "armor" check is because this is used for everything on /living, including humans
	if(armour_penetration >= armor)
		armor = max(0, armor - armour_penetration)
		if(penetrated_text)
			to_chat(src, span_userdanger("[penetrated_text]"))
		else
			to_chat(src, span_userdanger("Your armor was fully penetrated!"))
	else if(armor >= 100)
		if(absorb_text)
			to_chat(src, span_notice("[absorb_text]"))
		else
			to_chat(src, span_notice("Your armor fully absorbs the blow!"))
	else
		if(soften_text)
			to_chat(src, span_warning("[soften_text]"))
		else
			to_chat(src, span_warning("Your armor softens the blow!"))

	return max(0, armor - armour_penetration)

/mob/living/proc/getsubarmor(def_zone, d_type)
	return 0

/mob/living/proc/get_edge_protection(def_zone)
	return 0

/mob/living/proc/get_subarmor_flags(def_zone)
	return NONE

/mob/living/proc/damage_armor(damage = 0, damage_flag = MELEE, damage_type = BRUTE, sharpness = NONE, def_zone = BODY_ZONE_CHEST)
	return damage

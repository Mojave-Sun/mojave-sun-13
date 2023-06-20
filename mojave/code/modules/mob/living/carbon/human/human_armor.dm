/mob/living/carbon/human/getsubarmor(def_zone, d_type)
	if(!def_zone)
		//no averaging values when no bodypart is specified, that's stupid
		return 0
	if(isbodypart(def_zone))
		return checksubarmor(def_zone, d_type)
	var/obj/item/bodypart/affecting = get_bodypart(check_zone(def_zone))
	if(affecting)
		//If a specific bodypart is targeted, check how that bodypart is protected and return the value.
		return checksubarmor(affecting, d_type)

//We only get the best edge protection, no stacking
/mob/living/carbon/human/get_edge_protection(def_zone)
	var/obj/item/bodypart/affecting
	if(def_zone)
		if(isbodypart(def_zone))
			affecting = def_zone
		else
			affecting = get_bodypart(check_zone(def_zone))

	//No support for averaging out edge protection because it'd be fucking stupid
	if(!affecting)
		return 0

	var/edge_protection = 0
	var/list/clothings = clothingonpart(affecting)
	for(var/obj/item/clothing in clothings)
		edge_protection = max(edge_protection, clothing.subarmor.getRating(EDGE_PROTECTION))
	return max(edge_protection, physiology.subarmor.getRating(EDGE_PROTECTION))

//We only get the most superficial armor flags, no stacking!
/mob/living/carbon/human/get_subarmor_flags(def_zone)
	var/obj/item/bodypart/affecting
	if(def_zone)
		if(isbodypart(def_zone))
			affecting = def_zone
		else
			affecting = get_bodypart(check_zone(def_zone))

	//if you don't specify a bodypart then only your physiology matters
	if(!affecting)
		return physiology.subarmor.subarmor_flags

	var/list/clothings = clothingonpart(affecting)
	for(var/obj/item/clothing as anything in clothings)
		return clothing.subarmor.getRating(SUBARMOR_FLAGS)
	return physiology.subarmor.getRating(SUBARMOR_FLAGS)

/mob/living/carbon/human/proc/checksubarmor(obj/item/bodypart/def_zone, d_type)
	if(!d_type)
		return 0

	//for the love of god this should never happen, if it did happen you fucked up
	var/static/list/converstion_table = list(MELEE, BULLET)
	if(d_type in converstion_table)
		d_type = CRUSHING
		stack_trace("Called checksubarmor with invalid d_type ([d_type])!")

	var/obj/item/bodypart/affecting
	if(def_zone)
		if(isbodypart(def_zone))
			affecting = def_zone
		else
			affecting = get_bodypart(check_zone(def_zone))

	if(!affecting)
		return physiology.subarmor.getRating(d_type)

	var/protection = 0
	var/list/clothings = clothingonpart(affecting)
	for(var/obj/item/clothing as anything in clothings)
		protection += clothing.subarmor.getRating(d_type)
	protection += physiology.subarmor.getRating(d_type)
	return protection

/mob/living/carbon/human/damage_armor(damage = 0, damage_flag = MELEE, damage_type = BRUTE, sharpness = NONE, def_zone = BODY_ZONE_CHEST)
	//We need to convert attack flags into actually useful subarmor variables
	var/static/list/conversion_table = list(MELEE, BULLET)
	if(damage_flag in conversion_table)
		damage_flag = CRUSHING
		if(sharpness & SHARP_IMPALING)
			damage_flag = IMPALING
		else if(sharpness & SHARP_POINTY)
			damage_flag = PIERCING
		else if(sharpness & SHARP_EDGED)
			damage_flag = CUTTING

	if(wear_suit && istype(wear_suit, /obj/item/clothing/suit/space/hardsuit/ms13/power_armor))
		return wear_suit.take_damage(damage, damage_type, damage_flag, 0, def_zone = def_zone)

	var/obj/item/bodypart/affecting
	if(def_zone)
		if(isbodypart(def_zone))
			affecting = def_zone
		else
			affecting = get_bodypart(check_zone(def_zone))

	if(!affecting)
		return damage

	var/list/clothings = clothingonpart(affecting)
	for(var/obj/item/clothing/clothing as anything in clothings)
		if(clothing.take_damage_zone(def_zone, damage, damage_flag, damage_type, sharpness, 100))
			return damage

	return damage

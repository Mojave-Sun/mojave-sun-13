/mob/living
	var/datum/special/special

/mob/living/Destroy()
	qdel(special)
	. = ..()

/mob/living/proc/getSpecial(strength = 5, perception = 5, endurance = 5, charisma = 5, intelligence = 5, agility = 5, luck = 5)
	. = src.special
	if (!.)
		. = new /datum/special(src, strength, perception, endurance, charisma, intelligence, agility, luck)

/datum/special
	//5 value no give buffs and debuffs
	var/strength = 5
	var/perception = 5
	var/endurance = 5
	var/charisma = 5
	var/intelligence = 5
	var/agility = 5
	var/luck = 5

	var/list/perks = list()

	//Mob or Player
	var/mob/living/owner

/datum/special/New(owner, strength = 5, perception = 5, endurance = 5, charisma = 5, intelligence = 5, agility = 5, luck = 5)
	src.owner = owner
	src.strength = strength
	src.perception = perception
	src.endurance = endurance
	src.intelligence = intelligence
	src.agility = agility
	src.luck = luck
	if(perks.len)
		var/list/init_perks = list()
		for(var/datum/perk/p as anything in perks)
			init_perks.Add(initial(p.id) = new p(src))

/datum/special/Destroy(force, ...)
	owner = null
	QDEL_LIST(perks)
	. = ..()

/datum/special/proc/Reset()
	strength = initial(strength)
	perception = initial(perception)
	endurance = initial(endurance)
	intelligence = initial(intelligence)
	agility = initial(agility)
	luck = initial(luck)

/datum/special/proc/ReCalculating()
	for(var/datum/perk/p as anything in perks)
		p.added_effect()

/datum/special/proc/modifyRating(strength = 0, perception = 0, endurance = 0, charisma = 0, intelligence = 0, agility = 0, luck = 0)
	src.strength += strength
	src.perception += perception
	src.endurance += endurance
	src.intelligence += intelligence
	src.agility += agility
	src.luck += luck

/datum/special/proc/setRating(strength, perception, endurance, charisma, intelligence, agility, luck)
	Reset()

	if(!isnull(strength))
		src.strength = strength
	if(!isnull(perception))
		src.perception = perception
	if(!isnull(endurance))
		src.endurance = endurance
	if(!isnull(charisma))
		src.charisma = charisma
	if(!isnull(intelligence))
		src.intelligence = intelligence
	if(!isnull(agility))
		src.agility = agility
	if(!isnull(luck))
		src.luck = luck

	ReCalculating()

/datum/special/proc/checkRating(strength, perception, endurance, charisma, intelligence, agility, luck)
	if(!isnull(strength) && src.strength < strength)
		return FALSE
	if(!isnull(perception) && src.perception < perception)
		return FALSE
	if(!isnull(endurance) && src.endurance < endurance)
		return FALSE
	if(!isnull(charisma) && src.charisma < charisma)
		return FALSE
	if(!isnull(intelligence) && src.intelligence < intelligence)
		return FALSE
	if(!isnull(agility) && src.agility < agility)
		return FALSE
	if(!isnull(luck) && src.luck < luck)
		return FALSE

	return TRUE

/datum/special/proc/getRating(rating)
	return vars[rating] - 5 // RETURN -5, BECAUSE 5 DON'T HAVE EFFECT

/datum/special/proc/AddPerk(datum/perk/type_or_id)
	if(QDELETED(owner))
		return
	if(isnull(type_or_id))
		return
	var/datum/perk/p
	if(istype(type_or_id))
		p = new type_or_id(src)
		perks.Add(p)
		p.added_effect()
	else if (istext(type_or_id))
		var/perk_type = GLOB.perks[type_or_id]
		p = new perk_type(src)
		perks.Add(p)
		p.added_effect()

/datum/special/proc/RemovePerk(datum/perk/type_or_id)
	if(isnull(type_or_id))
		return
	var/datum/perk/p
	if(istype(type_or_id))
		for(p as anything in perks)
			if(type_or_id != p.type)
				continue

			perks.Remove(p)
			p.remove_effect()
			qdel(p)
			return

	else if (istext(type_or_id))
		for(p as anything in perks)
			if(type_or_id != p.id)
				continue

			perks.Remove(p)
			p.remove_effect()
			qdel(p)
			return

/datum/special/proc/HasPerk(datum/perk/type_or_id)
	if(isnull(type_or_id))
		return FALSE
	var/datum/perk/p
	if(istype(type_or_id))
		for(p as anything in perks)
			if(type_or_id != p.type)
				continue
			return TRUE

	else if (istext(type_or_id))
		for(p as anything in perks)
			if(type_or_id != p.id)
				continue
			return TRUE

	return FALSE

//Calculating chance SPECIAL. WE WILL RETURN ONLY NUMBERS, BECAUSE THERE ONLY CALCULATING SPECIAL LEVEL LOGIC.
/datum/special/proc/chanse_mellee_act()
	. = 30
	. += 2 * (agility + strength)

/datum/special/proc/chanse_mellee_item_act()
	. = 55
	. += max(strength, agility)

/datum/special/proc/chanse_bullet_light_act()
	. = 5
	. += 4 * agility

/datum/special/proc/chanse_bullet_heavy_act()
	. = 2 * agility

/datum/special/proc/chanse_laser_act()
	. = 2
	. += 2 * perception
	. += luck / 2

/datum/special/proc/chanse_first_aid_help()
	. = 30
	. += perception + intelligence

/datum/special/proc/chanse_hack()
	. = 20
	. += (perception + agility) / 2

/datum/special/proc/chanse_steal()
	. = 20
	. += agility

/datum/special/proc/chanse_stels()
	. = 5
	if(!HasPerk(PERK_SILENT_RINNING))
		. += 3 * agility

/datum/special/proc/chanse_naturalist()
	. = 2 * (endurance + intelligence)

/datum/special/proc/chanse_traps()
	. = 10
	. += agility + endurance

/datum/special/proc/chanse_eloquence()
	. = 5 * charisma

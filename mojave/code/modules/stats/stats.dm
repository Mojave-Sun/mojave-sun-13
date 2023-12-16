/mob/living
	var/datum/stats/stats

/mob/living/Destroy()
	qdel(stats)
	. = ..()

/datum/stats
	//15 value no give buffs and debuffs
	var/perceptive = 15
	var/enduring = 15
	var/retaining = 15
	var/strong = 15
	var/outgoing = 15
	var/nimble = 15

	var/list/perks = list()

	//Mob or Player
	var/mob/living/owner

/datum/stats/New(owner, perceptive = 15, enduring = 15, retaining = 15, strong = 15, outgoing = 15, nimble = 15)
	src.owner = owner
	src.perceptive = perceptive
	src.enduring = enduring
	src.retaining = retaining
	src.strong = strong
	src.outgoing = outgoing
	src.nimble = nimble
	if(perks.len)
		var/list/init_perks = list()
		for(var/datum/perk/p as anything in perks)
			init_perks.Add(initial(p.id) = new p(src))

/datum/stats/Destroy(force, ...)
	owner = null
	QDEL_LIST(perks)
	. = ..()

/datum/stats/proc/Reset()
	perceptive = initial(perceptive)
	enduring = initial(enduring)
	retaining = initial(retaining)
	strong = initial(strong)
	outgoing = initial(outgoing)
	nimble = initial(nimble)

/datum/stats/proc/ReCalculating()
	for(var/datum/perk/p as anything in perks)
		p.added_effect()

/datum/stats/proc/modifyRating(perceptive = 0, enduring = 0, retaining = 0, strong = 0, outgoing = 0, nimble = 0)
	src.perceptive += perceptive
	src.enduring += enduring
	src.retaining += retaining
	src.strong += strong
	src.outgoing += outgoing
	src.nimble += nimble

/datum/stats/proc/setRating(perceptive, enduring, retaining, strong, outgoing, nimble)
	Reset()

	if(!isnull(perceptive))
		src.perceptive = perceptive
	if(!isnull(enduring))
		src.enduring = enduring
	if(!isnull(retaining))
		src.retaining = retaining
	if(!isnull(strong))
		src.strong = strong
	if(!isnull(outgoing))
		src.outgoing = outgoing
	if(!isnull(outgoing))
		src.outgoing = outgoing
	if(!isnull(nimble))
		src.nimble = nimble

	ReCalculating()

/datum/stats/proc/checkRating(perceptive, enduring, retaining, strong, outgoing, nimble)
	if(!isnull(perceptive) && src.perceptive < perceptive)
		return FALSE
	if(!isnull(enduring) && src.enduring < enduring)
		return FALSE
	if(!isnull(retaining) && src.retaining < retaining)
		return FALSE
	if(!isnull(strong) && src.strong < strong)
		return FALSE
	if(!isnull(outgoing) && src.outgoing < outgoing)
		return FALSE
	if(!isnull(nimble) && src.nimble < nimble)
		return FALSE

	return TRUE

/datum/stats/proc/AddPerk(datum/perk/type_or_id)
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

/datum/stats/proc/RemovePerk(datum/perk/type_or_id)
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

/datum/stats/proc/HasPerk(datum/perk/type_or_id)
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

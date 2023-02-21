/datum/species
	/// Special type of butchering triggered once our only remaining bodypart is the torso and it has no organs
	var/can_be_mcribs = TRUE

/datum/species/proc/try_to_mcrib(mob/living/carbon/human/user, obj/item/weapon, mob/living/carbon/human/victim)
	//bad component usage omg!!!!
	var/datum/component/butchering/butchering_component = weapon.GetComponent(/datum/component/butchering)
	if(!butchering_component?.butchering_enabled)
		return
	var/obj/item/bodypart/chest = victim.get_bodypart(BODY_ZONE_CHEST)
	if(!chest?.meat_type)
		return
	user.visible_message(span_warning("[user] begins to butcher [victim]..."),\
			span_notice("You begin to butcher [victim]..."))
	if(do_mob(user, FLOOR(butchering_component.speed, 1), target = victim))
		user.visible_message(span_warning("[user] butchers [victim]."),\
				span_notice("You butcher [victim]."))
		new chest.meat_type(victim.drop_location())
		qdel(victim)
		return TRUE
	return FALSE

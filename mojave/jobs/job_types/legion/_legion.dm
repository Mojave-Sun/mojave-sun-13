/datum/job/ms13/legion
	selection_color = "#9c0000"
	departments_list = list(
		/datum/job_department/legion,
	)
	exp_granted_type = EXP_TYPE_LEGION
	exp_required_type = EXP_TYPE_LEGION
	forbid = "Caesar's Legion forbids: chem usage, over-reliance on technology of all forms."

/datum/outfit/job/ms13/legion
	name = "Default"
	jobtype = /datum/job/ms13/legion

	back = /obj/item/storage/ms13/leather_backpack

/datum/outfit/job/ms13/legion/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/ms13/legion/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(H.gender != MALE)
		H.gender = MALE
		H.body_type = MALE
		H.real_name = random_unique_legion_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/legion/config_check()
	if(type == /datum/job/ms13/legion)
		return FALSE
	return ..()

/datum/job/ms13/legion/map_check()
	if(type == /datum/job/ms13/legion)
		return FALSE
	return ..()

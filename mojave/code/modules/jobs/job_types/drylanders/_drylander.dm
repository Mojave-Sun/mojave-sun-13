/datum/job/ms13/drylander
	selection_color = "#412d09"
	departments_list = list(
		/datum/job_department/drylander,
	)

/datum/outfit/job/ms13/drylander
	name = "Default"
	jobtype = /datum/job/ms13/drylander

/datum/outfit/job/ms13/drylander/pre_equip(mob/living/carbon/human/H)
	..()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/drylander/config_check()
	if(type == /datum/job/ms13/drylander)
		return FALSE
	return ..()

/datum/job/ms13/drylander/map_check()
	if(type == /datum/job/ms13/drylander)
		return FALSE
	return ..()

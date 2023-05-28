/datum/job/ms13/town_drought
	selection_color = "#12491a"
	departments_list = list(
		/datum/job_department/town_drought,
	)

/datum/outfit/job/ms13/town_drought
	name = "Default"
	jobtype = /datum/job/ms13/town_drought

/datum/outfit/job/ms13/town_drought/pre_equip(mob/living/carbon/human/H)
	..()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/town_drought/config_check()
	if(type == /datum/job/ms13/town_drought)
		return FALSE
	return ..()

/datum/job/ms13/town_drought/map_check()
	if(type == /datum/job/ms13/town_drought)
		return FALSE
	return ..()

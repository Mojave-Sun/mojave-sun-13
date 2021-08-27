/datum/job/ms13/bos
	selection_color = "#737592"

/datum/outfit/job/ms13/bos
	name = "Default"
	jobtype = /datum/job/ms13/bos

/datum/outfit/job/ms13/bos/pre_equip(mob/living/carbon/human/H)
	..()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/bos/config_check()
	if(type == /datum/job/ms13/bos)
		return FALSE
	return ..()

/datum/job/ms13/bos/map_check()
	if(type == /datum/job/ms13/bos)
		return FALSE
	return ..()

/datum/job/ms13/raiders
	selection_color = "#30389c"

/datum/outfit/job/ms13/raiders
	name = "Default"
	jobtype = /datum/job/ms13/raiders

/datum/outfit/job/ms13/raiders/pre_equip(mob/living/carbon/human/H)
	..()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/raiders/config_check()
	if(type == /datum/job/ms13/raiders)
		return FALSE
	return ..()

/datum/job/ms13/raiders/map_check()
	if(type == /datum/job/ms13/raiders)
		return FALSE
	return ..()

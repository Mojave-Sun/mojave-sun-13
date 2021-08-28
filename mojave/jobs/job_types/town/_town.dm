/datum/job/ms13/town
	selection_color = "#4feb64"

/datum/outfit/job/ms13/town
	name = "Default"
	jobtype = /datum/job/ms13/town

/datum/outfit/job/ms13/town/pre_equip(mob/living/carbon/human/H)
	..()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/town/config_check()
	if(type == /datum/job/ms13/town)
		return FALSE
	return ..()

/datum/job/ms13/town/map_check()
	if(type == /datum/job/ms13/town)
		return FALSE
	return ..()

/datum/job/ms13/legion
	selection_color = "#9c0000"
	exp_granted_type = EXP_TYPE_LEGION
	exp_required_type = EXP_TYPE_LEGION
	forbid = "Caesar's Legion forbids: chem usage, over-reliance on technology of all forms."

/datum/outfit/job/ms13/legion
	name = "Default"
	jobtype = /datum/job/ms13/legion

/datum/outfit/job/ms13/legion/pre_equip(mob/living/carbon/human/H)
	..()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/legion/config_check()
	if(type == /datum/job/ms13/legion)
		return FALSE
	return ..()

/datum/job/ms13/legion/map_check()
	if(type == /datum/job/ms13/legion)
		return FALSE
	return ..()

/datum/job/ms13/highwaymen
	selection_color = "#644a3159"
	departments_list = list(
		/datum/job_department/highwaymen,
	)
	exp_granted_type = EXP_TYPE_HIGHWAYMEN
	exp_required_type = EXP_TYPE_HIGHWAYMEN
	forbid = "The Highwaymen forbid betrayal of one's own, a close ally, or of a previous agreement. Hostility towards protected individiuals, as determined by Highwaymen leadership."
	enforce = "The Highwaymen expect obeying your superiors, keeping a cool head, and adhering to agreements and obligations expected of the group. Money and power is important, but so is the word of the Highwaymen and not backing down from it."

/datum/outfit/job/ms13/highwaymen
	name = "HighwaymenDatums"
	jobtype = /datum/job/ms13/highwaymen

/datum/outfit/job/ms13/highwaymen/pre_equip(mob/living/carbon/human/H)
	..()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/highwaymen/config_check()
	if(type == /datum/job/ms13/highwaymen)
		return FALSE
	return ..()

/datum/job/ms13/highwaymen/map_check()
	if(type == /datum/job/ms13/highwaymen)
		return FALSE
	return ..()

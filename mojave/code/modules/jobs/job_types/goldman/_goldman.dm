/datum/job/ms13/goldman
	selection_color = "#644a3159"
	departments_list = list(
		/datum/job_department/goldman,
	)
	exp_granted_type = EXP_TYPE_GOLDMAN
	exp_required_type = EXP_TYPE_GOLDMAN
	forbid = "The Goldman Posse forbids betrayal of one's own, a close ally, or of a previous agreement. Hostility towards protected individiuals, as determined by Goldman leadership."
	enforce = "The Goldman Posse expects obeying your superiors, keeping a cool head, and adhering to agreements and obligations expected of the group. Money and power is important, but so is the word of the Goldman Posse and not backing down from it."

/datum/outfit/job/ms13/goldman
	name = "GoldmanDatums"
	jobtype = /datum/job/ms13/goldman

/datum/outfit/job/ms13/goldman/pre_equip(mob/living/carbon/human/H)
	..()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/goldman/config_check()
	if(type == /datum/job/ms13/goldman)
		return FALSE
	return ..()

/datum/job/ms13/goldman/map_check()
	if(type == /datum/job/ms13/goldman)
		return FALSE
	return ..()

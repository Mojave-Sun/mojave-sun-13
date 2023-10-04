/datum/job/ms13/town
	selection_color = "#4feb64"
	departments_list = list(
		/datum/job_department/town,
	)
	forbid = "The laws of Snowcrest forbid: Gambling, the usage or possession of drugs (excluding Med-x and similar medical drugs), public intoxication, the brandishing of weapons or reckless discharge of firearms, slavery or human trafficking (except in the case of penal labor)."
	enforce = "The town of Snowcrest expects: Follow the laws of the town, listen to the Mayor, and to do your part to ensure the wellbeing and prosperity of the town."

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

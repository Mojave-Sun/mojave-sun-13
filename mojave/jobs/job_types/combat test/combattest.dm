/datum/job/ms13/combattest
	selection_color = "#a78765"
	departments_list = list(
		/datum/job_department/security,
	)

/datum/outfit/job/ms13/combattest
	name = "Default"
	jobtype = /datum/job/ms13/combattest


/datum/outfit/job/ms13/combattest/pre_equip(mob/living/carbon/human/H)
	..()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/combattest/config_check()
	if(type == /datum/job/ms13/combattest)
		return FALSE
	return ..()

/datum/job/ms13/combattest/map_check()
	if(type == /datum/job/ms13/combattest)
		return FALSE
	return ..()

/datum/job/ms13/bos
	selection_color = "#737592"
	departments_list = list(
		/datum/job_department/bos,
	)
	forbid = "Avoid unnecessary casualities. Experimentation on humans is forbidden."
	enforce = "Abide by the Codex. Listen to and respect your fellow brothers. Help the needy but do not place them above the cause."

/datum/outfit/job/ms13/bos
	name = "Default"
	jobtype = /datum/job/ms13/bos

	back = /obj/item/storage/ms13/bos

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

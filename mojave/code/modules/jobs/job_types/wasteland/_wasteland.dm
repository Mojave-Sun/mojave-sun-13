/datum/job/ms13/wasteland
	selection_color = "#e08960"
	departments_list = list(
		/datum/job_department/wasteland,
	)

/datum/outfit/job/ms13/wasteland
	name = "Default"
	jobtype = /datum/job/ms13/wasteland

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/wasteland/config_check()
	if(type == /datum/job/ms13/wasteland)
		return FALSE
	return ..()

/datum/job/ms13/wasteland/map_check()
	if(type == /datum/job/ms13/wasteland)
		return FALSE
	return ..()

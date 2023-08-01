/datum/job
	var/forbid = ""
	var/enforce = ""

/datum/job/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	if(ishuman(spawned))
		try_open_job_info(spawned, player_client)

/datum/job/proc/try_open_job_info(mob/living/carbon/human/spawned, client/player_client)
	if(!player_client)
		return
	spawned.open_job_info()

/datum/job/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "JobInfo", title)
		ui.set_autoupdate(FALSE)
		ui.open()

/datum/job/ui_state(mob/user)
	return GLOB.always_state

/datum/job/ui_static_data(mob/user)
	var/list/data = list()

	data["title"] = title
	data["description"] = description
	data["supervisors"] = supervisors
	data["forbid"] = forbid
	data["enforce"] = enforce

	return data

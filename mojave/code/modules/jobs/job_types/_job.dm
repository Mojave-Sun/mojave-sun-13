/datum/job
	var/forbid = ""
	var/enforce = ""

/datum/job/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	open_job_info(spawned, player_client)

/datum/job/proc/give_job_info(mob/living/spawned, client/player_client)
	spawned.open_job_info()

/datum/job/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "JobInfo", name)
		ui.open()

/datum/job/ui_state(mob/user)
	return GLOB.always_state

/datum/job/ui_static_data(mob/user)
	var/list/data = list()
	if(!target)
		return

	var/datum/job/job_target = target
	data["title"] = job_target.title
	data["description"] = job_target.description
	data["supervisors"] = job_target.supervisors
	data["forbid"] = job_target.forbid
	data["enforce"] = job_target.enforce
	return data

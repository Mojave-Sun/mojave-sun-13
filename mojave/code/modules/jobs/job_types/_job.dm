/datum/job
	var/forbid = ""
	var/enforce = ""

/datum/job/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	give_job_info(spawned, player_client)

/datum/job/proc/give_job_info(mob/living/spawned, client/player_client)
	var/datum/action/job_info/role_info = new(src)
	role_info.Grant(spawned)
	role_info.Trigger()

/datum/action/job_info
	name = "Open Role Information:"
	button_icon_state = "round_end"

/datum/action/job_info/New(Target)
	. = ..()
	var/datum/job/job_target = target
	name += " [job_target.title]"

/datum/action/job_info/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "JobInfo", name)
		ui.open()

/datum/action/job_info/ui_state(mob/user)
	return GLOB.always_state

/datum/action/job_info/ui_static_data(mob/user)
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

/datum/action/job_info/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return

	ui_interact(owner)

/datum/action/job_info/IsAvailable()
	if(!target)
		stack_trace("[type] was used without a target job datum!")
		return FALSE
	. = ..()
	if(!.)
		return
	if(!owner.mind?.assigned_role)
		return FALSE
	if(owner.mind.assigned_role != target)
		return FALSE
	return TRUE

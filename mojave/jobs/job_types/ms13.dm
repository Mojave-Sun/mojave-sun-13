/*
Mojave Sun Job Base Class
*/
/datum/job/ms13
	title = "Default - please implement the title in your dataum/job/ms13/yourjob file"
	supervisors = "N/A - please implement the supervisors in your dataum/job/ms13/yourjob file"
	description = "N/A - please give a description of the role in your dataum/job/ms13/yourjob file"
	forbid = "N/A - please note down what the role shout NOT be doing in your dataum/job/ms13/yourjob file"
	enforce = "N/A - please note down what the role should be doing in dataum/job/ms13/yourjob file"
	faction = FACTION_STATION // this has to be faction station for it to work properly with the prefs menu.
	paycheck = null
	paycheck_department = null
	job_flags = JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS

/datum/outfit/job/ms13
	name = "Default"
	jobtype = /datum/job/ms13

	//This is all nulled to override /datum/outfit/job giving everyone assistant gear.

	uniform = null
	id = null
	ears = null
	belt = null
	shoes = null
	box = null

	backpack = null
	satchel  = null
	duffelbag = null

	pda_slot = null

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/config_check()
	if(type == /datum/job/ms13)
		return FALSE
	return ..()

/datum/job/ms13/map_check()
	if(type == /datum/job/ms13)
		return FALSE
	return ..()

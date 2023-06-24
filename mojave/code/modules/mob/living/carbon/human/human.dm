/mob/living/carbon/human
	var/rotting = FALSE //dead body stink
	var/pre_spawn = FALSE

/mob/living/carbon/human/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/fixeye)
	AddComponent(/datum/component/mumbleboop)

/mob/living/carbon/human/verb/open_job_info()
	set category = "IC"
	set name = "Open Role Information"

	if(!mind?.assigned_role)
		return FALSE
	if(!istype(mind.assigned_role, /datum/job))
		return FALSE
	mind.assigned_role.ui_interact(src)

//miasma

/mob/living/carbon/human/process()
	. = ..()
	if(stat == DEAD && rotting)
		var/turf/my_turf = get_turf(src)
		my_turf.VapourListTurf(list(/datum/vapours/ms13/miasma = 50), VAPOUR_ACTIVE_EMITTER_CAP)

/mob/living/carbon/human/death(gibbed)
	. = ..()
	if(stat == DEAD && !pre_spawn)
		addtimer(CALLBACK(src, .proc/rot), rand(30 MINUTES, 45 MINUTES))
	if(stat == DEAD && pre_spawn)
		addtimer(CALLBACK(src, .proc/rot), rand(75 MINUTES, 90 MINUTES))

/mob/living/carbon/human/proc/rot()
	rotting = TRUE

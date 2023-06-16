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

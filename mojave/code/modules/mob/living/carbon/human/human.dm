/mob/living/carbon/human
	var/rotting = FALSE //dead body stink

/mob/living/carbon/human/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/fixeye)

//miasma

/mob/living/carbon/human/process()
	. = ..()
	if(stat == DEAD && rotting)
		var/turf/my_turf = get_turf(src)
		my_turf.VapourListTurf(list(/datum/vapours/ms13/miasma = 50), VAPOUR_ACTIVE_EMITTER_CAP)

/mob/living/carbon/human/death(gibbed)
	. = ..()
	if(stat == DEAD)
		addtimer(CALLBACK(src, .proc/rot), rand(45 MINUTES, 60 MINUTES))

/mob/living/carbon/human/proc/rot()
	rotting = TRUE

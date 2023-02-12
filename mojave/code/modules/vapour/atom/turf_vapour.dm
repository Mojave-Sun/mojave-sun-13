//open_turfs

/turf/open/VapourTurf(vapours_type, amount, cap)
	var/turf/upper_open_check = get_step_multiz(src, UP) // check if outside
	if(upper_open_check && istype(upper_open_check, /turf/open/openspace))
		return //dont Vapour
	if(!vapour)
		vapour = new(src)
	if(cap && vapour.total_amount >= cap)
		return
	vapour.AddVapours(vapours_type, amount)

/turf/open/VapourListTurf(list/vapours, cap)
	if(!vapour)
		vapour = new(src)
	if(cap && vapour.total_amount >= cap)
		return
	vapour.AddVapoursList(vapours)

/turf/open/IgniteTurf(power)
	if(turf_fire)
		turf_fire.AddPower(power)
		return
	if(isgroundlessturf(src) || isspaceturf(src))
		return
	new /obj/effect/abstract/turf_fire(src, power)

//turfs

/turf/proc/VapourTurf(vapours_type, amount, cap)
	return

/turf/proc/VapourListTurf(list/vapours, cap)
	return

/turf/proc/IgniteTurf(power)
	return

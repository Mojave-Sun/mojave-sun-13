//open_turfs

/turf/open/VapourTurf(vapours_type, amount, cap)
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

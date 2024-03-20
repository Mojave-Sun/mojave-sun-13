/datum/component/temporary_vapour_emission
	dupe_mode = COMPONENT_DUPE_ALLOWED
	/// The type of the vapour we're emitting
	var/vapours_type
	/// The amount we emitt every process
	var/vapours_amount
	/// When do we expire
	var/expiry_time

/datum/component/temporary_vapour_emission/Initialize(vapours_type, vapours_amount, expiry_time)
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE
	src.vapours_type = vapours_type
	src.vapours_amount = vapours_amount
	src.expiry_time = world.time + expiry_time
	RegisterSignal(parent, COMSIG_COMPONENT_CLEAN_ACT, PROC_REF(wash_off))
	START_PROCESSING(SSobj, src)

/datum/component/temporary_vapour_emission/Destroy()
	UnregisterSignal(parent, COMSIG_COMPONENT_CLEAN_ACT)
	STOP_PROCESSING(SSobj, src)
	return ..()

/datum/component/temporary_vapour_emission/process(delta_time = SSOBJ_DT)
	var/turf/my_turf = get_turf(parent)
	var/turf/upper_open_check = get_step_multiz(my_turf, UP) // check if outside
	if(upper_open_check && istype(upper_open_check, /turf/open/openspace))
		qdel(src)
		return //dont Vapour
	my_turf.VapourTurf(vapours_type, vapours_amount * delta_time)
	if(world.time >= expiry_time)
		qdel(src)

/datum/component/temporary_vapour_emission/proc/wash_off()
	if(ismob(parent))
		to_chat(parent, span_notice("The smell that lingered on your body fades."))
	qdel(src)

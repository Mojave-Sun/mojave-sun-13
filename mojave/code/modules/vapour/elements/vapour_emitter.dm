/datum/element/vapour_emitter
	element_flags = ELEMENT_DETACH | ELEMENT_BESPOKE
	id_arg_index = 2
	/// List of all affected atoms
	var/list/affected = list()
	/// Type of the spawned vapours
	var/vapours_type
	/// Amount of the vapours spawned per process
	var/vapours_amount

/datum/element/vapour_emitter/New()
	START_PROCESSING(SSvapour_emitters, src)

/datum/element/vapour_emitter/Attach(datum/target, vapours_type, vapours_amount)
	. = ..()
	if(!isatom(target))
		return ELEMENT_INCOMPATIBLE
	src.vapours_type = vapours_type
	src.vapours_amount = vapours_amount
	affected[target] = TRUE

/datum/element/vapour_emitter/Detach(datum/target)
	. = ..()
	affected -= target

/datum/element/vapour_emitter/process(delta_time)
	for(var/atom/affected_atom as anything in affected)
		var/turf/my_turf = get_turf(affected_atom)
		my_turf.VapourTurf(vapours_type, vapours_amount)

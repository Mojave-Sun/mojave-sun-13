PROCESSING_SUBSYSTEM_DEF(objectphysics)
	name = "Object Physics"
	wait = 1
	stat_tag = "OP"
	flags = SS_NO_INIT|SS_TICKER

/datum/controller/subsystem/processing/object/physics/fire(resumed = FALSE)
	if (!resumed)
		currentrun = processing.Copy()
	//cache for sanic speed (lists are references anyways)
	var/list/current_run = currentrun

	while(current_run.len)
		var/datum/thing = current_run[current_run.len]
		current_run.len--
		if(QDELETED(thing))
			processing -= thing
		else if(process_a_thing(thing) == PROCESS_KILL)
			// fully stop so that a future START_PROCESSING will work
			STOP_PROCESSING(src, thing)
		if (MC_TICK_CHECK)
			return

///Real fast ticking subsystem for moving movables via modifying pixel_x/y/z
PROCESSING_SUBSYSTEM_DEF(movablephysics)
	name = "Movable Physics"
	wait = 0.05 SECONDS
	stat_tag = "MP"
	priority = FIRE_PRIORITY_MOVABLE_PHYSICS
	flags = SS_NO_INIT
	var/cached_move_type //Micro optimizations; define variables outside of the process loop
	var/atom/movable/movable_parent

/datum/controller/subsystem/processing/movablephysics/fire(resumed = FALSE)
	if (!resumed)
		currentrun = processing.Copy()
	//cache for sanic speed (lists are references anyways)
	var/list/current_run = currentrun

	while(current_run.len)
		var/datum/component/thing = current_run[current_run.len]
		current_run.len--
		if(QDELETED(thing))
			processing -= thing
		else
			movable_parent = thing.parent
			cached_move_type = movable_parent.animate_movement
			movable_parent.animate_movement = NO_STEPS
			if(thing.process(wait * 0.1) == PROCESS_KILL)
				// fully stop so that a future START_PROCESSING will work
				STOP_PROCESSING(src, thing)
			movable_parent.animate_movement = cached_move_type
		if (MC_TICK_CHECK)
			return


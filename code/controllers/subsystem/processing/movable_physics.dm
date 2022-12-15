///Real fast ticking subsystem for moving movables via modifying pixel_x/y/z
PROCESSING_SUBSYSTEM_DEF(movablephysics)
	name = "Movable Physics"
	wait = 0.05 SECONDS
	stat_tag = "MP"
	priority = FIRE_PRIORITY_MOVABLE_PHYSICS

	/////The predicted directions that the movable atom will take; if it has a angle of movement of 0, it'll only travel north, if angle == 1, it'll travel north and east etc.
	//var/processing_by_expected_dir

/* very experimental performance optimizations
/datum/controller/subsystem/processing/movablephysics/Initialize()
	. = ..()
	processing_by_dir = list()
	for(var/dir in GLOB.diagonals)
		processing_by_dir[dir] = list()
*/

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
			if(thing.process(wait * 0.1) == PROCESS_KILL)
				// fully stop so that a future START_PROCESSING will work
				STOP_PROCESSING(src, thing)
		if (MC_TICK_CHECK)
			return


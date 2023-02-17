///Real fast ticking subsystem for moving movables via modifying pixel_x/y/z
PROCESSING_SUBSYSTEM_DEF(movablephysics)
	name = "Movable Physics"
	wait = 0.05 SECONDS
	stat_tag = "MP"
	priority = FIRE_PRIORITY_MOVABLE_PHYSICS
	///Setting this to true makes all newly initialized physics components to have set parameters, mainly for debugging without needing to recompile the code
	var/override_all_parameters = FALSE
	//Using _ helps keep the variables towards the top of the var editor so it's easy to get to and is organized
	///Currently setup to set initial velocity to rand(initial_velocity * 0.90, initial_velocity * 1.1
	var/_error_of_margain_velocity = 0.1
	var/_horizontal_velocity = 0
	var/_vertical_velocity = 0
	var/_horizontal_friction = 0
	var/_z_gravity = 9.80665
	var/_z_floor = -16

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


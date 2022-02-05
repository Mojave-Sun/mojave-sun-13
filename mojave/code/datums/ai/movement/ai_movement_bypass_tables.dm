//Subtyped movement datum that makes the AI teleport onto the table should there be one in the way
/datum/ai_movement/basic_avoidance/bypass_tables

//Copypaste the entire thing, could probably make this into a modular thing upstream
/datum/ai_movement/basic_avoidance/bypass_tables/pre_move(datum/move_loop/has_target/dist_bound/source)
	SIGNAL_HANDLER
	var/atom/movable/pawn = source.moving
	var/datum/ai_controller/controller = source.extra_info
	source.delay = controller.movement_delay
	source.distance = controller.blackboard[BB_CURRENT_MIN_MOVE_DISTANCE]

	var/can_move = TRUE
	if(controller.ai_traits & STOP_MOVING_WHEN_PULLED && pawn.pulledby)
		can_move = FALSE

	// Check if this controller can actually run, so we don't chase people with corpses
	if(!controller.able_to_run())
		controller.CancelActions()
		qdel(source) //stop moving
		return MOVELOOP_SKIP_STEP

	if(!isturf(pawn.loc)) //No moving if not on a turf
		can_move = FALSE

	var/turf/target_turf = get_step_towards(pawn, source.target)

	if(target_turf)
		for(var/atom/thing in target_turf.contents)
			if(istype(thing, /obj/structure/table))
				var/atom/movable/the_pawn = pawn
				thing.set_density(FALSE)
				step(the_pawn, get_dir(the_pawn.loc, thing.loc))
				thing.set_density(TRUE)
				return MOVELOOP_SKIP_STEP

	if(is_type_in_typecache(target_turf, GLOB.dangerous_turfs))
		can_move = FALSE

	if(can_move)
		return
	increment_pathing_failures(controller)
	return MOVELOOP_SKIP_STEP
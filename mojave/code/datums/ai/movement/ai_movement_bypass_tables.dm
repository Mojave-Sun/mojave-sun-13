//Subtyped movement datum that makes the AI teleport onto the table should there be one in the way
/datum/ai_movement/basic_avoidance/bypass_tables

//Copypaste the entire thing, could probably make this into a modular thing upstream
/datum/ai_movement/basic_avoidance/bypass_tables/pre_move(datum/move_loop/has_target/dist_bound/source, params)
	var/atom/movable/pawn = source.moving
	var/datum/ai_controller/controller = source.extra_info
	source.delay = controller.movement_delay
	source.distance = controller.blackboard[BB_CURRENT_MIN_MOVE_DISTANCE]

	var/can_move = TRUE
	if(controller.ai_traits & STOP_MOVING_WHEN_PULLED && pawn.pulledby)
		return MOVELOOP_SKIP_STEP

	if(controller.ai_traits & STOP_MOVING)
		return MOVELOOP_SKIP_STEP

	if(ismob(pawn))
		var/mob/mob_pawn = pawn
		if(controller.ai_traits & STOP_MOVING_DURING_DO_AFTER && LAZYLEN(mob_pawn.do_afters))
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
				var/preserved_density = thing.density
				thing.set_density(FALSE)
				step(the_pawn, get_dir(the_pawn.loc, thing.loc))
				thing.set_density(preserved_density)
				addtimer(CALLBACK(src, .proc/enable_movement, controller), 20)
				controller.ai_traits |= STOP_MOVING
				return MOVELOOP_SKIP_STEP
			if(istype(thing, /obj/structure/ms13/frame))
				var/atom/movable/the_pawn = pawn
				var/preserved_density = thing.density
				var/jump_height = 10
				thing.set_density(FALSE)
				var/dir_step = get_dir(the_pawn, thing.loc)
				var/same_loc = thing.loc == the_pawn.loc
				// on-border objects can be vaulted over and into the next turf.
				// The reverse dir check is for when normal behavior should apply instead (e.g. John Doe hops east of a railing facing west, ending on the same turf as it).
				if(thing.flags_1 & ON_BORDER_1 && (same_loc || !(dir_step & REVERSE_DIR(thing.dir))))
					//it can be vaulted over in two different cardinal directions. we choose one.
					if(ISDIAGONALDIR(thing.dir) && same_loc)
						if(params) //we check the icon x and y parameters of the click-drag to determine step_dir.
							var/list/modifiers = params2list(params)
							var/x_dist = (text2num(LAZYACCESS(modifiers, ICON_X)) - world.icon_size/2) * (thing.dir & WEST ? -1 : 1)
							var/y_dist = (text2num(LAZYACCESS(modifiers, ICON_Y)) - world.icon_size/2) * (thing.dir & SOUTH ? -1 : 1)
							dir_step = (x_dist >= y_dist ? (EAST|WEST) : (NORTH|SOUTH)) & thing.dir
						else //the_pawn is being moved by a forced_movement datum. dir_step will be the direction to the forced movement target.
							dir_step = get_dir(the_pawn, the_pawn.force_moving.target)
					else
						dir_step = get_dir(the_pawn, get_step(thing, thing.dir))
				step(the_pawn, dir_step)
				if(thing.dir == SOUTH)
					the_pawn.layer = 4.6
					jump_height = 15
				animate(the_pawn, pixel_y = jump_height, time = 1, easing = SINE_EASING)
				thing.set_density(preserved_density)
				addtimer(CALLBACK(src, .proc/end_jump, the_pawn), 2)
				addtimer(CALLBACK(src, .proc/enable_movement, controller), 20)
				controller.ai_traits |= STOP_MOVING
				return MOVELOOP_SKIP_STEP

	if(is_type_in_typecache(target_turf, GLOB.dangerous_turfs))
		can_move = FALSE

	if(can_move)
		return
	increment_pathing_failures(controller)
	return MOVELOOP_SKIP_STEP

/datum/ai_movement/basic_avoidance/bypass_tables/proc/enable_movement(datum/ai_controller/controller)
	controller.ai_traits &= ~STOP_MOVING

/datum/ai_movement/basic_avoidance/bypass_tables/proc/end_jump(var/atom/movable/the_pawn)
	the_pawn.pixel_y = the_pawn.base_pixel_y
	the_pawn.layer = initial(the_pawn.layer)

/datum/element/climbable
	element_flags = ELEMENT_BESPOKE|ELEMENT_DETACH
	id_arg_index = 2
	///Time it takes to climb onto the object
	var/climb_time = (2 SECONDS)
	///Stun duration for when you get onto the object
	var/climb_stun = (2 SECONDS)
	///Assoc list of object being climbed on - climbers.  This allows us to check who needs to be shoved off a climbable object when its clicked on.
	var/list/current_climbers
	//MOJAVE SUN EDIT: Makes stuns removable from climbing
	var/no_stun = FALSE
	//MOJAVE SUN EDIT: Makes an animation play when vaulting
	var/jump_over = FALSE
	//MOJAVE SUN EDIT: Jump Height for Animation
	var/jump_north
	//MOJAVE SUN EDIT: Jump Height for Animation
	var/jump_south
	//MOJAVE SUN EDIT: Jump Height for Animation
	var/jump_sides

/datum/element/climbable/Attach(datum/target, climb_time, climb_stun, no_stun, jump_over, jump_north, jump_south, jump_sides) //MOJAVE SUN EDIT: Climbing tweaks
	. = ..()

	if(!isatom(target) || isarea(target))
		return ELEMENT_INCOMPATIBLE
	if(climb_time)
		src.climb_time = climb_time
	if(climb_stun) //MOJAVE SUN EDIT: Makes stuns removable from climbing
		src.climb_stun = climb_stun
	if(no_stun) //MOJAVE SUN EDIT: Makes stuns removable from climbing
		src.no_stun = no_stun
	if(jump_over) //MOJAVE SUN EDIT: Makes an animation play when vaulting
		src.jump_over = jump_over //MOJAVE SUN EDIT: Makes an animation play when vaulting
	if(jump_north) //MOJAVE SUN EDIT: Makes an animation play when vaulting
		src.jump_north = jump_north //MOJAVE SUN EDIT: Makes an animation play when vaulting
	if(jump_south) //MOJAVE SUN EDIT: Animation jump height
		src.jump_south = jump_south //MOJAVE SUN EDIT: Animation jump height
	if(jump_sides) //MOJAVE SUN EDIT: Animation jump height
		src.jump_sides = jump_sides //MOJAVE SUN EDIT: Animation jump height

	RegisterSignal(target, COMSIG_ATOM_ATTACK_HAND, .proc/attack_hand)
	RegisterSignal(target, COMSIG_PARENT_EXAMINE, .proc/on_examine)
	RegisterSignal(target, COMSIG_MOUSEDROPPED_ONTO, .proc/mousedrop_receive)
	RegisterSignal(target, COMSIG_ATOM_BUMPED, .proc/try_speedrun)
	ADD_TRAIT(target, TRAIT_CLIMBABLE, ELEMENT_TRAIT(type))

/datum/element/climbable/Detach(datum/target)
	UnregisterSignal(target, list(COMSIG_ATOM_ATTACK_HAND, COMSIG_PARENT_EXAMINE, COMSIG_MOUSEDROPPED_ONTO, COMSIG_ATOM_BUMPED))
	REMOVE_TRAIT(target, TRAIT_CLIMBABLE, ELEMENT_TRAIT(type))
	return ..()

/datum/element/climbable/proc/on_examine(atom/source, mob/user, list/examine_texts)
	SIGNAL_HANDLER
	examine_texts += span_notice("[source] looks climbable.")

/datum/element/climbable/proc/can_climb(atom/source, mob/user)
	var/dir_step = get_dir(user, source.loc)
	//To jump over a railing you have to be standing next to it, not far behind it.
	if(source.flags_1 & ON_BORDER_1 && user.loc != source.loc && (dir_step & source.dir) == source.dir)
		return FALSE
	return TRUE

/datum/element/climbable/proc/attack_hand(atom/climbed_thing, mob/user)
	SIGNAL_HANDLER
	var/list/climbers = LAZYACCESS(current_climbers, climbed_thing)
	for(var/i in climbers)
		var/mob/living/structure_climber = i
		if(structure_climber == user)
			return
		user.changeNext_move(CLICK_CD_MELEE)
		user.do_attack_animation(climbed_thing)
		structure_climber.Paralyze(40)
		structure_climber.visible_message(span_warning("[structure_climber] is knocked off [climbed_thing]."), span_warning("You're knocked off [climbed_thing]!"), span_hear("You hear a cry from [structure_climber], followed by a slam."))


/datum/element/climbable/proc/climb_structure(atom/climbed_thing, mob/living/user, params)
	if(!can_climb(climbed_thing, user))
		return
	climbed_thing.add_fingerprint(user)
	user.visible_message(span_warning("[user] starts climbing onto [climbed_thing]."), \
								span_notice("You start climbing onto [climbed_thing]..."))
	var/adjusted_climb_time = climb_time
	var/adjusted_climb_stun = climb_stun
	if(HAS_TRAIT(user, TRAIT_HANDS_BLOCKED)) //climbing takes twice as long without help from the hands.
		adjusted_climb_time *= 2
	if(isalien(user))
		adjusted_climb_time *= 0.25 //aliens are terrifyingly fast
	if(HAS_TRAIT(user, TRAIT_FREERUNNING)) //do you have any idea how fast I am???
		adjusted_climb_time *= 0.8
		adjusted_climb_stun *= 0.8
	LAZYADDASSOCLIST(current_climbers, climbed_thing, user)
	if(do_after(user, adjusted_climb_time, climbed_thing))
		if(QDELETED(climbed_thing)) //Checking if structure has been destroyed
			return
		//MOJAVE SUN EDIT START: Climbing Animation and Stun changes/Fixes
		if(do_climb(climbed_thing, user, params))
			if(jump_over)
				var/jump_height
				switch(climbed_thing.dir)
					if(NORTH)
						user.layer = 4.6
						jump_height = jump_north
					if(SOUTH)
						user.layer = 4.6
						jump_height = jump_south
					if(EAST)
						jump_height = jump_sides
					if(WEST)
						jump_height = jump_sides
				playsound(user.loc, 'mojave/sound/ms13effects/vaulted.ogg', 80, TRUE)
				animate(user, pixel_y = jump_height, time = 1, easing = SINE_EASING)
				addtimer(CALLBACK(src, .proc/climb_shift_reset, user), 2)
			user.visible_message(span_warning("[user] climbs onto [climbed_thing]."), \
								span_notice("You climb onto [climbed_thing]."))
			log_combat(user, climbed_thing, "climbed onto")
			if(adjusted_climb_stun && !no_stun)
				user.Stun(adjusted_climb_stun)
			if(no_stun && jump_over)
				user.Stun(0.5) //stops them nyooming off, barely noticable
			//MOJAVE SUN EDIT END: Climbing Animation and Stun changes/Fixes
		else
			to_chat(user, span_warning("You fail to climb onto [climbed_thing]."))
	LAZYREMOVEASSOC(current_climbers, climbed_thing, user)

//MOJAVE SUN EDIT START: Climbing Animation and Stun changes/Fixes
/datum/element/climbable/proc/climb_shift_reset(mob/living/user)
	user.pixel_y = user.base_pixel_y
	user.layer = initial(user.layer)
//MOJAVE SUN EDIT END: Climbing Animation and Stun changes/Fixes

/datum/element/climbable/proc/do_climb(atom/climbed_thing, mob/living/user, params)
	if(!can_climb(climbed_thing, user))
		return
	climbed_thing.set_density(FALSE)
	var/dir_step = get_dir(user, climbed_thing.loc)
	var/same_loc = climbed_thing.loc == user.loc
	// on-border objects can be vaulted over and into the next turf.
	// The reverse dir check is for when normal behavior should apply instead (e.g. John Doe hops east of a railing facing west, ending on the same turf as it).
	if(climbed_thing.flags_1 & ON_BORDER_1 && (same_loc || !(dir_step & REVERSE_DIR(climbed_thing.dir))))
		//it can be vaulted over in two different cardinal directions. we choose one.
		if(ISDIAGONALDIR(climbed_thing.dir) && same_loc)
			if(params) //we check the icon x and y parameters of the click-drag to determine step_dir.
				var/list/modifiers = params2list(params)
				var/x_dist = (text2num(LAZYACCESS(modifiers, ICON_X)) - world.icon_size/2) * (climbed_thing.dir & WEST ? -1 : 1)
				var/y_dist = (text2num(LAZYACCESS(modifiers, ICON_Y)) - world.icon_size/2) * (climbed_thing.dir & SOUTH ? -1 : 1)
				dir_step = (x_dist >= y_dist ? (EAST|WEST) : (NORTH|SOUTH)) & climbed_thing.dir
			else //user is being moved by a forced_movement datum. dir_step will be the direction to the forced movement target.
				dir_step = get_dir(user, user.force_moving.target)
		else
			dir_step = get_dir(user, get_step(climbed_thing, climbed_thing.dir))
	. = step(user, dir_step)
	climbed_thing.set_density(TRUE)

///Handles climbing onto the atom when you click-drag
/datum/element/climbable/proc/mousedrop_receive(atom/climbed_thing, atom/movable/dropped_atom, mob/user, params)
	SIGNAL_HANDLER
	if(user == dropped_atom && isliving(dropped_atom))
		var/mob/living/living_target = dropped_atom
		if(isanimal(living_target))
			var/mob/living/simple_animal/animal = dropped_atom
			if (!animal.dextrous)
				return
		if(living_target.mobility_flags & MOBILITY_MOVE)
			INVOKE_ASYNC(src, .proc/climb_structure, climbed_thing, living_target, params)
			return

///Tries to climb onto the target if the forced movement of the mob allows it
/datum/element/climbable/proc/try_speedrun(datum/source, mob/bumpee)
	SIGNAL_HANDLER
	if(!istype(bumpee))
		return
	if(bumpee.force_moving?.allow_climbing)
		do_climb(source, bumpee)

#define EARTHS_GRAVITY 9.80665 //In meter / second^2, as if units mattered

/datum/element/object_physics
	element_flags = ELEMENT_DETACH
	///List of all moving objects being processed
	var/list/processing = list()
	/// The current stack of objects we are processing.
	var/list/currentrun
	/// Whether we stopped processing early the last tick.
	var/resumed = FALSE
	///Modifies the pixel_x/pixel_y of an object every process()
	var/list/horizontal_velocity = list()
	///Modifies the pixel_z of an object every process()
	var/list/vertical_velocity = list()
	///The horizontal_velocity is reduced by this every process(), this doesn't take into account the object being in the air vs gravity pushing it against the ground
	var/list/horizontal_friction = list()
	///The vertical_velocity is reduced by this every process()
	var/list/z_gravity = list()
	///The pixel_z that the object will no longer be influenced by gravity, for a 32x32 turf, keep this value between -16 to 16 so it'll stay present in the actual turf it's inside of
	var/list/z_floor = list()
	///The angle of the path the object takes on the x/y plane
	var/list/angle_of_movement = list()

/datum/element/object_physics/Attach(datum/target, _horizontal_velocity, _vertical_velocity, _horizontal_friction, _z_gravity, _z_floor, _angle_of_movement)
	. = ..()
	if(!length(processing))
		START_PROCESSING(SSobjectphysics, src)
	RegisterSignal(target, COMSIG_MOVABLE_IMPACT, .proc/throw_impact_ricochet, override = TRUE)
	processing += target
	horizontal_velocity[target] = _horizontal_velocity
	vertical_velocity[target] = _vertical_velocity
	horizontal_friction[target] = _horizontal_friction
	z_gravity[target] = _z_gravity
	z_floor[target] = _z_floor
	angle_of_movement[target] = _angle_of_movement

/datum/element/object_physics/Detach(datum/target)
	. = ..()
	UnregisterSignal(target, COMSIG_MOVABLE_IMPACT, .proc/throw_impact_ricochet)
	processing -= target
	horizontal_velocity -= target
	vertical_velocity -= target
	horizontal_friction -= target
	z_gravity -= target
	z_floor -= target
	angle_of_movement -= target
	if(!length(processing))
		STOP_PROCESSING(SSobjectphysics, src)

/datum/element/object_physics/process(delta_time)
	set waitfor = FALSE

	if(!resumed)
		currentrun = processing.Copy()

	resumed = FALSE
	var/list/cached_run = currentrun
	if(!length(cached_run))
		if(!length(processing))
			STOP_PROCESSING(SSobj, src)
			return
		return

	while(length(cached_run))
		var/atom/movable/moving_atom = cached_run[cached_run.len]
		cached_run.len--

		if(QDELETED(moving_atom))
			processing -= moving_atom
			if(!length(processing))
				STOP_PROCESSING(SSobjectphysics, src)
				return PROCESS_KILL
			if(CHECK_TICK)
				resumed = TRUE
				return
			continue

		angle_of_movement[moving_atom] = fix_angle(angle_of_movement[moving_atom], moving_atom)
		if(horizontal_velocity[moving_atom] <= 0 && moving_atom.pixel_z == 0)
			horizontal_velocity[moving_atom] = 0
			moving_atom.RemoveElement(/datum/element/object_physics)
			continue

		moving_atom.pixel_x += (horizontal_velocity[moving_atom] * (cos(angle_of_movement[moving_atom])))
		moving_atom.pixel_y += (horizontal_velocity[moving_atom] * (sin(angle_of_movement[moving_atom])))

		horizontal_velocity[moving_atom] = max(0, horizontal_velocity[moving_atom] - horizontal_friction[moving_atom])

		moving_atom.pixel_z = max(z_floor[moving_atom], moving_atom.pixel_z + vertical_velocity[moving_atom])
		if(moving_atom.pixel_z > z_floor[moving_atom])
			vertical_velocity[moving_atom] -= (z_gravity[moving_atom] * 0.1)

		if(moving_atom.pixel_z <= z_floor[moving_atom] && (vertical_velocity[moving_atom] < 0)) //z bounce
			z_floor_bounce(moving_atom)
			moving_atom.pixel_z = z_floor[moving_atom]
			vertical_velocity[moving_atom] = max(0, ((vertical_velocity[moving_atom] * -1) * 0.8) - 2)

		var/cached_move_type = moving_atom.animate_movement //No glitchy gliding
		moving_atom.animate_movement = NO_STEPS

		if(moving_atom.pixel_x > 16)
			if(moving_atom.Move(get_step(moving_atom, EAST)))
				moving_atom.pixel_x = -16
			else
				moving_atom.pixel_x = 16
				ricochet(moving_atom, 0)
		if(moving_atom.pixel_x < -16)
			if(moving_atom.Move(get_step(moving_atom, WEST)))
				moving_atom.pixel_x = 16
			else
				moving_atom.pixel_x = 0
				ricochet(moving_atom, 0)

		if(moving_atom.pixel_y > 16)
			if(moving_atom.Move(get_step(moving_atom, NORTH)))
				moving_atom.pixel_y = -16
			else
				moving_atom.pixel_y = 16
				ricochet(moving_atom, 180)
		if(moving_atom.pixel_y < -16)
			if(moving_atom.Move(get_step(moving_atom, SOUTH)))
				moving_atom.pixel_y = 16
			else
				moving_atom.pixel_y = -16
				ricochet(moving_atom, 180)

		moving_atom.animate_movement = cached_move_type

		if(CHECK_TICK)
			resumed = TRUE
			return

/datum/element/object_physics/proc/z_floor_bounce(atom/movable/moving_atom)
	angle_of_movement[moving_atom] += rand(-20, 20)
	horizontal_velocity[moving_atom] += max(0, (vertical_velocity[moving_atom] * -1) / 2)
	var/turf/a_turf = get_turf(moving_atom)
	playsound(moving_atom, a_turf.bullet_bounce_sound, 50, TRUE)

/datum/element/object_physics/proc/ricochet(atom/movable/moving_atom, bounce_angle)
	angle_of_movement[moving_atom] = ((180 - bounce_angle) - angle_of_movement[moving_atom])
	if(angle_of_movement[moving_atom] < 0)
		angle_of_movement[moving_atom] += 360
	//velocity loss for collision. might need to adjust this number. (maybe scaled based on current velocity??)
	horizontal_velocity[moving_atom] -= 1
	var/turf/a_turf = get_turf(moving_atom)
	playsound(src, a_turf.bullet_bounce_sound, 50, TRUE)

/datum/element/object_physics/proc/throw_impact_ricochet(datum/source, atom/hit_atom, datum/thrownthing/throwingdatum)
	SIGNAL_HANDLER
	var/atom/movable/atom_source = source
	ricochet(atom_source, get_angle(atom_source, throwingdatum.target_turf))

/datum/element/object_physics/proc/fix_angle(angle, atom/moving_atom)//fixes an angle below 0 or above 360
	if(!(angle_of_movement[moving_atom] > 360) && !(angle_of_movement[moving_atom] < 0))
		return angle //early return if it doesn't need to change
	var/new_angle
	if(angle_of_movement[moving_atom] > 360)
		new_angle = angle_of_movement[moving_atom] - 360
	if(angle_of_movement[moving_atom] < 0)
		new_angle = angle_of_movement[moving_atom] + 360
	return new_angle

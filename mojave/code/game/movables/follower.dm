/**
 * This is MOST LIKELY insane shitcode I am sorry.
 * Simply put, follower atoms help with standardizing hitboxes and such on large multi-tile atoms.
 *
 * REMIND ME TO TURN THIS INTO A COMPONENT IF WE CREATE EVEN A SINGLE ONE MORE MULTI-TILE OBJECT
 */
/atom/movable/follower
	name = "follower atom"
	desc = "if you are reading this, bob fucked up hard"
	density = FALSE
	opacity = FALSE
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	var/atom/master
	var/offset_x = 0//horizontal offset in tiles when facing SOUTH
	var/offset_y = 0//vertical offset in tiles when facing SOUTH

/atom/movable/follower/Initialize(mapload, atom/new_master, new_offset_x, new_offset_y)
	. = ..()
	moveToNullspace()
	if(!new_master)
		stack_trace("Tried to create /atom/movable/follower without a master atom!")
		return INITIALIZE_HINT_QDEL
	set_offset_x(new_offset_x)
	set_offset_y(new_offset_y)
	set_master(new_master)

/atom/movable/follower/Destroy(force)
	. = ..()
	if(master)
		set_master(null)

/atom/movable/follower/proc/set_master(atom/new_master)
	if(master)
		unregister_master()
	if(!new_master)
		return
	register_master(new_master)
	master = new_master
	master_dir_change(new_dir = master.dir)
	return TRUE

/atom/movable/follower/proc/register_master(atom/new_master)
	if(!new_master)
		return
	if(ismovable(new_master))
		RegisterSignal(new_master, COMSIG_MOVABLE_MOVED, .proc/master_moved)
	RegisterSignal(new_master, COMSIG_ATOM_DIR_CHANGE, .proc/master_dir_change)
	RegisterSignal(new_master, COMSIG_PARENT_QDELETING, .proc/no_gods_no_masters)
	return TRUE

/atom/movable/follower/proc/unregister_master()
	if(!master)
		return
	if(ismovable(master))
		UnregisterSignal(master, COMSIG_MOVABLE_MOVED)
	UnregisterSignal(master, COMSIG_ATOM_DIR_CHANGE)
	UnregisterSignal(master, COMSIG_PARENT_QDELETING)
	return TRUE

/atom/movable/follower/proc/set_offset_x(new_offset = 0)
	offset_x = new_offset
	if(master)
		master_dir_change(new_dir = master.dir)

/atom/movable/follower/proc/set_offset_y(new_offset = 0)
	offset_y = new_offset
	if(master)
		master_dir_change(new_dir = master.dir)

/atom/movable/follower/proc/master_moved(datum/source, new_dir)
	SIGNAL_HANDLER
	setDir(new_dir)
	update_loc()

/atom/movable/follower/proc/master_dir_change(datum/source, new_dir)
	SIGNAL_HANDLER
	setDir(new_dir)
	update_loc()

/atom/movable/follower/proc/no_gods_no_masters(datum/source)
	SIGNAL_HANDLER

	set_master(null)
	moveToNullspace()
	qdel(src)

/atom/movable/follower/proc/update_loc()
	var/turf/master_turf = get_turf(master)
	var/turf/final_destination
	if(master_turf)
		switch(master.dir)
			if(SOUTH)
				final_destination = locate(master_turf.x + offset_x, master_turf.y + offset_y, master_turf.z)
			if(NORTH)
				final_destination = locate(master_turf.x - offset_x, master_turf.y - offset_y, master_turf.z)
			if(EAST)
				final_destination = locate(master_turf.x + offset_y, master_turf.y + offset_x, master_turf.z)
			if(WEST)
				final_destination = locate(master_turf.x - offset_y, master_turf.y - offset_x, master_turf.z)
			//we can't handle diagonals go fuck yourself
			else
				final_destination = null
	if(final_destination)
		loc = final_destination //no forcemove to avoid calling entered and other crap
	else
		moveToNullspace()

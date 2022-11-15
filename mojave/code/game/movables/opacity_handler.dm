/**
 * This is MOST LIKELY insane shitcode i am sorry
 * This is necessary because bound_width and stuff don't account for opacity, therefore new atoms are required
 * to expand opacity outwards
 */
/atom/movable/opacity_handler
	name = "collision fucker"
	desc = "if you are reading this, bob fucked up hard"
	density = TRUE
	invisibility = INVISIBILITY_ABSTRACT
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	var/atom/master
	var/offset_x = 0//horizontal offset in tiles when facing SOUTH
	var/offset_y = 0//vertical offset in tiles when facing SOUTH

/atom/movable/opacity_handler/Initialize(atom/new_master, offset_x, offset_y)
	. = ..()
	moveToNullspace()
	if(!new_master)
		CRASH("Tried to create /atom/movable/opacity_handler without a master atom!")
	set_offset_x(offset_x)
	set_offset_y(offset_y)
	set_master(new_master)

/atom/movable/opacity_handler/proc/set_master(atom/new_master)
	RegisterSignal(new_master, COMSIG_ATOM_DIR_CHANGE, .proc/master_dir_change)
	RegisterSignal(new_master, COMSIG_ATOM_SET_OPACITY, .proc/master_opacity_change)
	RegisterSignal(new_master, COMSIG_PARENT_QDELETING, .proc/no_gods_no_masters)
	master = new_master
	set_opacity(new_master.opacity)

/atom/movable/opacity_handler/proc/set_offset_x(new_offset = 0)
	offset_x = new_offset
	if(master)
		master_dir_change(new_dir = master.dir)

/atom/movable/opacity_handler/proc/set_offset_y(new_offset = 0)
	offset_y = new_offset
	if(master)
		master_dir_change(new_dir = master.dir)

/atom/movable/opacity_handler/proc/master_dir_change(datum/source, new_dir)
	SIGNAL_HANDLER
	var/turf/master_turf = get_turf(master)
	var/turf/final_destination
	if(master_turf)
		switch(new_dir)
			if(SOUTH)
				final_destination = locate(master_turf.x + offset_x, master_turf.y + offset_y)
			if(NORTH)
				final_destination = locate(master_turf.x - offset_x, master_turf.y - offset_y)
			if(EAST)
				final_destination = locate(master_turf.x + offset_y, master_turf.y + offset_x)
			if(WEST)
				final_destination = locate(master_turf.x - offset_y, master_turf.y - offset_x)
			//we can't handle diagonals go fuck yourself
			else
				final_destination = null
	if(!final_destination)
		moveToNullspace()

/atom/movable/opacity_handler/proc/master_opacity_change(datum/source, new_opacity)
	SIGNAL_HANDLER

	set_opacity(new_opacity)

/atom/movable/opacity_handler/proc/no_gods_no_masters(datum/source)
	SIGNAL_HANDLER

	qdel(src)

/atom/movable/follower/density
	name = "density fucker"

/atom/movable/follower/density/register_master(atom/new_master)
	. = ..()
	if(!.)
		return
	RegisterSignal(new_master, COMSIG_ATOM_SET_DENSITY, .proc/master_density_change)
	master_density_change(new_master, new_master.opacity)

/atom/movable/follower/density/unregister_master()
	. = ..()
	if(!.)
		return
	UnregisterSignal(master, COMSIG_ATOM_SET_OPACITY)

/atom/movable/follower/density/proc/master_density_change(datum/source, new_density)
	SIGNAL_HANDLER

	set_density(new_density)

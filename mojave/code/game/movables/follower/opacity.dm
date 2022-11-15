/atom/movable/follower/opacity
	name = "opacity fucker"

/atom/movable/follower/opacity/register_master(atom/new_master)
	. = ..()
	if(!.)
		return
	RegisterSignal(new_master, COMSIG_ATOM_SET_OPACITY, .proc/master_opacity_change)
	master_opacity_change(new_master, new_master.opacity)

/atom/movable/follower/opacity/unregister_master()
	. = ..()
	if(!.)
		return
	UnregisterSignal(master, COMSIG_ATOM_SET_OPACITY)

/atom/movable/follower/opacity/proc/master_opacity_change(datum/source, new_opacity)
	SIGNAL_HANDLER

	set_opacity(new_opacity)

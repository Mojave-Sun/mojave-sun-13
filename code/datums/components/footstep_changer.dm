/// This component changes the footstep sound of whatever turf parent is on
/datum/component/footstep_changer
	/// Sound we should change the turf's footstep to
	var/footstep
	/// Old footstep sound of the open turf we entered
	var/old_footstep
	/// Bare footstep we should change the turf's barefootstep to
	var/barefootstep
	/// Old barefootstep sound of the open turf we entered
	var/old_barefootstep
	/// Connect_loc_behalf component required for this to work
	var/datum/component/connect_loc_behalf/connect_loc_behalf

/datum/component/footstep_changer/Initialize(footstep = FOOTSTEP_FLOOR, barefootstep = FOOTSTEP_HARD_BAREFOOT)
	. = ..()
	if(!ismovable(parent))
		return COMPONENT_INCOMPATIBLE
	src.footstep = footstep
	src.barefootstep = barefootstep
	on_entered(get_turf(parent), parent)

/datum/component/footstep_changer/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_PARENT_QDELETING, .proc/parent_deleted)
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = .proc/on_entered,
	)
	connect_loc_behalf = AddComponent(/datum/component/connect_loc_behalf, parent, loc_connections)

/datum/component/footstep_changer/UnregisterFromParent()
	. = ..()
	var/turf/open/open_turf_loc = get_turf(parent)
	if(istype(open_turf_loc) && SEND_SIGNAL(open_turf_loc, COMSIG_FOOTSTEP_CHANGER_IS_FOOTSTEP_CHANGED, src))
		clear_footstep(open_turf_loc)
	UnregisterSignal(parent, COMSIG_PARENT_QDELETING)
	QDEL_NULL(connect_loc_behalf)

/datum/component/footstep_changer/proc/on_entered(turf/open/source, atom/movable/arrived, turf/open/old_loc, list/atom/old_locs)
	SIGNAL_HANDLER

	if(istype(old_loc) && SEND_SIGNAL(old_loc, COMSIG_FOOTSTEP_CHANGER_IS_FOOTSTEP_CHANGED, src))
		clear_footstep(old_loc)
	if(!istype(source))
		return
	SEND_SIGNAL(source, COMSIG_FOOTSTEP_CHANGER_CLEAR_FOOTSTEP)
	if(SEND_SIGNAL(source, COMSIG_FOOTSTEP_CHANGER_IS_FOOTSTEP_CHANGED))
		return
	register_footstep(source)

/datum/component/footstep_changer/proc/parent_deleted(atom/movable/source)
	SIGNAL_HANDLER

	var/turf/open/source_turf = source.loc
	if(!istype(source_turf) || !SEND_SIGNAL(source_turf, COMSIG_FOOTSTEP_CHANGER_IS_FOOTSTEP_CHANGED, src))
		return
	clear_footstep(source_turf)

/datum/component/footstep_changer/proc/is_footstep_changed(turf/open/source, datum/component/footstep_changer)
	SIGNAL_HANDLER

	if(!footstep_changer || (footstep_changer == src))
		return TRUE

	return FALSE

/datum/component/footstep_changer/proc/register_footstep(turf/open/source)
	old_footstep = source.footstep
	old_barefootstep = source.barefootstep
	source.footstep = footstep
	source.barefootstep = barefootstep
	RegisterSignal(source, COMSIG_FOOTSTEP_CHANGER_IS_FOOTSTEP_CHANGED, .proc/is_footstep_changed)
	RegisterSignal(source, COMSIG_FOOTSTEP_CHANGER_CLEAR_FOOTSTEP, .proc/clear_footstep)

/datum/component/footstep_changer/proc/clear_footstep(turf/open/source)
	SIGNAL_HANDLER

	source.footstep = old_footstep
	source.barefootstep = barefootstep
	old_footstep = null
	old_barefootstep = null
	UnregisterSignal(source, COMSIG_FOOTSTEP_CHANGER_IS_FOOTSTEP_CHANGED)
	UnregisterSignal(source, COMSIG_FOOTSTEP_CHANGER_CLEAR_FOOTSTEP)

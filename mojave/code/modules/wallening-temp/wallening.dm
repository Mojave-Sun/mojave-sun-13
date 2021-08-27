/atom/movable/screen/plane_master/frill_under
	name = "frill under plane master"
	plane = UNDER_FRILL_PLANE
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_OVERLAY
	render_target = UNDER_FRILL_RENDER_TARGET

/atom/movable/screen/plane_master/frill_under/backdrop(mob/mymob)
	if(!mymob)
		CRASH("Plane master backdrop called without a mob attached.")
	remove_filter(FRILL_MOB_MASK)
	add_filter(FRILL_MOB_MASK, 1, alpha_mask_filter(render_source = FRILL_MASK_RENDER_TARGET, flags = MASK_INVERSE))

/atom/movable/screen/plane_master/frill_mask
	name = "frill mask plane master"
	plane = FRILL_MASK_PLANE
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_OVERLAY
	render_target = FRILL_MASK_RENDER_TARGET

/atom/movable/screen/plane_master/frill_under/backdrop(mob/mymob)
	if(!mymob)
		CRASH("Plane master backdrop called without a mob attached.")
	remove_filter(FRILL_MOB_MASK)
	add_filter(FRILL_MOB_MASK, 1, alpha_mask_filter(render_source = FRILL_MASK_RENDER_TARGET, flags = MASK_INVERSE))

/atom/movable/screen/plane_master/frill/backdrop(mob/mymob)
	if(!mymob)
		CRASH("Plane master backdrop called without a mob attached.")
	remove_filter(FRILL_FLOOR_CUT)
	remove_filter(FRILL_GAME_CUT)
	remove_filter(FRILL_MOB_MASK)
	if(!mymob.client?.prefs)
		return
	var/datum/preferences/client_prefs = mymob.client.prefs
	if(!client_prefs.frills_over_floors)
		add_filter(FRILL_FLOOR_CUT, 1, alpha_mask_filter(render_source = FLOOR_PLANE_RENDER_TARGET, flags = MASK_INVERSE))
	//add_filter(FRILL_GAME_CUT, 1, alpha_mask_filter(render_source = EMISSIVE_BLOCKER_RENDER_TARGET, flags = MASK_INVERSE))
	add_filter(FRILL_MOB_MASK, 1, alpha_mask_filter(render_source = FRILL_MASK_RENDER_TARGET, flags = MASK_INVERSE))

/datum/keybinding/client/toggle_frills_over_floors
	hotkey_keys = list("`")
	name = "toggle_frills_over_floors"
	full_name = "Toggle Frills over Floors"
	description = "Toggles the Frill-over-Floors preference"
	keybind_signal = COMSIG_KB_CLIENT_MINIMALHUD_DOWN

/datum/keybinding/client/toggle_frills_over_floors/down(client/user)
	. = ..()
	if(. || !user.prefs)
		return
	user.prefs.frills_over_floors = !user.prefs.frills_over_floors
	if(length(user?.screen))
		var/atom/movable/screen/plane_master/frill/frill = locate(/atom/movable/screen/plane_master/frill) in user.screen
		frill.backdrop(user.mob)
	return TRUE

/*
Some details about how to use these lists
We're essentially trying to predict how doors/doorlike things will be placed/surounded, and use that to set their direction
It's a little finiky, and you may need to override the lists or worst case senario manually edit something's dir
But it should behave like you expect
*/

///What to connect with by default. Used by /atom/proc/auto_align(). This can be overriden
GLOBAL_LIST_INIT(default_connectables, typecacheof(list(
		/obj/machinery/door/airlock,
		/obj/machinery/door/poddoor,
		/obj/machinery/smartfridge,
		/obj/structure/girder/reinforced,
		/obj/structure/plasticflaps,
		/obj/machinery/power/shieldwallgen,
		/obj/structure/door_assembly,
	)))
///What to connect with at a lower priority by default. Used for stuff that we want to consider, but only if we don't find anything else
GLOBAL_LIST_INIT(lower_priority_connectables, typecacheof(list(
		/obj/machinery/door/window,
		/obj/structure/table,
		/obj/structure/window,
		/obj/structure/girder,
	)))

///Ok so this whole proc is about finding tiles that we could in theory be connected to, and blocking off that direction right?
///It's not perfect, and it can make mistakes, but it does a pretty good job predicting a mapper's intentions
/atom/proc/auto_align(connectables_typecache, lower_priority_typecache)
	if(manual_align)
		return
	if(!connectables_typecache)
		connectables_typecache = GLOB.default_connectables
	if(!lower_priority_typecache)
		lower_priority_typecache = GLOB.lower_priority_connectables

	var/list/dirs_usable = GLOB.cardinals.Copy()
	var/list/dirs_secondary_priority = GLOB.cardinals.Copy()
	for(var/dir_to_check in GLOB.cardinals)
		var/turf/turf_to_check = get_step(src, dir_to_check)
		if(turf_to_check.density) //Dense turfs are connectable
			dirs_usable -= dir_to_check
			continue
		for(var/atom/movable/thing_to_check in turf_to_check)
			if(is_type_in_typecache(thing_to_check, connectables_typecache))
				dirs_usable -= dir_to_check //So are things in the default typecache
				break
			if(is_type_in_typecache(thing_to_check, lower_priority_typecache))
				dirs_secondary_priority -= dir_to_check //Assuming we find nothing else, note down the secondary priority stuff

	var/dirs_avalible = length(dirs_usable)
	//Only continue if we've got ourself either a corner or a side piece. Only side pieces really work well here, since corners aren't really something we can fudge handling for
	if(dirs_avalible <= 2 && dirs_avalible != 0)
		dir = dirs_usable[1] //Just take the first dir avalible
		return
	dirs_usable &= dirs_secondary_priority //Only consider dirs we both share
	dirs_avalible = length(dirs_usable)
	if(dirs_avalible <= 2 && dirs_avalible != 0)
		dir = dirs_usable[1] //Just take the first dir avalible
		return

/obj/machinery/door/LateInitialize(mapload)
	. = ..()
	if(mapload)
		auto_align()

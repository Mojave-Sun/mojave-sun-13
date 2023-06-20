/**
 * This object exists because sadly, there is no support for displacement filters changing direction according to owner atom.
 * Just use a filter if you don't care about having a matching dir. Please.
 *
 * Working on this has made me lose my mind because the technical issues were way more than i anticipated.
 */
/obj/effect/abstract/displacement_map
	name = "displacement map"
	icon = 'mojave/icons/effects/distortion/distort.dmi'
	//read up on _onclick/hud/render/plane_master.dm to know why this is necessary
	plane = DISPLACEMENT_MAP_PLANE
	//needs KEEP_APART because humans are quirky doe hehe! RESET_COLOR and RESET_ALPHA are pretty obvious on why they're necessary
	appearance_flags = TILE_BOUND|PIXEL_SCALE|KEEP_APART|RESET_COLOR|RESET_ALPHA
	vis_flags = VIS_INHERIT_DIR
	anchored = TRUE
	density = FALSE
	opacity = FALSE
	blocks_emissive = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	/// Atom we are currently applying the displacement filter on
	var/atom/movable/owner
	/// X of the filter
	var/displacement_x = 0
	/// Y of the filter
	var/displacement_y = 0
	/// Size of the filter
	var/displacement_size = 1

/obj/effect/abstract/displacement_map/Initialize(mapload, atom/movable/new_owner)
	. = ..()
	/// Displacement maps are of no use if you don't apply them to an atom
	if(!istype(new_owner))
		return INITIALIZE_HINT_QDEL
	// Going inside the atom's contents creates issues so we go to nullspace
	moveToNullspace()
	render_target = "[REF(src)]"
	set_owner(new_owner)

/obj/effect/abstract/displacement_map/Destroy(force)
	. = ..()
	if(owner)
		set_owner(null)
	owner = null

/obj/effect/abstract/displacement_map/proc/set_owner(atom/movable/new_owner)
	if(owner)
		LAZYREMOVE(owner.displacement_maps, type)
		UnregisterSignal(owner, COMSIG_PARENT_QDELETING)
		remove_displacement(owner)
		owner.vis_contents -= src
		owner = null
	if(!new_owner)
		return
	owner = new_owner
	LAZYSET(owner.displacement_maps, type, src)
	RegisterSignal(owner, COMSIG_PARENT_QDELETING, .proc/owner_qdeleted)
	/// We need to be inside owner's vis_contents due to the way render_source and render_target work
	/// (they only work if the render_source is in view)
	owner.vis_contents += src
	apply_displacement(owner)

/obj/effect/abstract/displacement_map/proc/apply_displacement(atom/movable/applied)
	if(!applied)
		return
	/// In case priority starts mattering for these, how about you go fuck yourself
	applied.add_filter("[REF(src)]", length(applied.filter_data), displacement_map_filter(render_source = render_target, x = displacement_x, y = displacement_y, size = displacement_size))

/obj/effect/abstract/displacement_map/proc/remove_displacement(atom/movable/removed)
	if(!removed)
		return
	removed.remove_filter("[REF(src)]")

/obj/effect/abstract/displacement_map/proc/get_displacement_filter()
	return filter(type = "displace", render_source = render_target, x = displacement_x, y = displacement_y, size = displacement_size)

///rest in piss bozo #packwatch
/obj/effect/abstract/displacement_map/proc/owner_qdeleted()
	SIGNAL_HANDLER

	qdel(src)

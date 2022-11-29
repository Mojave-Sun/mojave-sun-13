/**
 * This object exists because sadly, there is no support for displacement filters changing direction according to owner atom
 */
/obj/effect/abstract/displacement_map
	name = "displacement map"
	icon = 'mojave/icons/effects/distortion/distort.dmi'
	vis_flags = VIS_HIDE | VIS_INHERIT_DIR
	opacity = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	/// Atom we are currently applying the displacement filter on
	var/atom/owner
	/// X of the filter
	var/displacement_x = 0
	/// Y of the filter
	var/displacement_y = 0
	/// Size of the filter
	var/displacement_size = 1

/obj/effect/abstract/displacement_map/Initialize(mapload, atom/movable/new_owner)
	. = ..()
	/// Displacement maps are of no use if you don't apply them to anything
	if(!istype(new_owner))
		return INITIALIZE_HINT_QDEL
	/// We should never be outside of nullspace
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
		owner = null
		remove_displacement(owner)
	if(!new_owner)
		return
	owner = new_owner
	apply_displacement(new_owner)

/obj/effect/abstract/displacement_map/proc/apply_displacement(atom/movable/applied)
	if(!applied)
		return
	/// In case priority starts mattering for these, how about you go fuck yourself
	applied.add_filter("[REF(src)]", length(applied.filter_data), displacement_map_filter(render_source = render_target, x = displacement_x, y = displacement_y, size = displacement_size))
	/// We need to be inside owner's vis_contents due to the way render_source and render_target work
	/// (they only work if the render_source is in view)
	applied.vis_contents += src

/obj/effect/abstract/displacement_map/proc/remove_displacement(atom/movable/removed)
	if(!removed)
		return
	removed.remove_filter("[REF(src)]")
	removed.vis_contents -= src

/obj/effect/abstract/displacement_map/proc/get_displacement_filter()
	return filter(type = "displace", render_source = render_target, x = displacement_x, y = displacement_y, size = displacement_size)

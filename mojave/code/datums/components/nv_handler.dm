GLOBAL_LIST_EMPTY(nv_fov_icons)

// doing shit with code is easier than opening up photoshop #thuglife
/proc/get_nv_icon(fov_type = FOV_180_DEGREES)
	if(GLOB.nv_fov_icons["[fov_type]"])
		return GLOB.nv_fov_icons["[fov_type]"]
	//USING initial(icon) WILL NOT WORK HERE!!!!
	var/icon/original = icon('mojave/icons/effects/ms_fov.dmi', "[fov_type]")
	var/icon/final = icon(original)
	final.MapColors(-1,0,0, 0,-1,0, 0,0,-1, 1,1,1) //invert colors
	GLOB.nv_fov_icons["[fov_type]"] = final
	return final

/// Component which handles night vision masking for clients, mostly copy paste from the FOV handler
/datum/component/nv_handler
	/// Currently applied x size of the fov masks
	var/current_fov_x = BASE_FOV_MASK_X_DIMENSION
	/// Currently applied y size of the fov masks
	var/current_fov_y = BASE_FOV_MASK_Y_DIMENSION
	/// Whether we are applying the masks now
	var/applied_mask = FALSE
	/// The angle of the mask we are applying
	var/fov_angle = FOV_180_DEGREES
	/// The mask applied to a client's screen
	var/atom/movable/screen/night_vision/nv_mask

/datum/component/nv_handler/Initialize(fov_type = FOV_180_DEGREES, alpha = 255, color = "#aaffaa")
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	var/mob/living/mob_parent = parent
	var/client/parent_client = mob_parent.client
	if(!parent_client) //Love client volatility!!
		qdel(src) //no QDEL hint for components, and we dont want this to print a warning regarding bad component application
		return

	nv_mask = new
	if(!isnull(alpha))
		nv_mask.alpha = alpha
	if(!isnull(color))
		nv_mask.color = color
	set_nv_angle(fov_type)
	on_dir_change(mob_parent, mob_parent.dir, mob_parent.dir)
	update_nv_size()
	update_mask()

/datum/component/nv_handler/Destroy()
	if(applied_mask)
		remove_mask()
	if(nv_mask) // In a case of early deletion due to volatile client
		QDEL_NULL(nv_mask)
	return ..()

/datum/component/nv_handler/proc/set_nv_angle(new_angle)
	fov_angle = new_angle
	nv_mask.icon = get_nv_icon(new_angle)

/// Updates the size of the FOV masks by comparing them to client view size.
/datum/component/nv_handler/proc/update_nv_size()
	SIGNAL_HANDLER

	var/mob/parent_mob = parent
	var/client/parent_client = parent_mob.client
	if(!parent_client) //Love client volatility!!
		return
	var/list/view_size = getviewsize(parent_client.view)
	if(view_size[1] == current_fov_x && view_size[2] == current_fov_y)
		return
	current_fov_x = BASE_FOV_MASK_X_DIMENSION
	current_fov_y = BASE_FOV_MASK_Y_DIMENSION
	var/matrix/new_matrix = new
	var/x_shift = view_size[1] - current_fov_x
	var/y_shift = view_size[2] - current_fov_y
	var/x_scale = view_size[1] / current_fov_x
	var/y_scale = view_size[2] / current_fov_y
	current_fov_x = view_size[1]
	current_fov_y = view_size[2]
	nv_mask.transform = new_matrix.Scale(x_scale, y_scale)
	nv_mask.transform = new_matrix.Translate(x_shift * 16, y_shift * 16)

/// Updates the mask application to client by checking `stat` and `eye`
/datum/component/nv_handler/proc/update_mask()
	SIGNAL_HANDLER

	var/mob/parent_mob = parent
	var/client/parent_client = parent_mob.client
	if(!parent_client) //Love client volatility!!
		return

	var/atom/top_most_atom = get_atom_on_turf(parent_mob)
	var/user_extends_eye = parent_client.eye != top_most_atom
	var/should_apply_mask = !user_extends_eye
	if(should_apply_mask == applied_mask)
		return

	if(should_apply_mask)
		add_mask()
	else
		remove_mask()

/datum/component/nv_handler/proc/remove_mask()
	var/mob/parent_mob = parent
	var/client/parent_client = parent_mob.client
	if(!parent_client) //Love client volatility!!
		return

	applied_mask = FALSE
	parent_client.screen -= nv_mask

/datum/component/nv_handler/proc/add_mask()
	var/mob/parent_mob = parent
	var/client/parent_client = parent_mob.client
	if(!parent_client) //Love client volatility!!
		return
	applied_mask = TRUE
	parent_client.screen += nv_mask

/// When a direction of the user changes, so do the masks
/datum/component/nv_handler/proc/on_dir_change(mob/source, old_dir, new_dir)
	SIGNAL_HANDLER

	//we want to be in FRONT of the user
	nv_mask.dir = REVERSE_DIR(new_dir)

/// When a mob logs out, delete the component
/datum/component/nv_handler/proc/mob_logout(mob/source)
	SIGNAL_HANDLER

	qdel(src)

/datum/component/nv_handler/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_ATOM_DIR_CHANGE, .proc/on_dir_change)
	RegisterSignal(parent, COMSIG_LIVING_DEATH, .proc/update_mask)
	RegisterSignal(parent, COMSIG_LIVING_REVIVE, .proc/update_mask)
	RegisterSignal(parent, COMSIG_MOB_CLIENT_CHANGE_VIEW, .proc/update_nv_size)
	RegisterSignal(parent, COMSIG_MOB_RESET_PERSPECTIVE, .proc/update_mask)
	RegisterSignal(parent, COMSIG_MOB_LOGOUT, .proc/mob_logout)

/datum/component/nv_handler/UnregisterFromParent()
	. = ..()
	UnregisterSignal(parent, list(COMSIG_MOB_RESET_PERSPECTIVE, COMSIG_ATOM_DIR_CHANGE, COMSIG_LIVING_DEATH, COMSIG_LIVING_REVIVE, COMSIG_MOB_LOGOUT))

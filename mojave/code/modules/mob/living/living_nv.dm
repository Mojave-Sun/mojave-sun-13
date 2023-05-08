/// Updates the applied NV value and applies the handler to client if able
/mob/living/proc/update_nv()
	var/highest_fov_type
	var/highest_fov_data
	for(var/trait_type in nv_traits)
		var/fov_data = nv_traits[trait_type]
		if(fov_data["type"] > highest_fov_type)
			highest_fov_type = fov_data["type"]
			highest_fov_data = fov_data
	nv_fov_data = highest_fov_data
	update_nv_client()

/// Updates the FOV for the client.
/mob/living/proc/update_nv_client()
	if(!client)
		return
	var/datum/component/nv_handler/nv_handler = GetComponent(/datum/component/nv_handler)
	if(nv_fov_data)
		if(!nv_handler)
			AddComponent(/datum/component/nv_handler, nv_fov_data["type"], nv_fov_data["alpha"], nv_fov_data["color"])
		else
			nv_handler.set_nv_angle(nv_fov_data["type"])
			nv_handler.nv_mask.alpha = nv_fov_data["alpha"]
			nv_handler.nv_mask.color = nv_fov_data["color"]
	else if(nv_handler)
		qdel(nv_handler)

/// Adds a trait to apply nv component
/mob/living/proc/add_nv_trait(source, type, alpha, color)
	LAZYINITLIST(nv_traits)
	nv_traits[source] = list("type" = type, "alpha" = alpha, "color" = color)
	update_nv()

/// Removes a trait which applies nv component
/mob/living/proc/remove_nv_trait(source)
	if(!nv_traits) //Clothing equip/unequip is bad code and invokes this several times
		return
	nv_traits -= source
	UNSETEMPTY(nv_traits)
	update_nv()

/atom/movable/screen/night_vision
	icon = 'mojave/icons/effects/ms_fov.dmi'
	icon_state = "90_v"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = O_LIGHTING_VISUAL_PLANE
	layer = 3
	screen_loc = "BOTTOM,LEFT"

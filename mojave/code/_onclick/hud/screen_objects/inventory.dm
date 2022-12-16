/atom/movable/screen/inventory/hand/update_icon_state()
	. = ..()
	base_icon_state = !(held_index % RIGHT_HANDS) ? "rhand" : "lhand"
	icon_state = base_icon_state
	if(!hud?.mymob)
		return

	if(hud.wield_active)
		icon_state += "_wield"
	else if(hud.mymob.active_hand_index == held_index)
		icon_state += "_active"

/atom/movable/screen/wield
	name = "wield"
	icon = 'mojave/icons/hud/ms_ui_buttons.dmi'
	icon_state = "act_wield"
	base_icon_state = "act_wield"
	screen_loc = ui_wield
	var/active = FALSE

/atom/movable/screen/wield/update_name(updates)
	. = ..()
	if(active)
		name = "unwield active item"
	else
		name = "wield active item"

/atom/movable/screen/wield/update_icon_state()
	. = ..()
	if(active)
		icon_state = "[base_icon_state]_on"
	else
		icon_state = base_icon_state

/atom/movable/screen/wield/Click()
	. = ..()
	if(isliving(usr))
		var/mob/living/user = usr
		user.wield_active_hand()


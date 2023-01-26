/atom/movable/screen/resist
	name = "resist"
	icon = 'mojave/icons/hud/ms_ui_combat.dmi'
	icon_state = "resist"
	base_icon_state = "resist"
	plane = HUD_PLANE

/atom/movable/screen/resist/Click()
	if(isliving(usr))
		var/mob/living/L = usr
		L.resist()

/atom/movable/screen/wield
	name = "wield"
	icon = 'mojave/icons/hud/ms_ui_combat.dmi'
	icon_state = "wield"
	base_icon_state = "wield"
	plane = HUD_PLANE

/atom/movable/screen/wield/Click()
	if(isliving(usr))
		var/mob/living/L = usr
		L.wield_active_hand()

/atom/movable/screen/wield/update_icon_state()
	. = ..()
	if(hud?.wield_active)
		icon_state = "[base_icon_state]_active"
	else
		icon_state = base_icon_state

/atom/movable/screen/ms13/button_background
	name = "background"
	icon = 'mojave/icons/hud/ms_ui_base.dmi'
	icon_state = "background"
	plane = HUD_BACKGROUND_PLANE
	screen_loc = "WEST-3,SOUTH"
	mouse_opacity = 0

/atom/movable/screen/ms13/slot_background
	name = "base"
	icon = 'mojave/icons/hud/ms_ui_inventory.dmi'
	icon_state = "base"
	plane = HUD_BACKGROUND_PLANE
	screen_loc = "WEST,SOUTH"
	mouse_opacity = 0

/atom/movable/screen/ms13/hand_background
	name = "base"
	icon = 'mojave/icons/hud/ms_ui_hands.dmi'
	icon_state = "base"
	plane = HUD_BACKGROUND_PLANE
	screen_loc = "CENTER:-80,SOUTH"
	mouse_opacity = 0

/atom/movable/screen/combattoggle/ms13
	icon = 'mojave/icons/hud/ms_ui_combat.dmi'
	icon_state = "combat_off"

/atom/movable/screen/human/toggle/ms13
	icon = 'mojave/icons/hud/ms_ui_buttons.dmi'
	icon_state = "inventory"

/atom/movable/screen/human/toggle/ms13/Click()

	var/mob/targetmob = usr

	if(isobserver(usr))
		if(ishuman(usr.client.eye) && (usr.client.eye != usr))
			var/mob/M = usr.client.eye
			targetmob = M

	if(usr.hud_used.inventory_shown && targetmob.hud_used)
		usr.hud_used.inventory_shown = FALSE
		usr.client.screen -= targetmob.hud_used.toggleable_inventory
		icon_state = "inventory"
	else
		usr.hud_used.inventory_shown = TRUE
		usr.client.screen += targetmob.hud_used.toggleable_inventory
		icon_state = "inventory_on"

	targetmob.hud_used.hidden_inventory_update(usr)

/atom/movable/screen/rest/ms13
	icon = 'mojave/icons/hud/ms_ui_buttons.dmi'
	icon_state = "rest"
	base_icon_state = "rest"
	screen_loc = "WEST-3,SOUTH"

/atom/movable/screen/pull/ms13
	icon = 'mojave/icons/hud/ms_ui_buttons.dmi'
	icon_state = "pull"
	base_icon_state = "pull"
	screen_loc = "WEST-3,SOUTH"

//atom/movable/screen/resist/ms13

//atom/movable/screen/drop/ms13

/atom/movable/screen/throw_catch/ms13
	icon = 'mojave/icons/hud/ms_ui_buttons.dmi'
	icon_state = "act_throw_off"
	screen_loc = "WEST-3,SOUTH"

/atom/movable/screen/mov_intent/ms13
	icon = 'mojave/icons/hud/ms_ui_buttons.dmi'
	icon_state = "running"
	screen_loc = "WEST-3,SOUTH"



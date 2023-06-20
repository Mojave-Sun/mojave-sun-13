/datum/keybinding/living/wield
	hotkey_keys = list("V")
	name = "wield"
	full_name = "Wield"
	description = "Wield or unwield the item in your active hand."
	keybind_signal = COMSIG_KB_WIELD_DOWN

/datum/keybinding/living/wield/down(client/user)
	. = ..()
	var/mob/living/living_user = user.mob
	if(istype(living_user))
		living_user.wield_active_hand()
	return TRUE

/datum/keybinding/living/fixeye
	hotkey_keys = list("ShiftF")
	name = "fixeye"
	full_name = "Fix Eye"
	description = "Fix the direction you're staring at."
	keybind_signal = COMSIG_KB_FIXEYE_DOWN

/datum/keybinding/living/fixeye/down(client/user)
	. = ..()
	var/mob/living/living_user = user.mob
	if(istype(living_user))
		SEND_SIGNAL(living_user, COMSIG_FIXEYE_TOGGLE)
	return TRUE

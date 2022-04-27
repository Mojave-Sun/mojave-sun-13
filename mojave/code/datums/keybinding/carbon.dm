/datum/keybinding/carbon/wield
	hotkey_keys = list("V")
	name = "wield"
	full_name = "Wield"
	description = "Wield/unwield active held item."
	category = CATEGORY_CARBON
	keybind_signal = COMSIG_KB_CARBON_WIELD_DOWN

/datum/keybinding/carbon/wield/down(client/user)
	. = ..()
	var/mob/living/living_user = user.mob
	if(istype(living_user))
		living_user.wield_active_hand()
	return TRUE

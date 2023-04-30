/datum/component/two_handed
	/// Stores the wield flags we use, currently only matters for WIELD_HAS_INHANDS but oh well
	var/wield_flags = NONE

/datum/component/two_handed/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_TWOHANDED_CHECK, .proc/check_wielded)

/datum/component/two_handed/UnregisterFromParent()
	. = ..()
	UnregisterSignal(parent, COMSIG_TWOHANDED_CHECK)

/datum/component/two_handed/on_update_icon(obj/item/source)
	. = NONE
	//Consider adding base inhand state, because this SUCKS!
	if(wield_flags & WIELD_HAS_INHANDS)
		if(wielded)
			source.inhand_icon_state = "[initial(source.inhand_icon_state)]_wielded"
		else
			source.inhand_icon_state = initial(source.inhand_icon_state)
	if(icon_wielded && wielded)
		source.icon_state = icon_wielded
		return COMSIG_ATOM_NO_UPDATE_ICON_STATE

/datum/component/two_handed/wield(mob/living/carbon/user)
	. = ..()
	//This is VERY retarded but for some reason TURFS are being sent as user???? WHAT???
	//I don't fucking care what actually causes this, I am blaming Technobug
	if(!isliving(user))
		return
	user.wield_ui_update(wielded)

/datum/component/two_handed/unwield(mob/living/carbon/user)
	. = ..()
	if(!isliving(user))
		return
	user.wield_ui_update(wielded)

/datum/component/two_handed/proc/check_wielded(obj/item/source)
	return wielded

/obj/item/offhand
	icon = null
	icon_state = null

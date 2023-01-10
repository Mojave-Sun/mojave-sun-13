/datum/component/two_handed
	/// Stores the wield flags we use, currently only matters for WIELD_HAS_INHANDS but oh well
	var/wield_flags = NONE

/datum/component/two_handed/on_update_icon(obj/item/source)
	. = NONE
	if(!wielded)
		return
	if(icon_wielded)
		source.icon_state = icon_wielded
		. = COMSIG_ATOM_NO_UPDATE_ICON_STATE
	//Consider adding base inhand state, because this SUCKS!
	if(wield_flags & WIELD_HAS_INHANDS)
		source.inhand_icon_state = "[initial(source.inhand_icon_state)]_wielded"

/datum/component/two_handed/wield(mob/living/carbon/user)
	. = ..()
	//This is VERY retarded but for some reason TURFS are being sent as user???? WHAT???
	//I don't fucking care what actually causes this, I am blaming Technobug
	if(!isliving(user))
		return
	user.wield_ui_update(wielded)

/datum/component/two_handed/unwield(mob/living/carbon/user)
	. = ..()
	if(!isliving(user) || (wielded == old_wielded))
		return
	user.wield_ui_update(wielded)

/obj/item/offhand
	icon = null
	icon_state = null

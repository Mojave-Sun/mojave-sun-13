// Wielding any item very poggers
/obj/item/proc/wield_act(mob/living/carbon/user)
	// Check if we can even wield the item, if not we error out
	// I know using getcomponent for something rather common is not exactly poggers but turning this into signals is not viable
	var/datum/component/two_handed/wield_comp = get_wield_component()
	if(!wield_comp)
		to_chat(user, span_warning("\The [src] cannot be wielded in any way!"))
		return
	if(wield_comp.wielded)
		return wield_comp.unwield(user)
	return wield_comp.wield(user)

/obj/item/proc/get_wield_component()
	var/datum/component/two_handed/wield_component = GetComponent(/datum/component/two_handed)
	if(wield_component)
		return wield_component
	else if(!wield_info || QDELETED(src))
		return
	var/datum/wield_info/wield_datum = GLOB.path_to_wield_info[wield_info]
	if(!wield_datum || !(wield_datum.wield_flags & WIELD_WIELDABLE))
		return
	wield_component = AddComponent(/datum/component/two_handed, \
				require_twohands = (wield_datum.wield_flags & WIELD_ALWAYS_TWOHANDED),\
				wieldsound = wield_datum.wield_sound, \
				unwieldsound = wield_datum.unwield_sound, \
				attacksound = wield_datum.wielded_hitsound, \
				force_multiplier = wield_datum.force_multiplier, \
				force_wielded = wield_datum.force_wielded, \
				force_unwielded = wield_datum.force_unwielded, \
				icon_wielded = wield_datum.icon_wielded, \
				)
	//hacky bullcrap
	if(wield_datum.wield_flags & WIELD_NO_ATTACK_SELF)
		wield_component.UnregisterSignal(src, COMSIG_ITEM_ATTACK_SELF)
	wield_component.wield_flags = wield_datum.wield_flags
	return wield_component

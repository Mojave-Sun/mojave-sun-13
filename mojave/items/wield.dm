// Wielding any item very poggers
/obj/item
	var/wield_info = /datum/wield_info/standard

/obj/item/proc/get_wield_component()
	var/datum/component/two_handed/wield_component = GetComponent(/datum/component/two_handed)
	if(wield_component)
		return wield_component
	else if(!wield_info || QDELETED(src))
		return
	var/datum/wield_info/wield_datum = GLOB.path_to_wield_info[wield_info]
	if(!wield_datum)
		return
	if(wield_datum.wield_flags & WIELD_WIELDABLE)
		wield_component = LoadComponent(/datum/component/two_handed, \
					require_twohands = (wield_datum.wield_flags & WIELD_ALWAYS_TWOHANDED),\
					wieldsound = wield_datum.wield_sound, \
					unwieldsound = wield_datum.unwield_sound, \
					attacksound = wield_datum.wield_hitsound,\
					force_multiplier = wield_datum.force_multiplier,\
					force_wielded = wield_datum.force_wielded,\
					force_unwielded = wield_datum.force_unwielded,\
					icon_wielded = wield_datum.icon_wielded,\
					min_force_multiplier = wield_datum.min_force_multiplier,\
					min_force_wielded = wield_datum.min_force_wielded,\
					min_force_unwielded = wield_datum.min_force_unwielded,\
					min_force_strength = wield_datum.min_force_strength,\
					force_strength = wield_datum.force_strength,\
					)
		if(wield_datum.wield_flags & WIELD_NO_ATTACK_SELF)
			wield_component.UnregisterSignal(src, COMSIG_ITEM_ATTACK_SELF)
		return wield_component

/obj/item/proc/wield_act(mob/living/carbon/user)
	// Check if we can even wield the item, if not we error out
	var/datum/component/two_handed/wield_comp = get_wield_component()
	if(!wield_comp)
		to_chat(user, span_warning("\The [src] cannot be wielded in any way!"))
		return
	if(wield_comp.wielded)
		return wield_comp.unwield(user)
	return wield_comp.wield(user)

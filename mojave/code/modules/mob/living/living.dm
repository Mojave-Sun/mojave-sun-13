/mob/living
	var/voice_type
  
/mob/living/Initialize(mapload)
	. = ..()
	update_nv()

/// Wielding procs
/mob/living/proc/wield_active_hand()
	var/obj/item/active = get_active_held_item()
	if(istype(active))
		return active.wield_act(src)
	else
		to_chat(src, span_warning("You have nothing to wield!"))
		return FALSE

/mob/living/proc/wield_ui_update(active = FALSE)
	if(!hud_used)
		return FALSE
	hud_used.wield_active = active
	for(var/atom/movable/screen/wield/wield_button in hud_used.hotkeybuttons)
		wield_button.update_appearance()
	var/atom/movable/screen/inventory/hand_hud
	for(var/hand in hud_used.hand_slots)
		hand_hud = hud_used.hand_slots[hand]
		hand_hud?.update_appearance()
	var/obj/item/active_item = hud_used.mymob?.get_active_held_item()
	if(active_item?.wield_info)
		var/datum/wield_info/wield_info = GLOB.path_to_wield_info[active_item.wield_info]
		var/wield_pixel_x = !active ? 0 : (!(hud_used.mymob.active_hand_index % RIGHT_HANDS) ? wield_info.pixel_x_wielded : -wield_info.pixel_x_wielded)
		active_item.screen_loc = ui_hand_position(hud_used.mymob.active_hand_index, wield_pixel_x)
	return TRUE

//component for changing icons/name etc of item in washing machine

/datum/component/machine_washable
	// clean sprite for thing thats washed
	var/clean_sprite
	// if the description changes at all
	var/desc_change
	// new description for the thing
	var/new_desc
	// if the name changes at all
	var/name_change
	// new name for the thing
	var/new_name
	// if the item has been washed or not
	var/washed

/datum/component/machine_washable/Initialize(clean_sprite, desc_change, new_desc = FALSE, name_change, new_name = FALSE, washed = FALSE)
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE

	src.clean_sprite = clean_sprite
	src.desc_change = desc_change
	src.new_desc = new_desc
	src.name_change = name_change
	src.new_name = new_name
	src.washed = washed

/datum/component/machine_washable/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_COMPONENT_CLEAN_ACT, .proc/check_wash)

/datum/component/machine_washable/UnregisterFromParent()
	. = ..()
	UnregisterSignal(parent, COMSIG_COMPONENT_CLEAN_ACT)

/datum/component/machine_washable/proc/check_wash()
	var/atom/C = parent
	if(washed)
		C.icon_state = clean_sprite
		if(desc_change)
			C.desc = new_desc
		if(name_change)
			C.name = new_name
		C.update_appearance()

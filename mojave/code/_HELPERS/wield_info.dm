/proc/setup_wield_infos()
	. = list()
	for(var/datum/wield_info/wield_info as anything in init_subtypes(/datum/wield_info))
		.[wield_info.type] = wield_info

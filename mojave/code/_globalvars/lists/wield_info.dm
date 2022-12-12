GLOBAL_LIST_INIT(path_to_wield_info, setup_wield_infos())

/proc/setup_wield_infos()
	. = list()
	for(var/datum/wield_info/wield_info as anything in init_subtypes(/datum/wield_info))
		.[wield_info.type] = wield_info

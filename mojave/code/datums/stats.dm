GLOBAL_LIST_INIT(perks, list())

/proc/get_perk(perk_type)
	if(GLOB.perks[perk_type])
		return GLOB.perks[perk_type]
	else
		var/datum/perk/p = new perk_type
		GLOB.perks[perk_type] = p
		return p

/mob
	var/datum/stats_browser/stats

/datum/stats_browser
	var/datum/stats/temp_special
	var/list/activeperks = list()

/datum/stats_browser/ui_state()
	return GLOB.always_state

/datum/stats_browser/ui_data(mob/user)
	. = list()
	for(var/id in GLOB.perks_type)
		var/type = GLOB.perks_type[id]
		if(type in activeperks)
			continue
		var/datum/perk/p = get_perk(type)
		.["perks"] += list(list("name" = p.name, "desc" = p.desc, "id" = p.id, "type" = p.type_class, "filter" = p.filter, "level" = p.level, "ranks" = p.ranks))

	for(var/type in activeperks)
		var/datum/perk/p = get_perk(type)
		.["activeperks"] += list(list("name" = p.name, "desc" = p.desc, "id" = p.id, "type" = p.type_class, "filter" = p.filter, "level" = p.level, "ranks" = p.ranks))

/datum/stats_browser/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return
	switch (action)
		if("add_perk")
			var/datum/perk/p = GLOB.perks_type[params["id"]]
			activeperks.Add(p)
			return TRUE

		if("remove_perk")
			var/datum/perk/p = GLOB.perks_type[params["id"]]
			activeperks.Remove(p)
			return TRUE

/datum/stats_browser/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "StatsBrowser")
		ui.open()

/mob/verb/TestStats()
	set category = "TEST"
	set name = "TEST Stats"

	if(!stats)
		stats = new

	stats.ui_interact(src)

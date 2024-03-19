GLOBAL_LIST_INIT(perks, list())

/proc/get_perk(perk_type)
	if(GLOB.perks[perk_type])
		return GLOB.perks[perk_type]
	else
		var/datum/perk/p = new perk_type
		GLOB.perks[perk_type] = p
		return p

/mob
	var/datum/stats_browser/statsbrowser
/datum/stats_browser
	var/datum/stats/temp_special
	var/list/activeperks = list()

/datum/stats_browser/ui_state()
	return GLOB.always_state

/datum/stats_browser/ui_data(mob/user)
	. = list()
	.["perks"] = list()

	for(var/id in GLOB.perks_type)
		var/type = GLOB.perks_type[id]
		if(type in activeperks)
			continue
		var/datum/perk/p = get_perk(type)
		if(!p.is_ready)
			continue
		if(!p.check_to_add(temp_special))
			continue
		.["perks"] += list(list("name" = p.name, "desc" = p.desc, "id" = p.id, "type" = p.type_class, "filter" = p.filter, "level" = p.level, "ranks" = p.ranks))

	.["activeperks"] = list()

	for(var/type in activeperks)
		var/datum/perk/p = get_perk(type)
		.["activeperks"] += list(list("name" = p.name, "desc" = p.desc, "id" = p.id, "type" = p.type_class, "filter" = p.filter, "level" = p.level, "ranks" = p.ranks))

	.["stats"] = list("perceptive" = "[temp_special.perceptive - 10]", "enduring" = "[temp_special.enduring - 10]", "retaining" = "[temp_special.retaining - 10]", "strong" = "[temp_special.strong - 10]", "outgoing" = "[temp_special.outgoing - 10]", "nimble" = "[temp_special.nimble - 10]")

/datum/stats_browser/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return
	switch (action)
		if("add_perk")
			var/datum/perk/p = GLOB.perks_type[params["id"]]

			if(p in activeperks)
				return FALSE

			activeperks.Add(p)
			return TRUE

		if("remove_perk")
			var/datum/perk/p = GLOB.perks_type[params["id"]]
			activeperks.Remove(p)
			return TRUE

/datum/stats_browser/ui_interact(mob/user, datum/tgui/ui)
	if(isliving(user))
		var/mob/living/u = user
		temp_special = u.stats
	else
		temp_special = new

	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "StatsBrowser")
		ui.open()

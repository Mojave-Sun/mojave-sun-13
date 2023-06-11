/mob
	var/datum/stats_browser/stats

/datum/stats_browser
	var/datum/stats/temp_special

/datum/stats_browser/ui_state()
	return GLOB.always_state

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


/datum/special_browser
	var/datum/special/temp_special

/datum/special_browser/ui_interact(mob/user, datum/tgui/ui)
	. = ..()
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "SpecialBrowser")
		ui.open()

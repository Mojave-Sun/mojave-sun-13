/datum/physiology
	/// Like the armor datum except cooler
	var/datum/subarmor/subarmor

/datum/physiology/New()
	. = ..()
	subarmor = new

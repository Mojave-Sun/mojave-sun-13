GLOBAL_LIST_INIT(perks_type, list(
PERK_SILENT_RINNING = /datum/perk/silent_rinning
))

/datum/perk
	var/name = "ERROR: NEED CHANGE NAME VAR"
	var/desc = "ERROR: NEED CHANGE DESC VAR"

	var/id = "CHANGE THIS, WHEN YOU CREATE NEW PERK"
	var/level = 1
	var/ranks = 1
	var/type_class = "p"
	var/filter = ""

	var/icon/display = null
	var/icon_state = ""

	//Value is 0 because you will modificited main special
	var/perceptive = 0
	var/enduring = 0
	var/retaining = 0
	var/strong = 0
	var/outgoing = 0
	var/nimble = 0

	//Attached special
	var/datum/stats/special

/datum/perk/New(special)
	src.special = special

/datum/perk/Destroy(force, ...)
	special = null
	. = ..()

/datum/perk/proc/added_effect()
	special.modifyRating(perceptive, enduring, retaining, strong, outgoing, nimble)

/datum/perk/proc/remove_effect()
	special.modifyRating(-perceptive, -enduring, -retaining, -strong, -outgoing, -nimble)

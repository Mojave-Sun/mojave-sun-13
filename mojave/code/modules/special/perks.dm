GLOBAL_LIST_INIT(perks, list(
PERK_SILENT_RINNING = /datum/perk/silent_rinning
))

/proc/getPerk(id)
	. = GLOB.perks[id]

/datum/perk
	var/name = "ERROR: NEED CHANGE NAME VAR"
	var/desc = "ERROR: NEED CHANGE DESC VAR"

	var/id = "CHANGE THIS, WHEN YOU CREATE NEW PERK"

	var/icon/display = null
	var/icon_state = ""

	//Value is 0 because you will modificited main special
	var/strength = 0
	var/perception = 0
	var/endurance = 0
	var/charisma = 0
	var/intelligence = 0
	var/agility = 0
	var/luck = 0

	//Attached special
	var/datum/special/special

/datum/perk/New(special)
	src.special = special

/datum/perk/Destroy(force, ...)
	special = null
	. = ..()

/datum/perk/proc/added_effect()
	special.modifyRating(strength, perception, endurance, charisma, intelligence, agility, luck)

/datum/perk/proc/remove_effect()
	special.modifyRating(-strength, -perception, -endurance, -charisma, -intelligence, -agility, -luck)

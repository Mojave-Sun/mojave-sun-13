GLOBAL_LIST_INIT(perks_type, list(
PERK_SILENT_RINNING = /datum/perk/silent_rinning,
PERK_AMATEUR_ARMORER = /datum/perk/amateur_armorer,
PERK_DRAMA_QUEEN = /datum/perk/drama_queen,
PERK_PHONETIC_FANATIC = /datum/perk/phonetic_fanatic,
PERK_GRACEFUL_FALL = /datum/perk/graceful_fall,
PERK_GRABBER = /datum/perk/grabber,
PERK_INSPIRING_VOICE = /datum/perk/inspiring_voice,
PERK_CRABBY_PERSONALITY = /datum/perk/crabby_personality,
PERK_PREACHER = /datum/perk/preacher,
PERK_MUMBLER = /datum/perk/mumbler,
PERK_CHIEF_KIEFER = /datum/perk/chief_kiefer,
PERK_BLESSED = /datum/perk/blessed,
PERK_HUMAN_TORCH = /datum/perk/human_torch,
))

/datum/perk
	var/name = "ERROR: NEED CHANGE NAME VAR"
	var/full_name = "ERROR: NEED CHANGE FULL_NAME VAR"
	var/desc = "ERROR: NEED CHANGE DESC VAR"
	var/full_desc = "ERROR: NEED CHANGE FULL_DESC VAR"

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

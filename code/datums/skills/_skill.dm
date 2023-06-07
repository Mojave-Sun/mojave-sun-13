GLOBAL_LIST_INIT(skill_types, subtypesof(/datum/skill))

/datum/skill
	var/name = "Skilling"
	var/desc = "the art of doing things"
	var/level_up_comparator = "better"		// comparator used for levelup messages (e.g. "I'm getting stronger!")
	var/level_down_comparator = "worser"	// comparator used for leveldown messages (e.g. "I'm getting weaker!")

/**
 * level_gained: Gives skill levelup/down messages to the user
 *
 * Only fires if the xp gain isn't silent, so only really useful for messages.
 * Arguments:
 * * mind - The mind that you'll want to send messages
 * * new_level - The newly gained/lost level. Can check the actual level to give different messages at different levels, see defines in skills.dm
 * * old_level - Similar to the above, but the level you had before levelling up/down.
 */
/datum/skill/proc/level_changed(datum/mind/mind, new_level, old_level)//just for announcements (doesn't go off if the xp gain is silent)
	if(new_level >= old_level)
		to_chat(mind.current, span_notice("I can feel myself getting [level_up_comparator]!"))
	else
		to_chat(mind.current, span_notice("I can feel myself getting [level_down_comparator]!"))

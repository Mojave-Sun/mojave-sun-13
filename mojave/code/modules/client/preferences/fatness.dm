/datum/preference/choiced/fatness
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "fatness"

/datum/preference/choiced/fatness/init_possible_values()
	. = list()
	for(var/thing in GLOB.fat_types)
		. += capitalize(thing)

/datum/preference/choiced/fatness/create_default_value()
	return "Average"

/datum/preference/choiced/fatness/apply_to_human(mob/living/carbon/human/target, value)
	target.fatness = lowertext(value)

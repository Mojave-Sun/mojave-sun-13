/datum/preference/choiced/fatness
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "fatness"

/datum/preference/choiced/fatness/init_possible_values()
	. = list()
	for(var/thing in GLOB.fatness_types)
		. += capitalize(thing)

/datum/preference/choiced/fatness/create_default_value()
	return capitalize(FATNESS_AVERAGE)

/datum/preference/choiced/fatness/apply_to_human(mob/living/carbon/human/target, value)
	var/lowertext_value = lowertext(value)
	target.fatness = lowertext_value
	//fat fucks start with a full belly, obviously - go run some laps lardass
	if(lowertext_value == FATNESS_OBESE)
		target.set_nutrition(NUTRITION_LEVEL_FAT + 50)

/datum/preference/choiced/fat_adjective
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	priority = PREFERENCE_PRIORITY_NAME_MODIFICATIONS
	savefile_key = "fat_adjective"

/datum/preference/choiced/fat_adjective/is_accessible(datum/preferences/preferences)
	. = ..()
	if(!.)
		return
	var/fatness = preferences.read_preference(/datum/preference/choiced/fatness)
	if(lowertext(fatness) != FATNESS_OBESE)
		return FALSE

/datum/preference/choiced/fat_adjective/init_possible_values()
	return GLOB.fatness_adjectives

/datum/preference/choiced/fat_adjective/create_default_value()
	return "Fat"

/datum/preference/choiced/fat_adjective/apply_to_human(mob/living/carbon/human/target, value)
	target.fatness_adjective = (value == "None" ? null : value)

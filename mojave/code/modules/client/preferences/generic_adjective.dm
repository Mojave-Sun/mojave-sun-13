/datum/preference/choiced/generic_adjective
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	priority = PREFERENCE_PRIORITY_NAME_MODIFICATIONS
	savefile_key = "generic_adjective"

/datum/preference/choiced/generic_adjective/init_possible_values()
	var/list/adjectives = GLOB.preference_adjectives.Copy()
	adjectives.Insert(1, "None") //None is always the first opinion
	return adjectives

/datum/preference/choiced/generic_adjective/create_default_value()
	return "None"

/datum/preference/choiced/generic_adjective/apply_to_human(mob/living/carbon/human/target, value)
	target.generic_adjective = (value == "None" ? null : value)

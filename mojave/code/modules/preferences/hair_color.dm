/datum/preference/choiced/hair_color
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "hair_color"

/datum/preference/choiced/hair_color/init_possible_values()
	return GLOB.hair_colors

/datum/preference/choiced/hair_color/apply_to_human(mob/living/carbon/human/target, value)
	target.hair_color = hairtone2hex(value)

/datum/preference/color/facial_hair_color
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "facial_hair_color"

/datum/preference/color/facial_hair_color/apply_to_human(mob/living/carbon/human/target, value)
	target.facial_hair_color = target.hair_color

/datum/preference/color/facial_hair_color/is_accessible(datum/preferences/preferences)
	. = ..()
	return FALSE

/datum/preference/choiced/underwear_color
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "underwear_color"

/datum/preference/choiced/underwear_color/init_possible_values()
	return GLOB.underwear_colors

/datum/preference/choiced/underwear_color/apply_to_human(mob/living/carbon/human/target, value)
	target.underwear_color = undiestone2hex(value)

/datum/preference/choiced/underwear_color/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = new species_type
	return !(NO_UNDERWEAR in species.species_traits)

/// Gender preference
/datum/preference/choiced/gender
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "gender"
	priority = PREFERENCE_PRIORITY_GENDER

/datum/preference/choiced/gender/init_possible_values()
	return list(MALE, FEMALE) //MOJAVE SUN DIT - Gender Prefs

/datum/preference/choiced/gender/apply_to_human(mob/living/carbon/human/target, value)
	if (value == FEMALE)
		target.facial_hairstyle = "Shaved" //MOJAVE SUN EDIT - Prefs
	if(!target.dna.species.sexes)
		value = PLURAL //disregard gender preferences on this species
	target.gender = value

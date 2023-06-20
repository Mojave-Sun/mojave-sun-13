/// Gender preference
/datum/preference/choiced/gender
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "gender"
	priority = PREFERENCE_PRIORITY_GENDER

/datum/preference/choiced/gender/init_possible_values()
	return list(MALE, FEMALE) // MOJAVE SUN EDIT - ORIGINAL IS 	'return list(MALE, FEMALE, PLURAL)'

/datum/preference/choiced/gender/apply_to_human(mob/living/carbon/human/target, value)
	if(!target.dna.species.sexes)
		value = PLURAL //disregard gender preferences on this species
	target.gender = value
	//MOJAVE SUN EDIT START - Pref fixes
	if (value == FEMALE)
		target.facial_hairstyle = "shaved"
	if(value != PLURAL)
		target.body_type = target.gender
	else
		target.body_type = MALE //blank state mainly, helps it reset
	//MOJAVE SUN EDIT END - Pref fixes

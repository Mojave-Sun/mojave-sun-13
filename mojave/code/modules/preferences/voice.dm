//For voice sounds. :) Funny beep boops

//Backpack/Storage

#define VOICE_VARIANT_ONE "lowest"
#define VOICE_VARIANT_TWO "low"
#define VOICE_VARIANT_THREE "high"
#define VOICE_VARIANT_FOUR "highest"

GLOBAL_LIST_INIT(voicelist, list(VOICE_VARIANT_ONE, VOICE_VARIANT_TWO, VOICE_VARIANT_THREE, VOICE_VARIANT_FOUR))

/datum/preference/choiced/voice_tone
	savefile_key = "voice_tone"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Voice tone"
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	should_generate_icons = FALSE

/datum/preference/choiced/voice_tone/init_possible_values()
	var/list/values = list()

	values[VOICE_VARIANT_ONE] = 1
	values[VOICE_VARIANT_TWO] = 2
	values[VOICE_VARIANT_THREE] = 3
	values[VOICE_VARIANT_FOUR] = 4
	return values

/datum/preference/choiced/voice_tone/apply_to_human(mob/living/target, value)
	target.voice_sound = value

/proc/generate_possible_values_for_sprite_accessories_on_head(accessories)
	var/list/values = possible_values_for_sprite_accessory_list(accessories)

	var/icon/head_icon = icon('icons/mob/human_parts_greyscale.dmi', "human_head_m")
	head_icon.Blend("#ffe0d1", ICON_MULTIPLY)

	for (var/name in values)
		var/datum/sprite_accessory/accessory = accessories[name]
		if (accessory == null || accessory.icon_state == null)
			continue

		var/icon/final_icon = new(head_icon)

		var/icon/beard_icon = values[name]
		beard_icon.Blend("#363636", ICON_MULTIPLY)
		final_icon.Blend(beard_icon, ICON_OVERLAY)

		final_icon.Crop(10, 19, 22, 31)
		final_icon.Scale(32, 32)

		values[name] = final_icon

	return values

// Male Voices ---- We actually need to split these up because using the proc that gets possible selections actually DOESN'T UPDATE ON THE FLY, and thus putting this into a singular action... currently isn't possible. awesome, TG.
// Luckily you don't really notice anything jarring in-game but... If you're here.... YOU KNOW...

/datum/preference/choiced/voice_type
	savefile_key = "voice_type"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Voice type"
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_NAME_MODIFICATIONS

/datum/preference/choiced/voice_type/is_accessible(datum/preferences/preferences)
	. = ..()
	var/gender = preferences.read_preference(/datum/preference/choiced/gender)
	if(gender == MALE)
		return TRUE
	else
		return FALSE


/datum/preference/choiced/voice_type/init_possible_values()
	return GLOB.male_voice_type_list

/datum/preference/choiced/voice_type/apply_to_human(mob/living/carbon/human/target, value)
	if(target.gender == FEMALE)
		return
	target.voice_type = value

// Female Voices

/datum/preference/choiced/voice_type_female
	savefile_key = "voice_type_female"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Voice type"
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_NAME_MODIFICATIONS

/datum/preference/choiced/voice_type_female/is_accessible(datum/preferences/preferences)
	. = ..()
	var/gender = preferences.read_preference(/datum/preference/choiced/gender)
	if(gender == FEMALE)
		return TRUE
	else
		return FALSE

/datum/preference/choiced/voice_type_female/init_possible_values()
	return GLOB.female_voice_type_list

/datum/preference/choiced/voice_type_female/apply_to_human(mob/living/carbon/human/target, value)
	if(target.gender == MALE)
		return
	target.voice_type = value

/datum/preference/choiced/eye_color
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "eye_color"

/datum/preference/choiced/eye_color/init_possible_values()
	return GLOB.eye_colors

/datum/preference/choiced/eye_color/apply_to_human(mob/living/carbon/human/target, value)
	target.eye_color = eyetone2hex(value)

	var/obj/item/organ/eyes/eyes_organ = target.getorgan(/obj/item/organ/eyes)
	if (istype(eyes_organ))
		if (!initial(eyes_organ.eye_color))
			eyes_organ.eye_color = eyetone2hex(value)
		eyes_organ.old_eye_color = eyetone2hex(value)

/mob/living/carbon/proc/apply_fatness_filter(mutable_appearance/modified_appearance, is_clothing = FALSE)
	if(!modified_appearance || !fatness || (fatness != FATNESS_OBESE))
		return modified_appearance
	var/fatness_map_type = (is_clothing ? /obj/effect/abstract/displacement_map/fat/clothes : \
										/obj/effect/abstract/displacement_map/fat/body)
	var/obj/effect/abstract/displacement_map/fatness_map = get_displacement_map(fatness_map_type)
	if(!fatness_map)
		fatness_map = add_displacement_map(fatness_map_type)
	modified_appearance.filters += fatness_map.get_displacement_filter()
	return modified_appearance

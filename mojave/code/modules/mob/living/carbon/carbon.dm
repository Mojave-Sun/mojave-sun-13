/mob/living/carbon/proc/apply_fatness(image/modified_appearance, is_clothing = FALSE)
	if(!fatness || (fatness != "obese"))
		return modified_appearance
	var/fatness_map_type = (is_clothing ? /obj/effect/abstract/displacement_map/fat/clothes : /obj/effect/abstract/displacement_map/fat/body)
	var/obj/effect/abstract/displacement_map/fatness_map
	fatness_map = locate(fatness_map_type) in contents
	if(!fatness_map)
		fatness_map = new fatness_map_type(src)
	modified_appearance.filters += fatness_map.get_displacement_filter()
	return modified_appearance

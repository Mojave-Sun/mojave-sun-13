/mob/living/carbon/proc/apply_fatness(mutable_appearance/modified_appearance, is_clothing = FALSE)
	if(!fatness || (fatness == "average"))
		return modified_appearance
	var/fatness_map = (is_clothing ? /obj/effect/abstract/displacement_map/fat/clothes : /obj/effect/abstract/displacement_map/fat/body)

	return modified_appearance

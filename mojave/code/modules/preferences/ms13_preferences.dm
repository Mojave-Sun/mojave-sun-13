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

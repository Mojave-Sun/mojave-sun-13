		//MOJAVE SUN PREFERENCES DIRECTORY (CHARACTER)//
	//ie shit that goes directly on the right of the player//
//Put its in its own file so it can be re-arranged #weh8TGUI2013//

//Hairstyle

/datum/preference/choiced/hairstyle
	savefile_key = "hairstyle_name"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	main_feature_name = "Hairstyle"
	should_generate_icons = TRUE

/datum/preference/choiced/hairstyle/init_possible_values()
	return generate_possible_values_for_sprite_accessories_on_head(GLOB.hairstyles_list)

/datum/preference/choiced/hairstyle/apply_to_human(mob/living/carbon/human/target, value)
	target.hairstyle = value

/datum/preference/choiced/hairstyle/compile_constant_data()
	var/list/data = ..()

	return data

//Facial Hairstyle

/datum/preference/choiced/facial_hairstyle
	savefile_key = "facial_style_name"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_CLOTHING
	main_feature_name = "Facial hair"
	should_generate_icons = TRUE

/datum/preference/choiced/facial_hairstyle/init_possible_values()
	return generate_possible_values_for_sprite_accessories_on_head(GLOB.facial_hairstyles_list)

/datum/preference/choiced/facial_hairstyle/apply_to_human(mob/living/carbon/human/target, value)
	target.facial_hairstyle = value

/datum/preference/choiced/facial_hairstyle/compile_constant_data()
	var/list/data = ..()

	return data

/datum/preference/choiced/facial_hairstyle/is_accessible(datum/preferences/preferences)
	. = ..()
	var/gender = preferences.read_preference(/datum/preference/choiced/gender)
	if(gender != MALE)
		return FALSE
	else
		return TRUE

//Undershirt

/datum/preference/choiced/undershirt
	savefile_key = "undershirt"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Undershirt"
	category = PREFERENCE_CATEGORY_CLOTHING
	should_generate_icons = TRUE

/datum/preference/choiced/undershirt/init_possible_values()
	var/icon/body = icon('icons/mob/human_parts_greyscale.dmi', "human_r_leg")
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_l_leg"), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_r_arm"), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_l_arm"), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_r_hand"), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_l_hand"), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_chest_m"), ICON_OVERLAY)
	body.Blend("#ffe0d1", ICON_MULTIPLY)

	var/list/values = list()

	for (var/accessory_name in GLOB.undershirt_list)
		var/icon/icon_with_undershirt = icon(body)

		if (accessory_name != "Nude")
			var/datum/sprite_accessory/accessory = GLOB.undershirt_list[accessory_name]
			icon_with_undershirt.Blend(icon('mojave/icons/mob/clothing/underwear.dmi', accessory.icon_state), ICON_OVERLAY) //MOJAVE SUN EDIT - Prefs

		icon_with_undershirt.Crop(9, 9, 23, 23)
		icon_with_undershirt.Scale(32, 32)
		values[accessory_name] = icon_with_undershirt

	return values

/datum/preference/choiced/undershirt/apply_to_human(mob/living/carbon/human/target, value)
	target.undershirt = value

//Underwear

/datum/preference/choiced/underwear
	savefile_key = "underwear"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Underwear"
	category = PREFERENCE_CATEGORY_CLOTHING
	should_generate_icons = TRUE

/datum/preference/choiced/underwear/init_possible_values()
	return generate_values_for_underwear(GLOB.underwear_list, list("human_chest_m", "human_r_leg", "human_l_leg"), COLOR_ALMOST_BLACK)

/datum/preference/choiced/underwear/apply_to_human(mob/living/carbon/human/target, value)
	target.underwear = value

/datum/preference/choiced/underwear/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = new species_type
	return !(NO_UNDERWEAR in species.species_traits)

/datum/preference/choiced/underwear/compile_constant_data()
	var/list/data = ..()

	return data

//Socks

/datum/preference/choiced/socks
	savefile_key = "socks"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Socks"
	category = PREFERENCE_CATEGORY_CLOTHING
	should_generate_icons = TRUE

/datum/preference/choiced/socks/init_possible_values()
	return generate_values_for_underwear(GLOB.socks_list, list("human_r_leg", "human_l_leg"))

/datum/preference/choiced/socks/apply_to_human(mob/living/carbon/human/target, value)
	target.socks = value

//Backpack/Storage

#define TPACK "Travelpack"
#define MBACKPACK "Millitary Backpack"
#define SATCHEL "Satchel"

GLOBAL_LIST_INIT(backpacklist, list(TPACK, MBACKPACK))

/datum/preference/choiced/backpack
	savefile_key = "backpack"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Backpack"
	category = PREFERENCE_CATEGORY_CLOTHING
	should_generate_icons = TRUE

/datum/preference/choiced/backpack/init_possible_values()
	var/list/values = list()

	values[TPACK] = /obj/item/storage/ms13/travel
	values[MBACKPACK] = /obj/item/storage/ms13/military
	values[SATCHEL] = /obj/item/storage/backpack/satchel/leather
	return values

/datum/preference/choiced/backpack/apply_to_human(mob/living/carbon/human/target, value)
	target.backpack = value

/datum/outfit/job/ms13/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	switch(H.backpack)
		if(TPACK)
			back = /obj/item/storage/ms13/travel
		if(MBACKPACK)
			back = /obj/item/storage/ms13/military
		if(SATCHEL)
			back = /obj/item/storage/backpack/satchel/leather
		else
			back = backpack //Department backpack
	//converts the uniform string into the path we'll wear, whether it's the skirt or regular variant
	var/holder
	if(H.jumpsuit_style == PREF_SKIRT)
		holder = "[uniform]/skirt"
		if(!text2path(holder))
			holder = "[uniform]"
	else
		holder = "[uniform]"
	uniform = text2path(holder)

	var/client/client = GLOB.directory[ckey(H.mind?.key)]

	if(client?.is_veteran() && client?.prefs.read_preference(/datum/preference/toggle/playtime_reward_cloak))
		neck = /obj/item/clothing/neck/cloak/skill_reward/playing

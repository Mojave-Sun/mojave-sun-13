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
	if(gender == FEMALE)
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

#define L_SATCHEL "Leather satchel"
#define L_BACKPACK "Leather backpack"
#define CORVBAG "Corvega backpack"
#define COLABAG "Nuka Cola backpack"

GLOBAL_LIST_INIT(backpacklist, list(L_SATCHEL, L_BACKPACK, CORVBAG, COLABAG))

/datum/preference/choiced/backpack
	savefile_key = "backpack"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Backpack"
	category = PREFERENCE_CATEGORY_CLOTHING
	should_generate_icons = TRUE

/datum/preference/choiced/backpack/init_possible_values()
	var/list/values = list()

	values[L_SATCHEL] = /obj/item/storage/ms13/satchel
	values[L_BACKPACK] = /obj/item/storage/ms13/leather_backpack
	values[CORVBAG] = /obj/item/storage/ms13/corvega_bag
	values[COLABAG] = /obj/item/storage/ms13/nuka_bag
	return values

/datum/preference/choiced/backpack/apply_to_human(mob/living/carbon/human/target, value)
	target.backpack = value

//Base pre-equip code

/datum/outfit/job/ms13/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(back == /obj/item/storage/backpack) //This is the default backpack, so this allows roles to use the backpack prefs but also allow us to have some roles not spawn with a backpack at all.
		switch(H.backpack)
			if(L_SATCHEL)
				back = /obj/item/storage/ms13/satchel
			if(L_BACKPACK)
				back = /obj/item/storage/ms13/leather_backpack
			if(CORVBAG)
				back = /obj/item/storage/ms13/corvega_bag
			if(COLABAG)
				back = /obj/item/storage/ms13/nuka_bag
	else
		back = back //Forced backpack

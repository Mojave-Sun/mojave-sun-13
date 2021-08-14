/obj/structure/mirror/ms13
	desc = "A dust stained reflective mirror, you can sort of make out your reflection in it."
	icon = 'mojave/icons/structure/32x64_tall_furniture.dmi'
	layer = WALL_OBJ_LAYER

/obj/structure/mirror/ms13/attack_hand(mob/user, list/modifiers)
	if(.)
		return
	if(broken || !Adjacent(user))
		return
	if(!user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return //no tele-grooming
	if(ishuman(user))
		var/mob/living/carbon/human/H = user

		var/new_hair
		var/new_facial_hairstyle

		if(HAS_TRAIT(H, TRAIT_BALD))
			to_chat(H, span_notice("If only growing back hair were that easy for you..."))
			return

		//handle facial hair (if necessary)
		var/hairchoice = tgui_alert(H, "Head or Facial hair?", "Adjust Hair", list("Head", "Facial"))
		if(hairchoice == "Head")
			//for(var/datum/sprite_accessory/H in GLOB.hairstyles_list)
			switch(H.hairstyle)
				if(src in GLOB.hairstyles_bald_list)
					new_hair = tgui_input_list(usr, "What hair style do you want?", "Hair style choice", GLOB.hairstyles_bald_list)
				if(src in GLOB.hairstyles_short_list)
					new_hair = tgui_input_list(usr, "What hair style do you want?", "Hair style choice", list(GLOB.hairstyles_short_list, GLOB.hairstyles_bald_list))
				if(src in GLOB.hairstyles_medium_list)
					new_hair = tgui_input_list(usr, "What hair style do you want?", "Hair style choice", list(GLOB.hairstyles_medium_list, GLOB.hairstyles_short_list, GLOB.hairstyles_bald_list))
				if(src in GLOB.hairstyles_long_list)
					new_hair = tgui_input_list(usr, "What hair style do you want?", "Hair style choice", list(GLOB.hairstyles_long_list, GLOB.hairstyles_medium_list, GLOB.hairstyles_short_list, GLOB.hairstyles_bald_list))
		if(hairchoice == "Facial" && H.facial_hairstyle != "Shaved")
			switch(H.gender)
				if(MALE)
					new_facial_hairstyle = tgui_input_list(usr, "What facial hair style do you want?", "Facial hair style choice", GLOB.facial_hairstyles_male_list)
					H.hairstyle = new_facial_hairstyle
					H.update_hair()
					return
				else if(FEMALE)
					new_facial_hairstyle = tgui_input_list(usr, "What facial hair style do you want?", "Facial hair style choice", GLOB.facial_hairstyles_female_list)
					H.hairstyle = new_facial_hairstyle
					H.update_hair()
					return
				else
					new_facial_hairstyle = tgui_input_list(usr, "What facial hair style do you want?", "Facial hair style choice", GLOB.facial_hairstyles_list)
					H.hairstyle = new_facial_hairstyle
					H.update_hair()
					return
		if(new_hair)
			H.hairstyle = new_hair
			H.update_hair()
			return

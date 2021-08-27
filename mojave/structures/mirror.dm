/obj/structure/mirror/ms13
	desc = "A dust stained reflective mirror, you can sort of make out your reflection in it."
	icon = 'mojave/icons/structure/32x64_tall_furniture.dmi'

/obj/structure/mirror/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/wall_mount)

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
		var/new_facial_hair

		if(HAS_TRAIT(H, TRAIT_BALD))
			to_chat(H, span_notice("If only growing back hair were that easy for you..."))
			return

		//handle facial hair (if necessary)
		var/hairchoice = tgui_alert(H, "Head or Facial hair?", "Adjust Hair", list("Head", "Facial"))
		if(hairchoice == "Head")
			//for(var/datum/sprite_accessory/H in GLOB.hairstyles_list)
			if(H.hairstyle in GLOB.hairstyles_bald_list)
				new_hair = tgui_input_list(usr, "What hair style do you want?", "Hair style choice", GLOB.hairstyles_bald_list)
			else if(H.hairstyle in GLOB.hairstyles_short_list)
				new_hair = tgui_input_list(usr, "What hair style do you want?", "Hair style choice", GLOB.hairstyles_short_list)
			else if(H.hairstyle in GLOB.hairstyles_medium_list)
				new_hair = tgui_input_list(usr, "What hair style do you want?", "Hair style choice", GLOB.hairstyles_medium_list)
			else if(H.hairstyle in GLOB.hairstyles_long_list)
				new_hair = tgui_input_list(usr, "What hair style do you want?", "Hair style choice", GLOB.hairstyles_long_list)
		if(new_hair)
			if(do_after(user, 4 SECONDS, src))
				H.hairstyle = new_hair
				H.update_hair()
				return
		if(hairchoice == "Facial")
			if(H.facial_hairstyle == "Shaved")
				to_chat(user, span_warning("You have no facial hair!"))
				return
			else
				new_facial_hair = tgui_input_list(usr, "What facial hair style do you want?", "Facial hair style choice", GLOB.facial_hairstyles_list)
		if(new_facial_hair)
			if(do_after(user, 4 SECONDS, src))
				H.facial_hairstyle = new_facial_hair
				H.update_hair()
				return


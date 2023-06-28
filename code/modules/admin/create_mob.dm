
/datum/admins/proc/create_mob(mob/user)
	var/static/create_mob_html
	if (!create_mob_html)
		var/mobjs = null
		mobjs = jointext(typesof(/mob), ";")
		create_mob_html = file2text('html/create_object.html')
		create_mob_html = replacetext(create_mob_html, "Create Object", "Create Mob")
		create_mob_html = replacetext(create_mob_html, "null /* object types */", "\"[mobjs]\"")

	user << browse(create_panel_helper(create_mob_html), "window=create_mob;size=425x475")

/proc/randomize_human(mob/living/carbon/human/H)
	H.gender = pick(MALE, FEMALE)
	H.body_type = H.gender
	H.real_name = random_unique_name(H.gender)
	H.name = H.real_name
	H.underwear = random_underwear(H.gender)
	H.underwear_color = sanitize_hexcolor(undiestone2hex(random_underwear_color())) //MOJAVE SUN EDIT - Hair/Gendered/Colours
	H.skin_tone = random_skin_tone()
	H.hairstyle = random_hairstyle(H.gender)
	H.facial_hairstyle = random_facial_hairstyle(H.gender)
	H.hair_color = sanitize_hexcolor(hairtone2hex(random_hair_color())) //MOJAVE SUN EDIT - Hair/Gendered/Colours
	H.facial_hair_color = H.hair_color
	H.eye_color = sanitize_hexcolor(eyetone2hex(random_eye_color())) //MOJAVE SUN EDIT - Hair/Gendered/Colours
	H.dna.blood_type = random_blood_type()
	H.voice_type = random_voice_type(H.gender) // MOJAVE SUN EDIT - Voice!!

	// Mutant randomizing, doesn't affect the mob appearance unless it's the specific mutant.
	H.dna.features["mcolor"] = "#[random_color()]"
	H.dna.features["ethcolor"] = GLOB.color_list_ethereal[pick(GLOB.color_list_ethereal)]
	H.dna.features["tail_lizard"] = pick(GLOB.tails_list_lizard)
	H.dna.features["snout"] = pick(GLOB.snouts_list)
	H.dna.features["horns"] = pick(GLOB.horns_list)
	H.dna.features["frills"] = pick(GLOB.frills_list)
	H.dna.features["spines"] = pick(GLOB.spines_list)
	H.dna.features["body_markings"] = pick(GLOB.body_markings_list)
	H.dna.features["moth_wings"] = pick(GLOB.moth_wings_list)
	H.dna.features["moth_antennae"] = pick(GLOB.moth_antennae_list)

	H.update_body()
	H.update_hair()
	H.update_body_parts()

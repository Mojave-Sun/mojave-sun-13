/// Fully randomizes everything in the character.
<<<<<<< HEAD
/datum/preferences/proc/randomise_appearance_prefs(randomise_flags = ALL)
	if(randomise_flags & RANDOMIZE_GENDER)
		gender = pick(MALE, FEMALE, PLURAL)
		switch(gender)
			if(MALE, FEMALE)
				body_type = gender
			else
				body_type = pick(MALE, FEMALE)
	if(randomise_flags & RANDOMIZE_SPECIES)
		var/rando_race = GLOB.species_list[pick(GLOB.roundstart_races)]
		pref_species = new rando_race()
	if(randomise_flags & RANDOMIZE_NAME)
		real_name = pref_species.random_name(gender, TRUE)
	if(randomise_flags & RANDOMIZE_AGE)
		age = rand(AGE_MIN, AGE_MAX)
	if(randomise_flags & RANDOMIZE_UNDERWEAR)
		underwear = random_underwear(gender)
	if(randomise_flags & RANDOMIZE_UNDERWEAR_COLOR)
		underwear_color = sanitize_hexcolor(undiestone2hex(random_underwear_color())) //MOJAVE SUN EDIT - Hair/Gendered/Colours
	if(randomise_flags & RANDOMIZE_UNDERSHIRT)
		undershirt = random_undershirt(gender)
	if(randomise_flags & RANDOMIZE_SOCKS)
		socks = random_socks()
	if(randomise_flags & RANDOMIZE_BACKPACK)
		backpack = random_backpack()
	if(randomise_flags & RANDOMIZE_JUMPSUIT_STYLE)
		jumpsuit_style = pick(GLOB.jumpsuitlist)
	if(randomise_flags & RANDOMIZE_HAIRSTYLE)
		hairstyle = random_hairstyle(gender)
	if(randomise_flags & RANDOMIZE_FACIAL_HAIRSTYLE)
		facial_hairstyle = random_facial_hairstyle(gender)
	if(randomise_flags & RANDOMIZE_HAIR_COLOR)
		hair_color = sanitize_hexcolor(hairtone2hex(random_hair_color())) //MOJAVE SUN EDIT - Hair/Gendered/Colours
	if(randomise_flags & RANDOMIZE_FACIAL_HAIR_COLOR)
		facial_hair_color = hair_color //MOJAVE SUN EDIT - Hair/Gendered/Colours
	if(randomise_flags & RANDOMIZE_SKIN_TONE)
		skin_tone = random_skin_tone()
	if(randomise_flags & RANDOMIZE_EYE_COLOR)
		eye_color = sanitize_hexcolor(eyetone2hex(random_eye_color())) //MOJAVE SUN EDIT - Hair/Gendered/Colours
	if(randomise_flags & RANDOMIZE_FEATURES)
		features = random_features()
=======
/datum/preferences/proc/randomise_appearance_prefs(randomize_flags = ALL)
	for (var/datum/preference/preference as anything in get_preferences_in_priority_order())
		if (!preference.included_in_randomization_flags(randomize_flags))
			continue
>>>>>>> 5a4c87a9fc3... tgui Preferences Menu + total rewrite of the preferences backend (#61313)

		if (preference.is_randomizable())
			write_preference(preference, preference.create_random_value(src))

/// Randomizes the character according to preferences.
/datum/preferences/proc/apply_character_randomization_prefs(antag_override = FALSE)
<<<<<<< HEAD
	if(!randomise[RANDOM_BODY] && !(antag_override && randomise[RANDOM_BODY_ANTAG]))
		return // Prefs say "no, thank you"
	if(randomise[RANDOM_GENDER] || antag_override && randomise[RANDOM_GENDER_ANTAG])
		gender = pick(MALE, FEMALE, PLURAL)
		switch(gender)
			if(MALE, FEMALE)
				body_type = gender
			else
				body_type = pick(MALE, FEMALE)
	if(randomise[RANDOM_SPECIES])
		random_species()
	else if(randomise[RANDOM_NAME] || antag_override && randomise[RANDOM_NAME_ANTAG])
		real_name = pref_species.random_name(gender, TRUE)
	if(randomise[RANDOM_AGE] || antag_override && randomise[RANDOM_AGE_ANTAG])
		age = rand(AGE_MIN, AGE_MAX)
	if(randomise[RANDOM_UNDERWEAR])
		underwear = random_underwear(gender)
	if(randomise[RANDOM_UNDERWEAR_COLOR])
		underwear_color = random_underwear_color() //MOJAVE SUN EDIT - Hair/Gendered/Colours
	if(randomise[RANDOM_UNDERSHIRT])
		undershirt = random_undershirt(gender)
	if(randomise[RANDOM_SOCKS])
		socks = random_socks()
	if(randomise[RANDOM_BACKPACK])
		backpack = random_backpack()
	if(randomise[RANDOM_JUMPSUIT_STYLE])
		jumpsuit_style = pick(GLOB.jumpsuitlist)
	if(randomise[RANDOM_HAIRSTYLE])
		hairstyle = random_hairstyle(gender)
	if(randomise[RANDOM_FACIAL_HAIRSTYLE])
		facial_hairstyle = random_facial_hairstyle(gender)
	if(randomise[RANDOM_HAIR_COLOR])
		hair_color = random_hair_color() //MOJAVE SUN EDIT - Hair/Gendered/Colours
	if(randomise[RANDOM_FACIAL_HAIR_COLOR])
		facial_hair_color = random_hair_color() //MOJAVE SUN EDIT - Hair/Gendered/Colours
	if(randomise[RANDOM_SKIN_TONE])
		skin_tone = random_skin_tone()
	if(randomise[RANDOM_EYE_COLOR])
		eye_color = random_eye_color() //MOJAVE SUN EDIT - Hair/Gendered/Colours
	features = random_features()


/datum/preferences/proc/random_species()
	var/random_species_type = GLOB.species_list[pick(GLOB.roundstart_races)]
	pref_species = new random_species_type
	if(randomise[RANDOM_NAME])
		real_name = pref_species.random_name(gender,1)
=======
	switch (read_preference(/datum/preference/choiced/random_body))
		if (RANDOM_ANTAG_ONLY)
			if (!antag_override)
				return

		if (RANDOM_DISABLED)
			return
>>>>>>> 5a4c87a9fc3... tgui Preferences Menu + total rewrite of the preferences backend (#61313)

	for (var/datum/preference/preference as anything in get_preferences_in_priority_order())
		if (should_randomize(preference, antag_override))
			write_preference(preference, preference.create_random_value(src))

///Setup the random hardcore quirks and give the character the new score prize.
/datum/preferences/proc/hardcore_random_setup(mob/living/carbon/human/character)
	var/next_hardcore_score = select_hardcore_quirks()
	character.hardcore_survival_score = next_hardcore_score ** 1.2  //30 points would be about 60 score


/**
 * Goes through all quirks that can be used in hardcore mode and select some based on a random budget.
 * Returns the new value to be gained with this setup, plus the previously earned score.
 **/
/datum/preferences/proc/select_hardcore_quirks()
	. = 0

	var/quirk_budget = rand(8, 35)

	all_quirks = list() //empty it out

	var/list/available_hardcore_quirks = SSquirks.hardcore_quirks.Copy()

	while(quirk_budget > 0)
		for(var/i in available_hardcore_quirks) //Remove from available quirks if its too expensive.
			var/datum/quirk/available_quirk = i
			if(available_hardcore_quirks[available_quirk] > quirk_budget)
				available_hardcore_quirks -= available_quirk

		if(!available_hardcore_quirks.len)
			break

		var/datum/quirk/picked_quirk = pick(available_hardcore_quirks)

		var/picked_quirk_blacklisted = FALSE
		for(var/bl in SSquirks.quirk_blacklist) //Check if the quirk is blacklisted with our current quirks. quirk_blacklist is a list of lists.
			var/list/blacklist = bl
			if(!(picked_quirk in blacklist))
				continue
			for(var/iterator_quirk in all_quirks) //Go through all the quirks we've already selected to see if theres a blacklist match
				if((iterator_quirk in blacklist) && !(iterator_quirk == picked_quirk)) //two quirks have lined up in the list of the list of quirks that conflict with each other, so return (see quirks.dm for more details)
					picked_quirk_blacklisted = TRUE
					break
			if(picked_quirk_blacklisted)
				break

		if(picked_quirk_blacklisted)
			available_hardcore_quirks -= picked_quirk
			continue

		if(initial(picked_quirk.mood_quirk) && CONFIG_GET(flag/disable_human_mood)) //check for moodlet quirks
			available_hardcore_quirks -= picked_quirk
			continue

		all_quirks += initial(picked_quirk.name)
		quirk_budget -= available_hardcore_quirks[picked_quirk]
		. += available_hardcore_quirks[picked_quirk]
		available_hardcore_quirks -= picked_quirk

/// Returns what job is marked as highest
/datum/preferences/proc/get_highest_priority_job()
	var/datum/job/preview_job
	var/highest_pref = 0

	for(var/job in job_preferences)
		if(job_preferences[job] > highest_pref)
			preview_job = SSjob.GetJob(job)
			highest_pref = job_preferences[job]

	return preview_job

/datum/preferences/proc/render_new_preview_appearance(mob/living/carbon/human/dummy/mannequin)
	var/datum/job/preview_job = get_highest_priority_job()

	if(preview_job)
		// Silicons only need a very basic preview since there is no customization for them.
		if (istype(preview_job,/datum/job/ai))
			return image('icons/mob/ai.dmi', icon_state = resolve_ai_icon(read_preference(/datum/preference/choiced/ai_core_display)), dir = SOUTH)
		if (istype(preview_job,/datum/job/cyborg))
			return image('icons/mob/robots.dmi', icon_state = "robot", dir = SOUTH)

	// Set up the dummy for its photoshoot
	apply_prefs_to(mannequin, TRUE)

	if(preview_job)
		mannequin.job = preview_job.title
		mannequin.dress_up_as_job(preview_job, TRUE)

	COMPILE_OVERLAYS(mannequin)
	return mannequin.appearance

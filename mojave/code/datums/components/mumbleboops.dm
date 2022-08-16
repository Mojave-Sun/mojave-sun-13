#define MAX_MUMBLEBOOP_CHARACTERS 30

// This system was ported from Concordia and modified

/datum/component/mumbleboop
	var/mumbleboop_sound_override
	var/mumbleboop_sound_male = "mojave/sound/voices/male/vowel_male_"
	var/mumbleboop_sound_female = "mojave/sound/voices/vowel_female_"
	var/mumbleboop_sound_agender = "mojave/sound/voices/vowel_thing_"
	var/volume = MUMBLEBOOP_DEFAULT_VOLUME
	var/duration = MUMBLEBOOP_DEFAULT_DURATION
	var/last_mumbleboop = 0

/datum/component/mumbleboop/Initialize(mumbleboop_sound_override, \
								mumbleboop_sound_male = "mojave/sound/voices/male/vowel_male_", \
								mumbleboop_sound_female = "mojave/sound/voices/vowel_female_", \
								mumbleboop_sound_agender = "mojave/sound/voices/vowel_thing_", \
								volume = MUMBLEBOOP_DEFAULT_VOLUME, \
								duration = MUMBLEBOOP_DEFAULT_DURATION)
	. = ..()
	if(!ismob(parent))
		return COMPONENT_INCOMPATIBLE
	src.mumbleboop_sound_override = mumbleboop_sound_override
	src.mumbleboop_sound_male = mumbleboop_sound_male
	src.mumbleboop_sound_female = mumbleboop_sound_female
	src.mumbleboop_sound_agender = mumbleboop_sound_agender
	src.volume = volume
	src.duration = duration

/datum/component/mumbleboop/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_MOB_POST_SAY, .proc/after_say)

/datum/component/mumbleboop/UnregisterFromParent()
	. = ..()
	UnregisterSignal(parent, COMSIG_MOB_POST_SAY)

/datum/component/mumbleboop/proc/after_say(mob/mumblebooper, list/speech_args, list/speech_spans, list/speech_mods)
	SIGNAL_HANDLER

	last_mumbleboop = world.time
	INVOKE_ASYNC(src, .proc/handle_booping, mumblebooper, speech_args, speech_spans, speech_mods)

/datum/component/mumbleboop/proc/handle_booping(mob/mumblebooper, list/speech_args, list/speech_spans, list/speech_mods)
	var/message = speech_args[SPEECH_MESSAGE]
	var/initial_mumbleboop_time = last_mumbleboop
	var/initial_mumbleboop_sound = mumbleboop_sound_override
	if(!initial_mumbleboop_sound)
		switch(mumblebooper.gender)
			if(MALE)
				initial_mumbleboop_sound = mumbleboop_sound_male
			if(FEMALE)
				initial_mumbleboop_sound = mumbleboop_sound_female
			else
				initial_mumbleboop_sound = mumbleboop_sound_agender
	var/initial_volume = volume
	var/initial_pitch = 0
	var/initial_falloff = 7
	var/boop_letter = null
	var/final_boop = null
	if(speech_mods[WHISPER_MODE])
		initial_volume -= 40
		initial_falloff -= 5
	else if(speech_spans[SPAN_YELL])
		initial_volume += 30
		initial_pitch += 5
		initial_falloff += 3
	var/obj/item/clothing/mask/mask = mumblebooper.get_item_by_slot(ITEM_SLOT_MASK)
	if(istype(mask) && mask.lowers_pitch && !mask.mask_adjusted)
		initial_pitch -= 10
	var/initial_delay = duration
	var/list/hearers = GLOB.player_list.Copy()
	for(var/mob/hearer as anything in hearers)
		if(hearer.client && hearer.can_hear())
			continue
		hearers -= hearer
	var/mumbleboop_delay_cumulative = 0
	for(var/i in 1 to min(length(message), MAX_MUMBLEBOOP_CHARACTERS))
		var/volume = initial_volume
		//var/pitch = initial_pitch Disabled for now. Doesn't work as intended- seemingly anything above default is dumb sounding
		var/falloff_exponent = initial_falloff
		var/current_delay = initial_delay
		switch(lowertext(message[i]))
			if("a")
				boop_letter = "A"
			if("b")
				boop_letter = "gen"
			if("c")
				boop_letter = "gen"
			if("d")
				boop_letter = "gen"
			if("e")
				boop_letter = "E"
			if("f")
				boop_letter = "gen"
			if("g")
				boop_letter = "gen"
			if("h")
				boop_letter = "gen"
			if("i")
				boop_letter = "I"
			if("j")
				boop_letter = "gen"
			if("k")
				boop_letter = "gen"
			if("m")
				boop_letter = "gen"
			if("n")
				boop_letter = "gen"
			if("o")
				boop_letter = "O"
			if("p")
				boop_letter = "gen"
			if("q")
				boop_letter = "gen"
			if("r")
				boop_letter = "gen"
			if("s")
				boop_letter = "gen"
			if("t")
				boop_letter = "gen"
			if("u")
				boop_letter = "U"
			if("v")
				boop_letter = "gen"
			if("w")
				boop_letter = "gen"
			if("x")
				boop_letter = "gen"
			if("y")
				boop_letter = "Y"
			if("z")
				boop_letter = "gen"
			if("!")
				volume = 0
				current_delay *= 1.5
			if("?")
				volume = 0
				current_delay *= 2
			if(",", ";", "-")
				volume = 0
				current_delay *= 1.5
			if(".")
				volume = 0
				current_delay *= 2
			if(" ")
				volume = 0
			//else
			//	pitch = 0
		final_boop = "[initial_mumbleboop_sound][boop_letter].wav"
		addtimer(CALLBACK(src, .proc/play_mumbleboop, hearers, mumblebooper, final_boop, volume, initial_mumbleboop_time), mumbleboop_delay_cumulative + current_delay, falloff_exponent)
		mumbleboop_delay_cumulative += current_delay

/datum/component/mumbleboop/proc/play_mumbleboop(list/hearers, mob/mumblebooper, final_boop, volume, initial_mumbleboop_time, falloff_exponent)
	if(!volume || (last_mumbleboop != initial_mumbleboop_time))
		return
	for(var/mob/hearer as anything in hearers)
		hearer.playsound_local(get_turf(mumblebooper), final_boop, volume, TRUE, falloff_exponent)

#undef MAX_MUMBLEBOOP_CHARACTERS

#define MAX_mumbleboop_CHARACTERS 40

/datum/component/mumbleboop
	var/mumbleboop_sound_override
	var/mumbleboop_sound_male = 'mojave/sound/voices/mumbleboop_male.wav'
	var/mumbleboop_sound_female = 'mojave/sound/voices/mumbleboop_female.wav'
	var/mumbleboop_sound_agender = 'mojave/sound/voices/mumbleboop_agender.wav'
	var/volume = MUMBLEBOOP_DEFAULT_VOLUME
	var/duration = MUMBLEBOOP_DEFAULT_DURATION
	var/last_mumbleboop = 0

/datum/component/mumbleboop/Initialize(mumbleboop_sound_override, \
								mumbleboop_sound_male = 'mojave/sound/voices/mumbleboop_male.wav', \
								mumbleboop_sound_female = 'mojave/sound/voices/mumbleboop_female.wav', \
								mumbleboop_sound_agender = 'mojave/sound/voices/mumbleboop_agender.wav', \
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
	INVOKE_ASYNC(src, .proc/handle_babbling, mumblebooper, speech_args, speech_spans, speech_mods)

/datum/component/mumbleboop/proc/handle_babbling(mob/mumblebooper, list/speech_args, list/speech_spans, list/speech_mods)
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
	if(speech_mods[WHISPER_MODE])
		initial_volume -= 30
	else if(speech_spans[SPAN_YELL])
		initial_volume += 30
	var/initial_pitch = 0
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
	for(var/i in 1 to min(length(message), MAX_mumbleboop_CHARACTERS))
		var/volume = initial_volume
		var/pitch = initial_pitch
		var/current_delay = initial_delay
		switch(lowertext(message[i]))
			if("!")
				pitch += 16
			if("a")
				pitch += 12
			if("b")
				pitch += 11
			if("c")
				pitch += 10
			if("d")
				pitch += 9
			if("e")
				pitch += 8
			if("f")
				pitch += 7
			if("g")
				pitch += 6
			if("h")
				pitch += 5
			if("i")
				pitch += 4
			if("j")
				pitch += 3
			if("k")
				pitch += 2
			if("m")
				pitch += 1
			if("n")
				pitch -= 1
			if("o")
				pitch -= 2
			if("p")
				pitch -= 3
			if("q")
				pitch -= 4
			if("r")
				pitch -= 5
			if("s")
				pitch -= 6
			if("t")
				pitch -= 7
			if("u")
				pitch -= 8
			if("v")
				pitch -= 9
			if("w")
				pitch -= 10
			if("x")
				pitch -= 11
			if("y")
				pitch -= 12
			if("z")
				pitch -= 13
			if("?")
				pitch -= 16
			if(",", ";", "-")
				pitch -= 2
				current_delay *= 1.5
			if(".")
				pitch -= 4
				current_delay *= 2
			if(" ")
				volume = 0
			else
				pitch = 0
		addtimer(CALLBACK(src, .proc/play_mumbleboop, hearers, mumblebooper, pick(initial_mumbleboop_sound), volume, pitch, initial_mumbleboop_time), mumbleboop_delay_cumulative + current_delay)
		mumbleboop_delay_cumulative += current_delay

/datum/component/mumbleboop/proc/play_mumbleboop(list/hearers, mob/mumblebooper, mumbleboop_sound, volume, pitch, initial_mumbleboop_time)
	if(!volume || (last_mumbleboop != initial_mumbleboop_time))
		return
	for(var/mob/hearer as anything in hearers)
		hearer.playsound_local(get_turf(mumblebooper), mumbleboop_sound, volume, FALSE, pitch)

#undef MAX_mumbleboop_CHARACTERS

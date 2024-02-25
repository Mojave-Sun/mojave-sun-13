/////////////////////MOJAVE SUN EMOTE STORAGE///////////////////////

//Yeah ur gonna sniff my backfire -helda harding 2289
/datum/emote/living/sniff/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(.)
		var/turf/open/current_turf = get_turf(user)
		if(istype(current_turf) && current_turf.vapour)
			if(iscarbon(user))
				var/mob/living/carbon/carbon_user = user
				if(carbon_user.internal) //Breathing from internals means we cant smell
					return
				carbon_user.next_smell = world.time + SMELL_COOLDOWN
			current_turf.vapour.SmellAct(user)

// Wipe emote - wipes your eyes or gas mask

/datum/emote/living/wipe
	key = "wipe"
	key_third_person = "wipes"
	message = "wipes their eyes."
	emote_type = EMOTE_VISIBLE
	cooldown = 3.5 SECONDS

/datum/emote/living/wipe/run_emote(mob/user, params, type_override, intentional)
	// If they're wearing a gas mask, it's implied they're wiping the mask. Easier to wipe a mask clean rather than your eyes!
	if(HAS_TRAIT(user, TRAIT_WEARING_GAS_MASK))
		message = "wipes their mask."
		playsound(user.loc, 'mojave/sound/ms13effects/gasmask_wipe.ogg', 2, TRUE)
		user.adjust_blurriness(-100)
		return ..()

	if(!HAS_TRAIT(user, TRAIT_WEARING_GAS_MASK))
		user.adjust_blurriness(-15)
		message = "wipes their eyes."
		return ..()


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

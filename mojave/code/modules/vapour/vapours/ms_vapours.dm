////////////////MOJAVE SUN VAPOUR AND SMELLS STORAGE/////////////////

//Corpse

///Decaying flesh of a human
/datum/vapours/ms13/miasma
	name = "Miasma"
	vapours_flags = VAPOUR_SMELL | VAPOUR_BREATHE_ACT
	smell_intensity = 10
	descriptor = SCENT_DESC_ODOR
	scent = "sickening"

/datum/vapours/ms13/miasma/BreatheAct(mob/living/carbon/victim, amount)
	switch(amount)
		if(5 to 19)
			if(prob(20))
				victim.emote("sniff")
			else if(prob(10))
				victim.emote("gag")
		if(20 to 79)
			if(prob(20))
				victim.emote("sniff")
			if(prob(20))
				victim.emote("gag")
			if(prob(5))
				victim.vomit()
		if(80 to 1000)
			if(prob(50))
				victim.emote("sniff")
				victim.emote("gag")
			if(prob(20))
				victim.vomit()
			victim.adjustToxLoss(2)

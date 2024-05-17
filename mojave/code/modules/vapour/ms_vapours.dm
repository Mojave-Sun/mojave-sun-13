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
	if(HAS_TRAIT(victim, TRAIT_WEARING_GAS_MASK) || amount <= 10)
		return

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

///Sulphur coming from SULFUR growths :D
/datum/vapours/sulfur_concentrate
	name = "Sulfur concentrate"
	vapours_flags = VAPOUR_SMELL | VAPOUR_APPEARANCE | VAPOUR_BREATHE_ACT // TouchAct intentionally excluded until not shart code
	color = COLOR_YELLOW
	alpha = 115
	smell_intensity = 5
	descriptor = SCENT_DESC_SMELL
	scent = "sulfur"

/*
/datum/vapours/sulfur_concentrate/TouchAct(mob/living/carbon/victim, amount) // Disabled for now. Keep it to yo lungs.
	. = ..()

	for(var/obj/item/clothing/C in victim.get_equipped_items())
		if(((C.body_parts_covered & HANDS) && (C.body_parts_covered & ARMS) && (C.body_parts_covered & LEGS) && (C.body_parts_covered & LEGS) && (C.body_parts_covered & HEAD))) //Cover up head to toe!
			return

	switch(amount)
		if(-INFINITY to 20)
			return

		if(20 to 30)
			victim.adjustFireLoss(0.1 * amount)
			if(COOLDOWN_FINISHED(src, agony_announcement))
				victim.throw_alert_text(/atom/movable/screen/alert/text/sad, "Your skin stings!", override = FALSE)
				COOLDOWN_START(src, agony_announcement, 10 SECONDS)

		if(30 to 60)
			victim.adjustFireLoss(0.1 * amount)
			if(COOLDOWN_FINISHED(src, agony_announcement))
				victim.throw_alert_text(/atom/movable/screen/alert/text/sad, "Your skin burns!", override = FALSE)
				victim.emote("scream")
				COOLDOWN_START(src, agony_announcement, 5 SECONDS)

		if(100 to INFINITY)
			victim.adjustFireLoss(0.1 * amount)
			if(COOLDOWN_FINISHED(src, agony_announcement))
				victim.throw_alert_text(/atom/movable/screen/alert/text/cry, "AAAAAAAGGGHHHHHH!!!", override = FALSE)
				victim.emote("agony")
				COOLDOWN_START(src, agony_announcement, 1 SECONDS) */

/datum/vapours/sulfur_concentrate/BreatheAct(mob/living/carbon/victim, amount)
	if(HAS_TRAIT(victim, TRAIT_WEARING_GAS_MASK) || amount <= 10)
		return

	if(COOLDOWN_FINISHED(src, agony_announcement))
		victim.throw_alert_text(/atom/movable/screen/alert/text/dead, "Each breath your take hurts!", override = FALSE)
	COOLDOWN_START(src, agony_announcement, 10 SECONDS)

	if(prob(amount))
		victim.adjustToxLoss(0.1 * amount / 2)
		victim.losebreath += 1
		victim.emote("cough")

	if(prob(amount / 10)) // Yo longs fuct
		victim.ForceContractDisease(new /datum/disease/pocklung)

///CS gas for NCR warcrimes!!
/datum/vapours/cs_gas
	name = "CS Gas"
	vapours_flags = VAPOUR_SMELL | VAPOUR_APPEARANCE | VAPOUR_BREATHE_ACT
	color = COLOR_WHITE
	alpha = 255
	smell_intensity = 5
	descriptor = SCENT_DESC_SMELL
	scent = "strong chemicals"

/datum/vapours/cs_gas/BreatheAct(mob/living/carbon/victim, amount)
	if(HAS_TRAIT(victim, TRAIT_WEARING_GAS_MASK) || amount <= 10)
		return

	if(COOLDOWN_FINISHED(src, agony_announcement))
		victim.throw_alert_text(/atom/movable/screen/alert/text/cry, "Holy shit! It HURTS!", override = FALSE)
	COOLDOWN_START(src, agony_announcement, 10 SECONDS)

	switch(amount)
		if(-INFINITY to 5)
			return

		if(6 to 20)
			victim.emote("cough")
			victim.blur_eyes(1 * (amount))
			victim.Jitter(5)

		if(21 to 60)
			victim.emote("cough")
			victim.blur_eyes(1 * (amount))
			victim.Jitter(10)
			victim.Stun(25)
			victim.Knockdown(25)

		if(61 to INFINITY)
			victim.Knockdown(10)
			victim.blur_eyes(1 * (amount))
			victim.Jitter(10)
			victim.Stun(50)
			victim.Knockdown(50)
			if(prob(amount / 20)) // Small chance for a bit of puke action :D At least one person in a crowd should get this maybe.
				victim.vomit(10, FALSE, TRUE, 1)


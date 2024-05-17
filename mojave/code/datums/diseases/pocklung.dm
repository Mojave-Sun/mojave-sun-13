/// POCKLUNG DISEASE ///
/* This is highly schizophrenic. The in-world reason this exists? Something about mutant bacteria that lives within the sulfur vents below. Cope about it... Wear a mask

Has quirky effects with no cure. Wear a mask.

Occasionally, a chosen one is born... They will adapt to it and "recover" Benefits? not really. Though they'll cough up a little 'pearl' occasionally (kind of often depending on the person tbh) */

/datum/disease/pocklung
	name = "Pocklung"
	desc = "A bacterial/chemically induced condition in which the victim's lungs are degraded by a mixture of sulfur concentrate and the bacteria that has found a home within it."
	disease_flags = CAN_CARRY
	max_stages = 4
	stage_prob = 0.5 // A "subtler" ailment. In comparison to Kuru, at lease. Takes less time to build up on average. If lucky, you very well might even outlast it by the end of the round.
	spread_text = "Non-contagious"
	spread_flags = NONE
	cure_text = "Incurable"
	form = "Condition"
	agent = "bacteria"
	sicktext = "Your chest begins to ache and burn horribly."
	viable_mobtypes = list(/mob/living/carbon/human)
	required_organs = list(/obj/item/organ/lungs)
	bypasses_immunity = TRUE
	severity = DISEASE_SEVERITY_MEDIUM
	var/infection_purity // MFs will be graded like cattle. You'll cough up more shit, but your lungs will be hurt more in the long run.
	//^ This ALSO opens you up to being a candidate for stage 4- the good part! Good luck.

/datum/disease/pocklung/infect(mob/living/infectee, make_copy)
	. = ..()
	infection_purity = rand(1,10)

/datum/disease/pocklung/stage_act(delta_time, times_fired)
	. = ..()
	if(!.)
		return
	var/turf/my_turf = get_turf(affected_mob)
	switch(stage)
		if(1)
			if(DT_PROB(2, delta_time))
				affected_mob.emote("cough")
				affected_mob.Jitter(0.1 SECONDS)
				affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, (0.1 * infection_purity), 100)
		if(2)
			if(DT_PROB(4, delta_time))
				affected_mob.emote("cough")
				affected_mob.Jitter(0.2 SECONDS)
				affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, (0.25 * infection_purity), 100)
				my_turf.VapourTurf(/datum/vapours/sulfur_concentrate, 5)
			if(DT_PROB(3, delta_time))
				affected_mob.adjust_blurriness(5)
		if(3)
			if(DT_PROB(8, delta_time))
				affected_mob.emote("cough")
				affected_mob.Stun(0.5 SECONDS)
				affected_mob.Jitter(0.2 SECONDS)
				affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, (0.5 / infection_purity), 200)
				if(prob(infection_purity))
					affected_mob.vomit(25, TRUE, TRUE, 1)
					affected_mob.visible_message(span_alert("[affected_mob] vomits something up amidst their coughing!"),
						span_userdanger("Through the coughs, you gag up a prize!"),
						span_hear("You hear vomiting, followed by spitting- then, something dropping to the floor quietly."), 4)
					var/obj/item/ms13/component/sulfurpearl/P = new /obj/item/ms13/component/sulfurpearl (affected_mob.loc, rand(1, (infection_purity)))
					P.pixel_x = P.base_pixel_x + rand(-12, 12)
					P.pixel_y = P.base_pixel_y + rand(-12, 12)
				my_turf.VapourTurf(/datum/vapours/sulfur_concentrate, 10)
			if(DT_PROB(1, delta_time))
				affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, (0.25 / infection_purity), 100)
			if(DT_PROB(4, delta_time))
				affected_mob.emote("groan")
		if(4)
			if(DT_PROB(8, delta_time))
				affected_mob.emote("cough")
				if(prob(infection_purity / 2)) // If you're here for the long run, you're gonna be a lil less useful than your short lived friends
					affected_mob.vomit(25, TRUE, TRUE, 1)
					affected_mob.visible_message(span_alert("[affected_mob] vomits something up amidst their coughing!"),
						span_userdanger("Through the coughs, you puke up a prize!"),
						span_hear("You hear vomiting, followed by spitting- then, something dropping to the floor quietly."), 4)
					var/obj/item/ms13/component/sulfurpearl/P = new /obj/item/ms13/component/sulfurpearl (affected_mob.loc, rand(1, (infection_purity)))
					P.pixel_x = P.base_pixel_x + rand(-12, 12)
					P.pixel_y = P.base_pixel_y + rand(-12, 12)
				my_turf.VapourTurf(/datum/vapours/sulfur_concentrate, 15)

/datum/disease/pocklung/update_stage(new_stage)
	. = ..()
	switch(stage)
		if(2)
			to_chat(affected_mob, span_yellowteamradio("Your feet ache almost as badly as your chest."))
			affected_mob.add_movespeed_modifier(/datum/movespeed_modifier/pocklung_negative) // A debuff to move speed
		if(3)
			affected_mob.add_actionspeed_modifier(/datum/actionspeed_modifier/pocklung_negative)
			if(infection_purity <= 5) // If you're not good enough, you're just not good enough. Sorry kiddo. Cough 'til death.
				stage_prob = 0
				max_stages = 3
			else
				stage_prob = stage_prob / 2 // If you're good enough to reach stage 4, you'll have half the chance to roll an upgrade as previous stages.
		if(4) // Stage 4 is actually a SEcReT stage where the "victim" gains immunity to the majority of the harsh effects, but will have certain drawbacks in favor of other negatives
			stage_prob = 0 // alright stop playin
			to_chat(affected_mob, span_yellowteamradio("You suddenly feel a bit better- your body seems to adapt to the condition. Your hands feel steady and your feet no longer weigh you down!"))
			affected_mob.add_actionspeed_modifier(/datum/actionspeed_modifier/pocklung_positive) // Congratulations, you're better than ever!
			affected_mob.remove_actionspeed_modifier(/datum/actionspeed_modifier/pocklung_negative) // Remove the stage 3 action speed debuff!
			affected_mob.remove_movespeed_modifier(/datum/movespeed_modifier/pocklung_negative) // Remove the stage 1 movespeed debuff finally!

/datum/actionspeed_modifier/pocklung_positive
	multiplicative_slowdown = -0.1

/datum/actionspeed_modifier/pocklung_negative
	multiplicative_slowdown = 0.1

/datum/movespeed_modifier/pocklung_positive
	multiplicative_slowdown = -0.1

/datum/movespeed_modifier/pocklung_negative
	multiplicative_slowdown = 0.1

/datum/disease/pocklung
	name = "Pocklung"
	desc = "A chemically induced condition in which the victim's lungs are degraded by sulfur concentrate exposure."
	disease_flags = CAN_CARRY
	max_stages = 3
	stage_prob = 0.5 // A "subtler" ailment. Takes less time to build up on average. If lucky, you very well might even outlast it by the end of the round.
	spread_text = "Non-contagious"
	spread_flags = NONE
	cure_text = "Incurable"
	form = "Condition"
	agent = "decay nodes"
	sicktext = "Your chest begins to ache and burn horribly."
	viable_mobtypes = list(/mob/living/carbon/human)
	required_organs = list(/obj/item/organ/lungs)
	bypasses_immunity = TRUE
	severity = DISEASE_SEVERITY_MEDIUM

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
				affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, 1, 100)
		if(2)
			if(DT_PROB(4, delta_time))
				affected_mob.emote("cough")
				affected_mob.Jitter(0.2 SECONDS)
				affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, 2.5, 100)
				my_turf.VapourTurf(/datum/vapours/sulfur_concentrate, 5)
			if(DT_PROB(3, delta_time))
				affected_mob.adjust_blurriness(5)
		if(3)
			if(DT_PROB(8, delta_time))
				affected_mob.emote("cough")
				affected_mob.Stun(0.5 SECONDS)
				affected_mob.Jitter(0.5 SECONDS)
				affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, 5, 200)
				my_turf.VapourTurf(/datum/vapours/sulfur_concentrate, 5)
			if(DT_PROB(1, delta_time))
				affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, 2.5, 100)
			if(DT_PROB(4, delta_time))
				affected_mob.emote("groan")

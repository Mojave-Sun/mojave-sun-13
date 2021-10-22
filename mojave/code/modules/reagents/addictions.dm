// Obligatory basetype //

/datum/addiction/ms13
	name = "base type MS13 crack addiction"
	withdrawal_stage_messages = list("", "", "")

// Jet //

/datum/addiction/ms13/jet
	name = "jet"
	withdrawal_stage_messages = list("", "", "")

/datum/addiction/jet/withdrawal_enters_stage_1(mob/living/carbon/affected_carbon)
	. = ..()
	to_chat(affected_carbon, span_holoparasite("[pick("Need some jet man...", "It's a good time for some jet.")]"))

/datum/addiction/ms13/jet/withdrawal_stage_1_process(mob/living/carbon/affected_carbon, delta_time)
	. = ..()
	affected_carbon.Dizzy(5)
	if(prob(30))
		affected_carbon.emote(pick("twitch", "groan"))

/datum/addiction/jet/withdrawal_enters_stage_2(mob/living/carbon/affected_carbon)
	. = ..()
	to_chat(affected_carbon, span_holoparasite("[pick("Could really use some jet right now.", "Come on... Let's go get some jet.")]"))

/datum/addiction/ms13/jet/withdrawal_stage_2_process(mob/living/carbon/affected_carbon, delta_time)
	. = ..()
	affected_carbon.set_disgust(60)
	affected_carbon.Dizzy(10)
	if(prob(40))
		affected_carbon.emote(pick("twitch", "groan", "moan"))

/datum/addiction/jet/withdrawal_enters_stage_3(mob/living/carbon/affected_carbon)
	. = ..()
	to_chat(affected_carbon, span_holoparasite("[pick("I really need some jet- NOW!", "I'm FALLING APART!")]"))

/datum/addiction/ms13/jet/withdrawal_stage_3_process(mob/living/carbon/affected_carbon, delta_time)
	. = ..()
	if(!HAS_TRAIT(affected_carbon, TRAIT_IMMOBILIZED) && !isspaceturf(affected_carbon.loc) && isturf(affected_carbon.loc))
		step(affected_carbon, pick(GLOB.cardinals))
	affected_carbon.adjustToxLoss(1, 0)
	affected_carbon.set_disgust(100)
	affected_carbon.Dizzy(15)
	if(prob(50))
		affected_carbon.emote(pick("twitch", "drool", "groan"))

// Rocket //

/datum/addiction/ms13/rocket
	name = "rocket"
	withdrawal_stage_messages = list("", "", "")

/datum/addiction/rocket/withdrawal_enters_stage_1(mob/living/carbon/affected_carbon)
	. = ..()
	to_chat(affected_carbon, span_holoparasite("[pick("Need some rocket man...", "It's a good time for some rocket.")]"))

/datum/addiction/ms13/rocket/withdrawal_stage_1_process(mob/living/carbon/affected_carbon, delta_time)
	. = ..()
	affected_carbon.Dizzy(5)
	if(prob(30))
		affected_carbon.emote(pick("twitch", "groan"))

/datum/addiction/rocket/withdrawal_enters_stage_2(mob/living/carbon/affected_carbon)
	. = ..()
	to_chat(affected_carbon, span_holoparasite("[pick("Could really use some rocket right now.", "Come on... Let's go get some rocket.")]"))

/datum/addiction/ms13/rocket/withdrawal_stage_2_process(mob/living/carbon/affected_carbon, delta_time)
	. = ..()
	affected_carbon.set_disgust(60)
	affected_carbon.Dizzy(10)
	if(prob(40))
		affected_carbon.emote(pick("twitch", "groan", "moan"))

/datum/addiction/rocket/withdrawal_enters_stage_3(mob/living/carbon/affected_carbon)
	. = ..()
	to_chat(affected_carbon, span_holoparasite("[pick("I really need some rocket- NOW!", "I'm FALLING APART!")]"))

/datum/addiction/ms13/rocket/withdrawal_stage_3_process(mob/living/carbon/affected_carbon, delta_time)
	. = ..()
	if(!HAS_TRAIT(affected_carbon, TRAIT_IMMOBILIZED) && !isspaceturf(affected_carbon.loc) && isturf(affected_carbon.loc))
		step(affected_carbon, pick(GLOB.cardinals))
	affected_carbon.adjustToxLoss(1, 0)
	affected_carbon.set_disgust(100)
	affected_carbon.Dizzy(15)
	if(prob(50))
		affected_carbon.emote(pick("twitch", "drool", "groan"))

// Mentats //

/datum/addiction/ms13/mentats
	name = "mentats"
	withdrawal_stage_messages = list("", "", "")

/datum/addiction/mentats/withdrawal_enters_stage_1(mob/living/carbon/affected_carbon)
	. = ..()
	to_chat(affected_carbon, span_notice("[pick("Your head strains slightly", "You begin to feel unwell.")]"))

/datum/addiction/ms13/mentats/withdrawal_stage_1_process(mob/living/carbon/affected_carbon, delta_time)
	. = ..()
	affected_carbon.Jitter(3)
	affected_carbon.Dizzy(5)
	if(prob(20))
		to_chat(affected_carbon, span_warning("[pick("Your head hurts.", "Your head pounds.")]"))
	..()

/datum/addiction/mentats/withdrawal_enters_stage_2(mob/living/carbon/affected_carbon)
	. = ..()
	to_chat(affected_carbon, span_notice("[pick("Your head strains heavily", "You begin to feel very headsick.")]"))

/datum/addiction/ms13/mentats/withdrawal_stage_2_process(mob/living/carbon/affected_carbon, delta_time)
	. = ..()
	affected_carbon.Jitter(5)
	affected_carbon.Dizzy(10)
	if(prob(20))
		affected_carbon.adjustStaminaLoss(25)
		to_chat(affected_carbon, span_warning("[pick("Your head hurts a lot.", "Your head pounds incessantly.")]"))
	..()

/datum/addiction/mentats/withdrawal_enters_stage_3(mob/living/carbon/affected_carbon)
	. = ..()
	to_chat(affected_carbon, span_notice("[pick("Your head pounds in anguish", "You sulk in pain as your head constricts and expands.")]"))

/datum/addiction/ms13/mentats/withdrawal_stage_3_process(mob/living/carbon/affected_carbon, delta_time)
	. = ..()
	affected_carbon.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(1,3))
	affected_carbon.Jitter(5)
	affected_carbon.Dizzy(10)
	if(prob(20))
		affected_carbon.Stun(35)
		to_chat(affected_carbon, span_userdanger("[pick("Your head hurts!", "You feel a burning knife inside your brain!", "A wave of pain fills your head!")]"))
	..()

// Psycho //

/datum/addiction/ms13/psycho
	name = "psycho"
	withdrawal_stage_messages = list("Your eye twitches sl ightly.", "You feel like something changed- But you can't figure out what. This angers you!", "Everything is just- Wrong! What the HELL IS GOING ON?")

/datum/addiction/ms13/psycho/withdrawal_enters_stage_1(mob/living/carbon/affected_carbon)
	. = ..()
	to_chat(affected_carbon, span_warning("Your eye twitches slightly."))

/datum/addiction/ms13/psycho/withdrawal_stage_1_process(mob/living/carbon/affected_carbon, delta_time)
	. = ..()
	affected_carbon.Jitter(5)
	if(prob(20))
		to_chat(affected_carbon, span_warning("You feel angry, and you don't know why..."))
	..()

/datum/addiction/ms13/psycho/withdrawal_stage_2_process(mob/living/carbon/affected_carbon, delta_time)
	. = ..()
	affected_carbon.adjustOrganLoss(ORGAN_SLOT_HEART, 0.25)
	affected_carbon.Jitter(10)
	affected_carbon.Dizzy(10)
	if(prob(20))
		to_chat(affected_carbon, span_warning("[pick("You are filled with anger.", "Is the room spinning...? This is PISSING YOU OFF!", "You REALLY want to PUNCH someone right now.")]"))
	..()

/datum/addiction/ms13/psycho/withdrawal_enters_stage_2(mob/living/carbon/affected_carbon)
	. = ..()
	to_chat(affected_carbon, span_warning("You feel like something changed- But you can't figure out what. This angers you!"))

/datum/addiction/ms13/psycho/withdrawal_enters_stage_3(mob/living/carbon/affected_carbon)
	. = ..()
	to_chat(affected_carbon, span_boldwarning("Everything is just- Wrong! What the HELL IS GOING ON?"))

/datum/addiction/ms13/psycho/withdrawal_stage_3_process(mob/living/carbon/affected_carbon, delta_time)
	. = ..()
	affected_carbon.adjustOrganLoss(ORGAN_SLOT_HEART, 0.65)
	affected_carbon.adjustOrganLoss(ORGAN_SLOT_BRAIN, 0.5)
	affected_carbon.Jitter(5)
	affected_carbon.Dizzy(10)
	if(prob(20))
		to_chat(affected_carbon, span_warning("[pick("Your head burns... Your heart aches... You are FURIOUS!", "You feel a sickening nausea run over you- You're filled with RAGE!", "Why is EVERYONE so adamant on PISSING YOU OFF at a time like this?!")]"))
	..()

// Smooch //

/datum/addiction/ms13/smooch/withdrawal_stage_1_process(mob/living/carbon/affected_carbon)
	. = ..()
	affected_carbon.hallucination += 20
	if(!HAS_TRAIT(affected_carbon, TRAIT_IMMOBILIZED) && !isspaceturf(affected_carbon.loc) && isturf(affected_carbon.loc))
		step(affected_carbon, pick(GLOB.cardinals))
	affected_carbon.Jitter(10)
	affected_carbon.Dizzy(10)
	affected_carbon.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(30))
		affected_carbon.emote(pick("twitch","drool","moan"))

/datum/addiction/ms13/smooch/withdrawal_stage_2_process(mob/living/carbon/affected_carbon)
	. = ..()
	affected_carbon.hallucination += 30
	if(!HAS_TRAIT(affected_carbon, TRAIT_IMMOBILIZED) && !isspaceturf(affected_carbon.loc) && isturf(affected_carbon.loc))
		step(affected_carbon, pick(GLOB.cardinals))
	affected_carbon.Jitter(15)
	affected_carbon.Dizzy(15)
	affected_carbon.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(40))
		affected_carbon.emote(pick("twitch","drool","moan"))

/datum/addiction/ms13/smooch/withdrawal_stage_3_process(mob/living/carbon/affected_carbon)
	. = ..()
	affected_carbon.hallucination += 30
	if(!HAS_TRAIT(affected_carbon, TRAIT_IMMOBILIZED) && !isspaceturf(affected_carbon.loc) && isturf(affected_carbon.loc))
		step(affected_carbon, pick(GLOB.cardinals))
	affected_carbon.Jitter(50)
	affected_carbon.Dizzy(50)
	affected_carbon.adjustToxLoss(5, 0)
	affected_carbon.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(50))
		affected_carbon.emote(pick("twitch","drool","moan"))

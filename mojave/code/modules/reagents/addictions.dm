// Obligatory basetype //

/datum/addiction/ms13
	name = "base type MS13 crack addiction"
	withdrawal_stage_messages = list("", "", "")
	///Higher threshold, when you start being addicted. Should be high so that it's hard to shrug off addictions.
	addiction_gain_threshold = 950
	///Lower threshold, when you stop being addicted
	addiction_loss_threshold = 50
	///Rates at which you lose addiction (in units/second) if you are not on the drug at that time per stage
	addiction_loss_per_stage = list(0.5, 0.5, 1, 1.5)

// Jet //

/datum/addiction/ms13/jet
	name = "jet"
	withdrawal_stage_messages = list("", "", "")

/datum/addiction/jet/withdrawal_enters_stage_1(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_red("[pick("Need some jet man...", "It's a good time for some jet.")]"))

/datum/addiction/ms13/jet/withdrawal_stage_1_process(mob/living/carbon/M, delta_time)
	. = ..()
	M.Dizzy(5)
	if(prob(5))
		M.emote("groan")

/datum/addiction/jet/withdrawal_enters_stage_2(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_red("[pick("Could really use some jet right now.", "Come on... Let's go get some jet.")]"))

/datum/addiction/ms13/jet/withdrawal_stage_2_process(mob/living/carbon/M, delta_time)
	. = ..()
	M.set_disgust(25)
	M.Dizzy(10)
	if(prob(15))
		M.emote(pick("groan", "moan"))

/datum/addiction/jet/withdrawal_enters_stage_3(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_red("[pick("I really need some jet- NOW!", "I'm FALLING APART!")]"))

/datum/addiction/ms13/jet/withdrawal_stage_3_process(mob/living/carbon/M, delta_time)
	. = ..()
	if(!HAS_TRAIT(M, TRAIT_IMMOBILIZED) && !isspaceturf(M.loc) && isturf(M.loc))
		step(M, pick(GLOB.cardinals))
	M.set_disgust(45)
	M.Dizzy(15)
	if(prob(25))
		M.emote(pick("drool", "groan"))

// Rocket //

/datum/addiction/ms13/rocket
	name = "rocket"
	withdrawal_stage_messages = list("", "", "")

/datum/addiction/rocket/withdrawal_enters_stage_1(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_red("[pick("Need some rocket man...", "It's a good time for some rocket.")]"))

/datum/addiction/ms13/rocket/withdrawal_stage_1_process(mob/living/carbon/M, delta_time)
	. = ..()
	M.set_disgust(25)
	M.Dizzy(5)
	if(prob(30))
		M.emote("groan")

/datum/addiction/rocket/withdrawal_enters_stage_2(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_red("[pick("Could really use some rocket right now.", "Come on... Let's go get some rocket.")]"))

/datum/addiction/ms13/rocket/withdrawal_stage_2_process(mob/living/carbon/M, delta_time)
	. = ..()
	M.set_disgust(60)
	M.Dizzy(10)
	if(prob(40))
		M.emote(pick("groan", "moan"))

/datum/addiction/rocket/withdrawal_enters_stage_3(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_red("[pick("I really need some rocket- NOW!", "I'm FALLING APART!")]"))

/datum/addiction/ms13/rocket/withdrawal_stage_3_process(mob/living/carbon/M, delta_time)
	. = ..()
	if(!HAS_TRAIT(M, TRAIT_IMMOBILIZED) && !isspaceturf(M.loc) && isturf(M.loc))
		step(M, pick(GLOB.cardinals))
	M.set_disgust(100)
	M.Dizzy(25)
	if(prob(50))
		M.emote(pick("drool", "groan"))
// Turbo //

/datum/addiction/ms13/turbo
	name = "turbo"
	withdrawal_stage_messages = list("", "", "")

/datum/addiction/turbo/withdrawal_enters_stage_1(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_red("[pick("Going any faster just seems so impossible...", "I don't think I can maintain speed without turbo...")]"))
	if(M.has_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/turbo_slow)) // Stacking this could break stuff.
		M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/turbo_slow) // Don't do drugs, kids. Dependencies are real.

/datum/addiction/ms13/turbo/withdrawal_stage_1_process(mob/living/carbon/M, delta_time)
	. = ..()
	M.Dizzy(5)
	if(prob(5))
		M.emote("groan")

/datum/addiction/turbo/withdrawal_enters_stage_2(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_red("[pick("Really need a speedup right about now.", "I should go get some Turbo. Then I can be fast again.")]"))

/datum/addiction/ms13/jet/withdrawal_stage_2_process(mob/living/carbon/M, delta_time)
	. = ..()
	M.Dizzy(10)
	if(prob(15))
		M.emote(pick("groan", "moan"))

/datum/addiction/turbo/withdrawal_enters_stage_3(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_red("[pick("I really gotta go fast.", "I want to go NOW!")]"))

/datum/addiction/ms13/turbo/withdrawal_stage_3_process(mob/living/carbon/M, delta_time)
	. = ..()
	if(!HAS_TRAIT(M, TRAIT_IMMOBILIZED) && !isspaceturf(M.loc) && isturf(M.loc))
		step(M, pick(GLOB.cardinals))
	M.Dizzy(15)
	if(prob(25))
		M.emote(pick("drool", "groan"))

// Mentats //

/datum/addiction/ms13/mentats
	name = "mentats"
	withdrawal_stage_messages = list("", "", "")

/datum/addiction/mentats/withdrawal_enters_stage_1(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_notice("[pick("Your head strains slightly", "You begin to feel unwell.")]"))

/datum/addiction/ms13/mentats/withdrawal_stage_1_process(mob/living/carbon/M, delta_time)
	. = ..()
	M.Jitter(3)
	M.Dizzy(5)
	if(prob(20))
		to_chat(M, span_warning("[pick("Your head hurts.", "Your head pounds.")]"))
	..()

/datum/addiction/mentats/withdrawal_enters_stage_2(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_notice("[pick("Your head strains heavily", "You begin to feel very headsick.")]"))

/datum/addiction/ms13/mentats/withdrawal_stage_2_process(mob/living/carbon/M, delta_time)
	. = ..()
	M.Jitter(5)
	M.Dizzy(10)
	if(prob(20))
		M.adjustStaminaLoss(25)
		to_chat(M, span_warning("[pick("Your head hurts a lot.", "Your head pounds incessantly.")]"))
	..()

/datum/addiction/mentats/withdrawal_enters_stage_3(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_notice("[pick("Your head pounds in anguish", "You sulk in pain as your head constricts and expands.")]"))

/datum/addiction/ms13/mentats/withdrawal_stage_3_process(mob/living/carbon/M, delta_time)
	. = ..()
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(1,3))
	M.Jitter(5)
	M.Dizzy(10)
	if(prob(20))
		M.Stun(35)
		to_chat(M, span_userdanger("[pick("Your head hurts!", "You feel a burning knife inside your brain!", "A wave of pain fills your head!")]"))
	..()

// Psycho //

/datum/addiction/ms13/psycho
	name = "psycho"
	withdrawal_stage_messages = list("", "", "")

/datum/addiction/ms13/psycho/withdrawal_enters_stage_1(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_warning("Your eye twitches slightly."))

/datum/addiction/ms13/psycho/withdrawal_stage_1_process(mob/living/carbon/M, delta_time)
	. = ..()
	M.Jitter(5)
	if(prob(20))
		to_chat(M, span_warning("You feel angry, and you don't know why..."))
	..()

/datum/addiction/ms13/psycho/withdrawal_stage_2_process(mob/living/carbon/M, delta_time)
	. = ..()
	M.Jitter(10)
	M.Dizzy(10)
	if(prob(20))
		to_chat(M, span_warning("[pick("You are filled with anger.", "Is the room spinning...? This is PISSING YOU OFF!", "You REALLY want to PUNCH someone right now.")]"))
	..()

/datum/addiction/ms13/psycho/withdrawal_enters_stage_2(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_warning("You feel like something changed- But you can't figure out what. This angers you!"))

/datum/addiction/ms13/psycho/withdrawal_enters_stage_3(mob/living/carbon/M)
	. = ..()
	to_chat(M, span_boldwarning("Everything is just- Wrong! What the HELL IS GOING ON?"))

/datum/addiction/ms13/psycho/withdrawal_stage_3_process(mob/living/carbon/M, delta_time)
	. = ..()
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 0.5)
	M.Jitter(5)
	M.Dizzy(10)
	if(prob(20))
		to_chat(M, span_warning("[pick("Your head burns... Your heart aches... You are FURIOUS!", "You feel a sickening nausea run over you- You're filled with RAGE!", "Why is EVERYONE so adamant on PISSING YOU OFF at a time like this?!")]"))
	..()

// Smooch //

/datum/addiction/ms13/smooch/withdrawal_stage_1_process(mob/living/carbon/M)
	. = ..()
	M.hallucination += 20
	if(!HAS_TRAIT(M, TRAIT_IMMOBILIZED) && !isspaceturf(M.loc) && isturf(M.loc))
		step(M, pick(GLOB.cardinals))
	M.Jitter(10)
	M.Dizzy(10)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(30))
		M.emote(pick("twitch","drool","moan"))

/datum/addiction/ms13/smooch/withdrawal_stage_2_process(mob/living/carbon/M)
	. = ..()
	M.hallucination += 30
	if(!HAS_TRAIT(M, TRAIT_IMMOBILIZED) && !isspaceturf(M.loc) && isturf(M.loc))
		step(M, pick(GLOB.cardinals))
	M.Jitter(15)
	M.Dizzy(15)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(40))
		M.emote(pick("twitch","drool","moan"))

/datum/addiction/ms13/smooch/withdrawal_stage_3_process(mob/living/carbon/M)
	. = ..()
	M.hallucination += 30
	if(!HAS_TRAIT(M, TRAIT_IMMOBILIZED) && !isspaceturf(M.loc) && isturf(M.loc))
		step(M, pick(GLOB.cardinals))
	M.Jitter(50)
	M.Dizzy(50)
	M.adjustToxLoss(5, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(50))
		M.emote(pick("twitch","drool","moan"))

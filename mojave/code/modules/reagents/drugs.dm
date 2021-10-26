// Buffout //

/datum/reagent/ms13/buffout
	name = "Buffout"
	description = "A highly potent anabolic steroid popular before the war with athletes. Causes mild liver and heart damage."
	color = "#a19f7c"
	overdose_threshold = 25

/datum/reagent/ms13/buffout/on_mob_metabolize(mob/living/M)
	M.maxHealth += 30 // These probably shouldn't ever be too high for the sake of balance. You're only human anyways afterall.
	M.health += 30
	..()

/datum/reagent/ms13/buffout/on_mob_delete(mob/living/M)
	M.maxHealth -= 30
	M.health -= 30
	..()

/datum/reagent/ms13/buffout/overdose_start(mob/living/M)
	. = ..()
	if(M.maxHealth <= 0) // So that you can't jack dudes up until they're 100% fried. Why? Eh. Let them live as a vegetable. It's funnier.
		return

	M.maxHealth -= 50 // Every time you start to overdose on this crap, you lose out on 50 max health points. Good luck after that. Better off sticking to bar RP buddy.
	to_chat(M, span_warning("You're rushed with a wave of fatigue... Something doesn't feel right, and the world seemingly gets a lot heavier." ))

/datum/reagent/ms13/buffout/overdose_process(mob/living/M)
	if(M.maxHealth <= 0) // If they're already a vegetable, just start putting them out of their misery I guess.
		M.drowsyness += 10
		M.adjustToxLoss(rand(2,5))
		return

	M.drowsyness += 1
	M.emote(pick("groan"))
	..()

// Calmex //

/datum/reagent/ms13/calmex //useful for surgery allegedly
	name = "Calmex"
	description = "A light anaesthetic. Reduces inhibitions and dulls the senses."
	color = "#BC13FE"
	overdose_threshold = 30

/datum/reagent/ms13/calmex/on_mob_life(mob/living/carbon/M)
	if(current_cycle >= 5)
		SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "numb", /datum/mood_event/narcotic_medium, name)
	..()

/datum/reagent/ms13/calmex/overdose_process(mob/living/M)
	switch(current_cycle)
		if(11)
			to_chat(M, span_warning("You start to feel tired..." ))
		if(12 to 24)
			M.drowsyness += 1
		if(24 to INFINITY)
			M.Sleeping(40, 0)
			..()

// Day Tripper //

/datum/reagent/ms13/day_tripper
	name = "Day Tripper"
	description = "A mild hallucinogen. Helps take the edge off, but weakens muscles."
	color = "#94b8cc"
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/ms13/daytripper = 25)

/datum/reagent/ms13/day_tripper/on_mob_metabolize(mob/living/L)
	..()
	SEND_SIGNAL(L, COMSIG_ADD_MOOD_EVENT, "daytripper_drug", /datum/mood_event/happiness_drug)

/datum/reagent/ms13/day_tripper/on_mob_delete(mob/living/L)
	SEND_SIGNAL(L, COMSIG_CLEAR_MOOD_EVENT, "daytripper_drug")
	..()

/datum/reagent/ms13/day_tripper/on_mob_life(mob/living/carbon/M)
	M.set_drugginess(15)
	M.jitteriness = 0
	if(prob(7))
		M.emote(pick("twitch","drool","moan","giggle"))
	..()

/datum/reagent/ms13/day_tripper/overdose_process(mob/living/M)
	M.adjust_disgust(2)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 0.2)
	..()

// Steady //

/datum/reagent/ms13/steady
	name = "Steady"
	description = "A military grade relaxant. Reduces weapon sway and increases effective accuracy, but carries a severe risk of addiction."
	color = "#665355"
	overdose_threshold = 30

// X-Cell //

/datum/reagent/ms13/x_cell
	name = "X-Cell"
	description = "A general purpose performance enhancer. Gives a general boost to all SPECIAL stats, but with a high risk of addiction."
	color = "#766494"
	overdose_threshold = 30

// Hydra //

/datum/reagent/ms13/hydra
	name = "Hydra"
	description = "A curative agent that anaesthetises and restores crippled limbs. Causes heart damage."
	color = "#60A584"
	overdose_threshold = 30

/datum/reagent/ms13/hydra/on_mob_add(mob/living/M, amount)
	to_chat(M, span_notice("Your insides start tingling slightly. You can feel things shifting."))
	..()

/datum/reagent/ms13/hydra/on_mob_life(mob/living/carbon/M) // This needs to be unscuffed before we can use it. It WORKS. Just too well. Instant healing of wounds for as long as it's in your blood. I'm not qualified for this! help!
	if(!isliving(M))
		return

	for(var/thing in M.all_wounds)
		var/datum/wound/blunt/severe/W = thing
		W.remove_wound()

/datum/reagent/ms13/hydra/on_mob_delete(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, span_notice("Everything seems back to normal now."))
	..()

// Jet //

/datum/reagent/ms13/jet
	name = "Jet"
	description = "A highly addictive substance. Causes lung damage and addiction."
	color = "#ca4f4f"
	overdose_threshold = 45
	addiction_types = list(/datum/addiction/ms13/jet = 45)

/datum/reagent/ms13/jet/on_mob_add(mob/living/carbon/human/M)
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.add_filter("jet_blur", 1, list("type" = "radial_blur", "size" = 0))
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/jet)

	for(var/filter in game_plane_master_controller.get_filters("jet_blur"))
		animate(filter, loop = -1, size = 0.04, time = 2 SECONDS, easing = ELASTIC_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(size = 0, time = 6 SECONDS, easing = CIRCULAR_EASING|EASE_IN)
	if(isliving(M))
		to_chat(M, span_userdanger("You feel an incredible pulsating high! You just absolutely love life in this moment!"))
	..()

/datum/reagent/ms13/jet/on_mob_delete(mob/living/carbon/human/M)
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.remove_filter("jet_blur")
	M.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/jet)
	if(isliving(M))
		to_chat(M, span_userdanger("You come down from your high. Maybe you should go get some more?"))
	..()

/datum/reagent/ms13/jet/on_mob_life(mob/living/carbon/M)
	M.adjustStaminaLoss(-2.5, 0)
	M.setOrganLoss(ORGAN_SLOT_LUNGS, rand(0.25, 2))
	if(prob(12))
		M.emote(pick("drool", "moan", "chuckle"))
	..()

/datum/reagent/ms13/jet/overdose_start(mob/living/M)
	to_chat(M, span_userdanger("You start tripping hard!"))
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/ms13/jet/overdose_process(mob/living/M)
	M.hallucination += 10
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, rand(0.25,5))
	..()

// Rocket //

/datum/reagent/ms13/rocket
	name = "Rocket"
	description = "A variant of jet. Has more potent combat properties, but carries a higher risk of addiction."
	color = "#a35353"
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/ms13/rocket = 40)

/datum/reagent/ms13/rocket/on_mob_add(mob/living/carbon/human/M)
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.add_filter("rocket_blur", 1, list("type" = "radial_blur", "size" = 0))
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/rocket)

	for(var/filter in game_plane_master_controller.get_filters("rocket_blur"))
		animate(filter, loop = -1, size = 0.02, time = 2 SECONDS, easing = JUMP_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(size = 0, time = 6 SECONDS, easing = JUMP_EASING|EASE_IN)
	if(isliving(M))
		to_chat(M, span_userdanger("You feel an incredible high! But feel very focused..."))
	..()

/datum/reagent/ms13/rocket/on_mob_delete(mob/living/carbon/human/M)
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.remove_filter("rocket_blur")
	M.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/jet)

	if(isliving(M))
		to_chat(M, span_userdanger("You come down from your high. Everything seems back to normal."))
	..()

/datum/reagent/ms13/rocket/on_mob_life(mob/living/carbon/M)
	M.adjustStaminaLoss(-5, 0)
	M.setOrganLoss(ORGAN_SLOT_LUNGS, rand(0.25, 1))
	if(prob(12))
		M.emote(pick("twitch","drool","moan"))

/datum/reagent/ms13/rocket/overdose_start(mob/living/M)
	to_chat(M, span_userdanger("You start tripping hard!"))
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/ms13/rocket/overdose_process(mob/living/M)
	M.hallucination += 10
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, rand(2,8))
	..()

// Turbo //

/datum/reagent/ms13/turbo
	name = "Turbo"
	description = "Jet mixed with cazador poison and hairspray. Results in extremely strong Jet effects."
	color = "#be8585"
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/ms13/turbo = 35)

/datum/reagent/ms13/turbo/on_mob_add(mob/living/carbon/human/M)
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.add_filter("turbo_wave", 1, list("type" = "wave", "x" = 32, "y" = 32))
	for(var/filter in game_plane_master_controller.get_filters("turbo_wave"))
		animate(filter, time = 32 SECONDS, loop = -1, easing = LINEAR_EASING, offset = 32, flags = ANIMATION_PARALLEL)
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/turbo)
	M.sound_environment_override = SOUND_ENVIRONMENT_DRUGGED
	if(isliving(M))
		to_chat(M, span_notice("The world around you begins to slow down."))
	..()

/datum/reagent/ms13/turbo/on_mob_delete(mob/living/carbon/human/M)
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.remove_filter("turbo_wave")
	M.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/turbo)
	M.sound_environment_override = NONE
	if(isliving(M))
		to_chat(M, span_notice("The world around you starts speeding up again."))
	..()

/datum/reagent/ms13/turbo/on_mob_life(mob/living/carbon/M)
	M.setOrganLoss(ORGAN_SLOT_LUNGS, rand(0.25, 2))
	if(prob(12))
		M.emote(pick("stare", "glare"))
	..()

/datum/reagent/ms13/turbo/overdose_start(mob/living/M)
	to_chat(M, span_userdanger("You start tripping hard!"))
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)
	..()

/datum/reagent/ms13/turbo/overdose_process(mob/living/M)
	M.hallucination += 10
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, rand(0.25,5))
	..()

// Mentats //

/datum/reagent/ms13/mentats
	name = "Mentat powder"
	description = "A powerful nootropic that increases mental faculties and cures brain damage, but increases thirst."
	color = "#a0dfe7"
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/ms13/mentats = 25)

/datum/reagent/ms13/mentats/on_mob_life(mob/living/carbon/C)
	C.adjustOrganLoss(ORGAN_SLOT_BRAIN, -2*REM)
	if(prob(15))
		C.cure_trauma_type(resilience = TRAUMA_RESILIENCE_BASIC)
	..()

/datum/reagent/ms13/mentats/overdose_process(mob/living/carbon/M)
	M.Jitter(3)
	M.adjustToxLoss(0.5, 1)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -5*REM)
	if(prob(50))
		to_chat(M, span_warning("<[pick("Your head hurts a lot.", "Your head pounds incessantly.")]"))
	else if(prob(33))
		to_chat(M, span_userdanger("[pick("Your head hurts!", "You feel a burning knife inside your brain!", "A wave of pain fills your head!")]"))
		M.Stun(35)
	if(prob(1))
		to_chat(M, span_userdanger("You feel something within your head snap."))
		M.gain_trauma_type(BRAIN_TRAUMA_MILD, TRAUMA_RESILIENCE_ABSOLUTE)
	..()

// Psycho //

/datum/reagent/ms13/psycho //military grade bath salts? SIGN ME AND THE REST OF AMERICA THE FUCK UP!
	name = "Psycho"
	description = "A military grade amphetamine. Causes increased strength and endurance, but induces a powerful psychosis."
	color = "#cf6060"
	overdose_threshold = 20
	addiction_types = list(/datum/addiction/ms13/psycho = 35)
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage

/datum/reagent/ms13/psycho/on_mob_metabolize(mob/living/M)
	ADD_TRAIT(M, TRAIT_STUNIMMUNE, type)
	ADD_TRAIT(M, TRAIT_SLEEPIMMUNE, type)
	M.apply_status_effect(STATUS_EFFECT_SPASMS)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	M.overlay_fullscreen("psycho", /atom/movable/screen/fullscreen/color_vision/red)
	if(prob(25))
		M.adjustOrganLoss(ORGAN_SLOT_HEART, )
	M.visible_message(span_danger("[M]'s eyes go empty, with their face quickly shifting to a scorn"), span_narsiesmall("Your mind suddenly begins to drift- you begin to feel ANGRY."))
	..()

/datum/reagent/ms13/psycho/on_mob_end_metabolize(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_STUNIMMUNE, type)
	REMOVE_TRAIT(M, TRAIT_SLEEPIMMUNE, type)
	M.remove_status_effect(STATUS_EFFECT_SPASMS)
	if(rage)
		QDEL_NULL(rage)
	M.clear_fullscreen("psycho")
	..()

/datum/reagent/ms13/psycho/overdose_start(mob/living/M)
	to_chat(M, span_narsiesmall("YOU FEEL AN INSATIABLE BLOODLUST!"))
	..()

/datum/reagent/ms13/psycho/overdose_process(mob/living/M)
	M.Jitter(10)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 0.5)
	if(prob(15))
		M.emote(pick("twitch", "shiver"))
	if(prob(15))
		M.adjustToxLoss(2, 0)
	..()

/datum/reagent/ms13/psycho/on_mob_life(mob/living/M)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "gone_psycho", /datum/mood_event/stimulant_heavy, name)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 0.25)
	M.hallucination += 5
	..()

// Rebound //

/datum/reagent/ms13/rebound
	name = "Rebound"
	description = "A powerful mix of adrenaline and liquid Jet. Makes the user faster, but causes considerable heart damage."
	color = "#ddab69"
	overdose_threshold = 30

// OVERDRIVE //

/datum/reagent/ms13/overdrive
	name = "Overdrive"
	description = "A modified version of Psycho, designed to produce a stronger effect. Extremely dangerous."
	color = "#ac4b4b"
	overdose_threshold = 30
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage

/datum/reagent/ms13/overdrive/on_mob_metabolize(mob/living/M)
	..()
	ADD_TRAIT(M, TRAIT_STUNIMMUNE, type)
	ADD_TRAIT(M, TRAIT_SLEEPIMMUNE, type)
	ADD_TRAIT(M, TRAIT_NOSOFTCRIT, TRAUMA_TRAIT)
	ADD_TRAIT(M, TRAIT_NOHARDCRIT, TRAUMA_TRAIT)
	M.apply_status_effect(STATUS_EFFECT_SPASMS)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	M.overlay_fullscreen("overdrive", /atom/movable/screen/fullscreen/color_vision/red)

/datum/reagent/ms13/overdrive/on_mob_end_metabolize(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_STUNIMMUNE, type)
	REMOVE_TRAIT(M, TRAIT_SLEEPIMMUNE, type)
	REMOVE_TRAIT(M, TRAIT_NOSOFTCRIT, TRAUMA_TRAIT)
	REMOVE_TRAIT(M, TRAIT_NOHARDCRIT, TRAUMA_TRAIT)
	M.remove_status_effect(STATUS_EFFECT_SPASMS)
	if(rage)
		QDEL_NULL(rage)
	M.clear_fullscreen("overdrive")
	..()

/datum/reagent/ms13/overdrive/overdose_start(mob/living/M)
	M.emote("scream")
	M.drop_all_held_items()
	M.visible_message(span_userdanger("[M]'s chest produces an audible pop. They look visibly stunned and in pain."), span_userdanger("A pop is heard coming from your chest and sudden pain appears- It's INTOLERABLE! What happened?"), span_hear("You hear a pop."))
	REMOVE_TRAIT(M, TRAIT_STUNIMMUNE, type)
	REMOVE_TRAIT(M, TRAIT_SLEEPIMMUNE, type)
	M.Stun(25)
	..()

/datum/reagent/ms13/overdrive/overdose_process(mob/living/carbon/M)
	if(prob(35)) // panic
		to_chat(M, span_userdanger("[pick("OH SHIT!", "THE PAIN!", "AGHHHH!", "OH GOD IT HURTS!")]"))
	if(prob(10))
		M.vomit(25, TRUE ,TRUE)
	M.Jitter(20)
	M.emote(pick("twitch", "shiver"))
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(1, 5))
	addtimer(CALLBACK(src, .proc/heartsplosion, M), rand(1, 5) SECONDS) // We want to delay the actual removal of the heart a tiny bit so people can get out a "Oh damn" or something. You go ZZZzzz mode the second you don't have one.
	..()

/datum/reagent/ms13/overdrive/proc/heartsplosion(mob/living/carbon/M)
	var/obj/item/organ/heart/our_heart = M.getorganslot(ORGAN_SLOT_HEART)
	qdel(our_heart)
	M.visible_message(span_notice("[M] looks faint and begins to close their eyes."), span_alert("This doesn't feel good at all..."))

/datum/reagent/ms13/overdrive/on_mob_life(mob/living/M)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "gone_OVERDRIVE", /datum/mood_event/stimulant_heavy, name)
	if(prob(25))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(1, 5))
	M.hallucination += 10
	..()

// Addictol //

/datum/reagent/ms13/addictol
	name = "Addictol"
	description = "An effective pre-War medicine that works both physically and psychologically to remove both the symptoms of drug abuse and the craving."
	color = "#8da070"
	overdose_threshold = 10

/datum/reagent/ms13/addictol/on_mob_metabolize(mob/living/carbon/M)
	..()
	if(M.mind)
		for(var/addiction_type in subtypesof(/datum/addiction))
			M.mind.remove_addiction_points(addiction_type, MAX_ADDICTION_POINTS) //Remove addictions
	to_chat(M, span_green("Your head feels a lot more clear now!"))

/*/datum/reagent/ms13/addictol/overdose_start(mob/living/carbon/M) This is busted, probably. Let's not for now.
	..()
	if(M.mind)
		for(var/addiction_type in subtypesof(/datum/addiction/ms13))
			M.mind.add_addiction_points(addiction_type, MAX_ADDICTION_POINTS) //KILL.
*/
/datum/reagent/ms13/addictol/overdose_process(mob/living/carbon/M)
	M.adjustToxLoss(5, 0)
	..()

/datum/reagent/ms13/addictol/on_mob_life(mob/living/M)
	M.adjustToxLoss(2, 0)
	..()

/////// Movespeed Modifiers ///////

/datum/movespeed_modifier/reagent/ms13

/datum/movespeed_modifier/reagent/ms13/jet
	multiplicative_slowdown = -0.1

/datum/movespeed_modifier/reagent/ms13/rocket
	multiplicative_slowdown = -0.2

/datum/movespeed_modifier/reagent/ms13/turbo
	multiplicative_slowdown = -0.35

/datum/movespeed_modifier/reagent/ms13/turbo_slow
	multiplicative_slowdown = 0.35

// Buffout //

/datum/reagent/ms13/buffout
	name = "buffout"
	description = "A highly potent anabolic steroid popular before the war with athletes. Causes mild liver and heart damage."
	color = "#a19f7c"
	overdose_threshold = 25
	metabolization_rate = 0.08 * REM

/datum/reagent/ms13/buffout/on_mob_metabolize(mob/living/M)
	M.maxHealth += 30 // These probably shouldn't ever be too high for the sake of balance. You're only human anyways afterall.
	M.health += 30
	return ..()

/datum/reagent/ms13/buffout/on_mob_delete(mob/living/M)
	M.maxHealth -= 30
	M.health -= 30
	return ..()

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
	return ..()

// Calmex //

/datum/reagent/ms13/calmex //useful for surgery allegedly
	name = "calmex"
	description = "A light anaesthetic. Reduces inhibitions and dulls the senses."
	color = "#BC13FE"
	overdose_threshold = 30
	metabolization_rate = 0.12 * REM

/datum/reagent/ms13/calmex/on_mob_metabolize(mob/living/M)
	M.throw_alert_text(/atom/movable/screen/alert/text, "You feel empty inside.", override = FALSE)
	return ..()

/datum/reagent/ms13/calmex/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(current_cycle >= 5)
		SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "numb", /datum/mood_event/narcotic_medium, name)
	return ..()

/datum/reagent/ms13/calmex/overdose_process(mob/living/M)
	switch(current_cycle)
		if(11)
			to_chat(M, span_warning("You start to feel tired..." ))
		if(12 to 24)
			M.drowsyness += 1
		if(24 to INFINITY)
			M.Sleeping(40, 0)
			return ..()

// Calmex //

/datum/reagent/ms13/medx //useful for surgery allegedly
	name = "medx"
	description = "A very strong painkilling agent. Renders pain into a foreign concept, and allows you to continue doing whatever you please."
	color = "#59a1d4"
	overdose_threshold = 30
	metabolization_rate = 0.12 * REM

/datum/reagent/ms13/medx/on_mob_add(mob/living/carbon/M, delta_time, times_fired)
	. = ..()
	to_chat(M, span_noticealien("Your whole body begins to feel numb, and a wave of calmness washes over you."))
	ADD_TRAIT(M, TRAIT_NOSOFTCRIT, TRAUMA_TRAIT)
	ADD_TRAIT(M, TRAIT_STUNIMMUNE, TRAUMA_TRAIT)
	return ..()

/datum/reagent/ms13/medx/on_mob_delete(mob/living/carbon/M, delta_time, times_fired)
	. = ..()
	REMOVE_TRAIT(M, TRAIT_NOSOFTCRIT, TRAUMA_TRAIT)
	REMOVE_TRAIT(M, TRAIT_STUNIMMUNE, TRAUMA_TRAIT)
	return ..()

/datum/reagent/ms13/medx/overdose_start(mob/living/M)
	. = ..()
	M.visible_message(span_alert("[M] begins to take long deep breaths, looking a bit ill."), span_userdanger("You notice it becomes a bit harder to breathe and begin taking deep breaths."), span_hear("You hear heavy panting."), 4)
	return ..()

/datum/reagent/ms13/medx/overdose_process(mob/living/M)
	. = ..()
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, 0.2)
	M.adjustOxyLoss(rand(3, 4))
	if(!prob(10))
		return
	if(M.stat == CONSCIOUS)
		M.Stun(15)
		M.visible_message(span_alert("[M] stops for a moment, trying to regain his breath."), span_userdanger("You try to take some deep breaths, struggling to get enough oxygen to keep you going."), span_hear("You hear heavy panting."), 4)
	if(M.stat == UNCONSCIOUS || HARD_CRIT)
		M.visible_message(span_alert("[M] makes choking sounds as a light foam pours from their mouth."), span_userdanger("You can feel yourself choking on something."), span_hear("You hear choking."), 4)
		M.emote("twitch")
		M.Jitter(1)
	return ..()

// Rad-X //

/datum/reagent/ms13/radx // I would NEVER rename potassium iodine
	name = "Rad-X"
	description = "Prevents radiation damaging effects"
	reagent_state = SOLID
	color = "#593509"
	metabolization_rate = 2 * REAGENTS_METABOLISM
	overdose_threshold = 30
	ph = 12 //It's a reducing agent

/datum/reagent/ms13/radx/on_mob_metabolize(mob/living/L)
	. = ..()
	ADD_TRAIT(L, TRAIT_HALT_RADIATION_EFFECTS, "[type]")

/datum/reagent/ms13/radx/on_mob_end_metabolize(mob/living/L)
	REMOVE_TRAIT(L, TRAIT_HALT_RADIATION_EFFECTS, "[type]")
	return ..()

/datum/reagent/ms13/radx/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if (HAS_TRAIT(M, TRAIT_IRRADIATED))
		M.adjustToxLoss(-1 * REM * delta_time)

	..()

// Cateye //

/datum/reagent/ms13/cateye //slight darkness vision boost
	name = "cateye"
	description = "A chem that enhances the eye's ability to see in the dark."
	color = "#22ac37"
	overdose_threshold = 25
	metabolization_rate = 0.6 * REM

/datum/reagent/ms13/cateye/on_mob_add(mob/living/carbon/M, delta_time, times_fired)
	. = ..()
	to_chat(M, span_warning("Your eyes slightly ache as everything seemingly begins to brighten."))
	M.add_quirk(/datum/quirk/night_vision)
	return ..()

/datum/reagent/ms13/cateye/on_mob_delete(mob/living/carbon/M, delta_time, times_fired)
	. = ..()
	M.remove_quirk(/datum/quirk/night_vision)
	return ..()

/datum/reagent/ms13/cateye/overdose_process(mob/living/M)
	M.blur_eyes(5)
	M.blind_eyes(3)
	M.adjustOrganLoss(ORGAN_SLOT_EYES, 0.2)
	return ..()

// Day Tripper //

/datum/reagent/ms13/day_tripper
	name = "day Tripper"
	description = "A mild hallucinogen. Helps take the edge off, but weakens muscles."
	color = "#94b8cc"
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/ms13/daytripper = 25)
	metabolization_rate = 0.6 * REM

/datum/reagent/ms13/day_tripper/on_mob_metabolize(mob/living/L)
	. = ..()
	SEND_SIGNAL(L, COMSIG_ADD_MOOD_EVENT, "daytripper_drug", /datum/mood_event/happiness_drug)

/datum/reagent/ms13/day_tripper/on_mob_delete(mob/living/L)
	SEND_SIGNAL(L, COMSIG_CLEAR_MOOD_EVENT, "daytripper_drug")
	return ..()

/datum/reagent/ms13/day_tripper/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.jitteriness = 0
	return ..()

/datum/reagent/ms13/day_tripper/overdose_process(mob/living/M)
	M.adjust_disgust(2)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 0.2)
	return ..()

// Steady //

/datum/reagent/ms13/steady
	name = "steady"
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
	name = "hydra"
	description = "A curative agent that anaesthetises and restores crippled limbs. Causes heart damage from the overworking, and tends to make the user feel ill."
	color = "#60A584"
	overdose_threshold = 15
	metabolization_rate = 1 * REM

/datum/reagent/ms13/hydra/on_mob_metabolize(mob/living/M, amount)
	. = ..()
	to_chat(M, span_notice("Your insides start tingling slightly. You can feel things shifting."))
	return ..()

/datum/reagent/ms13/hydra/on_mob_life(mob/living/carbon/M, datum/reagent/chem, delta_time, times_fired) // This needs to be unscuffed before we can use it. It WORKS. Just too well. Instant healing of wounds for as long as it's in your blood. I'm not qualified for this! help!
	if(!isliving(M))
		return
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 0.2)
	var/obj/item/bodypart/bodypart = pick(M.bodyparts)
	var/datum/wound/blunt/existing_break = locate(/datum/wound/blunt) in bodypart.wounds
	// If we have an existing burn try to upgrade it
	if(existing_break)
		existing_break.remove_wound()
	return ..()

/datum/reagent/ms13/hydra/on_mob_delete(mob/living/carbon/human/M)
	. = ..()
	if(isliving(M))
		to_chat(M, span_notice("Everything seems back to normal now."))

// Jet //

/datum/reagent/ms13/jet
	name = "jet"
	description = "A highly addictive substance. Causes lung damage and addiction."
	color = "#ca4f4f"
	overdose_threshold = 35
	addiction_types = list(/datum/addiction/ms13/jet = 45)
	metabolization_rate = 0.8 * REM

/datum/reagent/ms13/jet/on_mob_add(mob/living/carbon/human/M)
	if(!M.hud_used)
		return
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.add_filter("jet_blur", 1, list("type" = "radial_blur", "size" = 0))
	for(var/filter in game_plane_master_controller.get_filters("jet_blur"))
		animate(filter, loop = -1, size = 0.04, time = 2 SECONDS, easing = ELASTIC_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(size = 0, time = 6 SECONDS, easing = CIRCULAR_EASING|EASE_IN)
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/jet)
	if(isliving(M))
		to_chat(M, span_userdanger("You feel an incredible pulsating high! You just absolutely love life in this moment!"))
	return ..()

/datum/reagent/ms13/jet/on_mob_delete(mob/living/carbon/human/M)
	if(!M.hud_used)
		return
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.remove_filter("jet_blur")
	M.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/jet)
	if(isliving(M))
		to_chat(M, span_userdanger("You come down from your high. Maybe you should go get some more?"))
	return ..()

/datum/reagent/ms13/jet/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjustStaminaLoss(-2.5, 0)
	M.setOrganLoss(ORGAN_SLOT_LUNGS, rand(0.25, 2))
	if(prob(12))
		M.emote(pick("drool", "moan", "chuckle"))
	return ..()

/datum/reagent/ms13/jet/overdose_start(mob/living/M)
	to_chat(M, span_userdanger("Your chest tenses up, and you struggle to breathe as it aches!"))
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/ms13/jet/overdose_process(mob/living/M)
	M.hallucination += 10
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, rand(1,2))
	return ..()

// Rocket //

/datum/reagent/ms13/rocket
	name = "rocket"
	description = "A variant of jet. Has more potent combat properties, but carries a higher risk of addiction."
	color = "#a35353"
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/ms13/rocket = 40)
	metabolization_rate = 0.8 * REM

/datum/reagent/ms13/rocket/on_mob_add(mob/living/carbon/human/M)
	if(!M.hud_used)
		return
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.add_filter("rocket_blur", 1, list("type" = "radial_blur", "size" = 0))
	for(var/filter in game_plane_master_controller.get_filters("rocket_blur"))
		animate(filter, loop = -1, size = 0.02, time = 2 SECONDS, easing = JUMP_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(size = 0, time = 6 SECONDS, easing = JUMP_EASING|EASE_IN)
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/rocket)
	if(isliving(M))
		to_chat(M, span_green("You feel an incredible high! But feel very focused..."))
	return ..()

/datum/reagent/ms13/rocket/on_mob_delete(mob/living/carbon/human/M)
	if(!M.hud_used)
		return
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.remove_filter("rocket_blur")
	game_plane_master_controller.remove_filter("rocket_OD_blur")
	M.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/jet)

	if(isliving(M))
		to_chat(M, span_userdanger("You come down from your high. Everything seems back to normal."))
	return ..()

/datum/reagent/ms13/rocket/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjustStaminaLoss(-5, 0)
	M.setOrganLoss(ORGAN_SLOT_LUNGS, rand(0.25, 1))
	if(prob(12))
		M.emote("twitch")
		M.Jitter(5)
	return ..()

/datum/reagent/ms13/rocket/overdose_start(mob/living/M)
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.remove_filter("rocket_blur")
	game_plane_master_controller.add_filter("rocket_OD_blur", 1, list("type" = "angular_blur", "size" = 45))
	for(var/filter in game_plane_master_controller.get_filters("rocket_OD_blur"))
		animate(filter, loop = 23, size = 15, time = 3 SECONDS, easing = LINEAR_EASING|EASE_IN|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(size = 15, time = 6 SECONDS, easing = LINEAR_EASING|EASE_IN|EASE_OUT)
	to_chat(M, span_bolddanger("The world spins around you, and you can't focus on ANYTHING!"))
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/ms13/rocket/overdose_process(mob/living/M)
	M.hallucination += 10
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, rand(2,8))
	return ..()

// Turbo //

/datum/reagent/ms13/turbo
	name = "turbo"
	description = "Jet mixed with cazador poison and hairspray. Results in extremely strong Jet effects."
	color = "#be8585"
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/ms13/turbo = 35)
	metabolization_rate = 1 * REM

/datum/reagent/ms13/turbo/on_mob_add(mob/living/carbon/human/M)
	if(!M.hud_used)
		return
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.add_filter("turbo_wave", 1, list("type" = "wave", "x" = 32, "y" = 32))
	for(var/filter in game_plane_master_controller.get_filters("turbo_wave"))
		animate(filter, time = 32 SECONDS, loop = -1, easing = LINEAR_EASING, offset = 32, flags = ANIMATION_PARALLEL)
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/turbo)
	M.sound_environment_override = SOUND_ENVIRONMENT_DRUGGED
	if(isliving(M))
		to_chat(M, span_notice("The world around you begins to slow down."))
	return ..()

/datum/reagent/ms13/turbo/on_mob_delete(mob/living/carbon/human/M)
	if(!M.hud_used)
		return
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.remove_filter("turbo_wave")
	M.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/turbo)
	M.sound_environment_override = NONE
	if(isliving(M))
		to_chat(M, span_notice("The world around you starts speeding up again."))
	return ..()

/datum/reagent/ms13/turbo/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.setOrganLoss(ORGAN_SLOT_LUNGS, rand(0.25, 2))
	if(prob(12))
		M.emote(pick("stare", "glare"))
	return ..()

/datum/reagent/ms13/turbo/overdose_start(mob/living/M)
	to_chat(M, span_userdanger("You start tripping hard!"))
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/turbo_slow)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)
	return ..()

/datum/reagent/ms13/turbo/overdose_process(mob/living/M)
	M.hallucination += 10
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, rand(0.25,5))
	return ..()

// Mentats //

/datum/reagent/ms13/mentats
	name = "mentat powder"
	description = "A powerful nootropic that increases mental faculties and cures brain damage, but increases thirst."
	color = "#a0dfe7"
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/ms13/mentats = 25)
	metabolization_rate = 1 * REM

/datum/reagent/ms13/mentats/on_mob_life(mob/living/carbon/C)
	C.adjustOrganLoss(ORGAN_SLOT_BRAIN, -2*REM)
	if(prob(15))
		C.cure_trauma_type(resilience = TRAUMA_RESILIENCE_BASIC)
	return ..()

/datum/reagent/ms13/mentats/overdose_process(mob/living/carbon/M)
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
	return ..()

// Psycho //

/datum/reagent/ms13/psycho //military grade bath salts? SIGN ME AND THE REST OF AMERICA THE FUCK UP!
	name = "psycho"
	description = "A military grade amphetamine. Causes increased strength and endurance, but induces a powerful psychosis."
	color = "#cf6060"
	overdose_threshold = 25
	addiction_types = list(/datum/addiction/ms13/psycho = 35)
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage
	metabolization_rate = 0.7 * REM

/datum/reagent/ms13/psycho/on_mob_add(mob/living/M)
	. = ..()
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	M.overlay_fullscreen("psycho", /atom/movable/screen/fullscreen/color_vision/red)
	M.visible_message(span_danger("[M]'s eyes go empty, with their face quickly shifting to a scorn"), span_narsiesmall("Your mind suddenly begins to drift- you begin to feel ANGRY."))
	ADD_TRAIT(M, TRAIT_SLEEPIMMUNE, type)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "gone_psycho", /datum/mood_event/stimulant_heavy, name)
	M.throw_alert_text(/atom/movable/screen/alert/text, "You feel a burning urge to harm.", override = FALSE)

/datum/reagent/ms13/psycho/on_mob_life(mob/living/M)
	if(prob(75))
		shake_camera(M, 0.25, 1)
		M.emote("jitter")
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 0.25)
	M.hallucination += 5
	return ..()

/datum/reagent/ms13/psycho/on_mob_delete(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_STUNIMMUNE, type)
	REMOVE_TRAIT(M, TRAIT_SLEEPIMMUNE, type)
	if(rage)
		QDEL_NULL(rage)
	M.clear_fullscreen("psycho")
	return ..()

/datum/reagent/ms13/psycho/overdose_start(mob/living/M)
	to_chat(M, span_narsiesmall("YOU FEEL AN INSATIABLE BLOODLUST!")) // pitbull
	M.throw_alert_text(/atom/movable/screen/alert/text, "These people should all be dead!", override = FALSE)
	return ..()

/datum/reagent/ms13/psycho/overdose_process(mob/living/M)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 0.5)
	if(prob(15))
		M.Jitter(10)
		M.emote(pick("twitch", "shiver"))
	if(prob(15))
		M.adjustToxLoss(2, 0)
	return ..()

// Rebound //

/datum/reagent/ms13/rebound
	name = "rebound"
	description = "A powerful mix of adrenaline and liquid Jet. Makes the user faster, but causes considerable heart damage."
	color = "#ddab69"
	overdose_threshold = 30

// OVERDRIVE //

/datum/reagent/ms13/overdrive
	name = "overdrive"
	description = "A modified version of Psycho, designed to produce a stronger effect. Extremely dangerous."
	color = "#ac4b4b"
	overdose_threshold = 30
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage
	metabolization_rate = 0.75 * REM

/datum/reagent/ms13/overdrive/on_mob_metabolize(mob/living/M)
	. = ..()
	ADD_TRAIT(M, TRAIT_STUNIMMUNE, type)
	ADD_TRAIT(M, TRAIT_SLEEPIMMUNE, type)
	ADD_TRAIT(M, TRAIT_NOSOFTCRIT, TRAUMA_TRAIT)
	ADD_TRAIT(M, TRAIT_NOHARDCRIT, TRAUMA_TRAIT)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	M.overlay_fullscreen("overdrive", /atom/movable/screen/fullscreen/color_vision/red)
	M.throw_alert_text(/atom/movable/screen/alert/text, "You feel a burning urge to harm.", override = FALSE)

/datum/reagent/ms13/overdrive/on_mob_end_metabolize(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_STUNIMMUNE, type)
	REMOVE_TRAIT(M, TRAIT_SLEEPIMMUNE, type)
	REMOVE_TRAIT(M, TRAIT_NOSOFTCRIT, TRAUMA_TRAIT)
	REMOVE_TRAIT(M, TRAIT_NOHARDCRIT, TRAUMA_TRAIT)
	if(M.reagents.has_reagent(/datum/reagent/ms13/psycho)) // do NOT mix these. worst mistake of my life.
		overdose_start()
	if(rage)
		QDEL_NULL(rage)
	M.clear_fullscreen("overdrive")
	return ..()

/datum/reagent/ms13/overdrive/overdose_start(mob/living/M)
	M.emote("scream")
	M.drop_all_held_items()
	M.visible_message(span_userdanger("[M]'s chest produces an audible pop. They look visibly stunned and in pain."), span_userdanger("A pop is heard coming from your chest and sudden pain appears- It's INTOLERABLE! What happened?"), span_hear("You hear a pop."))
	REMOVE_TRAIT(M, TRAIT_STUNIMMUNE, type)
	REMOVE_TRAIT(M, TRAIT_SLEEPIMMUNE, type)
	M.throw_alert_text(/atom/movable/screen/alert/text/sad, "Ohhh shit...", override = FALSE)
	M.Stun(50)
	addtimer(CALLBACK(src, .proc/heartsplosion, M), rand(3, 8) SECONDS) // We want to delay the actual removal of the heart a tiny bit so people can get out a "Oh damn" or something. You go ZZZzzz mode the second you don't have one.
	return ..()

/datum/reagent/ms13/overdrive/overdose_process(mob/living/carbon/M)
	if(prob(35)) // panic
		to_chat(M, span_userdanger("[pick("OH SHIT!", "THE PAIN!", "AGHHHH!", "OH GOD IT HURTS!")]"))
	if(prob(10))
		M.vomit(25, TRUE ,TRUE)
	M.Jitter(20)
	M.emote(pick("twitch", "shiver"))
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(1, 5))
	return ..()

/datum/reagent/ms13/overdrive/proc/heartsplosion(mob/living/carbon/M)
	var/obj/item/organ/heart/our_heart = M.getorganslot(ORGAN_SLOT_HEART)
	qdel(our_heart) // jhkljl;;....jlhlj;.
	M.visible_message(span_notice("[M] looks faint and begins to close their eyes."), span_alert("This doesn't feel good at all..."))
	M.throw_alert_text(/atom/movable/screen/alert/text/cry, "You feel the area where your heart should be get a lot sloshier.", override = FALSE)

/datum/reagent/ms13/overdrive/on_mob_life(mob/living/M)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "gone_OVERDRIVE", /datum/mood_event/stimulant_heavy, name)
	if(prob(25))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(1, 5))
	M.hallucination += 10
	return ..()

// Addictol //

/datum/reagent/ms13/addictol
	name = "addictol"
	description = "An effective pre-War medicine that works both physically and psychologically to remove both the symptoms of drug abuse and the craving."
	color = "#8da070"
	overdose_threshold = 10
	metabolization_rate = 0.8 * REM

/datum/reagent/ms13/addictol/on_mob_metabolize(mob/living/carbon/M)
	. = ..()
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
	return ..()

/datum/reagent/ms13/addictol/on_mob_life(mob/living/M)
	M.adjustToxLoss(2, 0)
	return ..()

// Stimpaks //

/datum/reagent/ms13/medicine/stimpak_fluid
	name = "stimpak fluid"
	description = "stimpak"
	reagent_state = LIQUID
	color = "#ad1717"
	metabolization_rate = 1.6
	overdose_threshold = 15
	/// The value to subtract from the mob's damage, as well as the value to base the ODing off
	var/heal_Rate = 10
	/// Let's do some damage.
	var/OD_multiplier = 1
	/// To prevent double dosing of super/regular stimpaks, avoiding OD
	var/forbidden_double_dose = /datum/reagent/ms13/medicine/stimpak_fluid/super
	/// Super stimpak moment
	var/stamina_damage = 0
// Blatant rip from the coagulant reagent //
	/// The bloodiest wound that the patient has will have its blood_flow reduced by about half this much each second
	var/clot_rate = 0.5
	/// While this reagent is in our bloodstream, we reduce all bleeding by this factor
	var/passive_bleed_modifier = 0.2
	/// For tracking when we tell the person we're no longer bleeding
	var/was_working

/datum/reagent/ms13/medicine/stimpak_fluid/on_mob_metabolize(mob/living/M)
	ADD_TRAIT(M, TRAIT_COAGULATING, /datum/reagent/ms13/medicine/stimpak_fluid)
	M.throw_alert_text(/atom/movable/screen/alert/text/brutal, "You feel your body start mending itself rapidly.", override = FALSE)
	return ..()

/datum/reagent/ms13/medicine/stimpak_fluid/on_mob_end_metabolize(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_COAGULATING, /datum/reagent/ms13/medicine/stimpak_fluid)
	return ..()

/datum/reagent/ms13/medicine/stimpak_fluid/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	. = ..()

	var/obj/item/organ/heart/our_heart = M.getorganslot(ORGAN_SLOT_HEART)

	if(!M.reagents.has_reagent((forbidden_double_dose))) // Stacking healing items? Yeah right.
		M.adjustBruteLoss(-(heal_Rate), 0)
		M.adjustFireLoss(-(heal_Rate), 0)
		M.adjustStaminaLoss((stamina_damage), 0)
		if(!M.blood_volume || !M.all_wounds)
			return

		var/datum/wound/bloodiest_wound
		for(var/i in M.all_wounds)
			var/datum/wound/iter_wound = i
			if(iter_wound.blood_flow)
				if(iter_wound.blood_flow > bloodiest_wound?.blood_flow)
					bloodiest_wound = iter_wound

		if(bloodiest_wound)
			if(!was_working)
				to_chat(M, span_green("I can already feel my wounds closing!"))
				was_working = TRUE
			bloodiest_wound.blood_flow = max(0, bloodiest_wound.blood_flow - (clot_rate * REM * delta_time))
		else if(was_working)
			was_working = FALSE

	else
		to_chat(M, span_userdanger("Oh dear god... Shouldn't do that..."))
		our_heart.applyOrganDamage(9.5 * (OD_multiplier))
		if(DT_PROB(14.5, delta_time))
			M.losebreath += rand(4, 8)
			M.adjustOxyLoss(rand(3, 8))
			if(prob(25 * (OD_multiplier)))
				to_chat(M, span_userdanger("Oh this is bad..."))
				M.vomit(20)
				M.adjustOxyLoss(rand(4, 7))
				M.Stun(35)

/datum/reagent/ms13/medicine/stimpak_fluid/overdose_process(mob/living/carbon/human/M, delta_time, times_fired)
	. = ..()
	if(!M.blood_volume)
		return

	var/obj/item/organ/heart/our_heart = M.getorganslot(ORGAN_SLOT_HEART)
	our_heart.applyOrganDamage(9.5 * (OD_multiplier))

	if(DT_PROB(7.5, delta_time))
		M.losebreath += rand(2, 4)
		M.adjustOxyLoss(rand(1, 3))
		if(prob(25 * (OD_multiplier)))
			to_chat(M, span_userdanger("Can't catch my breath..."))
			M.adjustOxyLoss(rand(3, 4))
			M.Stun(35)

/datum/reagent/ms13/medicine/stimpak_fluid/on_mob_metabolize(mob/living/M)
	if(!ishuman(M))
		return

	var/mob/living/carbon/human/blood_boy = M
	blood_boy.physiology?.bleed_mod *= passive_bleed_modifier

// Super Stimpak //

/datum/reagent/ms13/medicine/stimpak_fluid/super
	name = "super stimpak fluid"
	reagent_state = LIQUID
	color = "#c73131"
	metabolization_rate = 1.6
	overdose_threshold = 15
	heal_Rate = 20
	OD_multiplier = 1.5
	forbidden_double_dose = /datum/reagent/ms13/medicine/stimpak_fluid
	stamina_damage = 20
	clot_rate = 0.6
	passive_bleed_modifier = 0.4

// Bitter Drink //

/datum/reagent/medicine/bitter_drink
	name = "Bitter drink"
	description = "A herbal remedy known for its healing properies, brewed from Xander and Broc."
	reagent_state = LIQUID
	color ="#aea447"
	taste_description = "harsh bitterness"
	metabolization_rate = 4.55 * REAGENTS_METABOLISM // 0.95 per second
	overdose_threshold = 40

/datum/reagent/medicine/bitter_drink/on_mob_life(mob/living/carbon/M)
	if(!M.reagents.has_reagent(/datum/reagent/ms13/medicine/stimpak_fluid) || !M.reagents.has_reagent(/datum/reagent/ms13/medicine/stimpak_fluid/super))
		M.adjustFireLoss(-3.35)
		M.adjustBruteLoss(-3.35)
		. = TRUE
	else
		M.adjustFireLoss(-0.5)
		M.adjustBruteLoss(-0.5)
		M.adjustStaminaLoss(1)
	..()

/datum/reagent/medicine/bitter_drink/overdose_process(mob/living/M)
	M.hallucination = clamp(M.hallucination + (5 * REM), 0, 60)
	M.dizziness = max(M.dizziness - (6 * REM), 0)
	..()
	. = TRUE


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

//UNCRAFTABLE (MUST BE SCAVENGED)
/datum/reagent/ms13/buffout
	name = "Buffout"
	description = "A highly potent anabolic steroid popular before the war with athletes. Causes mild liver and heart damage."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 1

/datum/reagent/ms13/buffout/on_mob_metabolize(mob/living/M)
	M.maxHealth += 30
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
	color = "#BC13FE" // rgb: 96, 165, 132
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
			. = 1
	..()

// Day Tripper //

/datum/reagent/ms13/day_tripper
	name = "Day Tripper"
	description = "A mild hallucinogen. Helps take the edge off, but weakens muscles."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

// Smooch //

/datum/reagent/ms13/smooch
	name = "Smooch"
	description = "A novel smokable from Northern Nevada. Tastes terrible, but causes mellowness and ecstacy. Prolonged use causes extreme brain damage."
	color = "#65FF00"
	overdose_threshold = 20
	taste_description = "putrid death"

/datum/reagent/ms13/smooch/on_mob_metabolize(mob/living/L)
	..()
	SEND_SIGNAL(L, COMSIG_ADD_MOOD_EVENT, "smooch_drug", /datum/mood_event/happiness_drug)

/datum/reagent/ms13/smooch/on_mob_delete(mob/living/L)
	SEND_SIGNAL(L, COMSIG_CLEAR_MOOD_EVENT, "smooch_drug")
	..()

/datum/reagent/ms13/smooch/on_mob_life(mob/living/carbon/M)
	M.set_drugginess(15)
	M.jitteriness = 0
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 0.2)
	if(prob(7))
		M.emote(pick("twitch","drool","moan","giggle"))
	..()
	. = 1

/datum/reagent/ms13/smooch/overdose_process(mob/living/M)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 0.5)
	M.adjustToxLoss(0.5, 0)
	M.adjust_disgust(2)
	..()
	. = 1

// Steady //

/datum/reagent/ms13/steady
	name = "Steady"
	description = "A military grade relaxant. Reduces weapon sway and increases effective accuracy, but carries a severe risk of addiction."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

// X-Cell //

/datum/reagent/ms13/x_cell
	name = "X-Cell"
	description = "A general purpose performance enhancer. Gives a general boost to all SPECIAL stats, but with a high risk of addiction."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

// Hydra //

/datum/reagent/ms13/hydra
	name = "Hydra"
	description = "A curative agent that anaesthetises and restores crippled limbs. Causes heart damage."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/ms13/hydra/on_mob_add(mob/living/M, amount)
	. = ..()
	to_chat(M, span_notice("Your insides start tingling slightly. You can feel things shifting."))

/datum/reagent/ms13/hydra/on_mob_life(mob/living/carbon/M) // This needs to be unscuffed before we can use it. It WORKS. Just too well. Instant healing of wounds for as long as it's in your blood. I'm not qualified for this! help!
	. = ..()
	..()
	if(!isliving(M))
		return

	for(var/thing in M.all_wounds)
		var/datum/wound/blunt/severe/W = thing
		W.remove_wound()

/datum/reagent/ms13/hydra/on_mob_delete(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, span_notice("Your insides halt to a stop. Everything seems back to normal now."))

// Jet //

/datum/reagent/ms13/jet
	name = "Jet"
	description = "A highly addictive substance. Causes lung damage and addiction."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/ms13/jet = 35)

/datum/reagent/ms13/jet/on_mob_add(mob/living/carbon/human/M)
	..()
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.add_filter("jet_blur", 1, list("type" = "radial_blur", "size" = 0))
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/jet)

	for(var/filter in game_plane_master_controller.get_filters("jet_blur"))
		animate(filter, loop = -1, size = 0.04, time = 2 SECONDS, easing = ELASTIC_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(size = 0, time = 6 SECONDS, easing = CIRCULAR_EASING|EASE_IN)
	if(isliving(M))
		to_chat(M, span_userdanger("You feel an incredible pulsating high! You just absolutely love life in this moment!"))

/datum/reagent/ms13/jet/on_mob_delete(mob/living/carbon/human/M)
	..()
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.remove_filter("jet_blur")
	M.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/jet)

	if(isliving(M))
		to_chat(M, span_userdanger("You come down from your high. Maybe you should go get some more?"))

/datum/reagent/ms13/jet/on_mob_life(mob/living/carbon/M)
	M.setOrganLoss(ORGAN_SLOT_LUNGS, rand(0.25, 2))
	if(prob(12))
		M.emote(pick("twitch", "drool", "moan", "giggle"))
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
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/ms13/rocket = 45)

/datum/reagent/ms13/rocket/on_mob_add(mob/living/carbon/human/M)
	..()
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.add_filter("rocket_blur", 1, list("type" = "radial_blur", "size" = 0))
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/rocket)

	for(var/filter in game_plane_master_controller.get_filters("rocket_blur"))
		animate(filter, loop = -1, size = 0.02, time = 2 SECONDS, easing = JUMP_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(size = 0, time = 6 SECONDS, easing = JUMP_EASING|EASE_IN)
	if(isliving(M))
		to_chat(M, span_userdanger("You feel an incredible high! But feel very focused..."))

/datum/reagent/ms13/rocket/on_mob_delete(mob/living/carbon/human/M)
	..()
	var/atom/movable/plane_master_controller/game_plane_master_controller = M.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
	game_plane_master_controller.remove_filter("rocket_blur")
	M.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/ms13/jet)

	if(isliving(M))
		to_chat(M, span_userdanger("You come down from your high. Everything seems back to normal."))

/datum/reagent/ms13/rocket/on_mob_life(mob/living/carbon/M)
	M.adjustStaminaLoss(-20, 0)
	M.AdjustAllImmobility(-5)
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

	..()

// Mentats //

/datum/reagent/ms13/mentats
	name = "Mentat powder"
	description = "A powerful nootropic that increases mental faculties and cures brain damage, but increases thirst."
	color = "#60A584" // rgb: 96, 165, 132
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
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 20
	addiction_types = list(/datum/addiction/ms13/psycho = 25)
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage

/datum/reagent/ms13/psycho/on_mob_metabolize(mob/living/M)
	..()
	ADD_TRAIT(M, TRAIT_STUNIMMUNE, type)
	ADD_TRAIT(M, TRAIT_SLEEPIMMUNE, type)
	M.apply_status_effect(STATUS_EFFECT_SPASMS)
	M.maxHealth += 25
	M.health += 25
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	M.overlay_fullscreen("psycho", /atom/movable/screen/fullscreen/color_vision/red)
	if(prob(25))
		M.adjustOrganLoss(ORGAN_SLOT_HEART, )

/datum/reagent/ms13/psycho/on_mob_end_metabolize(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_STUNIMMUNE, type)
	REMOVE_TRAIT(M, TRAIT_SLEEPIMMUNE, type)
	M.remove_status_effect(STATUS_EFFECT_SPASMS)
	M.maxHealth -= 25
	M.health -= 25
	if(rage)
		QDEL_NULL(rage)
	M.clear_fullscreen("psycho")
	..()

/datum/reagent/ms13/psycho/overdose_start(mob/living/M)
	to_chat(M, span_narsiesmall("YOU FEEL AN INSATIABLE BLOODLUST!"))

/datum/reagent/ms13/psycho/overdose_process(mob/living/M)
	M.Jitter(10)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 0.5)
	if(prob(5))
		M.drop_all_held_items()
	if(prob(15))
		M.emote(pick("scream","twitch"))
	if(prob(15))
		M.adjustToxLoss(3, 0)
	..()

/datum/reagent/ms13/psycho/on_mob_life(mob/living/M)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "gone_psycho", /datum/mood_event/stimulant_heavy, name)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 1)
	M.hallucination += 5
	..()
	. = 1


// Rebound //

/datum/reagent/ms13/rebound
	name = "Rebound"
	description = "A powerful mix of adrenaline and liquid Jet. Makes the user faster, but causes considerable heart damage."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

// Turbo //

/datum/reagent/ms13/turbo
	name = "Turbo"
	description = "Jet mixed with cazador poison and hairspray. Results in extremely strong Jet effects."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

// Voodoo //

/datum/reagent/ms13/voodoo
	name = "Voodoo"
	description = "A potent mix of animal venoms and alcohol. Results in numbness that reduces damage."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

// Mutie //

/datum/reagent/ms13/mutie
	name = "Mutie"
	description = "A potent mutagenic serum that causes random mutations."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

// OVERDRIVE //

/datum/reagent/ms13/overdrive
	name = "Overdrive"
	description = "A modified version of Psycho, designed to produce a stronger effect. Extremely dangerous."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/////// Movespeed Modifiers ///////

/datum/movespeed_modifier/reagent/ms13

/datum/movespeed_modifier/reagent/ms13/jet
	multiplicative_slowdown = -0.10

/datum/movespeed_modifier/reagent/ms13/rocket
	multiplicative_slowdown = -0.15

/datum/movespeed_modifier/reagent/ms13/turbo
	multiplicative_slowdown = -0.25

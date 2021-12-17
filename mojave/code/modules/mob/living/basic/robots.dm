/mob/living/basic/ms13/robot
	name = "robot"
	desc = "beep boop you have dysentery."
	icon = 'mojave/icons/mob/ms13robots.dmi'
	icon_state = "assaultron"
	mob_biotypes = MOB_ROBOTIC
	gender = MALE //i guess?
	idlesound = list('mojave/sound/ms13items/tracker_far.ogg')
	health = 150
	maxHealth = 150
	speed = 1
	attack_verb_continuous = "dissects"
	attack_verb_simple = "stabs"
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_sound = 'sound/weapons/punch1.ogg'
	combat_mode = TRUE
	faction = list("robot")
	speak_emote = list("states","dictates")
	var/shadow_type = null // For shadows below floating robots

	ai_controller = /datum/ai_controller/basic_controller/ms13/robot

/mob/living/basic/ms13/robot/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/death_drops, list(/obj/effect/decal/cleanable/robot_debris))
	AddElement(/datum/element/ranged_attacks, null, 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_2.ogg', /obj/projectile/beam/ms13/laser/handy)

/datum/ai_controller/basic_controller/ms13/robot
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic()
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/random_speech/ms13/robot,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_melee_attack_subtree/ms13/robot,
		/datum/ai_planning_subtree/find_and_hunt_target
	)

/datum/ai_planning_subtree/basic_melee_attack_subtree/ms13/robot
	melee_attack_behavior = /datum/ai_behavior/basic_melee_attack/ms13/robot

/datum/ai_behavior/basic_melee_attack/ms13/robot
	action_cooldown = 1.0 SECONDS

//This is a seperate controlled for ranged robots.


/datum/ai_controller/basic_controller/ms13/robot/rangedrobot

	planning_subtrees = list(
		/datum/ai_planning_subtree/random_speech/ms13/robot,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/ms13/robot,  //If we are attacking someone, this will prevent us from hunting
		/datum/ai_planning_subtree/find_and_hunt_target
	)

/datum/ai_planning_subtree/basic_ranged_attack_subtree/ms13/robot
	ranged_attack_behavior = /datum/ai_behavior/basic_ranged_attack/ms13/robot

/datum/ai_behavior/basic_ranged_attack/ms13/robot
	action_cooldown = 3 SECONDS



/mob/living/basic/ms13/robot/assaultron
	name = "assaultron"
	desc = "A robot designed with a sole concept in mind. Combat efficiency. It boasts a strong range laser attack, and devestating up-close piercing blade hands."
	icon_state = "assaultron"
	icon_living = "assaultron"
	idlesound = list('mojave/sound/ms13items/tracker_far.ogg')
	health = 150
	maxHealth = 150
	melee_damage_lower = 10
	melee_damage_upper = 25
	wound_bonus = 5
	bare_wound_bonus = 5
	attack_verb_continuous = "flays"
	attack_verb_simple = "rends"
	sharpness = SHARP_POINTY

/mob/living/basic/ms13/robot/assaultron/death()
	. = ..()
	do_sparks(3, TRUE, src)


/mob/living/basic/ms13/robot/handy
	name = "Mr. Handy"
	desc = "A standard model Mr. Handy unit. It's long lost any rational wires in its circuits."
	icon_state = "mrhandy_claw"
	icon_living = "mrhandy_claw"
	health = 150
	maxHealth = 150
	melee_damage_lower = 10
	melee_damage_upper = 20
	bare_wound_bonus = 5
	speak_emote = list("states", "says")
	attack_verb_continuous = "pinches"
	attack_verb_simple = "pinch"
	sharpness = SHARP_POINTY
	shadow_type = "shadow_large"

/mob/living/basic/ms13/robot/handy/New()
	..()
	add_overlay(image(icon, "[shadow_type]", BELOW_MOB_LAYER, dir))

/mob/living/basic/ms13/robot/handy/death()
	. = ..()
	do_sparks(3, TRUE, src)
	qdel(src)

/mob/living/basic/ms13/robot/handy/saw
	desc = "A work model Mr. Handy unit, armed with a horrifyingly sharp saw. It's long lost any rational wires in its circuits."
	icon_state = "mrhandy_saw"
	icon_living = "mrhandy_saw"
	melee_damage_lower = 15
	melee_damage_upper = 35
	wound_bonus = 5
	bare_wound_bonus = 10
	attack_verb_continuous = "saws"
	attack_verb_simple = "saw"
	attack_sound = 'sound/weapons/circsawhit.ogg'


/mob/living/basic/ms13/robot/handy/laser
	desc = "An armed model of Mr. Handy unit. It's long lost any rational wires in its circuits. It's equipped with a laser rifle!"
	icon_state = "mrhandy_laser"
	icon_living = "mrhandy_laser"
	melee_damage_lower = 15
	melee_damage_upper = 35
	wound_bonus = 5
	bare_wound_bonus = 10
	attack_verb_continuous = "saws"
	attack_verb_simple = "saw"
	attack_sound = 'sound/weapons/circsawhit.ogg'
	ai_controller = /datum/ai_controller/basic_controller/ms13/robot/rangedrobot

/mob/living/basic/ms13/robot/handy/laser/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/ranged_attacks, null, 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_2.ogg', /obj/projectile/beam/ms13/laser/handy)


/mob/living/basic/ms13/robot/handy/gutsy
	name = "Mr. Gutsy"
	desc = "A militarized version of the Handy model. Equiped with a compact plasma rifle, it's a dangerous foe."
	icon_state = "mrhandy_gutsy"
	icon_living = "mrhandy_gutsy"
	melee_damage_lower = 15
	melee_damage_upper = 35
	wound_bonus = 5
	bare_wound_bonus = 10
	attack_verb_continuous = "saws"
	attack_verb_simple = "saw"
	attack_sound = 'sound/weapons/circsawhit.ogg'
	ai_controller = /datum/ai_controller/basic_controller/ms13/robot/rangedrobot
	projectiletype = /obj/projectile/bullet/ms13/plasma/gutsy
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/plasrifle/plasma_3.ogg'

/mob/living/basic/ms13/robot/handy/laser/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/ranged_attacks, null, 'mojave/sound/ms13weapons/gunsounds/plasrifle/plasma_3.ogg', /obj/projectile/bullet/ms13/plasma/gutsy)

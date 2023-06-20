/mob/living/basic/ms13/robot
	name = "robot"
	desc = "beep boop you have dysentery."
	icon = 'mojave/icons/mob/ms13robots.dmi'
	icon_state = "assaultron"
	mob_biotypes = MOB_ROBOTIC
	gender = NEUTER
	health = 150
	maxHealth = 150
	speed = 1
	attack_verb_continuous = "dissects"
	attack_verb_simple = "stabs"
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_sound = 'sound/weapons/punch1.ogg'
	deathsound = 'mojave/sound/ms13npc/robot_death.ogg'
	combat_mode = TRUE
	faction = list("robots")
	speak_emote = list("states","dictates")
	var/shadow_type = null // For shadows below floating robots

	ai_controller = /datum/ai_controller/basic_controller/ms13/robot

/mob/living/basic/ms13/robot/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/death_drops, list(/obj/effect/decal/cleanable/robot_debris))

/datum/ai_controller/basic_controller/ms13/robot
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic()
	)

	ai_movement = /datum/ai_movement/basic_avoidance/bypass_tables
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
	action_cooldown = 1.5 SECONDS

/mob/living/basic/ms13/robot/handy
    name = "Mr. Handy"
    desc = "A standard model Mr. Handy unit. It's long lost any rational wires in its circuits."
    icon_state = "mrhandy_claw"
    health = 130
    maxHealth = 130
    melee_damage_lower = 15
    melee_damage_upper = 15
    subtractible_armour_penetration = 5
    speed = 0.5
    speak_emote = list("states", "says")
    attack_verb_continuous = "pinches"
    attack_verb_simple = "pinch"
    attack_sound = 'mojave/sound/ms13weapons/meleesounds/pipe_hit.ogg'
    sharpness = NONE
    wound_bonus = 0 // These dudes for real will usually one shot dislocate limbs if they're given anything above one apparently. I'd rather them never do it than always do it.
    bare_wound_bonus = 0
    shadow_type = "shadow_large"

/mob/living/basic/ms13/robot/handy/New()
    ..()
    add_overlay(image(icon, "[shadow_type]", BELOW_MOB_LAYER, dir))

/mob/living/basic/ms13/robot/handy/death()
	. = ..()
	do_sparks(3, TRUE, src)
	new /obj/item/stack/sheet/ms13/scrap/two(loc)
	new /obj/item/stack/sheet/ms13/scrap_parts(loc)
	new /obj/item/stack/sheet/ms13/scrap_electronics(loc)
	playsound(src, 'mojave/sound/ms13npc/robot_death.ogg', 60, TRUE)
	qdel(src)

/mob/living/basic/ms13/robot/handy/saw
    desc = "A work model Mr. Handy unit, armed with a horrifyingly sharp saw. It's long lost any rational wires in its circuits."
    icon_state = "mrhandy_saw"
    melee_damage_lower = 25
    melee_damage_upper = 25
    subtractible_armour_penetration = 15
    sharpness = SHARP_EDGED
    wound_bonus = 8
    bare_wound_bonus = 10
    attack_verb_continuous = "saws"
    attack_verb_simple = "saw"
    attack_sound = list('mojave/sound/ms13weapons/meleesounds/ripper_hit1.ogg', 'mojave/sound/ms13weapons/meleesounds/ripper_hit2.ogg')

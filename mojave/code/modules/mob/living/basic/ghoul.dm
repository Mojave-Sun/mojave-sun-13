/mob/living/basic/ms13/ghoul
	name = "feral ghoul"
	desc = "A being from a realm with only 2 dimensions. At least it's trying to stay faced towards you."
	icon = 'mojave/icons/mob/ms13enemies.dmi'
	icon_state = "feralghoul"
	icon_dead = "stickman_dead"
	mob_biotypes = MOB_HUMANOID
	gender = MALE
	health = 100
	maxHealth = 100
	speed = 0.5
	attack_verb_continuous = "tears"
	attack_verb_simple = "claws"
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_sound = 'sound/weapons/punch1.ogg'
	combat_mode = TRUE
	faction = list("ghoul")
	speak_emote = list("grumbles","growls")

/mob/living/basic/ms13/ghoul/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/basic_body_temp_sensitive, cold_damage = 7.5, heat_damage = 7.5)
	AddElement(/datum/element/atmos_requirements, list("min_oxy" = 5, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0), 7.5)

/datum/ai_controller/basic_controller/ms13/ghoul
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic()
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_melee_attack_subtree/ms13/ghoul
	)

/datum/ai_planning_subtree/basic_melee_attack_subtree/ms13/ghoul
	melee_attack_behavior = /datum/ai_behavior/basic_melee_attack/ms13/ghoul

/datum/ai_behavior/basic_melee_attack/ms13/ghoul
	action_cooldown = 1.5 SECONDS

/mob/living/simple_animal/hostile/ms13/ghoul
	name = "feral ghoul"
	desc = "The remnants of what was once a human being with aspirations and desires. Reduced to a soul lacking husk of flesh with a single purpose."
	icon = 'mojave/icons/mob/ms13enemies.dmi'
	icon_state = "feralghoul"
	faction = list("ghoul")
	speak = list("hnnnhhh","heuhhhh","nnnnhhh")
	speak_emote = list("grumbles","growls")
	emote_hear = list("lets out a weak groan.")
	emote_see = list("idly twitches")
	attack_verb_continuous = "tears"
	attack_verb_simple = "claws"
	turns_per_move = 1
	attack_sound = list('sound/creatures/venus_trap_hurt.ogg', 'sound/creatures/venus_trap_hit.ogg')
	health = 100
	maxHealth = 100
	melee_damage_lower = 5
	melee_damage_upper = 20

/mob/living/basic/ms13/ghoul/brown
	icon_state = "feralghoul_brown"

/mob/living/basic/ms13/ghoul/frozen
	name = "frozen feral ghoul"
	desc = "A frozen corpse that has decided to seek heat once more. It's a miracle they can walk with all that ice in them."
	icon_state = "iceghoul"
	health = 110
	maxHealth = 110
	melee_damage_lower = 10
	melee_damage_upper = 25

/mob/living/basic/ms13/ghoul/radioactive
	name = "glowing feral ghoul"
	desc = "A glowing, calloused ghoul. It looks like it has spent is entire lifetime sitting in a radioactive lake, as the damn thing can probably power a building if you hooked it up."
	icon_state = "glowinghoul"
	health = 130
	maxHealth = 130
	melee_damage_lower = 5
	melee_damage_upper = 30
	speed = 0.9
	light_range = 2
	light_color = "#4ba54f"

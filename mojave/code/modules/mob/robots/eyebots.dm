// Neutral eyebot for patrolling and aesthetics, but still can bonk you.

/mob/living/simple_animal/hostile/retaliate/ms13/robot/eyebot
	name = "eyebot"
	desc = "An eye shaped roaming radio broadcaster. It is equipped with a basic laser with no visible motives. Rumour says they document your every move."
	icon_state = "eyebot"
	icon_living = "eyebot"
	icon_dead = "eyebot"
	idlesound = list('mojave/sound/ms13items/radio_1.ogg', 'mojave/sound/ms13items/radio_2.ogg', 'mojave/sound/ms13items/radio_3.ogg', 'mojave/sound/ms13items/radio_4.ogg', 'mojave/sound/ms13items/radio_5.ogg')
	mob_size = MOB_SIZE_SMALL
	footstep_type = null
	stat_attack = SOFT_CRIT
	stat_exclusive = TRUE
	robust_searching = TRUE
	idlechance = 15
	minimum_distance = 8
	retreat_distance = 12
	speed = 2
	attack_sound = "slam"
	status_flags = CANPUSH
	vision_range = 20
	aggro_vision_range = 10
	maxHealth = 80
	health = 80
	harm_intent_damage = 10
	melee_damage_lower = 2
	melee_damage_upper = 3
	wound_bonus = -5
	bare_wound_bonus = 0
	ranged = TRUE
	projectiletype = /obj/projectile/beam/ms13/laser/eyebot
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_1.ogg'
	bot_type = "ED" // Literally just for naming
	shadow_type = "shadow_small"
	stop_automated_movement = TRUE //Could interfere with patrolling so this is here

/mob/living/simple_animal/hostile/retaliate/ms13/robot/eyebot/Initialize()
	..()
	name = "[bot_type]-[rand(1,999)]"
	add_overlay(image(icon, "[shadow_type]", BELOW_MOB_LAYER, dir))
	return INITIALIZE_HINT_LATELOAD

/mob/living/simple_animal/hostile/retaliate/ms13/robot/eyebot/LateInitialize()
	AddElement(/datum/element/generic_patrol_animal, _animal_node_weights = list(NODE_LAST_VISITED = -1), _animal_identifier = IDENTIFIER_EYEBOT, _patrol_move_delay = 6)

/mob/living/simple_animal/hostile/retaliate/ms13/robot/eyebot/LoseAggro()
	//stop_automated_movement = 0 For patrolling
	vision_range = initial(vision_range)
	taunt_chance = initial(taunt_chance)

/mob/living/simple_animal/hostile/retaliate/ms13/robot/eyebot/death()
	. = ..()
	do_sparks(3, TRUE, src)
	explosion(src,0,0,2,1)
	qdel(src)

// Hostile eyebots, dungeon guards.

/mob/living/simple_animal/hostile/ms13/robot/eyebot/
	name = "eyebot"
	desc = "An eye shaped roaming radio broadcaster. It is equipped with a basic laser and twitches every so often and produces a sharp electrical crack every now and then."
	icon_state = "eyebot"
	icon_living = "eyebot"
	mob_size = MOB_SIZE_SMALL
	footstep_type = null
	stat_attack = HARD_CRIT // Execution time
	stat_exclusive = TRUE
	robust_searching = TRUE
	idlesound = list('mojave/sound/ms13npc/eyebot_loop.ogg', 'sound/misc/interference.ogg', 'sound/machines/terminal_error.ogg','sound/misc/bloop.ogg')
	minimum_distance = 8
	retreat_distance = 12
	speed = 2
	attack_sound = "slam"
	status_flags = CANPUSH
	vision_range = 20
	aggro_vision_range = 10
	maxHealth = 80
	health = 80
	harm_intent_damage = 10
	melee_damage_lower = 2
	melee_damage_upper = 3
	wound_bonus = -5
	bare_wound_bonus = 0
	ranged = TRUE
	projectiletype = /obj/projectile/beam/ms13/laser/eyebot
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_1.ogg'
	bot_type = "ED" // Literally just for naming
	shadow_type = "shadow_small"

/mob/living/simple_animal/hostile/ms13/robot/eyebot/New()
	..()
	name = "[bot_type]-[rand(1,999)]"
	add_overlay(image(icon, "[shadow_type]", BELOW_MOB_LAYER, dir))

/mob/living/simple_animal/hostile/ms13/robot/eyebot/death()
	. = ..()
	do_sparks(3, TRUE, src)
	explosion(src,0,0,2,1)
	qdel(src)

/mob/living/simple_animal/hostile/ms13/robot/eyebot/military
	desc = "A militarized Eyebot variant, developed primarily as patrol units. Not used in many places due to the niche of a weak patrol robot."
	icon_state = "eyebot_dur"
	icon_living = "eyebot_dur"
	minimum_distance = 4
	retreat_distance = 8
	maxHealth = 95
	health = 95
	melee_damage_lower = 5
	melee_damage_upper = 8
	wound_bonus = -2
	projectiletype = /obj/projectile/beam/ms13/laser/eyebot/overcharge
	bot_type = "MD"

/mob/living/simple_animal/hostile/ms13/robot/eyebot/prototype
	desc = "A prototype Eyebot variant, little ever documented regarding them. Stay weary"
	icon_state = "eyebot_prototype"
	icon_living = "eyebot_prototype"
	minimum_distance = 4
	retreat_distance = 8
	maxHealth = 95
	health = 95
	melee_damage_lower = 5
	melee_damage_upper = 8
	wound_bonus = -2
	rapid = 3
	rapid_fire_delay = 6
	projectiletype = /obj/projectile/beam/ms13/laser/eyebot/proto
	bot_type = "XED"

/mob/living/simple_animal/hostile/ms13/robot/eyebot/floating
	name = "floating eyebot"
	desc = "A light weight patrolling eye-shaped robot that watches over secure locations. It uses a taser gun to incapacitate foe."
	icon_state = "floater"
	icon_living = "floater"
	stat_attack = UNCONSCIOUS // Dont tase me bro
	minimum_distance = 4
	retreat_distance = 6
	maxHealth = 60
	health = 60
	projectiletype = /obj/projectile/energy/electrode/ms13
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/bb/wpn_bbgun_fire_2d.ogg'
	bot_type = "FED"
	shadow_type = "shadow_large"

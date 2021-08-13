/mob/living/simple_animal/hostile/ms13/robot/robobrain
	name = "robobrain"
	desc = "A pre-war military robot, using human brains as a computer. Extremely advanced, able to manipulate most weapons. This variant is able to unleash a radiation beam at its target."
	icon_state = "robobrain"
	health = 250
	maxHealth = 250
	melee_damage_lower = 15
	melee_damage_upper = 35
	attack_verb_continuous = "slams"
	attack_verb_simple = "slam"
	speak_emote = list("says", "whines", "crackles")
	mob_size = MOB_SIZE_LARGE
	footstep_type = FOOTSTEP_OBJ_ROBOT
	loot = list(/obj/item/stack/sheet/ms13/scrap/twentyfive, /obj/effect/decal/cleanable/robot_debris)
	dextrous = TRUE
	held_items = list(null, null)
	ranged = TRUE
	ranged_cooldown_time = 10 SECONDS
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_5.ogg'
	projectiletype = /obj/projectile/beam/ms13/laser/robobrain
	bot_type = "RB"

/mob/living/simple_animal/hostile/ms13/robot/robobrain/New()
	..()
	name = "[bot_type]-[rand(1,9999)]"

/mob/living/simple_animal/hostile/ms13/robot/robobrain/death()
	. = ..()
	do_sparks(3, TRUE, src)
	qdel(src)

/mob/living/simple_animal/hostile/ms13/robot/robobrain/heavy
	name = "robobrain"
	desc = "A pre-war military robot, using a cybernetic brain as a computer. Extremely advanced, able to manipulate most weapons. This variant is a later model and looks exceptionally heavy duty, and painted a slick army green."
	icon_state = "robobrain_army"
	health = 350
	maxHealth = 350
	melee_damage_lower = 15
	melee_damage_upper = 45
	ranged_cooldown_time = 5 SECONDS

/mob/living/simple_animal/hostile/ms13/robot/robobrain
	name = "robobrain"
	desc = "A pre-war military robot, using human brains as a computer. Extremely advanced, able to manipulate most weapons. This variant is able to unleash a radiation beam at its target."
	icon_state = "robobrain"
	health = 200
	maxHealth = 200
	melee_damage_lower = 15
	melee_damage_upper = 15
	subtractible_armour_penetration = 10
	sharpness = NONE
	wound_bonus = 5
	bare_wound_bonus = 3
	move_to_delay = 5
	minimum_distance = 3
	retreat_distance = 5
	speed = 2
	attack_verb_continuous = "slams"
	attack_verb_simple = "slam"
	speak_emote = list("says", "whines", "crackles")
	attack_sound = 'mojave/sound/ms13weapons/meleesounds/pipe_hit.ogg'
	mob_size = MOB_SIZE_LARGE
	footstep_type = FOOTSTEP_OBJ_ROBOT
	stat_attack = SOFT_CRIT
	loot = list(/obj/item/stack/sheet/ms13/scrap_steel/two, /obj/effect/decal/cleanable/robot_debris, /obj/item/stack/sheet/ms13/glass, /obj/item/stack/sheet/ms13/scrap_electronics/two, /obj/item/stack/sheet/ms13/circuits, /obj/item/stack/sheet/ms13/scrap_parts/two, /obj/item/ms13/component/vacuum_tube)
	dextrous = TRUE
	held_items = list(null, null)
	ranged = TRUE
	casingtype = /obj/item/ammo_casing/energy/ms13/laser/robobrain
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_5.ogg'
	ranged_cooldown_time = 6 SECONDS
	bot_type = "RB"

/mob/living/simple_animal/hostile/ms13/robot/robobrain/New()
	..()
	name = "[bot_type]-[rand(1,9999)]"

/mob/living/simple_animal/hostile/ms13/robot/robobrain/death()
	. = ..()
	do_sparks(3, TRUE, src)
	playsound(src, 'mojave/sound/ms13npc/robot_death.ogg', 60, TRUE)
	qdel(src)

/mob/living/simple_animal/hostile/ms13/robot/robobrain/heavy
	name = "heavy robobrain"
	desc = "A pre-war military robot, using a cybernetic brain as a computer. Extremely advanced, able to manipulate most weapons. This variant is a later model and looks exceptionally heavy duty, and painted a slick army green."
	icon_state = "robobrain_army"
	health = 240
	maxHealth = 240
	melee_damage_lower = 20
	melee_damage_upper = 20
	subtractible_armour_penetration = 15
	loot = list(/obj/item/stack/sheet/ms13/scrap_steel/two, /obj/effect/decal/cleanable/robot_debris, /obj/item/stack/sheet/ms13/glass, /obj/item/stack/sheet/ms13/scrap_electronics/two, /obj/item/stack/sheet/ms13/circuits/two, /obj/item/stack/sheet/ms13/scrap_parts/two, /obj/item/ms13/component/vacuum_tube)
	ranged_cooldown_time = 4 SECONDS

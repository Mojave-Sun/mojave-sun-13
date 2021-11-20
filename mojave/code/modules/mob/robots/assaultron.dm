/mob/living/simple_animal/hostile/ms13/robot/assaultron
	name = "assaultron"
	desc = "A robot designed with a sole concept in mind. Combat efficiency. It boasts a strong range laser attack, and devestating up-close piercing blade hands."
	icon_state = "assaultron"
	icon_living = "assaultron"
	idlesound = list('mojave/sound/ms13items/tracker_far.ogg')
	health = 150
	maxHealth = 150
	melee_damage_lower = 10
	melee_damage_upper = 15
	vision_range = 12
	aggro_vision_range = 10
	minimum_distance = 1
	retreat_distance = 4
	wound_bonus = 5
	bare_wound_bonus = 5
	sharpness = SHARP_POINTY
	attack_verb_continuous = "stabs"
	attack_verb_simple = "stab"
	stat_attack = HARD_CRIT //how grim
	ranged = TRUE
	projectiletype = /obj/projectile/beam/ms13/laser/assaultron
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/laser_heavy.ogg'
	ranged_cooldown_time = 10 SECONDS

/mob/living/simple_animal/hostile/ms13/robot/assaultron/death()
	. = ..()
	do_sparks(3, TRUE, src)

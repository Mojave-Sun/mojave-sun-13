/mob/living/simple_animal/hostile/ms13/robot/protectron
	name = "protectron"
	desc = "A standard protectron, issued in large quantities to establishments across pre-war America. Armed with lasers for 'self defense'."
	icon_state = "protectron_common"
	icon_living = "protectron_common"
	health = 120
	maxHealth = 120
	melee_damage_lower = 10
	melee_damage_upper = 15
	vision_range = 12
	aggro_vision_range = 10
	minimum_distance = 4
	retreat_distance = 8
	wound_bonus = -5
	bare_wound_bonus = 5
	attack_verb_continuous = "smacks"
	attack_verb_simple = "smack"
	stat_attack = SOFT_CRIT
	ranged = TRUE
	projectiletype = /obj/projectile/beam/ms13/laser/protectron
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_3.ogg'

/mob/living/simple_animal/hostile/ms13/robot/protectron/death()
	. = ..()
	do_sparks(3, TRUE, src)
	qdel(src)

/mob/living/simple_animal/hostile/ms13/robot/protectron/fire
	desc = "A pre-war protectron, assigned to a firefighting role apparently. Has a strong swing with a very sharp axe head, beware!"
	icon_state = "protectron_fireman"
	icon_living = "protectron_fireman"
	health = 135
	maxHealth = 135
	melee_damage_lower = 15
	melee_damage_upper = 40 // Axe time
	minimum_distance = 0
	retreat_distance = 2
	wound_bonus = 10
	bare_wound_bonus = 5
	sharpness = SHARP_EDGED
	attack_verb_continuous = "cleaves"
	attack_verb_simple = "cleave"
	attack_sound = 'sound/weapons/bladeslice.ogg'

/mob/living/simple_animal/hostile/ms13/robot/protectron/police
	icon_state = "protectron_police"
	icon_living = "protectron_police"
	health = 120
	maxHealth = 120
	stat_attack = UNCONSCIOUS

/mob/living/simple_animal/hostile/ms13/robot/protectron/police/Initialize()
	. = ..()
	if(prob(65))
		desc = "A protectron given the duty of upholding law. This one is equipped with standard laser weaponry."
		melee_damage_lower = 5
		melee_damage_upper = 10
		wound_bonus = -5
		bare_wound_bonus = 5

	else
		icon_state = "protectron_police_baton"
		icon_living = "protectron_police_baton"
		melee_damage_lower = 10
		melee_damage_upper = 15
		desc = "A protectron given the duty of upholding law. This one is equipped with a baton and incapacitation unit."
		projectiletype = /obj/projectile/energy/electrode/ms13
		projectilesound = 'mojave/sound/ms13weapons/gunsounds/bb/wpn_bbgun_fire_2d.ogg'

/mob/living/simple_animal/hostile/ms13/robot/protectron/builder
	desc = "A heavy duty protectron that is equipped with basic tools in order to aid construction workers. Stay clear!"
	icon_state = "protectron_builder"
	icon_living = "protectron_builder"
	health = 145
	maxHealth = 145
	melee_damage_lower = 10
	melee_damage_upper = 20
	wound_bonus = -5
	bare_wound_bonus = 5
	rapid = 2
	rapid_fire_delay = 3
	projectiletype = /obj/projectile/bullet/ms13/nail/protectron
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/nailgun/nailgun_single.ogg'

/mob/living/simple_animal/hostile/ms13/robot/protectron/reinforced
	name = "protectron"
	desc = "A high security variant of a protectron. Built to last and keep up to harsh punishment, the unaging guard that doesn't require payment."
	icon_state = "protectron_reinforced"
	icon_living = "protectron_reinforced"
	health = 175
	maxHealth = 175
	melee_damage_lower = 10
	melee_damage_upper = 20
	minimum_distance = 3
	retreat_distance = 6
	attack_verb_continuous = "smacks"
	attack_verb_simple = "smack"
	stat_attack = HARD_CRIT

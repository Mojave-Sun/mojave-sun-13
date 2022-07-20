/mob/living/simple_animal/hostile/ms13/robot/assaultron
	name = "assaultron"
	desc = "A robot designed with a sole concept in mind. Combat efficiency. It boasts a strong range laser attack, and dangerous piercing blade hands."
	icon_state = "assaultron"
	icon_living = "assaultron"
	idlesound = list('mojave/sound/ms13items/tracker_far.ogg')
	idlechance = 10
	health = 165
	maxHealth = 165
	melee_damage_lower = 20
	melee_damage_upper = 20
	subtractible_armour_penetration = 30
	vision_range = 12
	aggro_vision_range = 10
	minimum_distance = 1
	retreat_distance = null
	move_to_delay = 2.5
	loot = list(/obj/item/stack/sheet/ms13/scrap_steel/two, /obj/effect/decal/cleanable/robot_debris, /obj/item/stack/sheet/ms13/scrap_electronics/two, /obj/item/stack/sheet/ms13/scrap_parts/two, /obj/item/stack/sheet/ms13/circuits/three)
	speed = 1
	wound_bonus = 8
	bare_wound_bonus = 8
	sharpness = SHARP_POINTY
	attack_verb_continuous = "stabs"
	attack_verb_simple = "stab"
	stat_attack = SOFT_CRIT
	ranged = TRUE
	casingtype = /obj/item/ammo_casing/energy/ms13/laser/assaultron
	ranged_cooldown_time = 6 SECONDS

/mob/living/simple_animal/hostile/ms13/robot/assaultron/death()
	. = ..()
	do_sparks(3, TRUE, src)

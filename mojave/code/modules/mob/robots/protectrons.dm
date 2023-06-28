/mob/living/simple_animal/hostile/ms13/robot/protectron
	name = "protectron"
	desc = "A standard protectron, issued in large quantities to establishments across pre-war America. Armed with lasers for 'self defense'."
	icon_state = "protectron_common"
	icon_living = "protectron_common"
	health = 150
	maxHealth = 150
	melee_damage_lower = 10
	melee_damage_upper = 10
	vision_range = 12
	aggro_vision_range = 10
	minimum_distance = 4
	retreat_distance = 8
	move_to_delay = 6
	speed = 3
	wound_bonus = 0
	bare_wound_bonus = 0
	sharpness = NONE
	attack_verb_continuous = "smacks"
	attack_verb_simple = "smack"
	attack_sound = 'mojave/sound/ms13weapons/meleesounds/general_grip.ogg'
	loot = list(/obj/item/stack/sheet/ms13/scrap/two, /obj/effect/decal/cleanable/robot_debris, /obj/item/stack/sheet/ms13/glass, /obj/item/stack/sheet/ms13/scrap_electronics, /obj/item/stack/sheet/ms13/scrap_parts)
	stat_attack = SOFT_CRIT
	ranged = TRUE
	ranged_cooldown = 3 SECONDS
	casingtype = /obj/item/ammo_casing/energy/ms13/laser/protectron
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_3.ogg'

/mob/living/simple_animal/hostile/ms13/robot/protectron/death()
	. = ..()
	do_sparks(3, TRUE, src)
	playsound(src, 'mojave/sound/ms13npc/robot_death.ogg', 60, TRUE)
	qdel(src)

/mob/living/simple_animal/hostile/ms13/robot/protectron/fire
	name = "fireman protectron"
	desc = "A pre-war protectron, assigned to a firefighting role. Has a strong swing with a very sharp axe head, but can't take quite as much punishment as other protectrons."
	icon_state = "protectron_fireman"
	icon_living = "protectron_fireman"
	health = 130
	maxHealth = 130
	melee_damage_lower = 35
	melee_damage_upper = 35
	subtractible_armour_penetration = 20
	wound_bonus = 5
	bare_wound_bonus = 10
	sharpness = SHARP_EDGED
	attack_verb_continuous = "cleaves"
	attack_verb_simple = "cleave"
	attack_sound = list('mojave/sound/ms13weapons/meleesounds/heavyaxe_hit1.ogg', 'mojave/sound/ms13weapons/meleesounds/heavyaxe_hit2.ogg')
	ranged = FALSE
	projectilesound = null
	minimum_distance = 1
	retreat_distance = null
	move_to_delay = 4
	speed = 2

/mob/living/simple_animal/hostile/ms13/robot/protectron/police
	name = "police protectron"
	icon_state = "protectron_police"
	icon_living = "protectron_police"
	move_to_delay = 5

/mob/living/simple_animal/hostile/ms13/robot/protectron/police/Initialize()
	. = ..()
	if(prob(65))
		desc = "A protectron given the duty of upholding law. This one is equipped with standard laser weaponry."

	else
		icon_state = "protectron_police_baton"
		icon_living = "protectron_police_baton"
		melee_damage_lower = 25
		melee_damage_upper = 25
		subtractible_armour_penetration = 10
		wound_bonus = -10
		bare_wound_bonus = 0
		desc = "A protectron given the duty of upholding law. This one is equipped with a baton and incapacitation unit."
		attack_sound = 'mojave/sound/ms13weapons/meleesounds/baton_hit.ogg'
		minimum_distance = 1
		retreat_distance = null
		casingtype = /obj/item/ammo_casing/energy/electrode/ms13
		projectilesound = 'mojave/sound/ms13weapons/gunsounds/bb/wpn_bbgun_fire_2d.ogg'
		ranged_cooldown = 5 SECONDS

/mob/living/simple_animal/hostile/ms13/robot/protectron/builder
	name = "builder protectron"
	desc = "A heavy duty protectron that is equipped with basic tools in order to aid construction workers. Stay clear!"
	icon_state = "protectron_builder"
	icon_living = "protectron_builder"
	melee_damage_lower = 15
	melee_damage_upper = 15
	subtractible_armour_penetration = 15
	wound_bonus = 5
	bare_wound_bonus = 0
	rapid = 5
	rapid_fire_delay = 0.35 SECONDS //5 nails over 1.75 seconds
	ranged_cooldown = 5.75 SECONDS //Then a 4 second delay
	casingtype = /obj/item/ammo_casing/ms13/nail/protectron
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/nailgun/nailgun_single.ogg'
	minimum_distance = 3
	retreat_distance = 6

/mob/living/simple_animal/hostile/ms13/robot/protectron/reinforced
	name = "reinforced protectron"
	desc = "A high security variant of a protectron. Built to last and keep up to harsh punishment, the unaging guard that doesn't require payment."
	icon_state = "protectron_reinforced"
	icon_living = "protectron_reinforced"
	health = 190
	maxHealth = 190
	melee_damage_lower = 15
	melee_damage_upper = 15
	subtractible_armour_penetration = 5
	loot = list(/obj/item/stack/sheet/ms13/scrap_steel/two, /obj/effect/decal/cleanable/robot_debris, /obj/item/stack/sheet/ms13/glass, /obj/item/stack/sheet/ms13/scrap_electronics/two, /obj/item/stack/sheet/ms13/circuits, /obj/item/stack/sheet/ms13/scrap_parts/two)
	wound_bonus = 5
	bare_wound_bonus = 0
	minimum_distance = 3
	retreat_distance = 6

/mob/living/simple_animal/hostile/retaliate/ms13/robot/sentrybot
	name = "sentrybot"
	desc = "A robot with a scariest arsenal you seen so far, it's a pretty good idea if you stopped looking at it."
	icon = 'mojave/icons/mob/48x48.dmi'
	icon_state = "sentrybot"
	mob_size = MOB_SIZE_LARGE
	footstep_type = null
	robust_searching = TRUE
	idlechance = 15
	minimum_distance = 5 //We'll decrease this if need be
	retreat_distance = 5
	speed = 2
	move_to_delay = 4
	attack_sound = "slam"
	status_flags = CANPUSH
	loot = list(/obj/item/stack/sheet/ms13/scrap, /obj/item/stack/sheet/ms13/scrap_electronics, /obj/item/stack/sheet/ms13/scrap_parts)
	vision_range = 16
	aggro_vision_range = 16
	maxHealth = 700
	health = 700
	melee_damage_lower = 35
	melee_damage_upper = 35
	ranged = TRUE
	stat_attack = HARD_CRIT
	//projectiletype = /obj/projectile/beam/ms13/laser/sentrybot //Has some spread to it
	//projectilesound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_1.ogg'
	casingtype = /obj/item/ammo_casing/energy/ms13/laser/sentrybot
	ranged_cooldown = 3 SECONDS
	rapid = 15
	rapid_fire_delay = 0.2 SECONDS //Thankfully I made there be some spread to this
	bot_type = "Sentrybot"
	shadow_type = "shadow_large"

//randomspread prerequisite
/obj/item/ammo_casing/energy/ms13/laser/sentrybot
	variance = 30
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_1.ogg'
	randomspread = TRUE

/obj/projectile/beam/ms13/laser/sentrybot
	damage = 10


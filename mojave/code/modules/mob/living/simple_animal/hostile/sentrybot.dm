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
	ranged_cooldown = 6 SECONDS
	rapid = 30
	rapid_fire_delay = 0.1 SECONDS //Thankfully I made there be some spread to this
	bot_type = "Sentrybot"
	shadow_type = "shadow_large"
	var/datum/action/cooldown/mob_cooldown/launch_rocket/rocket

/mob/living/simple_animal/hostile/retaliate/ms13/robot/sentrybot/Initialize()
	. = ..()
	rocket = new /datum/action/cooldown/mob_cooldown/launch_rocket()
	rocket.Grant(src)

/mob/living/simple_animal/hostile/retaliate/ms13/robot/sentrybot/Destroy()
	QDEL_NULL(rocket)
	return ..()

//randomspread prerequisite
/obj/item/ammo_casing/energy/ms13/laser/sentrybot
	variance = 30
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_1.ogg'
	randomspread = TRUE

/obj/item/ammo_casing/energy/ms13/laser/sentrybot/fire_casing(atom/target, mob/living/user, params, distro, quiet, zone_override, spread, atom/fired_from, extra_damage, extra_penetration)
	. = ..()
	if(. && !QDELETED(src))
		qdel(src)

/obj/projectile/beam/ms13/laser/sentrybot
	damage = 5
	hitscan_light_intensity = 2
	hitscan_light_range = 0.50
	muzzle_flash_intensity = 4
	muzzle_flash_range = 1
	impact_light_intensity = 5
	impact_light_range = 1.25

//Launches a rocket out of you; don't question how it got there
/datum/action/cooldown/mob_cooldown/launch_rocket
	name = "Launch a rocket"
	desc = "Launches a cool rocket at the enemy"
	cooldown_time = 10 SECONDS
	click_to_activate = FALSE
	var/obj/projectile/projectile = /obj/projectile/bullet/a84mm/he

/datum/action/cooldown/mob_cooldown/launch_rocket/Activate(atom/target_atom)
	StartCooldown(10 SECONDS)
	launch_rocket(target_atom)
	StartCooldown()

/datum/action/cooldown/mob_cooldown/launch_rocket/proc/launch_rocket(atom/target_atom)
	//living_owner.SetStun(1.5 SECONDS, ignore_canstun = TRUE)
	playsound(owner, 'sound/weapons/gun/general/rocket_launch.ogg', 100, TRUE, -1)
	var/obj/projectile/projectile_obj = new projectile(get_turf(owner))
	projectile_obj.firer = owner
	projectile_obj.preparePixelProjectile(target_atom, owner)
	projectile_obj.fire()

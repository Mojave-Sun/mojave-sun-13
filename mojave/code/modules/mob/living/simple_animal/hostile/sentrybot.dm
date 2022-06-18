GLOBAL_LIST_INIT(sentrybot_death_sound, list('mojave/sound/ms13npc/sentrybot/death1.ogg',
									'mojave/sound/ms13npc/sentrybot/death2.ogg',
									'mojave/sound/ms13npc/sentrybot/death3.ogg',
									'mojave/sound/ms13npc/sentrybot/death4.ogg',
									'mojave/sound/ms13npc/sentrybot/death5.ogg',
									'mojave/sound/ms13npc/sentrybot/death6.ogg'
									))

GLOBAL_LIST_INIT(sentrybot_damaged_sound, list(
									'mojave/sound/ms13npc/sentrybot/damaged1.ogg',
									'mojave/sound/ms13npc/sentrybot/damaged2.ogg',
									'mojave/sound/ms13npc/sentrybot/damaged3.ogg',
									'mojave/sound/ms13npc/sentrybot/damaged4.ogg',
									'mojave/sound/ms13npc/sentrybot/damaged5.ogg'
									))

//Idle search => fight
GLOBAL_LIST_INIT(sentrybot_hostiles_located_sound, list(
									'mojave/sound/ms13npc/sentrybot/hostiles_located1.ogg',
									'mojave/sound/ms13npc/sentrybot/hostiles_located2.ogg',
									'mojave/sound/ms13npc/sentrybot/hostiles_located3.ogg',
									'mojave/sound/ms13npc/sentrybot/hostiles_located4.ogg'
									))

GLOBAL_LIST_INIT(sentrybot_idle_patrol_sound, list(
									'mojave/sound/ms13npc/sentrybot/idle_patrol1.ogg',
									'mojave/sound/ms13npc/sentrybot/idle_patrol2.ogg',
									'mojave/sound/ms13npc/sentrybot/idle_patrol3.ogg',
									'mojave/sound/ms13npc/sentrybot/idle_patrol4.ogg'
									))

//Whenever a new hostile enemy is picked
GLOBAL_LIST_INIT(sentrybot_new_hostile_sound, list(
									'mojave/sound/ms13npc/sentrybot/new_hostile_targeted1.ogg',
									'mojave/sound/ms13npc/sentrybot/new_hostile_targeted2.ogg'
									))

//fight => idle
GLOBAL_LIST_INIT(sentrybot_switch_to_patrol_sound, list(
									'mojave/sound/ms13npc/sentrybot/switch_to_patrol1.ogg',
									'mojave/sound/ms13npc/sentrybot/switch_to_patrol2.ogg',
									'mojave/sound/ms13npc/sentrybot/switch_to_patrol3.ogg',
									'mojave/sound/ms13npc/sentrybot/switch_to_patrol4.ogg'
									))

/mob/living/simple_animal/hostile/ms13/robot/sentrybot
	name = "sentrybot"
	desc = "A robot with the scariest arsenal you seen so far, it's a pretty good idea if you stopped looking at it."
	icon = 'mojave/icons/mob/48x48.dmi'
	icon_state = "sentrybot"
	mob_size = MOB_SIZE_LARGE
	footstep_type = FOOTSTEP_OBJ_MACHINE
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
	rapid_fire_delay = 0.05 SECONDS
	bot_type = "Sentrybot"
	shadow_type = "shadow_large"
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_1.ogg'
	check_friendly_fire = 0 //no
	var/datum/action/cooldown/launch_rocket/rocket
	var/datum/action/cooldown/launch_grenade/grenade
	sight = SEE_SELF|SEE_MOBS //thermal vision for fun

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/death(gibbed)
	playsound(src, pick(GLOB.sentrybot_death_sound), 50, TRUE)
	..(gibbed)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/Initialize()
	. = ..()
	rocket = new /datum/action/cooldown/launch_rocket()
	rocket.Grant(src)
	grenade = new /datum/action/cooldown/launch_grenade()
	grenade.Grant(src)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/Destroy()
	QDEL_NULL(rocket)
	return ..()

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/OpenFire()
	//Automatic usage of abilities by nonclients
	if(!client)
		if(rocket.IsAvailable())
			rocket.Trigger(target = target)
			return
		if(grenade.IsAvailable())
			grenade.Trigger(target = target)
			return
	. = ..()

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/AICanContinue(list/possible_targets)
	. = ..()
	if(!target && .) //AI should be turned on due to finding a target
		playsound(src, pick(GLOB.sentrybot_hostiles_located_sound), 50, FALSE)
	else
		if(prob(20))
			playsound(src, pick(GLOB.sentrybot_idle_patrol_sound), 50, FALSE)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/AIShouldSleep(list/possible_targets)
	. = ..()
	if(.) //Failed to find new targets, going into idle
		playsound(src, pick(GLOB.sentrybot_switch_to_patrol_sound), 50, FALSE)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	. = ..()
	if(amount > 10 && prob(10))
		playsound(src, pick(GLOB.sentrybot_damaged_sound), 50, FALSE)


/mob/living/simple_animal/hostile/ms13/robot/sentrybot/GiveTarget(new_target)
	..()
	if(target != null)
		playsound(src, pick(GLOB.sentrybot_new_hostile_sound), 50, FALSE)

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
	subtractible_armour_penetration = 5
	wound_bonus = 0
	bare_wound_bonus = 5

//Launches a rocket out of you
/datum/action/cooldown/launch_rocket
	name = "Launch a rocket"
	desc = "Launches a cool rocket at the enemy"
	cooldown_time = 10 SECONDS
	click_to_activate = TRUE
	var/obj/projectile/projectile = /obj/projectile/bullet/a84mm/he

/datum/action/cooldown/launch_rocket/Activate(atom/target_atom)
	StartCooldown(10 SECONDS)
	launch_rocket(target_atom)
	StartCooldown()

/datum/action/cooldown/launch_rocket/proc/launch_rocket(atom/target_atom)
	playsound(owner, 'sound/weapons/gun/general/rocket_launch.ogg', 100, TRUE, -1)
	var/obj/projectile/projectile_obj = new projectile(get_turf(owner))
	projectile_obj.firer = owner
	projectile_obj.preparePixelProjectile(target_atom, owner)
	projectile_obj.fire()

//Launch rocket but it's a shrapnel grenade
/datum/action/cooldown/launch_grenade
	name = "Launch a shrapnel grenade"
	desc = "Launches a cool grenade at the enemy"
	cooldown_time = 6 SECONDS
	click_to_activate = TRUE
	var/obj/item/grenade/grenade = /obj/item/grenade/frag/sentrybot

/datum/action/cooldown/launch_grenade/Activate(atom/target_atom)
	StartCooldown(6 SECONDS)
	launch_grenade(target_atom)
	StartCooldown()

/datum/action/cooldown/launch_grenade/proc/launch_grenade(atom/target_atom)
	//living_owner.SetStun(1.5 SECONDS, ignore_canstun = TRUE)
	playsound(owner, 'sound/weapons/gun/general/rocket_launch.ogg', 100, TRUE, -1)
	var/obj/item/grenade/thrown_grenade = new grenade(get_step(owner, get_dir(owner, target_atom)))
	thrown_grenade.throw_at(get_turf(target_atom), 15, 2, owner, FALSE, FALSE)
	thrown_grenade.arm_grenade(owner, 3 SECONDS, 2, 1, owner, TRUE)

//Shrapnel only grenade yo
/obj/item/grenade/frag/sentrybot
	name = "frag grenade"
	desc = "An anti-personnel fragmentation grenade, this weapon excels at killing soft targets by shredding them with metal shrapnel."
	icon_state = "frag"
	shrapnel_type = /obj/projectile/bullet/shrapnel
	shrapnel_radius = 2
	ex_heavy = 0
	ex_light = 0
	ex_flame = 0

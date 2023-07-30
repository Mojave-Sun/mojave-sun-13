GLOBAL_LIST_INIT(sentrybot_damaged_sound, list(
									'mojave/sound/ms13npc/sentrybot/damaged1.ogg',
									'mojave/sound/ms13npc/sentrybot/damaged2.ogg',
									'mojave/sound/ms13npc/sentrybot/damaged3.ogg',
									'mojave/sound/ms13npc/sentrybot/damaged4.ogg',
									'mojave/sound/ms13npc/sentrybot/damaged5.ogg'
									))

//Cooldowns for non death/damaged sounds being played; assoc key value laid out as
//Path to sound file = cooldown in SECONDS

//Idle search => fight
GLOBAL_LIST_INIT(sentrybot_hostiles_located_sound, list(
									'mojave/sound/ms13npc/sentrybot/hostiles_located1.ogg' = 5 SECONDS,
									'mojave/sound/ms13npc/sentrybot/hostiles_located2.ogg' = 6 SECONDS,
									'mojave/sound/ms13npc/sentrybot/hostiles_located3.ogg' = 4 SECONDS,
									'mojave/sound/ms13npc/sentrybot/hostiles_located4.ogg' = 6 SECONDS
									))

GLOBAL_LIST_INIT(sentrybot_idle_patrol_sound, list(
									'mojave/sound/ms13npc/sentrybot/idle_patrol1.ogg' = 7 SECONDS,
									'mojave/sound/ms13npc/sentrybot/idle_patrol2.ogg' = 11 SECONDS,
									'mojave/sound/ms13npc/sentrybot/idle_patrol3.ogg' = 7 SECONDS,
									'mojave/sound/ms13npc/sentrybot/idle_patrol4.ogg' = 6 SECONDS
									))

//Whenever a new hostile enemy is picked
GLOBAL_LIST_INIT(sentrybot_new_hostile_sound, list(
									'mojave/sound/ms13npc/sentrybot/new_hostile_targeted1.ogg' = 3 SECONDS,
									'mojave/sound/ms13npc/sentrybot/new_hostile_targeted2.ogg' = 3 SECONDS
									))

//fight => idle
GLOBAL_LIST_INIT(sentrybot_switch_to_patrol_sound, list(
									'mojave/sound/ms13npc/sentrybot/switch_to_patrol1.ogg' = 5 SECONDS,
									'mojave/sound/ms13npc/sentrybot/switch_to_patrol2.ogg' = 7 SECONDS,
									'mojave/sound/ms13npc/sentrybot/switch_to_patrol3.ogg' = 5 SECONDS,
									'mojave/sound/ms13npc/sentrybot/switch_to_patrol4.ogg' = 5 SECONDS
									))

//In combat
GLOBAL_LIST_INIT(sentrybot_in_combat_sound, list(
									'mojave/sound/ms13npc/sentrybot/in_combat1.ogg' = 8 SECONDS,
									'mojave/sound/ms13npc/sentrybot/in_combat2.ogg' = 7 SECONDS,
									'mojave/sound/ms13npc/sentrybot/in_combat3.ogg' = 8 SECONDS,
									'mojave/sound/ms13npc/sentrybot/in_combat4.ogg' = 9 SECONDS,
									))

//Dying before self destruct
//the seconds refer to the time before actually exploding
GLOBAL_LIST_INIT(sentrybot_dying_sound, list(
									'mojave/sound/ms13npc/sentrybot/death1.ogg' = 2.5 SECONDS,
									'mojave/sound/ms13npc/sentrybot/death2.ogg' = 2.5 SECONDS,
									'mojave/sound/ms13npc/sentrybot/death3.ogg' = 1.5 SECONDS,
									'mojave/sound/ms13npc/sentrybot/death4.ogg' = 2.5 SECONDS,
									'mojave/sound/ms13npc/sentrybot/death5.ogg' = 1.5 SECONDS,
									))

/mob/living/simple_animal/hostile/ms13/robot/sentrybot
	name = "sentry bot"
	desc = "A robot with the scariest arsenal you seen so far, it's a pretty good idea if you stopped looking at it."
	icon = 'mojave/icons/mob/48x48.dmi'
	icon_state = "sentrybot"
	mob_size = MOB_SIZE_LARGE
	footstep_type = null //Element is modified in Initialize()
	robust_searching = TRUE
	minimum_distance = 3 //We'll decrease this if needed
	retreat_distance = 3
	speed = 1
	move_to_delay = 4
	var/last_move_done_at = 0
	//var/drift_cooldown = 0
	attack_sound = 'mojave/sound/ms13weapons/meleesounds/heavyblunt_hit1.ogg'
	loot = list(/obj/item/stack/sheet/ms13/scrap_steel/ten, /obj/item/stack/sheet/ms13/scrap_electronics/ten, /obj/item/stack/sheet/ms13/scrap_parts/ten, /obj/item/stack/sheet/ms13/circuits/eight)
	vision_range = 12
	aggro_vision_range = 12
	dodge_prob = 50
	maxHealth = 1200
	health = 1200
	idlechance = 20
	melee_damage_lower = 25
	melee_damage_upper = 25
	subtractible_armour_penetration = 15
	sharpness = NONE
	wound_bonus = 8
	bare_wound_bonus = 0
	ranged = TRUE
	stat_attack = CONSCIOUS
	casingtype = /obj/item/ammo_casing/energy/ms13/laser/sentrybot
	ranged_cooldown = 4.5 SECONDS
	rapid = 16
	rapid_fire_delay = 0.05 SECONDS //16 shots over 1 second
	pixel_x = -8
	base_pixel_x = -8
	bot_type = "Sentrybot"
	shadow_type = "shadow_large"
	projectilesound = null
	check_friendly_fire = FALSE //no
	move_resist = INFINITY
	var/datum/action/cooldown/launch_rocket/rocket
	var/datum/action/cooldown/launch_grenade/grenade
	var/datum/action/cooldown/flamethrow/flamethrow
	var/already_firing = FALSE
	var/speech_cooldown = 0
	var/datum/looping_sound/treads/soundloop

/datum/looping_sound/treads
	start_sound = 'mojave/sound/ms13npc/sentrybot/treads_start.mp3'
	start_length = 1
	mid_sounds = list('mojave/sound/ms13npc/sentrybot/treads_mid_1.mp3' = 1, 'mojave/sound/ms13npc/sentrybot/treads_mid_2.mp3' = 1, 'mojave/sound/ms13npc/sentrybot/treads_mid_3.mp3' = 1, 'mojave/sound/ms13npc/sentrybot/treads_mid_4.mp3' = 1)
	mid_length = 1
	end_sound = 'mojave/sound/ms13npc/sentrybot/treads_end.mp3'
	vary = FALSE
	volume = 25

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/Initialize()
	. = ..()
	grenade = new /datum/action/cooldown/launch_grenade()
	rocket = new /datum/action/cooldown/launch_rocket()
	grenade.Grant(src)
	rocket.Grant(src)
	RegisterSignal(src, COMSIG_MOVABLE_MOVED, .proc/play_move_sound, override = TRUE)
	soundloop = new(src, FALSE)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/proc/play_move_sound()
	SIGNAL_HANDLER
	//playsound(src, 'sound/mecha/mechstep.ogg', 40, TRUE)
	last_move_done_at = world.time
	addtimer(CALLBACK(src, .proc/check_if_loop_should_continue, world.time), move_to_delay + 0.5 SECONDS)
	/*
	if(drift_cooldown > world.time) //Special move cooldown + drifting shouldn't restart the tread sounds
		return
	*/
	soundloop.start()

/*
/mob/living/simple_animal/hostile/ms13/robot/sentrybot/Goto(target, delay, minimum_distance)
	if(drift_cooldown < world.time)
		return
	..()
*/

//Anti original code
/mob/living/simple_animal/hostile/ms13/robot/sentrybot/AttackingTarget(atom/attacked_target)
	. = ..()
	RangedAttack(target)
	return .

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/proc/check_if_loop_should_continue(the_time)
	if(the_time != last_move_done_at)
		return
	/*
	if(drift_cooldown > world.time)
		return
	//TOKYO DRIFT
	*/
	soundloop.stop()
	/*
	playsound(src, 'mojave/sound/ms13npc/sentrybot/drift_king.ogg', 50, FALSE)
	drift_cooldown = world.time + 5 SECONDS
	var/time_til_next_move = 0
	var/turf_move_towards = get_step(src, src.dir)
	for(var/i = 1, i < 7, i++)
		time_til_next_move += (i * 0.1)
		addtimer(CALLBACK(src, .proc/wrapped_move, turf_move_towards, src.dir), (10 * time_til_next_move))
		turf_move_towards = get_step(turf_move_towards, src.dir)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/proc/wrapped_move(_newLoc, _Dir)
	if(get_dist(loc, _newLoc) > 1)
		return
	Move(_newLoc, _Dir)
*/

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/ListTargets()
	. = ..()
	if(target && get_dist(target, src) < aggro_vision_range)
		. += target

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/death(gibbed)
	LoseTarget()
	vision_range = 0
	aggro_vision_range = 0
	stop_automated_movement = TRUE
	SSmove_manager.move_to(src, src, min_dist = 0, delay = 0)
	var/the_sound = pick(GLOB.sentrybot_dying_sound)
	playsound(src, the_sound, 50, FALSE)
	addtimer(CALLBACK(src, .proc/self_destruct), GLOB.sentrybot_dying_sound[the_sound])
	..(gibbed)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/proc/self_destruct()
	explosion(src, devastation_range = 0, heavy_impact_range = 1, light_impact_range = 2, flame_range = 4, flash_range = 5, smoke = TRUE)
	qdel(src)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/proc/play_speech_sound(glob_list_used, bypass_cooldown = FALSE)
	if(!bypass_cooldown && (speech_cooldown > world.time))
		return
	var/random_speech = pick(glob_list_used)
	speech_cooldown = world.time + glob_list_used[random_speech]
	playsound(src, random_speech, 80, FALSE)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/Destroy()
	QDEL_NULL(rocket)
	QDEL_NULL(grenade)
	QDEL_NULL(flamethrow)
	QDEL_NULL(soundloop)
	return ..()

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/OpenFire(atom/A, actually_fire = FALSE)
	//Main gun time
	//If we don't have LoS on our target, we should see if there's any other targets we could be killing
	//Otherwise, we'll go chase the target by setting a lowered minimum distance
	if(!can_see(src, target, length = 10))
		FindTarget(possible_targets = null, HasTargetsList = FALSE)
	if(actually_fire)
		. = ..()
		playsound(src, 'mojave/sound/ms13npc/sentrybot/laser_gatling.ogg', 50, FALSE)
		addtimer(CALLBACK(src, .proc/wind_down_gun), 1 SECONDS)
	else
		if(!already_firing)
			addtimer(CALLBACK(src, .proc/trigger_abilities, A), rand(1.5 SECONDS, 3 SECONDS))
			addtimer(CALLBACK(src, .proc/OpenFire, A, TRUE), 1 SECONDS)
			playsound(src, 'mojave/sound/ms13npc/sentrybot/gatling_windup.ogg', 75, FALSE)
			already_firing = TRUE
	return

//Don't bother kiting if we lose sight of the target, we gotta rush them
/mob/living/simple_animal/hostile/ms13/robot/sentrybot/proc/checkLoS()
	if(!can_see(src, target, length = 10))
		minimum_distance = 1
		retreat_distance = 1
	else
		minimum_distance = 3
		retreat_distance = 3

//Quick LoS checking to begin chasing of target rather than keeping a minimum distance
/mob/living/simple_animal/hostile/ms13/robot/sentrybot/GiveTarget(new_target)
	if(new_target && target && (new_target != target))
		UnregisterSignal(target, COMSIG_MOVABLE_MOVED)
	. = ..()
	if(target)
		RegisterSignal(target, COMSIG_MOVABLE_MOVED, .proc/checkLoS, override = TRUE)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/LoseTarget()
	if(target)
		UnregisterSignal(target, COMSIG_MOVABLE_MOVED)
	. = ..()

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/bullet_act(obj/projectile/Proj)
	if(istype(Proj, /obj/projectile/bullet/shrapnel))
		visible_message(span_danger("[Proj] bounces off of the [src]!"))
		return BULLET_ACT_BLOCK
	return ..()

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/proc/trigger_abilities(atom/A)
	if(!client)
		if(grenade.IsAvailable() && can_see(src, target, 10))
			grenade.Trigger(target = target)
			return
		if(rocket.IsAvailable() && can_see(src, target, 10) && HAS_TRAIT(target, TRAIT_IN_POWERARMOUR))
			rocket.Trigger(target = target)
			return

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/AIShouldSleep(list/possible_targets)
	. = ..()
	if(.) //Failed to find new targets, going into idle
		play_speech_sound(GLOB.sentrybot_switch_to_patrol_sound, bypass_cooldown = TRUE)
		add_overlay("scanning")
		set_light(l_range = 1.5, l_power = 8, l_color = "#ff0000")

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/proc/wind_down_gun()
	playsound(src, 'mojave/sound/ms13npc/sentrybot/gatling_winddown.ogg', 50, FALSE)
	already_firing = FALSE

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/handle_automated_action()
	. = ..()
	if(client)
		return
	if(AIStatus == AI_ON)
		play_speech_sound(GLOB.sentrybot_in_combat_sound, bypass_cooldown = FALSE)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/handle_automated_speech()
	. = ..()
	if(AIStatus == AI_IDLE)
		play_speech_sound(GLOB.sentrybot_idle_patrol_sound, bypass_cooldown = FALSE)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/toggle_ai(togglestatus)
	var/oldAIStatus = AIStatus
	. = ..()
	if((oldAIStatus == AI_IDLE) && (AIStatus == AI_ON))
		play_speech_sound(GLOB.sentrybot_hostiles_located_sound, bypass_cooldown = FALSE)
		toggle_ai(AI_ON)
		cut_overlays("scanning")
		set_light(l_range = 1.5, l_power = 8, l_color = "#ff0000")
		update_icon()

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	. = ..()
	if(amount > 10 && prob(20))
		playsound(src, pick(GLOB.sentrybot_damaged_sound), 50, FALSE)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/FindTarget(list/possible_targets, HasTargetsList = 0, IgnoreRepetiveCall = FALSE)
	var/old_target = target //If we change target (NULL => new target, old target => new target) play a sound effect
	. = ..()
	if((old_target != null) && (old_target != target) && !client)
		play_speech_sound(GLOB.sentrybot_new_hostile_sound, bypass_cooldown = FALSE)
	//If we still don't have a target, we should try finding a target again but in critical condition
	if(!target && !IgnoreRepetiveCall && (stat_attack != HARD_CRIT))
		stat_attack = HARD_CRIT
		FindTarget(possible_targets, HasTargetsList, IgnoreRepetiveCall = TRUE)
		//We'll give a grace period for the sentry bot being able to attack crit'd targets for about 1 volley
		addtimer(CALLBACK(src, .proc/reset_stat_attack), 3 SECONDS)

/mob/living/simple_animal/hostile/ms13/robot/sentrybot/proc/reset_stat_attack()
	stat_attack = initial(stat_attack)

//randomspread prerequisite
/obj/item/ammo_casing/energy/ms13/laser/sentrybot
	projectile_type = /obj/projectile/beam/ms13/laser/sentrybot
	variance = 30
	pellets = 1
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/laser_heavy.ogg'
	randomspread = TRUE

/obj/item/ammo_casing/energy/ms13/laser/sentrybot/fire_casing(atom/target, mob/living/user, params, distro, quiet, zone_override, spread, atom/fired_from, extra_damage, extra_penetration)
	. = ..()
	if(. && !QDELETED(src))
		qdel(src)

/obj/projectile/beam/ms13/laser/sentrybot
	damage = 8
	subtractible_armour_penetration = 35
	wound_bonus = 18
	bare_wound_bonus = 10

//A special rocket for sentrybot; light explosion fixed with lots of fire

/obj/projectile/bullet/sentrybot_rocket
	name = "explosive rocket"
	icon_state = "84mm-hedp"
	damage = 0 //Damage comes from the light explosion and fire
	embedding = null
	shrapnel_type = null
	speed = 1 //slower because it's a rocket

/obj/projectile/bullet/sentrybot_rocket/on_hit(atom/target, blocked = FALSE)
	explosion(get_turf(target), devastation_range = -1, heavy_impact_range = -1, light_impact_range = 2, flame_range = 3, explosion_cause = src)
	return BULLET_ACT_HIT

//Launches a rocket out of you
/datum/action/cooldown/launch_rocket
	name = "Launch a rocket"
	desc = "Launches a cool rocket at the enemy"
	cooldown_time = 14 SECONDS
	click_to_activate = TRUE
	var/obj/projectile/projectile = /obj/projectile/bullet/sentrybot_rocket

/datum/action/cooldown/launch_rocket/Activate(atom/target_atom)
	StartCooldown(14 SECONDS)
	launch_rocket(target_atom)
	StartCooldown()

/datum/action/cooldown/launch_rocket/proc/launch_rocket(atom/target_atom)
	playsound(owner, 'mojave/sound/ms13npc/sentrybot/rocket1.ogg', 60, TRUE, -1)
	var/obj/projectile/projectile_obj = new projectile(get_turf(owner))
	projectile_obj.firer = owner
	projectile_obj.preparePixelProjectile(target_atom, owner)
	projectile_obj.fire()

//Launch rocket but it's a shrapnel grenade
/datum/action/cooldown/launch_grenade
	name = "Launch a shrapnel grenade"
	desc = "Launches a cool grenade at the enemy"
	cooldown_time = 8 SECONDS
	click_to_activate = TRUE
	var/obj/item/grenade/grenade = /obj/item/grenade/frag/sentrybot

/datum/action/cooldown/launch_grenade/Activate(atom/target_atom)
	StartCooldown(8 SECONDS)
	launch_grenade(target_atom)
	StartCooldown()

/datum/action/cooldown/launch_grenade/proc/launch_grenade(atom/target_atom)
	//living_owner.SetStun(1.5 SECONDS, ignore_canstun = TRUE)
	playsound(owner, 'mojave/sound/ms13npc/sentrybot/grenade2.ogg', 60, TRUE, -1)
	//var/obj/item/grenade/thrown_grenade = new grenade(get_step(owner, get_dir(owner, target_atom)))
	var/obj/item/grenade/thrown_grenade = new grenade(get_turf(owner))
	var/original_density = owner.density
	//Aim ahead of target by 3 steps
	var/new_target_turf = target_atom
	for(var/i = 0; i != 3; i++)
		new_target_turf = get_step(new_target_turf, get_dir(owner, target_atom))
	owner.density = FALSE
	thrown_grenade.throw_at(new_target_turf, 15, 2, owner, FALSE, FALSE)
	owner.density = original_density
	thrown_grenade.arm_grenade(owner, 1.5 SECONDS, 2, 1, owner, TRUE)

/obj/item/grenade/frag/sentrybot
	name = "frag grenade"
	desc = "An anti-personnel fragmentation grenade, this weapon excels at killing soft targets by shredding them with metal shrapnel."
	icon = 'mojave/icons/objects/throwables/ms_bomb_sentrybot.dmi'
	icon_state = "bomb"
	shrapnel_type = /obj/projectile/bullet/shrapnel/ms13
	pass_flags = PASSMOB
	shrapnel_radius = 4
	ex_heavy = -1
	ex_light = 1
	ex_flame = 2

/obj/item/shrapnel/ms13
	name = "shrapnel shard"
	weak_against_armour = FALSE
	icon = 'mojave/icons/objects/projectiles/projectiles.dmi'
	icon_state = "nail" //placeholder
	sharpness = SHARP_POINTY

/obj/projectile/bullet/shrapnel/ms13
	name = "flying shrapnel shard"
	damage = 15
	subtractible_armour_penetration = 20
	range = 25
	weak_against_armour = FALSE
	icon = 'mojave/icons/objects/projectiles/projectiles.dmi'
	icon_state = "nail" //placeholder
	ricochets_max = 2
	ricochet_chance = 75
	shrapnel_type = /obj/item/shrapnel/ms13
	ricochet_incidence_leeway = 60
	sharpness = SHARP_POINTY
	wound_bonus = 10
	bare_wound_bonus = 15
	embedding = list("embedded_pain_multiplier" = 1, "embed_chance" = 50, "embedded_fall_chance" = 10, "ignore_throwspeed_threshold" = TRUE)

//A flamethrower that's essentially a forward facing backblast of the rocket launcher
/datum/action/cooldown/flamethrow
	name = "Flamethrower"
	desc = "Throws a bunch of flame at the target"
	cooldown_time = 6 SECONDS
	click_to_activate = TRUE
	var/obj/projectile/bullet/incendiary/backblast/proj = /obj/projectile/bullet/incendiary/backblast

/datum/action/cooldown/flamethrow/Activate(atom/target_atom)
	StartCooldown(6 SECONDS)
	throw_flame(target_atom)
	StartCooldown()

/datum/action/cooldown/flamethrow/proc/throw_flame(atom/target_atom)
	var/forwards_angle = get_angle(owner, target_atom)
	//Forwards_angle - (angle spread * 0.5)
	var/starting_angle = SIMPLIFY_DEGREES(forwards_angle-(48 * 0.5))
	//Angle spread / plumes
	var/iter_offset = 48 / 4 // how much we increment the angle for each plume
	//in 1 to plumes
	for(var/i in 1 to 4)
		var/this_angle = SIMPLIFY_DEGREES(starting_angle + ((i - 1) * iter_offset))
		var/turf/target_turf = get_turf_in_angle(this_angle, get_turf(owner), 10)
		var/obj/projectile/bullet/P = new(get_turf(owner))
		P.original = target_turf
		P.range = 6
		P.fired_from = get_turf(owner)
		P.firer = owner // don't hit ourself that would be really annoying
		P.impacted = list(owner = TRUE) // don't hit the target we hit already with the flak
		P.preparePixelProjectile(target_turf, owner)
		P.fire()

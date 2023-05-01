/mob/living/simple_animal/hostile/megafauna/deathclaw
	name = "deathclaw"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match."
	icon = 'mojave/icons/mob/deathclaw.dmi'
	icon_state = "deathclaw"
	icon_living = "deathclaw"
	icon_dead = "deathclaw_dead"
	icon_gib = "deathclaw_gib"
	gender = MALE
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	stat_attack = HARD_CRIT
	robust_searching = 1
	anchored = 1
	speak = list("ROAR!","Rawr!","GRRAAGH!","Growl!")
	speak_emote = list("growls", "roars")
	emote_hear = list("grumbles.","grawls.")
	emote_taunt = list("stares ferociously", "stomps")
	speak_chance = 10
	taunt_chance = 25
	speed = 5
	move_to_delay = 2.5
	see_in_dark = 8
	maxHealth = 3000
	health = 3000
	obj_damage = 60
	armour_penetration = 30
	melee_damage_lower = 56
	melee_damage_upper = 56
	ranged = TRUE //Charging attacks
	attack_sound = 'sound/weapons/bladeslice.ogg'
	faction = list("deathclaw")
	blood_volume = BLOOD_VOLUME_MAXIMUM
	footstep_type = FOOTSTEP_MOB_HEAVY
	move_to_delay = 5
	pixel_x = -16
	base_pixel_x = -16
	aggro_vision_range = 10
	vision_range = 10
	wander = FALSE
	var/charging = FALSE
	var/datum/action/cooldown/mob_cooldown/charge/deathclaw/charge
	var/datum/action/cooldown/mob_cooldown/charge/deathclaw/combo/combo
	var/datum/action/cooldown/mob_cooldown/deathclaw/slash/slash
	var/datum/action/cooldown/mob_cooldown/charge/deathclaw/leap/leap
	var/datum/action/cooldown/mob_cooldown/deathclaw_roar/roar
	var/datum/action/cooldown/mob_cooldown/projectile_attack/rapid_fire/pocket_sand/pocket_sand
	var/aggro_roar_available = TRUE
	var/second_wind_available = TRUE

	///The ai_node we'll go back to with dead bodies and store them over there, extra flavor for roaming deathclaw
	var/obj/effect/ai_node/nest_node = null
	///Determine if we make it here and if we do, stop dragging a body
	var/turf/dropoff_location = null
	///OFF TO THE NEST!
	var/pulled_victim = null

/mob/living/simple_animal/hostile/megafauna/deathclaw/Initialize()
	. = ..()
	charge = new /datum/action/cooldown/mob_cooldown/charge/deathclaw()
	charge.Grant(src)
	roar = new /datum/action/cooldown/mob_cooldown/deathclaw_roar()
	roar.Grant(src)
	combo = new /datum/action/cooldown/mob_cooldown/charge/deathclaw/combo()
	combo.Grant(src)
	leap = new /datum/action/cooldown/mob_cooldown/charge/deathclaw/leap()
	leap.Grant(src)
	slash = new /datum/action/cooldown/mob_cooldown/deathclaw/slash()
	slash.Grant(src)
	//pocket_sand = new /datum/action/cooldown/mob_cooldown/projectile_attack/rapid_fire/pocket_sand()
	//pocket_sand.Grant(src)
	RegisterSignal(src, COMSIG_AI_NODE_REACHED, .proc/check_node)
	AddComponent(/datum/component/generic_animal_patrol, _animal_node_weights = list(NODE_LAST_VISITED = -1), _animal_identifier = IDENTIFIER_GENERIC_SIMPLE, _patrol_move_delay = 3)
	for(var/obj/effect/ai_node/node in range(7, src))
		nest_node = node
		break

//If we reach the node nest, pick a spot to go towards to drop off the body
/mob/living/simple_animal/hostile/megafauna/deathclaw/proc/check_node(datum/source)
	var/datum/component/generic_animal_patrol/patrol = GetComponent(/datum/component/generic_animal_patrol)
	if((nest_node == patrol.current_node) && pulled_victim && pulling)
		for(var/turf/T in shuffle(range(2, src)))
			dropoff_location = T
			prevent_goto_movement = FALSE
			Goto(dropoff_location, move_to_delay, minimum_distance = 0)
			break
		prevent_goto_movement = TRUE

/mob/living/simple_animal/hostile/megafauna/deathclaw/Destroy()
	QDEL_NULL(charge)
	QDEL_NULL(roar)
	return ..()

/mob/living/simple_animal/hostile/megafauna/deathclaw/GiveTarget(new_target)
	..()
	if(target && aggro_roar_available && !IsStun())
		roar.Trigger(target = new_target)
		aggro_roar_available = FALSE
	return (target != null)

/mob/living/simple_animal/hostile/megafauna/deathclaw/toggle_ai(togglestatus)
	. = ..()
	if(togglestatus == AI_OFF || togglestatus == AI_Z_OFF || togglestatus == AI_IDLE)
		aggro_roar_available = TRUE

/mob/living/simple_animal/hostile/megafauna/deathclaw/Life()
	. = ..()
	if(AIStatus == AI_IDLE)
		if(prob(20))
			playsound(src, pick('mojave/sound/ms13npc/deathclaw/npc_deathclaw_idle_01.wav', 'mojave/sound/ms13npc/deathclaw/npc_deathclaw_idle_02.wav', 'mojave/sound/ms13npc/deathclaw/npc_deathclaw_idle_03.wav', 'mojave/sound/ms13npc/deathclaw/npc_deathclaw_idle_04.wav'), 75, FALSE)

		if(loc == dropoff_location)
			stop_pulling()
			dropoff_location = null
			pulled_victim = null
			prevent_goto_movement = FALSE

		var/datum/component/generic_animal_patrol/patrol = GetComponent(/datum/component/generic_animal_patrol)
		if(!pulled_victim && !(nest_node == patrol.current_node))
			for(var/mob/living/carbon/human/rip in range(7, src))
				if(rip && ((rip.stat == DEAD) || (rip.stat == HARD_CRIT)))
					pulled_victim = rip
					break

		//We got too distracted
		if(pulled_victim && get_dist(src, pulled_victim) > 10)
			pulled_victim = null
			prevent_goto_movement = FALSE

		if(pulled_victim && !pulling)
			Goto(pulled_victim, move_to_delay, minimum_distance = 0)
			prevent_goto_movement = TRUE //Don't let generic patrol disturb us
			if(get_dist(src, pulled_victim) < 2)
				start_pulling(pulled_victim)

		//Life() optimization? Never heard of it, let's get back to the CAVE
		if(pulled_victim == pulling && (nest != patrol.target_node) && (nest != patrol.current_node))
			SEND_SIGNAL(src, COMSIG_AI_SET_GOAL_NODE, nest_node)
			prevent_goto_movement = FALSE

/mob/living/simple_animal/hostile/megafauna/deathclaw/adjustBruteLoss(amount, updating_health = TRUE, forced = FALSE)
	. = ..()
	if(. > 0 && prob(amount))
		var/obj/effect/decal/cleanable/blood/gibs/bubblegum/B = new /obj/effect/decal/cleanable/blood/gibs/bubblegum(loc)
		if(prob(amount))
			step(B, pick(GLOB.cardinals))
		else
			B.setDir(pick(GLOB.cardinals))
	if(!client && second_wind_available && (health < (maxHealth / 2)))
		roar.Trigger(target = src)
		second_wind_available = FALSE

/mob/living/simple_animal/hostile/megafauna/deathclaw/OpenFire()
	if(client)
		return
	//if(pocket_sand.Trigger(target = target))
	//	return
	var/turf/target_turf = pick(RANGE_TURFS(2, target))
	if(get_dist(target, src) > 4)
		if(prob(50))
			charge.Trigger(target = target_turf)
		else
			leap.Trigger(target = target)
	else
		if(get_dist(target, src) == 1)
			slash.Activate()
		else
			face_atom(target)
			var/turf/actual_target = get_turf(target)
			if(prob(50))
				actual_target = get_ranged_target_turf(actual_target, turn(get_dir(src, actual_target), 90), 3)
				//for(var/i = 0; i != 3; i++)
				//actual_target = get_step(actual_target, turn(dir, 90))
			else
				actual_target = get_ranged_target_turf(actual_target, turn(get_dir(src, actual_target), -90), 3)
				//for(var/i = 0; i != 3; i++)
				//actual_target = get_step(actual_target, turn(dir, -90))
			combo.Trigger(target = actual_target)

/mob/living/simple_animal/hostile/megafauna/deathclaw/handle_automated_action()
	. = ..()
	if((health != maxHealth) && (AIStatus == AI_OFF || AIStatus == AI_Z_OFF || AIStatus == AI_IDLE))
		adjustBruteLoss(-20) //Passive healing time
		if(health == maxHealth)
			second_wind_available = TRUE

/mob/living/simple_animal/hostile/megafauna/deathclaw/devour(mob/living/L)
	/*
	if(!L)
		return FALSE
	if(istype(L, /mob/living/carbon/human))
		var/mob/living/carbon/human/human = L
		for(var/obj/item/bodypart/part in human)
			part.dismember(dam_type = BRUTE, silent = FALSE)
	visible_message(
		span_danger("[src] eviscerates [L]!"),
		span_userdanger("You feast on [L], restoring your health!"))
	L.gib()
	playsound(src, 'mojave/sound/ms13npc/deathclaw/deathclaw_roar.mp3', 100, TRUE, -1)
	*/
	return TRUE

//Spooky roar that shakes nearby tiles and screens of players to act as a telegraph
/datum/action/cooldown/mob_cooldown/deathclaw_roar
	name = "Deathclaw's Roar"
	desc = "Makes you do a pretty big roar"
	cooldown_time = 10 SECONDS
	click_to_activate = FALSE
	shared_cooldown = null

/datum/action/cooldown/mob_cooldown/deathclaw_roar/Activate(atom/target_atom)
	roar()
	StartCooldown()

/datum/action/cooldown/mob_cooldown/deathclaw_roar/proc/roar()
	var/mob/living/living_owner = owner
	living_owner.SetStun(1.5 SECONDS, ignore_canstun = TRUE)
	playsound(owner, 'mojave/sound/ms13npc/deathclaw/deathclaw_roar.mp3', 100, TRUE, -1)
	new /obj/effect/temp_visual/shockwave(owner.loc, 18)
	addtimer(CALLBACK(src, .proc/roar_aftershock), 0.31 SECONDS)
	var/list/all_turfs = RANGE_TURFS(12, owner.loc)
	for(var/i = 0 to 12)
		for(var/turf/roar_turf in all_turfs)
			if(get_dist(owner.loc, roar_turf) > i)
				continue
			roar_turf.Shake(rand(-4, 4), rand(-4, 4), 0.3 SECONDS)
			for(var/mob/living/L in roar_turf)
				if(L == living_owner)
					continue
				shake_camera(L, 7, 3)
				L.adjustStaminaLoss(100 / max(1, get_dist(L, living_owner)))
				if(get_dist(L, living_owner) < 3) //Did you know getting jumpscared by a deathclaw is a bad thing?
					L.emote("scream")
					L.Knockdown(2 SECONDS, ignore_canstun = TRUE)
			all_turfs -= roar_turf
		sleep(0.05 SECONDS)

//Following the initial big shaking of stuff is a slightly less shaking of the tiles as the roar continues
/datum/action/cooldown/mob_cooldown/deathclaw_roar/proc/roar_aftershock()
	var/list/all_turfs = RANGE_TURFS(12, owner.loc)
	for(var/i = 0 to 12)
		for(var/turf/roar_turf in all_turfs)
			if(get_dist(owner.loc, roar_turf) > i)
				continue
			roar_turf.Shake(rand(-2, 2), rand(-2, 2), 1.5 SECONDS)
			for(var/atom/A in roar_turf)
				A.Shake(rand(-2, 2), rand(-2, 2), 1.5 SECONDS)
			all_turfs -= roar_turf
		sleep(0.05 SECONDS)
	sleep(0.91 SECONDS)
	all_turfs = RANGE_TURFS(12, owner.loc)
	for(var/i = 0 to 12)
		for(var/turf/roar_turf in all_turfs)
			if(get_dist(owner.loc, roar_turf) > i)
				continue
			roar_turf.Shake(rand(-1, 1), rand(-1, 1), 1.5 SECONDS)
			for(var/atom/A in roar_turf)
				A.Shake(rand(-1, 1), rand(-1, 1), 1.5 SECONDS)
			all_turfs -= roar_turf
		sleep(0.05 SECONDS)

//Deathclaw charge; Heavily modified bubblegum charge
/datum/action/cooldown/mob_cooldown/charge/deathclaw
	charge_delay = 0.3 SECONDS
	charge_past = 1
	charge_speed = 0.15 SECONDS
	cooldown_time = 6 SECONDS
	charge_distance = 99
	shared_cooldown = null

/datum/action/cooldown/mob_cooldown/charge/deathclaw/on_moved(atom/source)
	SIGNAL_HANDLER
	playsound(source, pick('mojave/sound/ms13npc/deathclaw/npc_deathclaw_foot_run_01.wav', 'mojave/sound/ms13npc/deathclaw/npc_deathclaw_foot_run_02.wav', 'mojave/sound/ms13npc/deathclaw/npc_deathclaw_foot_run_03.wav', 'mojave/sound/ms13npc/deathclaw/npc_deathclaw_foot_run_04.wav'), 200, TRUE, 2, TRUE)
	//INVOKE_ASYNC(src, .proc/DestroySurroundings, source)

/datum/action/cooldown/mob_cooldown/charge/deathclaw/do_charge_indicator(mob/charger, atom/charge_target)
	var/turf/target_turf = get_turf(charge_target)
	owner.icon_state = "deathclaw_danger"
	if(!target_turf)
		return
	charger.face_atom(target_turf)
	if(istype(owner, /mob/living/simple_animal))
		var/mob/living/simple_animal/animal = owner
		animal.prevent_goto_movement = TRUE
		addtimer(CALLBACK(src, .proc/reset_goto, animal), 0.5 SECONDS)
	if(!target_turf)
		return
	for(var/turf/t in RANGE_TURFS(1, charge_target))
		new /obj/effect/temp_visual/ms13/target_indicator(t)

/datum/action/cooldown/mob_cooldown/charge/deathclaw/proc/reset_goto(mob/living/simple_animal/animal)
	animal.prevent_goto_movement = FALSE

/datum/action/cooldown/mob_cooldown/charge/deathclaw/pre_move(datum)
	. = ..()
	owner.icon_state = "deathclaw"

//No deathclaw afterimages please
/datum/action/cooldown/mob_cooldown/charge/deathclaw/on_move(atom/source, atom/new_loc)
	SIGNAL_HANDLER
	if(!actively_moving)
		return COMPONENT_MOVABLE_BLOCK_PRE_MOVE
	//INVOKE_ASYNC(src, .proc/DestroySurroundings, source)

/datum/action/cooldown/mob_cooldown/charge/deathclaw/IsAvailable()
	. = ..()
	if(istype(owner, /mob/living/simple_animal))
		var/mob/living/simple_animal/animal = owner
		if(animal.prevent_goto_movement)
			. = FALSE
	return .

/datum/action/cooldown/mob_cooldown/charge/deathclaw/hit_target(atom/movable/source, atom/target, damage_dealt)
	. = ..()
	if(isliving(target))
		var/mob/living/target_mob = target
		var/throwlocation = target_mob.loc //Throw them 3 turfs away from impact
		for(var/x in 1 to 3)
			throwlocation = get_step(throwlocation, owner.dir)
		target_mob.throw_at(throwlocation, 2, 1, owner, TRUE)
		target_mob.Knockdown(3 SECONDS, ignore_canstun = FALSE)

//Dash to a mid way point and not straight towards the target, followed by a dash towards the target
/datum/action/cooldown/mob_cooldown/charge/deathclaw/combo
	cooldown_time = 4 SECONDS
	charge_delay = 0.3 SECONDS
	charge_past = 0
	charge_speed = 0.10 SECONDS
	charge_distance = 80

/datum/action/cooldown/mob_cooldown/charge/deathclaw/combo/charge_sequence(atom/movable/charger, atom/target_atom, delay, past)
	do_charge(owner, target_atom, charge_delay - 2, charge_past)
	if(istype(owner, /mob/living/simple_animal/hostile))
		var/mob/living/simple_animal/hostile/hostile = owner
		do_charge(owner, hostile.target, charge_delay * (1/3), charge_past + 2)
	else
		do_charge(owner, target_atom, charge_delay * (1/3), charge_past + 2)

//Leap towards a target
/datum/action/cooldown/mob_cooldown/charge/deathclaw/leap
	charge_distance = 99
	cooldown_time = 6 SECONDS
	charge_delay = 0.4 SECONDS
	charge_past = 1
	charge_speed = 0.15 SECONDS

/datum/action/cooldown/mob_cooldown/charge/deathclaw/leap/charge_end(datum/move_loop/source)
	SIGNAL_HANDLER
	for(var/turf/t in RANGE_TURFS(2, owner))
		t.Shake(pixelshiftx = rand(-4, 4), pixelshifty = rand(-4, 4), duration = 0.6 SECONDS)
		for(var/atom/movable/A in t)
			if(A == owner)
				continue
			if(A.anchored)
				continue
			var/target_angle = get_angle(owner, A)
			var/move_target = get_ranged_target_turf(A, angle2dir(target_angle), 3)
			A.throw_at(move_target, 3, 3)
			A.visible_message(span_warning("[A] gets thrown back by the force of the shockwave !"), span_warning("The shockwave sends you flying!"))
			if(isliving(A))
				var/mob/living/liver = A
				liver.Knockdown(0.5 SECONDS, ignore_canstun = FALSE)
	..()

//Standalone aoe slash attack
/datum/action/cooldown/mob_cooldown/deathclaw/slash
	name = "Slash"
	desc = "Slashes an entire area before yourself"
	cooldown_time = 0 SECONDS

/datum/action/cooldown/mob_cooldown/deathclaw/slash/IsAvailable()
	. = ..()
	if(istype(owner, /mob/living/simple_animal))
		var/mob/living/simple_animal/animal = owner
		if(animal.prevent_goto_movement)
			. = FALSE
	return .

/datum/action/cooldown/mob_cooldown/deathclaw/slash/Activate(atom/target_atom)
	owner.face_atom(target_atom)
	slash()
	StartCooldown()

/datum/action/cooldown/mob_cooldown/deathclaw/slash/proc/slash()
	if(istype(owner, /mob/living/simple_animal))
		var/mob/living/simple_animal/animal = owner
		animal.prevent_goto_movement = TRUE
	addtimer(CALLBACK(src, .proc/actually_slash), 0.5 SECONDS)
	//3x2 block ahead of the owner
	for(var/turf/t in block(get_step(get_turf(owner), turn(owner.dir, 45)), get_step(get_step(get_turf(owner), turn(owner.dir, -45)), owner.dir)))
		new /obj/effect/temp_visual/ms13/target_indicator(t)

/datum/action/cooldown/mob_cooldown/deathclaw/slash/proc/actually_slash()
	var/list/atom/movable/atoms_to_slash = list()
	for(var/turf/t in block(get_step(get_turf(owner), turn(owner.dir, 45)), get_step(get_step(get_turf(owner), turn(owner.dir, -45)), owner.dir)))
		atoms_to_slash += t.contents
	for(var/atom/movable/a in atoms_to_slash)
		a.attack_animal(owner)
		if(!a.anchored)
			step_away(a, owner, 1, 2)
	if(istype(owner, /mob/living/simple_animal))
		var/mob/living/simple_animal/animal = owner
		animal.prevent_goto_movement = FALSE
	playsound(owner, pick('mojave/sound/ms13npc/deathclaw/npc_deathclawsm_clawatk_01.wav', 'mojave/sound/ms13npc/deathclaw/npc_deathclawsm_clawatk_02.wav', 'mojave/sound/ms13npc/deathclaw/npc_deathclawsm_clawatk_03.wav', 'mojave/sound/ms13npc/deathclaw/npc_deathclawsm_clawatk_04.wav'), 200, TRUE, 2, TRUE)

#define SMOOTH_GROUP_TARGET_INDICATOR S_OBJ(400)

/obj/effect/temp_visual/ms13/target_indicator
	name = "generic warning indicator"
	desc = "Do you even have the time to spare looking at this?"
	icon = 'mojave/icons/effects/target_indicator.dmi'
	icon_state = "target_indicator-0"
	base_icon_state = "target_indicator"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_TARGET_INDICATOR)
	canSmoothWith = list(SMOOTH_GROUP_TARGET_INDICATOR)
	layer = FLY_LAYER
	plane = ABOVE_GAME_PLANE
	duration = 5 //0.5 SECONDS

/obj/effect/temp_visual/ms13/target_indicator/Initialize(mapload)
	. = ..()
	if(smoothing_flags & (SMOOTH_BITMASK))
		QUEUE_SMOOTH_NEIGHBORS(src)
		QUEUE_SMOOTH(src)

/obj/effect/temp_visual/ms13/target_indicator/Destroy()
	if(smoothing_flags & (SMOOTH_BITMASK))
		QUEUE_SMOOTH_NEIGHBORS(src)
	return ..()

//Pocket sand!
/datum/action/cooldown/mob_cooldown/projectile_attack/rapid_fire/pocket_sand
	name = "Throw pocket sand"
	desc = "Throws some sand at a target, disorientating and blinding them"
	cooldown_time = 5 SECONDS
	projectile_type = /obj/projectile/bullet/pocket_sand
	projectile_sound = null
	default_projectile_spread = 15
	shot_count = 10
	shot_delay = 0.0 SECONDS

/obj/projectile/bullet/pocket_sand
	name = "cloud of pocket sand"
	desc = "Don't just look at it, run away!"
	icon = 'icons/obj/meteor.dmi'
	icon_state = "dust"
	damage = 0
	range = 12
	pass_flags = PASSTABLE | PASSGRILLE
	projectile_piercing = PASSMOB
	phasing_ignore_direct_target = TRUE
	opacity = TRUE

/obj/projectile/bullet/pocket_sand/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(!isliving(target))
		return
	var/mob/living/unlucky = target
	if(unlucky.stat == DEAD)
		return
	unlucky.blur_eyes(10)
	if(unlucky.stat == UNCONSCIOUS || unlucky.eye_blurry) //No emote spam if you're already hit
		return
	unlucky.emote("scream")

//TerraGov Marine Corp's explosion shockwave that's repurposed for a sonic boom deathclaw roar
/obj/effect/temp_visual/shockwave
	icon = 'mojave/icons/effects/shockwave.dmi'
	icon_state = "shockwave"
	plane = GRAVITY_PULSE_PLANE
	pixel_x = -496
	pixel_y = -496

/obj/effect/temp_visual/shockwave/Initialize(mapload, radius)
	. = ..()
	deltimer(timerid)
	timerid = QDEL_IN(src, 0.5 * radius)
	transform = matrix().Scale(32 / 1024, 32 / 1024)
	animate(src, time = 1/2 * radius, transform=matrix().Scale((32 / 1024) * radius * 1.5, (32 / 1024) * radius * 1.5))

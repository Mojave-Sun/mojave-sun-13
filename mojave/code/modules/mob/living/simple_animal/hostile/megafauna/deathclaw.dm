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
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	anchored = 1
	speak = list("ROAR!","Rawr!","GRRAAGH!","Growl!")
	speak_emote = list("growls", "roars")
	emote_hear = list("grumbles.","grawls.")
	emote_taunt = list("stares ferociously", "stomps")
	speak_chance = 10
	taunt_chance = 25
	speed = 5
	move_to_delay = 3
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
	var/charging = FALSE
	var/datum/action/cooldown/mob_cooldown/charge/deathclaw/charge
	var/datum/action/cooldown/mob_cooldown/charge/deathclaw/combo/combo
	var/datum/action/cooldown/mob_cooldown/deathclaw/slash/slash
	var/datum/action/cooldown/mob_cooldown/charge/deathclaw/leap/leap
	var/datum/action/cooldown/mob_cooldown/deathclaw_roar/roar
	var/datum/action/cooldown/mob_cooldown/projectile_attack/rapid_fire/pocket_sand/pocket_sand
	var/aggro_roar_available = TRUE
	var/second_wind_available = TRUE

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

/mob/living/simple_animal/hostile/megafauna/deathclaw/Destroy()
	QDEL_NULL(charge)
	QDEL_NULL(roar)
	return ..()

/mob/living/simple_animal/hostile/megafauna/deathclaw/GiveTarget(new_target)
	if(target && aggro_roar_available && !IsStun())
		roar.Trigger(target = new_target)
		aggro_roar_available = FALSE
	return ..()

/mob/living/simple_animal/hostile/megafauna/deathclaw/toggle_ai(togglestatus)
	. = ..()
	if(togglestatus == AI_OFF || togglestatus == AI_Z_OFF || togglestatus == AI_IDLE)
		aggro_roar_available = TRUE

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
			combo.Trigger(target = target)

/mob/living/simple_animal/hostile/megafauna/deathclaw/handle_automated_action()
	. = ..()
	if(AIStatus == AI_OFF || AIStatus == AI_Z_OFF || AIStatus == AI_IDLE)
		adjustBruteLoss(-20) //Passive healing time
		if(health == maxHealth)
			second_wind_available = TRUE

/mob/living/simple_animal/hostile/megafauna/deathclaw/devour(mob/living/L)
	if(!L)
		return FALSE
	if(istype(L, /mob/living/carbon/human))
		var/mob/living/carbon/human/human = L
		for(var/obj/item/bodypart/part in human)
			part.dismember(dam_type = BRUTE, silent = FALSE)
	visible_message(
		span_danger("[src] devours [L]!"),
		span_userdanger("You feast on [L], restoring your health!"))
	L.gib()
	playsound(src, 'mojave/sound/ms13npc/deathclaw/deathclaw_roar.mp3', 100, TRUE, -1)
	return TRUE

//Deathclaw charge; bubblegum charge with modified GFX

/datum/action/cooldown/mob_cooldown/charge/deathclaw
	charge_delay = 0.6 SECONDS
	charge_past = 2
	charge_speed = 0.6
	cooldown_time = 10 SECONDS
	charge_distance = 10
	shared_cooldown = null

/datum/action/cooldown/mob_cooldown/charge/deathclaw/do_charge_indicator(mob/charger, atom/charge_target)
	var/turf/target_turf = get_turf(charge_target)
	owner.icon_state = "deathclaw_danger"
	if(!target_turf)
		return
	charger.face_atom(target_turf)

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
			roar_turf.Shake(rand(-2, 2), rand(-2, 2), 1 SECONDS)
			for(var/atom/A in roar_turf)
				A.Shake(rand(-2, 2), rand(-2, 2), 1 SECONDS)
			all_turfs -= roar_turf
		sleep(0.05 SECONDS)
	sleep(0.41 SECONDS)
	all_turfs = RANGE_TURFS(12, owner.loc)
	for(var/i = 0 to 12)
		for(var/turf/roar_turf in all_turfs)
			if(get_dist(owner.loc, roar_turf) > i)
				continue
			roar_turf.Shake(rand(-1, 1), rand(-1, 1), 1 SECONDS)
			for(var/atom/A in roar_turf)
				A.Shake(rand(-1, 1), rand(-1, 1), 1 SECONDS)
			all_turfs -= roar_turf
		sleep(0.05 SECONDS)

//Multiple short dashes with aoe attacks
/datum/action/cooldown/mob_cooldown/charge/deathclaw/combo
	cooldown_time = 6 SECONDS
	charge_delay = 0.5 SECONDS
	charge_past = 3
	charge_speed = 0.6
	charge_distance = 4

/datum/action/cooldown/mob_cooldown/charge/deathclaw/combo/charge_sequence(atom/movable/charger, atom/target_atom, delay, past)
	for(var/i in 0 to 2)
		do_charge(owner, target_atom, charge_delay - 2 * i, charge_past)

//Leap towards a target
/datum/action/cooldown/mob_cooldown/charge/deathclaw/leap
	charge_distance = 99
	cooldown_time = 10 SECONDS
	charge_delay = 0.5 SECONDS
	charge_past = 0
	charge_speed = 0.3

/datum/action/cooldown/mob_cooldown/charge/deathclaw/leap/do_charge_indicator(atom/charger, atom/charge_target)
	if(istype(owner, /mob/living/simple_animal))
		var/mob/living/simple_animal/animal = owner
		animal.prevent_goto_movement = TRUE
		addtimer(CALLBACK(src, .proc/reset_goto, animal), 0.5 SECONDS)
	var/turf/target_turf = get_turf(charge_target)
	if(!target_turf)
		return
	for(var/turf/t in RANGE_TURFS(1, charge_target))
		new /obj/effect/temp_visual/ms13/target_indicator(t)

/datum/action/cooldown/mob_cooldown/charge/deathclaw/leap/proc/reset_goto(mob/living/simple_animal/animal)
	animal.prevent_goto_movement = FALSE

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
	slash()
	StartCooldown()

/datum/action/cooldown/mob_cooldown/deathclaw/slash/proc/slash()
	if(istype(owner, /mob/living/simple_animal))
		var/mob/living/simple_animal/animal = owner
		animal.prevent_goto_movement = TRUE
	addtimer(CALLBACK(src, .proc/actually_slash), 0.5 SECONDS)
	new /obj/effect/temp_visual/ms13/target_indicator(get_step(owner, owner.dir))
	new /obj/effect/temp_visual/ms13/target_indicator(get_step(owner, turn(owner.dir, -45)))
	new /obj/effect/temp_visual/ms13/target_indicator(get_step(owner, turn(owner.dir, 45)))

/datum/action/cooldown/mob_cooldown/deathclaw/slash/proc/actually_slash()
	var/list/atom/movable/atoms_to_slash = get_step(owner, owner.dir).contents.Copy()
	atoms_to_slash += get_step(owner, turn(owner.dir, -45)).contents
	atoms_to_slash += get_step(owner, turn(owner.dir, 45)).contents
	for(var/atom/movable/a in atoms_to_slash)
		a.attack_animal(owner)
		if(!a.anchored)
			step_away(a, owner, 1, 2)
	if(istype(owner, /mob/living/simple_animal))
		var/mob/living/simple_animal/animal = owner
		animal.prevent_goto_movement = FALSE
	playsound(owner, 'sound/weapons/bladeslice.ogg', 200, TRUE, 2, TRUE)


/obj/effect/temp_visual/ms13/target_indicator
	name = "generic warning indicator"
	desc = "Do you even have time to spare looking at this?"
	icon = 'mojave/icons/effects/target_indicator.dmi'
	icon_state = "target_indicator"
	layer = FLY_LAYER
	plane = ABOVE_GAME_PLANE
	duration = 5 //0.5 SECONDS

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

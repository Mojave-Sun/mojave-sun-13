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
	speed = 10
	move_to_delay = 2.5
	see_in_dark = 8
	maxHealth = 2500
	health = 2500
	obj_damage = 60
	armour_penetration = 30
	melee_damage_lower = 56
	melee_damage_upper = 56
	ranged = TRUE //Charging
	attack_sound = 'sound/weapons/bladeslice.ogg'
	faction = list("deathclaw")
	blood_volume = BLOOD_VOLUME_MAXIMUM
	footstep_type = FOOTSTEP_MOB_HEAVY
	move_to_delay = 5
	var/charging = FALSE
	var/datum/action/cooldown/mob_cooldown/charge/deathclaw/charge
	var/datum/action/cooldown/mob_cooldown/deathclaw_roar/roar
	var/aggro_roar_available = TRUE
	var/second_wind_available = TRUE

/mob/living/simple_animal/hostile/megafauna/deathclaw/Initialize()
	. = ..()
	charge = new /datum/action/cooldown/mob_cooldown/charge/deathclaw()
	charge.Grant(src)
	roar = new /datum/action/cooldown/mob_cooldown/deathclaw_roar()
	roar.Grant(src)

/mob/living/simple_animal/hostile/megafauna/deathclaw/Destroy()
	QDEL_NULL(charge)
	QDEL_NULL(roar)
	return ..()

/mob/living/simple_animal/hostile/megafauna/deathclaw/GiveTarget(new_target)
	. = ..()
	if(aggro_roar_available && !IsStun())
		roar.Trigger(target = new_target)
		aggro_roar_available = FALSE
	return .

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
	if(second_wind_available && (health < (maxHealth / 2)))
		roar.Trigger(target = src)
		second_wind_available = FALSE

/mob/living/simple_animal/hostile/megafauna/deathclaw/OpenFire()
	if(client)
		return
	charge.Trigger(target = target)

/mob/living/simple_animal/hostile/megafauna/deathclaw/handle_automated_action()
	. = ..()
	if(AIStatus == AI_OFF || AIStatus == AI_Z_OFF || AIStatus == AI_IDLE)
		adjustBruteLoss(-20) //Passive healing time
		if(health == maxHealth)
			second_wind_available = TRUE

/mob/living/simple_animal/hostile/megafauna/deathclaw/devour(mob/living/L)
	if(!L)
		return FALSE
	visible_message(
		span_danger("[src] devours [L]!"),
		span_userdanger("You feast on [L], restoring your health!"))
	L.gib()
	playsound(src, 'sound/creatures/space_dragon_roar.ogg', 100, TRUE, -1)
	return TRUE

//Deathclaw charge; bubblegum charge with modified GFX

/datum/action/cooldown/mob_cooldown/charge/deathclaw
	charge_delay = 0.6 SECONDS
	charge_past = 2
	charge_speed = 1.25

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
	INVOKE_ASYNC(src, .proc/DestroySurroundings, source)

/datum/action/cooldown/mob_cooldown/charge/deathclaw/hit_target(atom/movable/source, atom/target, damage_dealt)
	. = ..()
	if(isliving(target))
		var/mob/living/target_mob = target
		var/throwlocation = target_mob.loc //Throw them 2 turfs away from impact
		for(var/x in 1 to 2)
			throwlocation = get_step(throwlocation, owner.dir)
		target_mob.throw_at(throwlocation, 2, 1, owner, TRUE)
		target_mob.Stun(2 SECONDS, ignore_canstun = TRUE) //Because you should feel real bad

//Spooky roar that shakes nearby tiles and screens of players to act as a telegraph
/datum/action/cooldown/mob_cooldown/deathclaw_roar
	name = "Deathclaw's Roar"
	desc = "Makes you do a pretty big scream"
	cooldown_time = 5 SECONDS
	click_to_activate = FALSE

/datum/action/cooldown/mob_cooldown/deathclaw_roar/Activate(atom/target_atom)
	StartCooldown(5 SECONDS)
	roar()
	StartCooldown()

/datum/action/cooldown/mob_cooldown/deathclaw_roar/proc/roar()
	var/mob/living/living_owner = owner
	living_owner.SetStun(1.5 SECONDS, ignore_canstun = TRUE)
	playsound(owner, 'sound/creatures/space_dragon_roar.ogg', 100, TRUE, -1)
	owner.visible_message(span_colossus("Run."))
	for(var/turf/affected_tile in range(7, living_owner)) //everything in the 2x3 block is found.
		affected_tile.Shake(4, 4, 2 SECONDS)
		for(var/i in affected_tile)
			var/atom/movable/affected = i
			if(ismob(affected) && affected != owner)
				var/mob/mob_affected = affected
				shake_camera(mob_affected, 7, 1)
			if(!ishuman(affected) && !istype(affected, /obj/item))
				affected.Shake(4, 4, 2 SECONDS)
				continue

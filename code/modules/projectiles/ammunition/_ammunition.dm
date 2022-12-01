#define EARTH_GRAVITY 9.80665 //In meter / second^2

/obj/item/ammo_casing
	name = "bullet casing"
	desc = "A bullet casing."
	icon = 'icons/obj/guns/ammo.dmi'
	icon_state = "s-casing"
	worn_icon_state = "bullet"
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	custom_materials = list(/datum/material/iron = 500)
	override_notes = TRUE
	///What sound should play when this ammo is fired
	var/fire_sound = null
	///Which kind of guns it can be loaded into
	var/caliber = null
	///The bullet type to create when New() is called
	var/projectile_type = null
	///the loaded projectile in this ammo casing
	var/obj/projectile/loaded_projectile = null
	///Pellets for spreadshot
	var/pellets = 1
	///Variance for inaccuracy fundamental to the casing
	var/variance = 0
	///Randomspread for automatics
	var/randomspread = 0
	///Delay for energy weapons
	var/delay = 0
	///Override this to make your gun have a faster fire rate, in tenths of a second. 4 is the default gun cooldown.
	var/click_cooldown_override = 0
	///the visual effect appearing when the ammo is fired.
	var/firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect
	var/heavy_metal = TRUE
	///pacifism check for boolet, set to FALSE if bullet is non-lethal
	var/harmful = TRUE

	animate_movement = NO_STEPS //No need for this. We're moving that ball for real.

	var/putting = FALSE //is someone lining up a shot?
	var/moving = FALSE //is the ball in motion

	var/putt_vel = 0 //strength of the lined up shot
	var/putt_angle = 0 //angle of the lined up shot

	//location on a 32x32 grid.
	var/ball_x = 16
	var/ball_y = 16
	var/ball_z = 0 //Current ball z; floor is the minimum it can go to
	var/ball_z_floor = 0 //Ideally somewhere between 0 and -16


	//x and y velocity
	var/vel_x = 0
	var/vel_y = 0
	var/vel_z = 0

	var/ball_angle = 0 //should be between 0 and 360. 0 is considered East, and it increments counter-clockwise.
	var/ball_velocity = 0 //the velocity of the ball, before converting to x and y velocity.

	var/friction = 0.5 //how much x/y velocity is lost every update

/obj/item/ammo_casing/proc/start_movement()
	//START_PROCESSING(SSprojectiles, src) //this will be moved to a seperate subsystem when I make that.
	moving = TRUE

/obj/item/ammo_casing/proc/end_movement()
	//STOP_PROCESSING(SSprojectiles, src)
	moving = FALSE

/obj/item/ammo_casing/spent
	name = "spent bullet casing"
	loaded_projectile = null

/obj/item/ammo_casing/Initialize(mapload)
	. = ..()
	if(projectile_type)
		loaded_projectile = new projectile_type(src)
	//pixel_x = base_pixel_x + rand(-10, 10)
	//pixel_y = base_pixel_y + rand(-10, 10)
	item_flags |= NO_PIXEL_RANDOM_DROP
	setDir(pick(GLOB.alldirs))
	update_appearance()

/obj/item/ammo_casing/Destroy()
	var/turf/T = get_turf(src)
	if(T && !loaded_projectile && is_station_level(T.z))
		SSblackbox.record_feedback("tally", "station_mess_destroyed", 1, name)
	QDEL_NULL(loaded_projectile)
	return ..()

/*/obj/item/ammo_casing/add_weapon_description()
	AddElement(/datum/element/weapon_description, attached_proc = .proc/add_notes_ammo) //MOJAVE EDIT - Comments out this proc because weapon_description in general is commented out.

/**
 *
 * Outputs type-specific weapon stats for ammunition based on the projectile loaded inside the casing.
 * Distinguishes between critting and stam-critting in separate lines
 *
 */
/obj/item/ammo_casing/proc/add_notes_ammo()
	// Try to get a projectile to derive stats from
	var/obj/projectile/exam_proj = projectile_type
	if(!ispath(exam_proj) || pellets == 0)
		return

	var/list/readout = list()
	// No dividing by 0
	if(initial(exam_proj.damage) > 0)
		readout += "Most monkeys our legal team subjected to these [span_warning(caliber)] rounds succumbed to their wounds after [span_warning("[HITS_TO_CRIT(initial(exam_proj.damage) * pellets)] shot\s")] at point-blank, taking [span_warning("[pellets] shot\s")] per round"
	if(initial(exam_proj.stamina) > 0)
		readout += "[!readout.len ? "Most monkeys" : "More fortunate monkeys"] collapsed from exhaustion after [span_warning("[HITS_TO_CRIT(initial(exam_proj.stamina) * pellets)] impact\s")] of these [span_warning("[caliber]")] rounds"
	if(!readout.len) // Everything else failed, give generic text
		return "Our legal team has determined the offensive nature of these [span_warning(caliber)] rounds to be esoteric"
	return readout.Join("\n") */ // Sending over a single string, rather than the whole list

/obj/item/ammo_casing/update_icon_state()
	icon_state = "[initial(icon_state)][loaded_projectile ? "-live" : null]"
	return ..()

/obj/item/ammo_casing/update_desc()
	desc = "[initial(desc)][loaded_projectile ? null : " This one is spent."]"
	return ..()

/*
 * On accidental consumption, 'spend' the ammo, and add in some gunpowder
 */
/obj/item/ammo_casing/on_accidental_consumption(mob/living/carbon/victim, mob/living/carbon/user, obj/item/source_item,  discover_after = TRUE)
	if(loaded_projectile)
		loaded_projectile = null
		update_appearance()
		victim.reagents?.add_reagent(/datum/reagent/gunpowder, 3)
		source_item?.reagents?.add_reagent(/datum/reagent/gunpowder, source_item.reagents.total_volume*(2/3))

	return ..()

//proc to magically refill a casing with a new projectile
/obj/item/ammo_casing/proc/newshot() //For energy weapons, syringe gun, shotgun shells and wands (!).
	if(!loaded_projectile)
		loaded_projectile = new projectile_type(src, src)

/obj/item/ammo_casing/attackby(obj/item/I, mob/user, params)
	//MOJAVE EDIT BEGIN
	if(istype(I, /obj/item/ammo_box/magazine/ammo_stack))
		var/obj/item/ammo_box/magazine/ammo_stack = I
		if(isturf(loc))
			var/boolets = 0
			for(var/obj/item/ammo_casing/bullet in loc)
				if(bullet == src)
					continue
				if(!bullet.loaded_projectile)
					continue
				if(length(ammo_stack.stored_ammo) >= ammo_stack.max_ammo)
					break
				if(ammo_stack.give_round(bullet, FALSE))
					boolets++
					break
			if((boolets <= 0) && loaded_projectile && !(length(ammo_stack.stored_ammo) >= ammo_stack.max_ammo))
				if(ammo_stack.give_round(src, FALSE))
					boolets++
			if(boolets > 0)
				ammo_stack.update_appearance()
				to_chat(user, span_notice("You collect [boolets] shell\s. [ammo_stack] now contains [length(ammo_stack.stored_ammo)] shell\s."))
			else
				to_chat(user, span_warning("You fail to collect anything!"))
		return ..()
	/*if(istype(I, /obj/item/ammo_box)) //No gaming
		var/obj/item/ammo_box/box = I
		if(isturf(loc))
			var/boolets = 0
			for(var/obj/item/ammo_casing/bullet in loc)
				if (box.stored_ammo.len >= box.max_ammo)
					break
				if (bullet.loaded_projectile)
					if (box.give_round(bullet, 0))
						boolets++
				else
					continue
			if (boolets > 0)
				box.update_appearance()
				to_chat(user, span_notice("You collect [boolets] shell\s. [box] now contains [box.stored_ammo.len] shell\s."))
			else
				to_chat(user, span_warning("You fail to collect anything!"))*/
	//MOJAVE EDIT END
	else
		return ..()

/obj/item/ammo_casing/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	//bounce_away(FALSE, NONE)
	pixel_z = 8
	AddElement(/datum/element/object_physics, _horizontal_velocity = rand(4.5, 5.5), _vertical_velocity = rand(3, 4), _horizontal_friction = 0.25, _z_gravity = 9.80665, _z_floor = rand(0, 16), _angle_of_movement = get_angle(src, throwingdatum.target_turf))
	return ..()

/// BALL MOVEMENT ///
/obj/item/ammo_casing/proc/bounce(bounce_angle)
	ball_angle = ((180 - bounce_angle) - ball_angle)
	if(ball_angle < 0)
		ball_angle += 360

	//velocity loss for collision. might need to adjust this number. (maybe scaled based on current velocity??)
	ball_velocity -= 1
	var/turf/a_turf = get_turf(src)
	playsound(src, a_turf.bullet_bounce_sound, 50, TRUE)

/obj/item/ammo_casing/proc/fix_angle(angle)//fixes an angle below 0 or above 360
	if(!(angle > 360) && !(angle < 0))
		return angle //early return if it doesn't need to change
	var/new_angle
	if(angle > 360)
		new_angle = angle - 360
	if(angle < 0)
		new_angle = angle + 360
	return new_angle

/obj/item/ammo_casing/process(delta_time)
	ball_angle = fix_angle(ball_angle)
	if(ball_velocity <= 0 && ball_z == 0)
		ball_velocity = 0
		end_movement()

	vel_x = (ball_velocity * (cos(ball_angle)))
	vel_y = (ball_velocity * (sin(ball_angle)))

	ball_velocity = max(0, ball_velocity - friction)

	ball_x += vel_x
	ball_y += vel_y

	ball_z = max(ball_z_floor, ball_z + vel_z)
	if(ball_z > ball_z_floor)
		vel_z -= (EARTH_GRAVITY * 0.1)

	if(ball_z == ball_z_floor && (vel_z < 0)) //bounce time
		actual_bounce(null, null, null, null)
		vel_z = max(0, ((vel_z * 0.8) * -1) - 0.8)

	if(ball_x > 32)
		if(Move(get_step(src, EAST)))
			ball_x = 0
		else
			ball_x = 32
			bounce(0)
	if(ball_x < 0)
		if(Move(get_step(src, WEST)))
			ball_x = 32
		else
			ball_x = 0
			bounce(0)

	if(ball_y > 32)
		if(Move(get_step(src, NORTH)))
			ball_y = 0
		else
			ball_y = 32
			bounce(180)
	if(ball_y < 0)
		if(Move(get_step(src, SOUTH)))
			ball_y = 32
		else
			ball_y = 0
			bounce(180)

	//change the pixel offset of the ball so that we can see it "move"
	pixel_x = (ball_x - 16)
	pixel_y = (ball_y - 16)
	pixel_z = (ball_z)

/obj/item/ammo_casing/proc/bounce_away(still_warm = FALSE, bounce_delay = 3, mob/shooter)
	if(!heavy_metal)
		return
	update_appearance()

	ball_velocity = rand(6.5, 7.5)
	vel_z = rand(3, 4)
	ball_z = 8
	ball_z_floor = rand(0, -16)
	ball_angle = rand(-20, 20)
	start_movement()

	SpinAnimation(speed = 2.0 SECONDS, loops = 1, parallel = TRUE)
	var/turf/T = get_turf(src)
	if(still_warm && T?.bullet_sizzle)
		addtimer(CALLBACK(GLOBAL_PROC, .proc/playsound, src, 'sound/items/welder.ogg', 10, 1), bounce_delay) //If the turf is made of water and the shell casing is still hot, make a sizzling sound when it's ejected.
	//else if(T?.bullet_bounce_sound)
	//	addtimer(CALLBACK(GLOBAL_PROC, .proc/playsound, src, T.bullet_bounce_sound, 20, 1), 0.3 SECONDS) //Soft / non-solid turfs that shouldn't make a sound when a shell casing is ejected over them.
	//	addtimer(CALLBACK(GLOBAL_PROC, .proc/playsound, src, T.bullet_bounce_sound, 20, 1), 0.6 SECONDS) //Soft / non-solid turfs that shouldn't make a sound when a shell casing is ejected over them.
	//	addtimer(CALLBACK(GLOBAL_PROC, .proc/playsound, src, T.bullet_bounce_sound, 20, 1), 0.9 SECONDS) //Soft / non-solid turfs that shouldn't make a sound when a shell casing is ejected over them.
	var/new_x = 0
	var/new_y = 0
	for(var/bounce_num = 0, bounce_num != 9, bounce_num += 3)
		//animate(src, pixel_x = pixel_x + rand(-12, 12), pixel_y = pixel_y + rand(-12, 12), time = 1 SECONDS, flags = ANIMATION_PARALLEL)
		//addtimer(CALLBACK(src, .proc/actual_bounce, shooter, new_x, new_y, bounce_num), bounce_num)
		//addtimer(CALLBACK(src, .proc/gravity_exists, new_y), bounce_num + 0.15 SECONDS)
		new_x += rand(-6, 18)
		new_y += rand(36, 12)
		//animate(src, pixel_x = pixel_x + rand(-18, 54), pixel_y = pixel_y + rand(108, 36), time = 1.5 SECONDS, easing = BOUNCE_EASING, flags = ANIMATION_PARALLEL)

/obj/item/ammo_casing/proc/actual_bounce(mob/shooter, new_x, new_y, bounce_num)

	ball_angle += rand(-20, 20)
	ball_velocity += max(0, (vel_z * -1) / 2)
	var/turf/a_turf = get_turf(src)
	playsound(src, a_turf.bullet_bounce_sound, 50, TRUE)
	//animate(src, pixel_y = rand(16, 32), time = 0.15 SECONDS, flags = ANIMATION_PARALLEL)

	//if(bounce_num == 6)
		//SpinAnimation(speed = 0.5 SECONDS, loops = 2, parallel = TRUE)
		//animate(src, pixel_x = new_x, pixel_y = new_y, time = 0.9 SECONDS, easing = SINE_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)
	//else
		//SpinAnimation(speed = 0.1 SECONDS, loops = 3, parallel = TRUE)
		//animate(src, pixel_x = new_x, pixel_y = new_y, time = 0.3 SECONDS, easing = LINEAR_EASING, flags = ANIMATION_PARALLEL)


	//var/list/possible_dirs = GLOB.cardinals.Copy()
	//possible_dirs -= turn(shooter.dir, -90) //RIP left handed users
	//var/chosen_dir = pick(possible_dirs)
	//var/target_turf = get_step_away(get_turf(src), chosen_dir, 1)

/obj/item/ammo_casing/proc/gravity_exists(new_y)
	//animate(src, pixel_y = base_pixel_y, time = 0.15 SECONDS, flags = ANIMATION_PARALLEL)

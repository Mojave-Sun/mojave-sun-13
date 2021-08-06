/////////////////////////////////////////////////////////////
////////////// MOJAVE SUN OBSTACLES DIRECTORY ///////////////
/////////////////////////////////////////////////////////////

//IE. Structures which are limpid but impassable, to serve more of a decorative and tactical purpose.//

/*
//Transparent ruins - more of a decal than structure, to function as decoration over the turf so that you can see base turf under it.
/obj/structure/ruins
	name = "ruins"
	desc = "Decaying remains of human civilization.<br>On the edge of falling apart, but still standing somehow."
	icon = 'icons/turf/walls.dmi'
	icon_state = "ruinswindowdestroyed"
	density = 1
	anchored = 1
*/

//Metal Bars

/obj/structure/ms13/bars
	name = "metal bars"
	desc = "Sturdy metal bars, if only you had a saw."
	icon = 'mojave/icons/obstacles/bars.dmi'
	icon_state = "bars"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	max_integrity = 500
	armor = list(MELEE = 80, BULLET = 80, LASER = 0, ENERGY = 0, BOMB = 25, BIO = 100, RAD = 100, FIRE = 80, ACID = 100)
	damage_deflection = 40
	CanAtmosPass = ATMOS_PASS_YES
	flags_1 = ON_BORDER_1 | RAD_PROTECT_CONTENTS_1
	var/barpasschance = 33

/obj/structure/ms13/bars/corner
	icon_state = "barscorner"

/obj/structure/ms13/bars/slot
	icon_state = "barsslot"
	barpasschance = 90

/obj/structure/ms13/bars/rusty
	icon_state = "bars_rust"

/obj/structure/ms13/bars/corner/rusty
	icon_state = "barscorner_rust"

/obj/structure/ms13/bars/slot/rusty
	icon_state = "barsslot_rust"

/obj/structure/ms13/bars/corner/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(istype(mover) && (mover.pass_flags & PASSGLASS))
		return TRUE
	if(istype(mover, /obj/projectile))
		return TRUE
	if(istype(mover, /obj/item))
		var/obj/item/I = mover
		if(I.w_class == WEIGHT_CLASS_SMALL)
			return TRUE
	return

/proc/valid_bars_location(turf/T, dir_to_check)
	if(!T)
		return FALSE
	for(var/obj/O in T)
		if(istype(O, /obj/structure/ms13/bars) && (O.dir == dir_to_check || dir_to_check == NORTHEAST))
			return FALSE
	return TRUE

/obj/structure/ms13/bars/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	var/attempted_dir = get_dir(loc, target)
	if(istype(mover, /obj/projectile/bullet))
		return TRUE
	else if(istype(mover, /obj/projectile))
		return TRUE
	else if(istype(mover) && (mover.pass_flags & PASSGLASS))
		return TRUE
	else if(istype(mover, /obj/item))
		var/obj/item/I = mover
		if(I.w_class == WEIGHT_CLASS_SMALL)
			return barpasschance
	else if(istype(mover, /obj/structure/window))
		var/obj/structure/window/W = mover
		if(!valid_bars_location(loc, W.ini_dir))
			return FALSE
	else if(istype(mover, /obj/structure/windoor_assembly))
		var/obj/structure/windoor_assembly/W = mover
		if(!valid_bars_location(loc, W.ini_dir))
			return FALSE
	else if(istype(mover, /obj/structure/ms13/bars) && !valid_bars_location(loc, mover.dir))
		return FALSE
	else if(istype(mover, /mob/))
		if(attempted_dir != dir)
			return TRUE
		else if(attempted_dir == dir)
			return
	else
		return

/obj/structure/ms13/bars/CheckExit(atom/movable/O, turf/target)
	if(istype(O) && (O.pass_flags & PASSGLASS))
		return TRUE
	if(istype(O, /mob/) && get_dir(O.loc, target) == dir)
		return FALSE
	return TRUE

/obj/structure/ms13/celldoor
	name = "cell door"
	desc = "Better hope you arent rotting on the wrong side slick."
	icon = 'mojave/icons/obstacles/bars.dmi'
	icon_state = "door"
	density = TRUE
	anchored = TRUE
	opacity = FALSE
	layer = ABOVE_MOB_LAYER
	max_integrity = 500
	armor = list(MELEE = 80, BULLET = 80, LASER = 0, ENERGY = 0, BOMB = 25, BIO = 100, RAD = 100, FIRE = 80, ACID = 100)
	damage_deflection = 40
	flags_1 = RAD_PROTECT_CONTENTS_1 | RAD_NO_CONTAMINATE_1
	var/locked = FALSE

	var/door_opened = FALSE //if it's open or not.
	var/isSwitchingStates = FALSE //don't try to change stats if we're already opening

	var/close_delay = -1 //-1 if does not auto close.
	var/openSound = 'mojave/sound/ms13effects/cellopen.ogg'
	var/closeSound = 'mojave/sound/ms13effects/cellclose.ogg'

/obj/structure/ms13/celldoor/locked
	locked = TRUE

/obj/structure/ms13/celldoor/rusty
	icon_state = "door_rust"

/obj/structure/ms13/celldoor/locked/rusty
	icon_state = "door_rust"

/obj/structure/ms13/celldoor/Initialize()
	. = ..()
	air_update_turf(TRUE)

/obj/structure/ms13/celldoor/Move()
	var/turf/T = loc
	. = ..()
	move_update_air(T)

/obj/structure/ms13/celldoor/attack_ai(mob/user)
	if(isAI(user))
		return
	else if(iscyborg(user))
		if(get_dist(user,src) <= 1)
			return TryToSwitchState(user)

/obj/structure/ms13/celldoor/attack_paw(mob/user)
	return attack_hand(user)

/obj/structure/ms13/celldoor/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	return TryToSwitchState(user)

/obj/structure/ms13/celldoor/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(istype(mover, /obj/projectile))
		return TRUE
	else if(istype(mover, /obj/item)) //allows a chance to throw small things through, grenades, tools etc.
		var/obj/item/I = mover
		if(I.w_class == WEIGHT_CLASS_SMALL)
			return TRUE
	else
		return

/obj/structure/ms13/celldoor/proc/TryToSwitchState(atom/user)
	if(isSwitchingStates || !anchored)
		return
	if(!locked)
		if(isliving(user))
			var/mob/living/M = user
			if(world.time - M.last_bumped <= 60)
				return //NOTE do we really need that?
			if(M.client)
				if(iscarbon(M))
					var/mob/living/carbon/C = M
					if(!C.handcuffed)
						SwitchState()
				else
					SwitchState()
		else if(ismecha(user))
			SwitchState()
	else
		return

/obj/structure/ms13/celldoor/proc/SwitchState()
	if(door_opened)
		Close()
	else
		Open()

/obj/structure/ms13/celldoor/proc/Open()
	isSwitchingStates = TRUE
	playsound(src, openSound, 100, TRUE)
	set_opacity(FALSE)
	flick("[initial(icon_state)]opening",src)
	sleep(9.4)
	density = FALSE
	door_opened = TRUE
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE

	if(close_delay != -1)
		addtimer(CALLBACK(src, .proc/Close), close_delay)

/obj/structure/ms13/celldoor/proc/Close()
	if(isSwitchingStates || !door_opened)
		return
	var/turf/T = get_turf(src)
	for(var/mob/living/L in T)
		return
	isSwitchingStates = TRUE
	playsound(src, closeSound, 100, TRUE)
	flick("[initial(icon_state)]closing",src)
	sleep(9.4)
	density = TRUE
	set_opacity(FALSE)
	door_opened = FALSE
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE

/obj/structure/ms13/celldoor/update_icon_state()
	icon_state = "[initial(icon_state)][door_opened ? "open":""]"

/obj/structure/ms13/celldoor/attackby(obj/item/I, mob/living/user)
	if(!user.combat_mode)
		return attack_hand(user)
	else
		return ..()

/obj/structure/ms13/celldoor/set_anchored(anchorvalue) //called in default_unfasten_wrench() chain
	. = ..()
	air_update_turf(TRUE)

//Road Barriers

/obj/structure/ms13/road_barrier
	name = "road barrier"
	desc = "A light and portable road barrier, used to direct traffic and stop people from going to dead ends."
	icon = 'mojave/icons/obstacles/barriers.dmi'
	icon_state = "road_barrier"
	density = TRUE
	anchored = FALSE
	max_integrity = 150
	var/hasaltstates = FALSE
	var/altstates = 0
	var/proj_pass_rate = 85

/obj/structure/ms13/road_barrier/Initialize()
	. = ..()
	if(!hasaltstates)
		return

	if(prob(45))
		icon_state = "[initial(icon_state)]_[rand(1,(altstates))]"

/obj/structure/ms13/road_barrier/concrete
	desc = "A heavy duty concrete road barrier, used to direct traffic and prevent going off the lane. Great to take cover behind."
	icon_state = "concrete_barrier"
	anchored = TRUE
	hasaltstates = TRUE
	max_integrity = 550
	altstates = 5
	proj_pass_rate = 45

/obj/structure/ms13/road_barrier/concrete/Initialize()
	. = ..()
	AddElement(/datum/element/climbable)

/obj/structure/ms13/road_barrier/concrete/alt
	desc = "A heavy duty concrete road barrier featuring a pattern that to this day is still somewhat vibrant. Used to direct traffic and prevent going off the lane."
	icon_state = "concrete_barrier_alt"
	altstates = 1

/obj/structure/ms13/road_barrier/concrete/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(locate(/obj/structure/ms13/road_barrier/concrete) in get_turf(mover))
		return TRUE
	else if(istype(mover, /obj/projectile))
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob(proj_pass_rate))
			return TRUE
		return FALSE

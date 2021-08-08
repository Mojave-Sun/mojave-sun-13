/////////////////////////////////////////////////////////////
////////////// MOJAVE SUN OBSTACLES DIRECTORY ///////////////
/////////////////////////////////////////////////////////////

//IE. Structures which are limpid but impassable, to serve more of a decorative and tactical purpose.//

//Metal Bars
/* re-add later   super broke right now
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
		if(istype(O, /obj/structure/ms13/bars) && (O.dir == dir_to_check || dir_to_check == FULLTILE_WINDOW_DIR))
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

/obj/structure/ms13/celldoor/attackby(obj/item/I, mob/user)
	if(user.a_intent != INTENT_HARM)
		return attack_hand(user)
	else
		return ..()

/obj/structure/ms13/celldoor/set_anchored(anchorvalue) //called in default_unfasten_wrench() chain
	. = ..()
	air_update_turf(TRUE)

//Metal fence
/obj/structure/fence/fencenormal
	name = "metal fence"
	desc = "You see nothing out of the ordinary."
	icon = 'mojave/icons/obstacles/obstacles.dmi'
	icon_state = "normal_fence"
	density = 1
	anchored = 1

/obj/structure/fence/fencenormal/Initialize()
	. = ..()
	layer = 4.2

/obj/structure/fence/fencenormal/CanPass(atom/movable/mover, turf/target, height=0)
	..()
	if (!density)
		return 1
	if (dir!=SOUTH)
		return 0
	if(istype(mover) && (mover.pass_flags & PASSGRILLE))
		return 1
	if(get_dir(loc, target) != SOUTH)
		return 1
	else
		return 0

/obj/structure/fence/fencenormal/CheckExit(atom/movable/O as mob|obj, target)
	if (!density)
		return 1
	if (dir!=SOUTH)
		return 0
	if(istype(O) && (O.pass_flags & PASSGRILLE))
		return 1
	if(get_dir(O.loc, target) != SOUTH)
		return 1
	else
		return 0

/obj/structure/fence/fencenormal/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/wirecutters))
		if(do_after(user,50, target = src))
			playsound(loc, 'sound/items/Wirecutter.ogg', 100, 1)
			user.visible_message("<span class='notice'>[user] cuts a hole in the fence.</span>", \
								 "<span class='notice'>You cut a hole in the fence.</span>")
			density = 0
			icon_state = "cut_fence"
			desc = "You have no idea what could make that hole..."


/obj/structure/fence/fencecorner
	name = "metal fence"
	desc = "It's still pretty sturdy.<br>You see nothing out of the ordinary."
	icon = 'mojave/icons/obstacles/obstacles.dmi'
	icon_state = "fence_corner"
	density = 1
	anchored = 1

/obj/structure/fence/fencecorner/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/wirecutters))
		user << "<span class='warning'>Even if I cut through here, I'll get hurt if I try to get through.<br>Let's find some better options.</span>"

/obj/structure/fence/fenceintersectmiddle
	name = "metal fence"
	desc = "Intersection of the fence.<br>You see nothing out of the ordinary."
	icon = 'mojave/icons/obstacles/obstacles.dmi'
	icon_state = "fence_intersect_middle"
	density = 1
	anchored = 1

/obj/structure/fence/fenceintersectmiddle/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/wirecutters))
		user << "<span class='warning'>It's not the best place to cut the fence.<br>I got to find better options.</span>"

/obj/structure/fence/fenceintersectbottom
	name = "metal fence"
	desc = "Intersection of the fence.<br>You see nothing out of the ordinary."
	icon = 'mojave/icons/obstacles/obstacles.dmi'
	icon_state = "fence_intersect_bottom"
	density = 1
	anchored = 1

/obj/structure/fence/fenceintersectbottom/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/wirecutters))
		user << "<span class='warning'>The fence here is too strong - it wouldn't cut!<br>Maybe there's a better spot to try again.</span>"

/obj/structure/fence/fencecornerintersect
	name = "metal fence"
	desc = "Intersection of the fence.<br>You see nothing out of the ordinary."
	icon = 'mojave/icons/obstacles/obstacles.dmi'
	icon_state = "fence_intersect_corner"
	density = 1
	anchored = 1

/obj/structure/fence/fencecornerintersect/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/wirecutters))
		user << "<span class='warning'><br>The fence here is too strong - it wouldn't cut!</br>Let's find some better options now.</span>"

/obj/structure/fence/fencedoor
	name = "metal fence door"
	desc = "The hinges are a bit rusty.<br>Who cares, it's just a door anyway."
	icon = 'mojave/icons/obstacles/obstacles.dmi'
	icon_state = "fence_door_front_closed"
	density = 1
	anchored = 1
	var/open_sound = 'mojave/sound/ms13machines/doorchainlink_open.ogg'
	var/close_sound = 'mojave/sound/ms13machines/doorchainlink_close.ogg'

/obj/structure/fence/fencedoor/Initialize()
	. = ..()
	layer = 4.2

/obj/structure/fence/fencedoor/attackby(obj/item/I, mob/living/user, params)
	if (density)
		icon_state = "fence_door_front_open"
		playsound(src.loc, open_sound, 40, 0, 0)
	else
		icon_state = "fence_door_front_closed"
		playsound(src.loc, close_sound, 40, 0, 0)
	density = !density

/obj/structure/fence/fencedoor/attack_hand(mob/user)
	if (density)
		icon_state = "fence_door_front_open"
		playsound(src.loc, open_sound, 40, 0, 0)
	else
		icon_state = "fence_door_front_closed"
		playsound(src.loc, close_sound, 40, 0, 0)
	density = !density

/obj/structure/fence/fencedoor/attack_tk(mob/user)
	if (density)
		icon_state = "fence_door_front_open"
		playsound(src.loc, open_sound, 40, 0, 0)
	else
		icon_state = "fence_door_front_closed"
		playsound(src.loc, close_sound, 40, 0, 0)
	density = !density

/obj/structure/fence/fencedoor/CanPass(atom/movable/mover, turf/target, height=0)
	..()
	if (!density)
		return 1
	if(istype(mover) && (mover.pass_flags & PASSGRILLE))
		return 1
	if(get_dir(loc, target) != SOUTH)
		return 1
	else
		return 0

/obj/structure/fence/fencedoor/CheckExit(atom/movable/O as mob|obj, target)
	if (!density)
		return 1

	if(istype(O) && (O.pass_flags & PASSGRILLE))
		return 1
	if(get_dir(O.loc, target) != SOUTH)
		return 1
	else
		return 0

/obj/structure/fence/fencedoorside
	name = "metal fence door"
	desc = "It opens and closes."
	icon = 'mojave/icons/obstacles/obstacles.dmi'
	icon_state = "fence_door_side_closed"
	density = 1
	anchored = 1
	var/open_sound = 'mojave/sound/ms13machines/doorchainlink_open.ogg'
	var/close_sound = 'mojave/sound/ms13machines/doorchainlink_close.ogg'

/obj/structure/fence/fencedoorside/attackby(obj/item/I, mob/living/user, params)
	if (density)
		icon_state = "fence_door_side_open"
		playsound(src.loc, open_sound, 40, 0, 0)
	else
		icon_state = "fence_door_side_closed"
		playsound(src.loc, close_sound, 40, 0, 0)
	density = !density

/obj/structure/fence/fencedoorside/attack_hand(mob/user)
	if (density)
		icon_state = "fence_door_side_open"
		playsound(src.loc, open_sound, 40, 0, 0)
	else
		icon_state = "fence_door_side_closed"
		playsound(src.loc, close_sound, 40, 0, 0)
	density = !density

/obj/structure/fence/fencedoorside/attack_tk(mob/user)
	if (density)
		icon_state = "fence_door_side_open"
		playsound(src.loc, open_sound, 40, 0, 0)
	else
		icon_state = "fence_door_side_closed"
		playsound(src.loc, close_sound, 40, 0, 0)
	density = !density

/obj/structure/fence/fencedoorside/CanPass(atom/movable/mover, turf/target, height=0)
	..()
	if (mover.loc == loc)
		return 1
	return !density

/obj/structure/fence/fencedoorside/CheckExit(atom/movable/O as mob|obj, target)
	if (O.loc == loc)
		return 1
	return !density
 */
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
	var/climbable = FALSE
/obj/structure/ms13/road_barrier/Initialize()
	. = ..()
	if(climbable)
		AddElement(/datum/element/climbable)
	if(!hasaltstates)
		return
	if(prob(45))
		icon_state = "[initial(icon_state)]_[rand(1,(altstates))]"

/obj/structure/ms13/road_barrier/concrete
	desc = "A heavy duty concrete road barrier, used to direct traffic and prevent going off the lane. Great to take cover behind."
	icon_state = "concrete_barrier"
	anchored = TRUE
	hasaltstates = TRUE
	climbable = TRUE
	max_integrity = 550
	altstates = 5
	proj_pass_rate = 45

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

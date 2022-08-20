/////////////////////////////////////////////////////////////
////////////// MOJAVE SUN OBSTACLES DIRECTORY ///////////////
/////////////////////////////////////////////////////////////

//IE. Structures which are limpid but impassable, to serve more of a decorative and tactical purpose.//

//Metal Bars

/obj/structure/ms13/bars
	name = "metal bars"
	desc = "Sturdy metal bars."
	icon = 'mojave/icons/obstacles/tallobstacles.dmi'
	icon_state = "bars"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_OBJ_LAYER
	max_integrity = 650
	damage_deflection = 21 //Basically meant to encompass 20 damage weapons and below
	can_atmos_pass = ATMOS_PASS_YES
	flags_1 = ON_BORDER_1
	var/barpasschance = 33

/obj/structure/ms13/bars/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap_steel(loc, 4)
	qdel(src)

/obj/structure/ms13/bars/attackby(obj/item/W, mob/user, params)
	if(W.tool_behaviour == TOOL_SAW)
		user.show_message(span_notice("You begin sawing through the bars."), MSG_VISUAL)
		if(do_after(user, 45 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
			user.show_message(span_notice("You saw through the bars!"), MSG_VISUAL)
			deconstruct()
			return TRUE

/obj/structure/ms13/bars/welder_act(mob/living/user, obj/item/I)
	if(!I.tool_start_check(user, amount=0))
		return TRUE
	if(I.use_tool(src, user, 20 SECONDS, volume=80))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/ms13/bars/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/ms13/bars/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>saw</b> or <b>welding tool</b> to cut through [src].")

/obj/structure/ms13/bars/corner
	icon_state = "barscorner"
	var/obj/cornersetter //why the hell did they limit border code to one single direction

/obj/structure/ms13/bars/slot
	icon_state = "barsslot"
	barpasschance = 90

/obj/structure/ms13/bars/rusty
	icon_state = "bars_rust"

/obj/structure/ms13/bars/corner/rusty
	icon_state = "barscorner_rust"

/obj/structure/ms13/bars/slot/rusty
	icon_state = "barsslot_rust"

/obj/structure/ms13/bars/Initialize()
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_EXIT = .proc/on_exit,
	)

	if (flags_1 & ON_BORDER_1)
		AddElement(/datum/element/connect_loc, loc_connections)
	switch(dir)
		if(SOUTH)
			layer = ABOVE_WINDOW_LAYER
		if(NORTH)
			layer = OBJ_LAYER

/obj/structure/ms13/bars/corner/Initialize()
	. = ..()
	ghostbar(FALSE)

/obj/structure/ms13/bars/corner/proc/ghostbar(destroyed)
	cornersetter = new /obj/structure/ms13/bars(loc)
	switch(dir)
		if(NORTH)
			cornersetter.dir = WEST
		if(EAST)
			cornersetter.dir = NORTH
		if(SOUTH)
			cornersetter.dir = EAST
		if(WEST)
			cornersetter.dir = SOUTH

	cornersetter.invisibility = INVISIBILITY_ABSTRACT
	if(destroyed)
		qdel(cornersetter)

/obj/structure/ms13/bars/corner/Destroy()
	. = ..()
	ghostbar(TRUE)

/proc/valid_bars_location(turf/dest_turf, test_dir)
	if(!dest_turf)
		return FALSE
	for(var/obj/turf_content in dest_turf)
		if(istype(turf_content, /obj/structure/ms13/bars))
			if((turf_content.dir == test_dir))
				return FALSE
	for(var/obj/turf_content in dest_turf)
		if(istype(turf_content, /obj/structure/ms13/celldoor))
			if((turf_content.dir == test_dir))
				return FALSE
	return TRUE

/obj/structure/ms13/bars/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()

	if(istype(mover, /obj/projectile))
		return TRUE

	if(istype(mover, /obj/projectile/bullet))
		return TRUE

	if(istype(mover, /obj/item))
		var/obj/item/I = mover
		if(I.w_class == WEIGHT_CLASS_SMALL)
			return TRUE

	if(.)
		return

	if(ismob(mover))
		if(get_dir(loc, src) == dir)
			return

	if(border_dir == dir)
		return FALSE

	if(istype(mover, /obj/structure/ms13/bars))
		var/obj/structure/ms13/bars/moved_bars = mover
		return valid_bars_location(loc, moved_bars.dir)

	return TRUE

/obj/structure/ms13/bars/proc/on_exit(datum/source, atom/movable/leaving, direction)
	SIGNAL_HANDLER

	if(istype(leaving, /obj/projectile) && prob(barpasschance))
		return

	if(istype(leaving, /obj/projectile/bullet) && prob(barpasschance))
		return

	if(istype(leaving, /obj/item))
		var/obj/item/I = leaving
		if(I.w_class == WEIGHT_CLASS_SMALL && prob(barpasschance))
			return
		else
			return COMPONENT_ATOM_BLOCK_EXIT

	if(leaving == src)
		return // Let's not block ourselves.

	if (leaving.pass_flags & pass_flags_self)
		return

	if(direction == dir && density)
		leaving.Bump(src)
		return COMPONENT_ATOM_BLOCK_EXIT

/obj/structure/ms13/celldoor
	name = "cell door"
	desc = "Better hope you aren't rotting on the wrong side, slick."
	icon = 'mojave/icons/obstacles/tallobstacles.dmi'
	icon_state = "door"
	density = TRUE
	anchored = TRUE
	opacity = FALSE
	layer = ABOVE_MOB_LAYER
	max_integrity = 650
	damage_deflection = 21 //Basically meant to encompass 20 damage weapons and below
	flags_1 = ON_BORDER_1
	var/locked = FALSE

	var/door_opened = FALSE //if it's open or not.
	var/isSwitchingStates = FALSE //don't try to change stats if we're already opening

	var/close_delay = -1 //-1 if does not auto close.
	var/openSound = 'mojave/sound/ms13effects/cellopen.ogg'
	var/closeSound = 'mojave/sound/ms13effects/cellclose.ogg'

	var/barpasschance = 33

/obj/structure/ms13/celldoor/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap_steel(loc, 4)
	qdel(src)

/obj/structure/ms13/celldoor/locked
	locked = TRUE

/obj/structure/ms13/celldoor/rusty
	icon_state = "door_rust"

/obj/structure/ms13/celldoor/locked/rusty
	icon_state = "door_rust"

/obj/structure/ms13/celldoor/Initialize()
	. = ..()
	air_update_turf(TRUE)
	var/static/list/loc_connections = list(
		COMSIG_ATOM_EXIT = .proc/on_exit,
	)

	if (flags_1 & ON_BORDER_1)
		AddElement(/datum/element/connect_loc, loc_connections)

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

/obj/structure/ms13/celldoor/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()

	if(istype(mover, /obj/projectile))
		return TRUE

	if(istype(mover, /obj/projectile/bullet))
		return TRUE

	if(istype(mover, /obj/item))
		var/obj/item/I = mover
		if(I.w_class == WEIGHT_CLASS_SMALL && prob(barpasschance))
			return TRUE
		else
			return

	if(.)
		return

	if(ismob(mover))
		if(get_dir(loc, src) == dir)
			return

	if(border_dir == dir)
		return FALSE

	if(istype(mover, /obj/item))
		var/obj/item/I = mover
		if(I.w_class == WEIGHT_CLASS_SMALL && prob(barpasschance))
			return TRUE
		else
			return

	if(istype(mover, /obj/structure/ms13/celldoor))
		var/obj/structure/ms13/celldoor/moved_bars = mover
		return valid_bars_location(loc, moved_bars.dir)

	return TRUE


/obj/structure/ms13/celldoor/proc/on_exit(datum/source, atom/movable/leaving, direction)
	SIGNAL_HANDLER

	if(istype(leaving, /obj/projectile) && prob(barpasschance))
		return

	if(istype(leaving, /obj/projectile/bullet) && prob(barpasschance))
		return

	if(istype(leaving, /obj/item))
		var/obj/item/I = leaving
		if(I.w_class == WEIGHT_CLASS_SMALL && prob(barpasschance))
			return
		else
			return COMPONENT_ATOM_BLOCK_EXIT

	if(leaving == src)
		return // Let's not block ourselves.

	if (leaving.pass_flags & pass_flags_self)
		return

	if(direction == dir && density)
		leaving.Bump(src)
		return COMPONENT_ATOM_BLOCK_EXIT

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
	. = ..()
	icon_state = "[initial(icon_state)][door_opened ? "open":""]"

/obj/structure/ms13/celldoor/set_anchored(anchorvalue) //called in default_unfasten_wrench() chain
	. = ..()
	air_update_turf(TRUE)

//Metal fence
//HOLY fuck this shitcode needs culling
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
		return 0
	else
		return 1

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
		return 0
	else
		return 1

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

// Railings //

/obj/structure/railing/ms13
	name = "base state MS13 guard rail"
	icon = 'mojave/icons/structure/railings.dmi'
	plane = WALL_PLANE
	layer = CLOSED_TURF_LAYER
	max_integrity = 150
	climbable = FALSE //so we can override TG

/obj/structure/railing/ms13/Initialize()
	. = ..()
	if(dir == SOUTH)
		layer = ABOVE_ALL_MOB_LAYER
	if(dir == NORTH)
		layer = ABOVE_ALL_MOB_LAYER

	AddElement(/datum/element/climbable, climb_time = 3 SECONDS, climb_stun = 0, no_stun = TRUE, jump_over = TRUE, jump_north = 12, jump_south = 17, jump_sides = 12)

/obj/structure/railing/ms13/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap(loc)
	qdel(src)

/obj/structure/railing/ms13/solo
	name = "guard rail"
	desc = "A sturdy rail setup with multiple functions, including but not limited to: ensuring you dont fly off the top of a four story tall building"
	icon_state = "civ_solo"

/obj/structure/railing/ms13/solo/industrial
	desc = "A sturdy rail setup with multiple functions, including but not limited to: ensuring you dont fly off the top of a four story tall building. It's got a slick orange taint, so you know it's to workplace regulations."
	icon_state = "indus_solo"

/obj/structure/railing/ms13/sewer
	name = "guard rail"
	desc = "A rusty guard rail used to prevent you from falling into the region's sewage. Thank the lord it's there."
	icon_state = "railings_sewer"

// Fences. Huzzah! //
/obj/structure/railing/ms13/wood
	name = "wooden fence"
	desc = "A classic wooden fence. It doesn't get more homely than this."
	icon_state = "wood_full"

/obj/structure/railing/ms13/wood/Initialize()
	. = ..()
	register_context()

/obj/structure/railing/ms13/wood/crowbar_act_secondary(mob/living/user, obj/item/tool)
	if(flags_1&NODECONSTRUCT_1)
		return TRUE
	..()
	user.visible_message("<span class='notice'>[user] starts to break \the [src].</span>", \
		"<span class='notice'>You start to break \the [src].</span>", \
		"<span class='hear'>You hear splitting wood.</span>")
	tool.play_tool_sound(src)
	if(do_after(user, 10 SECONDS * tool.toolspeed, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		playsound(src.loc, 'mojave/sound/ms13effects/wood_deconstruction.ogg', 50, TRUE)
		user.visible_message("<span class='notice'>[user] pries \the [src] into pieces.</span>", \
			"<span class='notice'>You pry \the [src] into pieces.</span>", \
			"<span class='hear'>You hear splitting wood.</span>")
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/railing/ms13/wood/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/plank(loc, 3)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 2)
		else
			new /obj/item/stack/sheet/ms13/scrap_wood(loc, 2)
	qdel(src)

/obj/structure/railing/ms13/wood/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/railing/ms13/wood/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>crowbar</b> or similar prying tool to dismantle [src] for planks and parts.")

/obj/structure/railing/ms13/wood/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_CROWBAR)
			context[SCREENTIP_CONTEXT_RMB] = "Dismantle"
			return CONTEXTUAL_SCREENTIP_SET

/obj/structure/railing/ms13/wood/ending
	icon_state = "wood_end"

/obj/structure/railing/ms13/wood/single
	icon_state = "wood_solo"

/obj/structure/railing/ms13/wood/snow
	name = "wooden fence"
	desc = "A classic wooden fence. It doesn't get more homely than this."
	icon_state = "wood_snow_full"

/obj/structure/railing/ms13/wood/snow/ending
	icon_state = "wood_snow_end"

/obj/structure/railing/ms13/wood/snow/single
	icon_state = "wood_snow_solo"

// Wood Barricade //

/obj/structure/ms13/barricade
	name = "wooden barricade"
	desc = "A semi-sturdy improvised wooden defense."
	icon = 'mojave/icons/obstacles/tallobstacles.dmi'
	icon_state = "barricade"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_OBJ_LAYER
	max_integrity = 120
	flags_1 = ON_BORDER_1
	var/barpasschance = 20

/obj/structure/ms13/barricade/crowbar_act_secondary(mob/living/user, obj/item/tool)
	if(flags_1&NODECONSTRUCT_1)
		return TRUE
	..()
	user.visible_message("<span class='notice'>[user] starts to break \the [src].</span>", \
		"<span class='notice'>You start to break \the [src].</span>", \
		"<span class='hear'>You hear splitting wood.</span>")
	tool.play_tool_sound(src)
	if(do_after(user, 6 SECONDS * tool.toolspeed, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		playsound(src.loc, 'mojave/sound/ms13effects/wood_deconstruction.ogg', 50, TRUE)
		user.visible_message("<span class='notice'>[user] pries \the [src] into pieces.</span>", \
			"<span class='notice'>You pry \the [src] into pieces.</span>", \
			"<span class='hear'>You hear splitting wood.</span>")
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/ms13/barricade/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/plank(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
		else
			new /obj/item/stack/sheet/ms13/scrap_wood(loc)
	qdel(src)

/obj/structure/ms13/barricade/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/ms13/barricade/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>crowbar</b> or similar prying tool to dismantle [src] for planks and parts.")

/obj/structure/ms13/barricade/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_CROWBAR)
			context[SCREENTIP_CONTEXT_RMB] = "Dismantle"
			return CONTEXTUAL_SCREENTIP_SET

/obj/structure/ms13/barricade/Initialize() //this shit should really be a component
	. = ..()
	register_context()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_EXIT = .proc/on_exit,
	)

	if (flags_1 & ON_BORDER_1)
		AddElement(/datum/element/connect_loc, loc_connections)
	switch(dir)
		if(SOUTH)
			layer = ABOVE_WINDOW_LAYER
		if(NORTH)
			layer = OBJ_LAYER

/proc/valid_barricade_location(turf/dest_turf, test_dir)
	if(!dest_turf)
		return FALSE
	for(var/obj/turf_content in dest_turf)
		if(istype(turf_content, /obj/structure/ms13/barricade))
			if((turf_content.dir == test_dir))
				return FALSE
	return TRUE

/obj/structure/ms13/barricade/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()

	if(istype(mover, /obj/projectile))
		return TRUE

	if(istype(mover, /obj/projectile/bullet))
		return TRUE

	if(istype(mover, /obj/item))
		var/obj/item/I = mover
		if(I.w_class == WEIGHT_CLASS_SMALL)
			return TRUE

	if(.)
		return

	if(ismob(mover))
		if(get_dir(loc, src) == dir)
			return

	if(border_dir == dir)
		return FALSE

	if(istype(mover, /obj/structure/ms13/barricade))
		var/obj/structure/ms13/barricade/moved_bars = mover
		return valid_bars_location(loc, moved_bars.dir)

	return TRUE

/obj/structure/ms13/barricade/proc/on_exit(datum/source, atom/movable/leaving, direction)
	SIGNAL_HANDLER

	if(istype(leaving, /obj/projectile) && prob(barpasschance))
		return

	if(istype(leaving, /obj/projectile/bullet) && prob(barpasschance))
		return

	if(istype(leaving, /obj/item))
		var/obj/item/I = leaving
		if(I.w_class == WEIGHT_CLASS_SMALL && prob(barpasschance))
			return
		else
			return COMPONENT_ATOM_BLOCK_EXIT

	if(leaving == src)
		return // Let's not block ourselves.

	if (leaving.pass_flags & pass_flags_self)
		return

	if(direction == dir && density)
		leaving.Bump(src)
		return COMPONENT_ATOM_BLOCK_EXIT

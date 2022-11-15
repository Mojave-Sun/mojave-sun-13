#define AIRLOCK_CLOSED 1
#define AIRLOCK_CLOSING 2
#define AIRLOCK_OPEN 3
#define AIRLOCK_OPENING 4
#define AIRLOCK_DENY 5
#define AIRLOCK_EMAG 6

/**
 * I'm gonna be real, this has a bunch of shitcode that can probably be improved.
 * Breathing too hard on this will break everything.
 */
/obj/machinery/door/airlock/vault/vault_door
	name = "vault door"
	desc = "A massive door shielding a vault from the disgusting, irradiated outside world. Operated externally."
	icon = 'mojave/icons/objects/airlocks/vault.dmi'
	overlays_file = 'mojave/icons/objects/airlocks/vault_overlays.dmi'
	note_overlay_file = 'mojave/icons/objects/airlocks/vault_overlays.dmi'
	bound_width = 128 //big chungus lol
	assemblytype = null
	id_tag = VAULT_DOOR_TAG
	safe = FALSE
	var/list/atom/movable/opacity_handler/opacity_handlers

/obj/machinery/door/airlock/vault/vault_door/Initialize(mapload)
	. = ..()
	for(var/i in 1 to round(bound_width/world.icon_size-1, 1))
		var/atom/movable/opacity_handler/opacity_handler = new /atom/movable/opacity_handler(mapload, src, i)
		LAZYADD(opacity_handlers, opacity_handler)

/obj/machinery/door/airlock/vault/vault_door/Destroy()
	. = ..()
	// opacity handlers already deal with qdeling themselves byeah
	opacity_handlers = null

/obj/machinery/door/airlock/vault/vault_door/setDir(newdir)
	if(newdir != SOUTH)
		stack_trace("Called setDir() on /obj/machinery/door/airlock/vault/vault_door with an invalid direction!")
		newdir = SOUTH
	return ..()

/obj/machinery/door/airlock/vault/vault_door/CanPass(atom/movable/mover, border_dir)
	. = ..()
	if(!.)
		return
	var/turf/our_turf = get_turf(src)
	//basically we only want to let mover pass if he is going through the open portion of the door, this is very dumb code bro
	if(mover.x != (our_turf.x+1))
		return FALSE
	//this basically means we're inside the vault door, aka we shouldn't move sideways
	else if(border_dir & WEST|EAST)
		return FALSE

//only opened by the funny button thing
/obj/machinery/door/airlock/vault/vault_door/allowed(mob/M)
	return FALSE

//top 10 longest airlock animations of all time
/obj/machinery/door/airlock/vault/vault_door/open_animation()
	update_icon(ALL, AIRLOCK_OPENING, TRUE)
	sleep(27.5)
	var/atom/movable/opacity_handler = LAZYACCESS(opacity_handlers, 1)
	if(opacity_handler)
		opacity_handler.set_opacity(0)
	else
		set_opacity(0)
	update_freelook_sight()
	sleep(12.4)
	set_density(FALSE)
	flags_1 &= ~PREVENT_CLICK_UNDER_1
	air_update_turf(TRUE, FALSE)
	sleep(1)
	layer = OPEN_DOOR_LAYER
	update_icon(ALL, AIRLOCK_OPEN, TRUE)
	operating = FALSE
	if(delayed_close_requested)
		delayed_close_requested = FALSE
		addtimer(CALLBACK(src, .proc/close), 1)

/obj/machinery/door/airlock/vault/vault_door/close_animation(dangerous_close = FALSE)
	update_icon(ALL, AIRLOCK_CLOSING, 1)
	layer = CLOSED_DOOR_LAYER
	if(air_tight)
		set_density(TRUE)
		flags_1 |= PREVENT_CLICK_UNDER_1
		air_update_turf(TRUE, TRUE)
	sleep(25.4)
	if(!air_tight)
		set_density(TRUE)
		flags_1 |= PREVENT_CLICK_UNDER_1
		air_update_turf(TRUE, TRUE)
	sleep(4)
	if(dangerous_close)
		crush()
	if(visible && !glass)
		var/atom/movable/opacity_handler = LAZYACCESS(opacity_handlers, 1)
		if(opacity_handler)
			opacity_handler.set_opacity(1)
		else
			set_opacity(1)
	update_freelook_sight()
	sleep(11.5)
	update_icon(ALL, AIRLOCK_CLOSED, 1)
	operating = FALSE
	delayed_close_requested = FALSE
	if(!dangerous_close)
		CheckForMobs()

/obj/machinery/door/airlock/vault/vault_door/crush()
	for(var/turf/occupied_turf in locs)
		for(var/mob/living/L in occupied_turf)
			L.visible_message(span_warning("[src] closes on [L], crushing [L.p_them()]!"), span_userdanger("[src] closes on you and crushes you!"))
			SEND_SIGNAL(L, COMSIG_LIVING_DOORCRUSHED, src)
			if(isalien(L))  //For xenos
				L.adjustBruteLoss(DOOR_CRUSH_DAMAGE * 1.5) //Xenos go into crit after aproximately the same amount of crushes as humans.
				L.emote("roar")
			else if(ishuman(L)) //For humans
				L.adjustBruteLoss(DOOR_CRUSH_DAMAGE)
				L.emote("scream")
				L.Paralyze(100)
			else //for simple_animals & borgs
				L.adjustBruteLoss(DOOR_CRUSH_DAMAGE)
			//add_blood doesn't work for borgs/xenos, but add_blood_floor does.
			L.add_splatter_floor(occupied_turf)
			log_combat(src, L, "crushed")
		for(var/obj/vehicle/sealed/mecha/M in get_turf(src))
			M.take_damage(DOOR_CRUSH_DAMAGE)
			log_combat(src, M, "crushed")

/obj/machinery/button/door/vault_door
	name = "vault door button"
	desc = "It opens one comically large door!"
	icon = 'mojave/icons/objects/airlocks/vault_console.dmi'
	icon_state = "button"
	base_icon_state = "button"
	skin = "button"
	id = VAULT_DOOR_TAG
	density = TRUE
	normaldoorcontrol = TRUE

#undef AIRLOCK_CLOSED
#undef AIRLOCK_CLOSING
#undef AIRLOCK_OPEN
#undef AIRLOCK_OPENING
#undef AIRLOCK_DENY
#undef AIRLOCK_EMAG

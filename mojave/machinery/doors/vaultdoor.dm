#define AIRLOCK_CLOSED 1
#define AIRLOCK_CLOSING 2
#define AIRLOCK_OPEN 3
#define AIRLOCK_OPENING 4
#define AIRLOCK_DENY 5
#define AIRLOCK_EMAG 6

/**
 * I'm gonna be real, this has a bunch of shitcode that can probably be improved.
 * Breathing too hard on this will break everything. Handle with care.
 */
/obj/machinery/door/airlock/vault/vault_door
	name = "vault door"
	desc = "A massive door shielding a vault from the disgusting, irradiated outside world. Operated externally."
	icon = 'mojave/icons/objects/airlocks/vault.dmi'
	overlays_file = 'mojave/icons/objects/airlocks/vault_overlays.dmi'
	note_overlay_file = 'mojave/icons/objects/airlocks/vault_overlays.dmi'
	bound_width = 32 //big chungus lol
	base_pixel_x = -32
	pixel_x = -32
	assemblytype = null
	id_tag = VAULT_DOOR_TAG
	safe = FALSE
	var/list/atom/movable/follower/opaque_followers

/obj/machinery/door/airlock/vault/vault_door/Initialize(mapload)
	. = ..()
	var/atom/movable/follower/opaque_follower
	for(var/i in list(-1, 1, 2))
		opaque_follower = new /atom/movable/follower(loc, src, i)
		opaque_follower.set_opacity(TRUE)
		opaque_follower.set_density(TRUE)
		LAZYADD(opaque_followers, opaque_follower)

/obj/machinery/door/airlock/vault/vault_door/Destroy()
	. = ..()
	// followers already deal with qdeling themselves proper byeah
	opaque_followers = null

/obj/machinery/door/airlock/vault/vault_door/setDir(newdir)
	if(newdir != SOUTH)
		stack_trace("Called setDir() on /obj/machinery/door/airlock/vault/vault_door with an invalid direction!")
		newdir = SOUTH
	return ..()

//only opened by the funny button thing
/obj/machinery/door/airlock/vault/vault_door/allowed(mob/M)
	return FALSE

//top 10 longest airlock animations of all time
/obj/machinery/door/airlock/vault/vault_door/open_animation()
	update_icon(ALL, AIRLOCK_OPENING, TRUE)
	sleep(27.5)
	set_opacity(FALSE)
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
		set_opacity(TRUE)
	update_freelook_sight()
	sleep(11.5)
	update_icon(ALL, AIRLOCK_CLOSED, 1)
	operating = FALSE
	delayed_close_requested = FALSE
	if(!dangerous_close)
		CheckForMobs()

/obj/machinery/door/airlock/vault/vault_door/crush()
	var/list/occupied_turfs = list()
	occupied_turfs += get_turf(src)
	for(var/atom/density_handler in opaque_followers)
		var/turf/density_handler_turf = get_turf(density_handler)
		if(!density_handler_turf)
			continue
		occupied_turfs += density_handler_turf
	for(var/turf/occupied_turf as anything in occupied_turfs)
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

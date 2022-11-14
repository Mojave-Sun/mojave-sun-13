#define AIRLOCK_CLOSED 1
#define AIRLOCK_CLOSING 2
#define AIRLOCK_OPEN 3
#define AIRLOCK_OPENING 4
#define AIRLOCK_DENY 5
#define AIRLOCK_EMAG 6

/obj/machinery/door/airlock/vault/vault_door
	name = "vault door"
	desc = "A massive door shielding a vault from the disgusting outside world. Operated externally."
	icon = 'mojave/icons/objects/airlocks/vault.dmi'
	overlays_file = 'mojave/icons/objects/airlocks/vault_overlays.dmi'
	note_overlay_file = 'mojave/icons/objects/airlocks/vault_overlays.dmi'
	bound_width = 128 //literally 4 tiles, this fucker is one big chungus alright
	id_tag = VAULT_DOOR_TAG
	safe = FALSE

//top 10 longest airlock animations of all time
/obj/machinery/door/airlock/vault/vault_door/open_animation()
	update_icon(ALL, AIRLOCK_OPENING, TRUE)
	sleep(27.5)
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
		set_opacity(1)
	update_freelook_sight()
	sleep(11.5)
	update_icon(ALL, AIRLOCK_CLOSED, 1)
	operating = FALSE
	delayed_close_requested = FALSE
	if(!dangerous_close)
		CheckForMobs()

/obj/machinery/airlock_sensor/vault_door
	name = "vault door console"
	desc = "It opens one comically large door!"
	icon = 'mojave/icons/objects/airlocks/vault_console.dmi'
	id_tag = VAULT_DOOR_TAG
	master_tag = VAULT_DOOR_CONTROLLER_TAG
	base_icon_state = "console"
	icon_state = "console_off"

/obj/machinery/airlock_sensor/vault_door/update_icon_state()
	. = ..()
	if(!on)
		icon_state = "[base_icon_state]_off"
	else
		icon_state = "[base_icon_state]_on"

#undef AIRLOCK_CLOSED
#undef AIRLOCK_CLOSING
#undef AIRLOCK_OPEN
#undef AIRLOCK_OPENING
#undef AIRLOCK_DENY
#undef AIRLOCK_EMAG

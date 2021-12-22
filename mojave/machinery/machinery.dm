/obj/machinery/ms13
	name = "ms13 machine"
	desc = "You shouldn't be seeing this."

/obj/machinery/door/poddoor/shutters/indestructible/ms13
	name = "shutters"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/door/poddoor/shutters/preopen/ms13/
	name = "shutters"

/obj/machinery/door/poddoor/shutters/preopen/ms13/indestructible
	name = "shutters"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/power/apc/unlocked/ms13
	name = "breaker"
	start_charge = 0

/obj/machinery/power/apc/unlocked/ms13/north
	dir = NORTH
	pixel_y = 23

/obj/machinery/power/apc/unlocked/ms13/south
	dir = SOUTH
	pixel_y = -23

/obj/machinery/power/apc/unlocked/ms13/east
	dir = EAST
	pixel_x = 23

/obj/machinery/power/apc/unlocked/ms13/west
	dir = WEST
	pixel_x = -23

////Fluff Machinery////

/obj/machinery/ms13/wartable
	name = "holo-table"
	desc = "A fancy high tech table, used to project plans up above its surface. Perfect for acting like you're a high ranking man who is very busy."
	icon = 'mojave/icons/structure/64x64_misc.dmi'
	icon_state = "wartable_off"
	layer = HIGH_OBJ_LAYER
	density = 1
	bound_height = 64
	bound_width = 64
	bound_x = 64
	bound_y = 64
	light_color = "#50afee"
	light_range = 4
	light_power = 0.3
	light_on = FALSE
	var/on = FALSE
	var/datum/looping_sound/ms13/holotable/soundloop

/obj/machinery/ms13/wartable/Initialize()
	. = ..()
	soundloop = new(src, on)

/obj/machinery/ms13/wartable/Destroy()
	QDEL_NULL(soundloop)
	return ..()

/obj/machinery/ms13/wartable/attack_hand(mob/living/user)
	. = ..()
	if(user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY)) //Can only actually activate this from the base tile in the bottom left due to the size of it. :Thinking://
		if(on)
			on = FALSE
			icon_state = "wartable_off"
			soundloop.stop()
		else
			on = TRUE
			icon_state = "wartable_on"
			soundloop.start()
		set_light_on(on)
		update_light()

// Intercoms //

/obj/item/radio/intercom/ms13 // Limited use closed in radios. Quirky.
	name = "intercom"
	desc = "A wall mounted intercom. Used to communicate seemlessly through distance in a closed system. Truly gamechanging."
	icon = 'mojave/icons/structure/machinery.dmi'
	icon_state = "intercom"
	pixel_y = 28
	canhear_range = 6
	frequency = 1445.4 // Wack-ass numbers. Ensure these goofballs don't ever reach open air.
	broadcasting = FALSE  // Whether the radio will transmit dialogue it hears nearby.
	freerange = TRUE  // If true, the radio has access to the full spectrum.
	freqlock = TRUE  // Frequency lock to stop the user from untuning specialist radios.
	radio_broadcast = RADIOSTATIC_LIGHT

/obj/item/radio/intercom/ms13/Initialize(mapload)
	. = ..()
	wires = new /datum/wires/radio(src)
	if(prison_radio)
		wires.cut(WIRE_TX) // OH GOD WHY
	secure_radio_connections = new
	for(var/ch_name in channels)
		secure_radio_connections[ch_name] = add_radio(src, GLOB.radiochannels[ch_name])

	become_hearing_sensitive(ROUNDSTART_TRAIT)
	if(dir == SOUTH)
		pixel_y = 28

/obj/item/radio/intercom/ms13/ui_data(mob/user) // These should be set up to be closed off from everything else, and thus will be neutered and set to a set frequency.
	var/list/data = list()
	data["broadcasting"] = broadcasting
	data["listening"] = listening
	return data

// Buttons //

/obj/machinery/button/door/ms13
	name = "button"
	desc = "A remote control switch."
	icon = 'mojave/icons/structure/machinery.dmi'
	icon_state = "button"
	skin = "button"

/obj/machinery/button/ms13/Initialize(mapload)
	. = ..()
	if(dir == SOUTH)
		pixel_y = 28

/obj/machinery/button/attackby(obj/item/W, mob/living/user, params)
	return // no opening these

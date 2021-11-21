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

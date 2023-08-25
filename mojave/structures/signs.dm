/obj/structure/ms13/sign
	name = "Generic MS13 sign"
	desc = "OOOOAAAGHHO OOOHOHHH HELP I DONT WANT TO ADD SHIT ANYMORE IM OVER IT HEEELP-"
	icon = 'mojave/icons/structure/64x64_signs.dmi'
	anchored = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
	max_integrity = 500 // Hardy but not immortal
	var/id = 1 // For toggling states with buttons or terminals. Namely neon signs.
	var/on = FALSE

// This code needs to die. They'll ALL be on FOREVER... until it's made otherwise :/
// /obj/structure/ms13/sign/Initialize(mapload)
// 	. = ..()
// 	GLOB.signs += src
//
// /obj/structure/ms13/sign/proc/on()
// 	set_light(2,2,"#9c476f")
// 	update_overlays()
// 	on = TRUE
//
// /obj/structure/ms13/sign/proc/off()
// 	set_light(0,0,"#000000")
// 	cut_overlays()
// 	on = FALSE
//
// /obj/structure/ms13/sign/update_overlays()
// 	. = ..()
//
//

/obj/structure/ms13/sign/snowcrest
	name = "snowcrest sign"
	desc = "A sign with the name 'Snowcrest'. You're filled with a slightly dreadful feeling."
	icon_state = "snowcrest"
	density = FALSE
	bound_x = 64
	pixel_y = 24

/obj/structure/ms13/sign/bazaar
	name = "bazaar sign"
	desc = "A set of signs clearly directing you to the heart of the Town. Obviously there is many things to be gained in this particular direction."
	icon_state = "bazaar"
	projectile_passchance = 50
	max_integrity = 750
	integrity_failure = 500
	var/datum/looping_sound/ms13/neonsign/soundloop

/obj/structure/ms13/sign/bazaar/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "[icon_state]_on")
	. += emissive_appearance(icon, "[icon_state]_on")

/obj/structure/ms13/sign/bazaar/Initialize(mapload)
	. = ..()
	set_light(1,1.5,"#da693c")
	update_appearance()
	soundloop = new(src)
	soundloop.start()

/obj/structure/ms13/sign/bazaar/atom_break(damage_flag)
	. = ..()
	cut_overlays()
	set_light(0,0,"#000000")
	do_sparks(1)
	QDEL_NULL(soundloop)

/obj/structure/ms13/sign/private
	name = "sign"
	desc = "A sign exclaiming 'Private Property'! You get the feeling the property ahead is private."
	icon_state = "private"
	bound_x = 64
	pixel_y = 32
	density = FALSE

/obj/structure/ms13/sign/workers
	name = "sign"
	desc = "A sign declaring a zone being off limits. Peculiar."
	icon_state = "workers"
	bound_x = 64
	pixel_y = 24
	density = FALSE

/obj/structure/ms13/sign/rent
	name = "rent sign"
	desc = "FOR RENT. How exciting."
	icon_state = "rent"
	pixel_y = 32
	density = FALSE

/obj/structure/ms13/sign/clinic
	name = "clinic sign"
	desc = "The great green cross of Snowcrest. You're finally safe..?"
	icon_state = "clinic"
	pixel_y = 32
	density = FALSE

/obj/structure/ms13/sign/bar
	name = "bar sign"
	desc = "Light blocks forming the word 'BAR'. Throat be dry no more!"
	icon_state = "bar"
	pixel_y = 32
	density = FALSE
	max_integrity = 75
	integrity_failure = 35
	hitted_sound = 'sound/effects/glasshit.ogg'

/obj/structure/ms13/sign/bar/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "[icon_state]")
	. += emissive_appearance(icon, "[icon_state]")

/obj/structure/ms13/sign/bar/Initialize(mapload)
	. = ..()
	set_light(1,1.5,"#dce62a")
	update_appearance()

/obj/structure/ms13/sign/bar/atom_break(damage_flag)
	. = ..()
	cut_overlays()
	set_light(0,0,"#000000")
	do_sparks(1)

/obj/structure/ms13/sign/open
	name = "open sign"
	desc = "A neon sign, showing if the building is open for business or not! Incredible!"
	icon_state = "open"
	max_integrity = 75
	integrity_failure = 35
	pixel_y = 32
	density = FALSE
	hitted_sound = 'sound/effects/glasshit.ogg'
	var/datum/looping_sound/ms13/neonsign/busted/soundloop

/obj/structure/ms13/sign/open/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "[icon_state]_on")
	. += emissive_appearance(icon, "[icon_state]_on")

/obj/structure/ms13/sign/open/Initialize(mapload)
	. = ..()
	set_light(2,2,"#9c476f")
	update_appearance()
	soundloop = new(src)
	soundloop.start()

/obj/structure/ms13/sign/open/atom_break(damage_flag)
	. = ..()
	cut_overlays()
	set_light(0,0,"#000000")
	do_sparks(1)
	QDEL_NULL(soundloop)

/obj/structure/ms13/sign/open/bar
	icon_state = "open_bar"

/obj/structure/ms13/sign/hotel
	name = "hotel sign"
	desc = "A hotel at last! Time to rest those weary feet."
	icon_state = "hotel"
	max_integrity = 800
	bound_x = 64
	pixel_y = 32
	density = FALSE

/obj/structure/ms13/sign/weopen
	name = "sign"
	desc = "A sign. We're OPEN? Fantastic news!"
	icon_state = "we_open"
	anchored = TRUE
	density = TRUE
	max_integrity = 650 // Hardy but not immortal
	integrity_failure = 500
	var/datum/looping_sound/ms13/neonsign/busted/soundloop

/obj/structure/ms13/sign/weopen/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "[icon_state]_on")
	. += emissive_appearance(icon, "[icon_state]_on")

/obj/structure/ms13/sign/weopen/Initialize(mapload)
	. = ..()
	set_light(1.5,2,"#ab4775")
	update_appearance()
	soundloop = new(src)
	soundloop.start()

/obj/structure/ms13/sign/weopen/atom_break(damage_flag)
	. = ..()
	cut_overlays()
	set_light(0,0,"#000000")
	QDEL_NULL(soundloop)

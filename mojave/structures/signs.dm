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

/obj/structure/ms13/sign/Initialize(mapload)
	. = ..()
	GLOB.signs += src

/obj/structure/ms13/sign/proc/on()
	. += mutable_appearance(icon, "[icon_state]_on")
	. += emissive_appearance(icon, "[icon_state]_on")
	set_light(0.5,0.2,"#9c476f")
	on = TRUE
	update_appearance()

/obj/structure/ms13/sign/proc/off()
	cut_overlays()
	set_light(0,0,"#000000")
	on = FALSE
	update_appearance()

/obj/structure/ms13/sign/snowcrest
	name = "snowcrest sign"
	desc = "A sign with the name 'Snowcrest'. You're filled with a slightly dreadful feeling."
	icon_state = "snowcrest"
	projectile_passchance = 35
	bound_x = 64

/obj/structure/ms13/sign/bazaar
	name = "bazaar sign"
	desc = "A set of signs clearly directing you to the heart of the Town. Obviously there is many things to be gained in this particular direction."
	icon_state = "bazaar"
	projectile_passchance = 50

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
	pixel_y = 32
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

/obj/structure/ms13/sign/open
	name = "open sign"
	desc = "A neon sign, showing if the building is open for business or not! Incredible!"
	icon_state = "open"
	pixel_y = 32
	density = FALSE

/obj/structure/ms13/sign/open/bar
	icon_state = "open_bar"
	pixel_y = 32
	density = FALSE

/obj/structure/ms13/sign/hotel
	name = "hotel sign"
	desc = "A hotel at last! Time to rest those weary feet."
	icon_state = "hotel"
	bound_x = 64
	pixel_y = 32
	density = FALSE

/obj/structure/safe/ms13
	name = "safe"
	desc = "A bulky and secure safe. No possible way to move this thing alone, much too heavy."
	icon = 'mojave/icons/structure/storage.dmi'
	icon_state = "safe_spinner"
	ms13_flags_1 = LOCKABLE_1
	maxspace = 200
	projectile_passchance = 80
	hitted_sound = 'mojave/sound/ms13effects/impact/metal/metal_generic_1.wav'

/obj/structure/safe/ms13/Initialize(mapload)
	. = ..()
	reset_grid_inventory()

/obj/structure/safe/ms13/advanced
	name = "safe"
	desc = "A bulky and secure safe. This one features an advanced locking method."
	icon_state = "safe"

/obj/structure/safe/ms13/wall
	name = "wall safe"
	desc = "A safe that's been cemended into the wall. Good luck ever getting this thing out. The only option is to figure out a way to open it."
	icon_state = "safe_wall"
	pixel_y = 32
	density = FALSE
	projectile_passchance = 100

/obj/structure/safe/ms13/wall/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/wall_mount)

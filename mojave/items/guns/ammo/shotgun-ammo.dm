/obj/item/ammo_casing/shotgun/ms13
	name = "mojave sun base shotgun shell"
	desc = "Complain when seeing this."
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	stack_size = 6
	stack_type = /obj/item/ammo_box/magazine/ammo_stack

/obj/item/ammo_casing/shotgun/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/ammo/ammo_inventory.dmi')

//12 gauge
/obj/item/ammo_casing/shotgun/ms13/buckshot
	name = "12 gauge buckshot shell"
	desc = "A 12 gauge shotgun shell loaded with buckshot."
	icon_state = "buckshot"
	pellets = 6
	variance = 25
	projectile_type = /obj/projectile/bullet/pellet/ms13/buckshot

/obj/item/ammo_casing/shotgun/ms13/buckshot/junk
	name = "12 gauge junkshot shell"
	desc = "A makeshift 12 gauge shotgun shell crudely loaded to resemble buckshot."
	icon_state = "buckshot"
	variance = 30
	projectile_type = /obj/projectile/bullet/pellet/ms13/buckshot/junk

/obj/item/ammo_casing/shotgun/ms13/buckshot/triple
	name = "12 gauge 000 buckshot shell"
	desc = "A 12 gauge shotgun shell loaded with heavier, more lethal buckshot."
	projectile_type = /obj/projectile/bullet/pellet/ms13/buckshot/triple

/obj/item/ammo_casing/shotgun/ms13/buckshot/flechette
	name = "12 gauge flechette shell"
	desc = "A 12 gauge shotgun shell loaded with flechette darts. Better penetration and tighter spread than standard buckshot."
	icon_state = "flechette"
	variance = 20
	projectile_type = /obj/projectile/bullet/pellet/ms13/flechette
	no_inventory_sprite = TRUE

/obj/item/ammo_casing/shotgun/ms13/slug
	name = "12 gauge slug"
	desc = "A deadly 12 gauge shotgun slug firing a single powerful projectile as opposed to multiple pellets."
	icon_state = "slug"
	projectile_type = /obj/projectile/bullet/ms13/slug
	no_inventory_sprite = TRUE

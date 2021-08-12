//Casings

/obj/item/ammo_casing/energy/ms13
	firing_effect_type = null
	click_cooldown_override = 1 //0.1 second fire delay; better balance your fire rates now
	fire_sound = null

// Laser //

/obj/item/ammo_casing/energy/ms13/laser/
	projectile_type = /obj/projectile/beam/ms13/laser
	e_cost = 50

/obj/item/ammo_casing/energy/ms13/laser/scatter
	projectile_type = /obj/projectile/beam/ms13/laser/scatter
	pellets = 3
	variance = 15
	select_name = "scatter"
	e_cost = 85

/obj/item/ammo_casing/energy/ms13/laser/pistol
	projectile_type = /obj/projectile/beam/ms13/laser/pistol
	e_cost = 15

/obj/item/ammo_casing/energy/ms13/laser/sniper
	projectile_type = /obj/projectile/beam/ms13/laser/sniper
	e_cost = 75

// Plasma //

/obj/item/ammo_casing/energy/ms13/plasma
	projectile_type = /obj/projectile/bullet/ms13/plasma
	select_name = "plasma burst"
	e_cost = 100

/obj/item/ammo_casing/energy/ms13/plasma/pistol
	projectile_type = /obj/projectile/bullet/ms13/plasma/pistol
	e_cost = 65

/obj/item/ammo_casing/energy/ms13/plasma/rifle
	projectile_type = /obj/projectile/bullet/ms13/plasma/rifle
	select_name = "plasma burst"
	e_cost = 90

/obj/item/ammo_casing/energy/ms13/plasma/scatter
	projectile_type = /obj/projectile/bullet/ms13/plasma/scatter
	pellets = 3
	variance = 14
	select_name = "scatter"
	e_cost = 115

/obj/item/ammo_casing/energy/ms13/plasma/pistol/splatter
	projectile_type = /obj/projectile/bullet/ms13/plasma/splatter
	e_cost = 75

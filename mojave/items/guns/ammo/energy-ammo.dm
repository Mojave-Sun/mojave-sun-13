//Casings

/obj/item/ammo_casing/energy/ms13
	firing_effect_type = null
	click_cooldown_override = 1 //0.1 second fire delay; better balance your fire rates now
	fire_sound = null

// Laser //

/obj/item/ammo_casing/energy/ms13/laser
	projectile_type = /obj/projectile/beam/ms13/laser
	e_cost = 25 //Combined with MFC capacity this gives 24 shots on laser rifles and 50 shots on RCW

/obj/item/ammo_casing/energy/ms13/laser/scatter
	projectile_type = /obj/projectile/beam/ms13/laser/scatter
	pellets = 3
	variance = 15
	select_name = "scatter"
	e_cost = 75 //Combined with MFC capacity this gives 8 shots

/obj/item/ammo_casing/energy/ms13/laser/pistol
	projectile_type = /obj/projectile/beam/ms13/laser/pistol
	e_cost = 15 //Combined with EC capacity this gives 20 shots

/obj/item/ammo_casing/energy/ms13/laser/pistol/mfc
	projectile_type = /obj/projectile/beam/ms13/laser/pistol
	e_cost = 30 //Combined with MFC capacity this gives 20 shots

/obj/item/ammo_casing/energy/ms13/laser/sniper
	projectile_type = /obj/projectile/beam/ms13/laser/sniper
	e_cost = 40 //Combined with MFC capacity this gives 15 shots

// Plasma //

/obj/item/ammo_casing/energy/ms13/plasma
	projectile_type = /obj/projectile/bullet/ms13/plasma
	select_name = "plasma burst"
	e_cost = 50 //Combined with PC capacity this gives 12 shots

/obj/item/ammo_casing/energy/ms13/plasma/pistol
	projectile_type = /obj/projectile/bullet/ms13/plasma
	e_cost = 37.5 //Combined with PC capacity this gives 16 shots

/obj/item/ammo_casing/energy/ms13/plasma/scatter
	projectile_type = /obj/projectile/bullet/ms13/plasma/scatter
	pellets = 5
	variance = 25
	select_name = "scatter"
	e_cost = 60 //Combined with PC capacity this gives 10 shots

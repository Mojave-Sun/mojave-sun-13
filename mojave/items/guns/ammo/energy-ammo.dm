//Casings

/obj/item/ammo_casing/energy/ms13
	firing_effect_type = null
	click_cooldown_override = 1 //0.1 second fire delay; better balance your fire rates now
	fire_sound = null

// Laser //

/obj/item/ammo_casing/energy/ms13/laser //DO NOT USE ME - Base type
	projectile_type = /obj/projectile/beam/ms13/laser

/obj/item/ammo_casing/energy/ms13/laser/wattz_pistol
	projectile_type = /obj/projectile/beam/ms13/laser/wattz_pistol
	e_cost = 15 //Combined with EC capacity this gives 20 shots

/obj/item/ammo_casing/energy/ms13/laser/stan_pistol
	projectile_type = /obj/projectile/beam/ms13/laser/stan_pistol
	e_cost = 15 //Combined with EC capacity this gives 20 shots

/obj/item/ammo_casing/energy/ms13/laser/wattz_rifle
	projectile_type = /obj/projectile/beam/ms13/laser/wattz_rifle
	e_cost = 25 //Combined with MFC capacity this gives 24 shots

/obj/item/ammo_casing/energy/ms13/laser/wattz_heavypistol
	projectile_type = /obj/projectile/beam/ms13/laser/wattz_heavypistol
	e_cost = 30 //Combined with MFC capacity this gives 20 shots

/obj/item/ammo_casing/energy/ms13/laser/sniper
	projectile_type = /obj/projectile/beam/ms13/laser/sniper
	e_cost = 30 //Combined with MFC capacity this gives 20 shots

/obj/item/ammo_casing/energy/ms13/laser/adv_rifle
	projectile_type = /obj/projectile/beam/ms13/laser/adv_rifle
	e_cost = 25 //Combined with MFC capacity this gives 24 shots

/obj/item/ammo_casing/energy/ms13/laser/stan_rifle
	projectile_type = /obj/projectile/beam/ms13/laser/stan_rifle
	e_cost = 25 //Combined with MFC capacity this gives 24 shots

/obj/item/ammo_casing/energy/ms13/laser/adv_pistol
	projectile_type = /obj/projectile/beam/ms13/laser/adv_pistol
	e_cost = 30 //Combined with MFC capacity this gives 20 shots

/obj/item/ammo_casing/energy/ms13/laser/las_defender
	projectile_type = /obj/projectile/beam/ms13/laser/las_defender
	e_cost = 30 //Combined with MFC capacity this gives 20 shots

/obj/item/ammo_casing/energy/ms13/laser/las_rcw
	projectile_type = /obj/projectile/beam/ms13/laser/las_rcw
	e_cost = 20 //Combined with ECP capacity this gives 50 shots

/obj/item/ammo_casing/energy/ms13/laser/scatter
	projectile_type = /obj/projectile/beam/ms13/laser/scatter
	pellets = 3
	variance = 15
	select_name = "scatter"
	e_cost = 75 //Combined with MFC capacity this gives 8 shots

// Plasma //

/obj/item/ammo_casing/energy/ms13/plasma //DO NOT USE ME - Base type
	projectile_type = /obj/projectile/bullet/ms13/plasma
	select_name = "plasma burst"

/obj/item/ammo_casing/energy/ms13/plasma/stan_pistol
	projectile_type = /obj/projectile/bullet/ms13/plasma/stan_pistol
	e_cost = 37.5 //Combined with PC capacity this gives 16 shots

/obj/item/ammo_casing/energy/ms13/plasma/plas_defender
	projectile_type = /obj/projectile/bullet/ms13/plasma/plas_defender
	e_cost = 37.5 //Combined with PC capacity this gives 16 shots

/obj/item/ammo_casing/energy/ms13/plasma/plas_carbine
	projectile_type = /obj/projectile/bullet/ms13/plasma/plas_carbine
	e_cost = 37.5 //Combined with PC capacity this gives 16 shots

/obj/item/ammo_casing/energy/ms13/plasma/plas_rifle
	projectile_type = /obj/projectile/bullet/ms13/plasma/plas_rifle
	e_cost = 50 //Combined with PC capacity this gives 12 shots

/obj/item/ammo_casing/energy/ms13/plasma/adv_pistol
	projectile_type = /obj/projectile/bullet/ms13/plasma/adv_pistol
	e_cost = 50 //Combined with PC capacity this gives 12 shots

/obj/item/ammo_casing/energy/ms13/plasma/scatter
	projectile_type = /obj/projectile/bullet/ms13/plasma/scatter
	pellets = 4
	variance = 25
	select_name = "scatter"
	e_cost = 60 //Combined with PC capacity this gives 10 shots

// Gauss //

/obj/item/ammo_casing/energy/ms13/gauss //DO NOT USE ME - Base type
	projectile_type = /obj/projectile/bullet/ms13/gauss
	select_name = "gauss bullet"

/obj/item/ammo_casing/energy/ms13/gauss/pistol
	projectile_type = /obj/projectile/bullet/ms13/gauss/pistol
	e_cost = 50 //Combined with 2mmEC capacity this gives 12 shots

/obj/item/ammo_casing/energy/ms13/gauss/rifle
	projectile_type = /obj/projectile/bullet/ms13/gauss/rifle
	e_cost = 75 //Combined with 2mmEC capacity this gives 8 shots

/obj/item/ammo_casing/energy/ms13/gauss/sniper
	projectile_type = /obj/projectile/bullet/ms13/gauss/sniper
	e_cost = 60 //Combined with 2mmEC capacity this gives 10 shots

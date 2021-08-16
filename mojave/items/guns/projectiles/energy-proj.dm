// Laser Projectiles //

/obj/projectile/beam/ms13
	speed = 0.2 //Vanilla tg is 0.8
	var/damage_constant = 1
	damage = 0
	armour_penetration = 0
	wound_bonus = 0

/obj/projectile/beam/ms13/laser
	name = "laser beam"
	range = 32
	hitscan = TRUE
	hitscan_light_color_override = COLOR_SOFT_RED
	muzzle_flash_color_override = COLOR_SOFT_RED
	impact_light_color_override = COLOR_SOFT_RED
	tracer_type = /obj/effect/projectile/tracer/ms13/laser
	muzzle_type = /obj/effect/projectile/muzzle/ms13/laser
	impact_type = /obj/effect/projectile/impact/ms13/laser
	hitscan_light_intensity = 2
	hitscan_light_range = 0.50
	muzzle_flash_intensity = 4
	muzzle_flash_range = 1
	impact_light_intensity = 5
	impact_light_range = 1.25

/obj/projectile/beam/ms13/laser/yellow
	hitscan_light_color_override = COLOR_YELLOW
	muzzle_flash_color_override = COLOR_YELLOW
	impact_light_color_override = COLOR_YELLOW
	tracer_type = /obj/effect/projectile/tracer/ms13/laser/yellow
	muzzle_type = /obj/effect/projectile/muzzle/ms13/laser/yellow
	impact_type = /obj/effect/projectile/impact/ms13/laser/yellow

/obj/projectile/beam/ms13/laser/sniper
	name = "laser beam"
	range = 48

/obj/projectile/beam/ms13/laser/pistol
	name = "laser beam"
	range = 28

/obj/projectile/beam/ms13/laser/scatter
	name = "scatter laser beam"
	range = 18
	damage = 15
	armour_penetration = 5


// Laser Projectile Effects //

/obj/effect/projectile/impact/ms13/laser
	name = "laser impact"
	icon_state = "laser_impact"
	icon = 'mojave/icons/objects/projectiles/projectiles_impact.dmi'

/obj/effect/projectile/muzzle/ms13/laser
	name = "muzzle flash"
	icon_state = "laser_muzzle"
	icon = 'mojave/icons/objects/projectiles/projectiles_muzzle.dmi'

/obj/effect/projectile/tracer/ms13/laser
	name = "laser beam"
	icon_state = "laser"
	icon = 'mojave/icons/objects/projectiles/projectiles_tracer.dmi'

/obj/effect/projectile/impact/ms13/laser/blue
	icon_state = "institute_impact"

/obj/effect/projectile/muzzle/ms13/laser/blue
	icon_state = "institute_muzzle"

/obj/effect/projectile/tracer/ms13/laser/blue
	icon_state = "institute"

/obj/effect/projectile/impact/ms13/laser/yellow
	icon_state = "recharger_impact"

/obj/effect/projectile/muzzle/ms13/laser/yellow
	icon_state = "recharger_muzzle"

/obj/effect/projectile/tracer/ms13/laser/yellow
	icon_state = "recharger"


// Plasma Projectiles //

/obj/projectile/bullet/ms13/plasma
	name = "plasma clot"
	icon = 'mojave/icons/objects/projectiles/projectiles.dmi'
	damage_type = BURN
	flag = ENERGY
	icon_state = "plasma"
	armour_penetration = 0
	wound_bonus = 10
	speed = 1

/obj/projectile/bullet/ms13/plasma/pistol
	wound_bonus = 10

/obj/projectile/bullet/ms13/plasma/rifle
	wound_bonus = 15

/obj/projectile/bullet/ms13/plasma/scatter
	range = 16
	wound_bonus = 20

/obj/projectile/bullet/ms13/plasma/splatter
	range = 18
	wound_bonus = 10
	bare_wound_bonus = 5
	armour_penetration = -5

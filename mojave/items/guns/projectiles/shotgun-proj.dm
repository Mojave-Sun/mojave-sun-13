/obj/projectile/bullet/pellet/ms13
	icon = 'mojave/icons/objects/projectiles/projectiles.dmi'
	icon_state = "buckshot"
	name = "base mojave sun shotgun pellet"
	speed = 0.5
	embedding = null

//12 gauge
/obj/projectile/bullet/pellet/ms13/buckshot
	icon_state = "buckshot"
	name = "buckshot pellet"
	damage = 10
	subtractible_armour_penetration = 10
	wound_bonus = 10
	bare_wound_bonus = 10

/obj/projectile/bullet/pellet/ms13/buckshot/junk
	name = "junkshot pellet"
	subtractible_armour_penetration = 0

/obj/projectile/bullet/pellet/ms13/buckshot/triple
	name = "000 buckshot pellet"
	damage = 10

/obj/projectile/bullet/pellet/ms13/flechette
	icon_state = "nail"
	name = "flechette dart"
	damage = 9
	wound_bonus = 2
	armour_penetration = 5

/obj/projectile/bullet/ms13/slug
	icon_state = "slug"
	name = "12g slug"
	damage = 45
	subtractible_armour_penetration = 20
	wound_bonus = -5
	speed = 0.75

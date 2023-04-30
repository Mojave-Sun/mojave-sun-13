/obj/machinery/porta_turret/ms13
	name = "BASE MS13 TURRET"
	icon = 'mojave/icons/structure/turrets.dmi'
	installation = null
	always_up = TRUE
	use_power = NO_POWER_USE
	has_cover = FALSE
	scan_range = 9
	req_access = list(ACCESS_SYNDICATE)
	faction = list("robots")
	uses_stored = FALSE
	mode = TURRET_LETHAL
	stun_projectile = /obj/projectile/bullet
	lethal_projectile = /obj/projectile/bullet/ms13
	lethal_projectile_sound = 'sound/weapons/gun/pistol/shot.ogg'
	stun_projectile_sound = 'sound/weapons/gun/pistol/shot.ogg'
	icon_state = "turret"
	base_icon_state = "turret"
	desc = "A ballistic machine gun auto-turret."

/obj/machinery/porta_turret/ms13/ballistic
	name = "autoturret stand"
	lethal_projectile = /obj/projectile/bullet/ms13/c9mm/turret
	lethal_projectile_sound = 'mojave/sound/ms13weapons/gunsounds/9mm/9mm1.ogg'
	icon_state = "turret_stand"
	base_icon_state = "turret_stand"
	desc = "A ballistic machine gun auto-turret utilizing a fast rate of fire with low caliber projectiles."
	shot_delay = 2
	max_integrity = 150

/obj/machinery/porta_turret/ms13/ballistic/anchored
	name = "autoturret"
	icon_state = "turret"
	base_icon_state = "turret"
	desc = "A beefy ballistic machine gun auto-turret utilizing a fast rate of fire with low caliber projectiles."
	shot_delay = 2
	max_integrity = 200

/obj/projectile/bullet/ms13/c9mm/turret
	name = "9mm bullet"
	icon_state = "merehandgun_bullet"
	damage = 20
	subtractible_armour_penetration = 10
	wound_bonus = 10
	bare_wound_bonus = 5
	spread = 20

// Eyebot Projectiles //

/obj/projectile/beam/ms13/laser/eyebot
	damage = 15
	hitscan_light_intensity = 1
	hitscan_light_range = 0.25
	muzzle_flash_intensity = 2
	muzzle_flash_range = 0.5
	impact_light_intensity = 2.5
	impact_light_range = 0.75

/obj/projectile/beam/ms13/laser/eyebot/overcharge
	damage = 20
	armour_penetration = 5
	wound_bonus = 0
	hitscan_light_intensity = 1.10
	hitscan_light_range = 0.25
	muzzle_flash_intensity = 2.15
	muzzle_flash_range = 0.75
	impact_light_intensity = 2.75
	impact_light_range = 1

/obj/projectile/beam/ms13/laser/eyebot/proto
	damage = 10
	slur = 5
	hitscan_light_color_override = COLOR_DARK_CYAN
	muzzle_flash_color_override = COLOR_DARK_CYAN
	impact_light_color_override = COLOR_DARK_CYAN
	tracer_type = /obj/effect/projectile/tracer/ms13/laser/blue
	muzzle_type = /obj/effect/projectile/muzzle/ms13/laser/blue
	impact_type = /obj/effect/projectile/impact/ms13/laser/blue
	wound_bonus = 5

/obj/projectile/energy/electrode/ms13
	nodamage = FALSE
	paralyze = 15
	stutter = 10
	jitter = 20
	eyeblur = 15
	range = 15

// Protectron Projectiles //

/obj/projectile/beam/ms13/laser/protectron
	damage = 30
	armour_penetration = 10
	wound_bonus = 5
	bare_wound_bonus = 5
	hitscan_light_intensity = 2
	hitscan_light_range = 0.50
	muzzle_flash_intensity = 4
	muzzle_flash_range = 1
	impact_light_intensity = 5
	impact_light_range = 1.25

/obj/projectile/bullet/ms13/nail/protectron
	icon_state = "nail"
	damage = 15
	armour_penetration = 5
	wound_bonus = 2
	wound_bonus = WOUND_MINIMUM_DAMAGE
	embedding = list(embed_chance=85, fall_chance=2, jostle_chance=0, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.5, pain_mult=3, rip_time=10)

// Robobrain Projectiles //

/obj/projectile/beam/ms13/laser/robobrain
	name = "radiation beam"
	damage = 20
	armour_penetration = 10
	drowsy = 25
	wound_bonus = 12
	bare_wound_bonus = 10
	hitscan_light_color_override = COLOR_YELLOW
	muzzle_flash_color_override = COLOR_YELLOW
	impact_light_color_override = COLOR_YELLOW
	tracer_type = /obj/effect/projectile/tracer/ms13/laser/yellow
	muzzle_type = /obj/effect/projectile/muzzle/ms13/laser/yellow
	impact_type = /obj/effect/projectile/impact/ms13/laser/yellow
	hitscan_light_intensity = 0.25
	hitscan_light_range = 0.25
	muzzle_flash_intensity = 0.25
	muzzle_flash_range = 0.25
	impact_light_intensity = 0.25
	impact_light_range = 0.25

// Mr Handy Projectiles //

/obj/projectile/beam/ms13/laser/handy
	damage = 25
	armour_penetration = 5
	wound_bonus = 0
	bare_wound_bonus = 5
	hitscan_light_intensity = 2
	hitscan_light_range = 0.50
	muzzle_flash_intensity = 4
	muzzle_flash_range = 1
	impact_light_intensity = 5
	impact_light_range = 1.25

/obj/projectile/bullet/ms13/plasma/gutsy
	damage = 35
	armour_penetration = 10

// Assaultron Projectiles //

/obj/projectile/beam/ms13/laser/assaultron
	damage = 35
	armour_penetration = 10
	wound_bonus = 5
	bare_wound_bonus = 10
	hitscan_light_intensity = 2.10
	hitscan_light_range = 1.25
	muzzle_flash_intensity = 3.15
	muzzle_flash_range = 2.75
	impact_light_intensity = 3.75
	impact_light_range = 2

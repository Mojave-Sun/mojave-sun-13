/obj/effect/spawner/random/ms13/ammo
	name = "DO NOT USE ME - Mojave Sun ammo spawners"
	spawn_loot_count = 3
	spawn_loot_double = TRUE

/obj/effect/spawner/random/ms13/ammo/tier1
	name = "tier 1 ammo spawner"
	spawn_loot_chance = 50

	loot = list(
			/obj/item/ammo_box/magazine/ms13/r10,
			/obj/item/ammo_box/magazine/ms13/m22,
			/obj/item/ammo_box/magazine/ms13/m9mm,
			/obj/item/ammo_box/ms13/rev10mm,
			/obj/item/ammo_box/magazine/ms13/m10mm,
			/obj/item/ammo_box/ms13/cpistol,
			/obj/item/ammo_box/ms13/r762,
			/obj/item/stock_parts/cell/ms13/ec,
			/obj/item/ammo_box/ms13/shotgun/junkshot
			)

/obj/effect/spawner/random/ms13/ammo/tier2
	name = "tier 2 ammo spawner"
	spawn_loot_chance = 50

	loot = list(
			/obj/item/ammo_box/magazine/ms13/m10mm,
			/obj/item/ammo_box/ms13/rev357,
			/obj/item/ammo_box/ms13/tube357,
			/obj/item/ammo_box/magazine/ms13/m45,
			/obj/item/ammo_box/magazine/ms13/r20,
			/obj/item/ammo_box/magazine/ms13/r308,
			/obj/item/ammo_box/ms13/r762,
			/obj/item/stock_parts/cell/ms13/ec,
			/obj/item/stock_parts/cell/ms13/pc,
			/obj/item/stock_parts/cell/ms13/mfc,
			/obj/item/ammo_box/ms13/shotgun/buckshot
			)

/obj/effect/spawner/random/ms13/ammo/tier3
	name = "tier 3 ammo spawner"
	spawn_loot_chance = 60

	loot = list(
			/obj/item/ammo_box/ms13/rev44,
			/obj/item/ammo_box/ms13/rev357,
			/obj/item/ammo_box/ms13/rev4570,
			/obj/item/ammo_box/ms13/rev556,
			/obj/item/ammo_box/magazine/ms13/r20,
			/obj/item/ammo_box/magazine/ms13/r308,
			/obj/item/ammo_box/magazine/ms13/smgm9mm,
			/obj/item/ammo_box/ms13/r762,
			/obj/item/ammo_box/ms13/tube44,
			/obj/item/ammo_box/magazine/ms13/smgm10mm,
			/obj/item/ammo_box/magazine/ms13/ar762,
			/obj/item/stock_parts/cell/ms13/pc,
			/obj/item/stock_parts/cell/ms13/mfc,
			/obj/item/ammo_box/ms13/shotgun/buckshot
			)

/obj/effect/spawner/random/ms13/ammo/tier4
	name = "tier 4 ammo spawner"
	spawn_loot_chance = 60

	loot = list(
			/obj/item/ammo_box/magazine/ms13/smgm45,
			/obj/item/ammo_box/magazine/ms13/amr,
			/obj/item/ammo_box/ms13/tube4570,
			/obj/item/ammo_box/magazine/ms13/smgm22,
			/obj/item/ammo_box/magazine/ms13/r20,
			/obj/item/ammo_box/magazine/ms13/r308,
			/obj/item/ammo_box/magazine/ms13/smg12mm,
			/obj/item/ammo_box/magazine/ms13/r308_10,
			/obj/item/ammo_box/magazine/ms13/deagle,
			/obj/item/ammo_box/magazine/ms13/m12mm,
			/obj/item/ammo_box/magazine/ms13/ar762,
			/obj/item/stock_parts/cell/ms13/pc,
			/obj/item/stock_parts/cell/ms13/mfc,
			/obj/item/stock_parts/cell/ms13/ecp
			)

/obj/effect/spawner/random/ms13/ammo/lowrandom
	name = "low tier random ammo spawner"
	spawn_loot_count = 1
	spawn_loot_chance = 100

	loot = list(
			/obj/effect/spawner/random/ms13/ammo/tier1 = 70,
			/obj/effect/spawner/random/ms13/ammo/tier2 = 30
			)

/obj/effect/spawner/random/ms13/ammo/highrandom
	name = "high tier random ammo spawner"
	spawn_loot_count = 1
	spawn_loot_chance = 100

	loot = list(
			/obj/effect/spawner/random/ms13/ammo/tier2 = 10,
			/obj/effect/spawner/random/ms13/ammo/tier3 = 60,
			/obj/effect/spawner/random/ms13/ammo/tier4 = 30
			)

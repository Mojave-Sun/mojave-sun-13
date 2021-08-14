/obj/effect/spawner/lootdrop/ms13/ammo
	name = "DO NOT USE ME - Mojave Sun ammo spawners"
	lootcount = 3
	lootdoubles = TRUE

/obj/effect/spawner/lootdrop/ms13/ammo/tier1
	name = "tier 1 ammo spawner"

	loot = list(
			/obj/item/ammo_box/magazine/ms13/r10,
			/obj/item/ammo_box/magazine/ms13/m22,
			/obj/item/ammo_box/magazine/ms13/m9mm,
			/obj/item/ammo_box/ms13/rev10mm,
			/obj/item/ammo_box/magazine/ms13/m10mm,
			/obj/item/ammo_box/ms13/cpistol,
			/obj/item/ammo_box/ms13/chinese_rifle
			)

/obj/effect/spawner/lootdrop/ms13/ammo/tier2
	name = "tier 2 ammo spawner"

	loot = list(
			/obj/item/ammo_box/magazine/ms13/m10mm,
			/obj/item/ammo_box/ms13/rev357,
			/obj/item/ammo_box/ms13/tube357,
			/obj/item/ammo_box/magazine/ms13/m45,
			/obj/item/ammo_box/magazine/ms13/r20,
			/obj/item/ammo_box/magazine/ms13/r308,
			/obj/item/ammo_box/ms13/sks
			)

/obj/effect/spawner/lootdrop/ms13/ammo/tier3
	name = "tier 3 ammo spawner"

	loot = list(
			/obj/item/ammo_box/ms13/rev44,
			/obj/item/ammo_box/ms13/rev357,
			/obj/item/ammo_box/ms13/rev4570,
			/obj/item/ammo_box/ms13/rev556,
			/obj/item/ammo_box/magazine/ms13/r20,
			/obj/item/ammo_box/magazine/ms13/r308,
			/obj/item/ammo_box/magazine/ms13/smgm9mm,
			/obj/item/ammo_box/ms13/sks,
			/obj/item/ammo_box/ms13/tube44,
			/obj/item/ammo_box/magazine/ms13/smgm10mm,
			/obj/item/ammo_box/magazine/ms13/ar762
			)

/obj/effect/spawner/lootdrop/ms13/ammo/tier4
	name = "tier 4 ammo spawner"

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
			/obj/item/ammo_box/magazine/ms13/ar762
			)

/obj/effect/spawner/lootdrop/ms13/ammo/lowrandom
	name = "low tier random ammo spawner"
	lootcount = 1

	loot = list(
			/obj/effect/spawner/lootdrop/ms13/ammo/tier1 = 70,
			/obj/effect/spawner/lootdrop/ms13/ammo/tier2 = 30
			)

/obj/effect/spawner/lootdrop/ms13/ammo/highrandom
	name = "high tier random ammo spawner"
	lootcount = 1

	loot = list(
			/obj/effect/spawner/lootdrop/ms13/ammo/tier2 = 10,
			/obj/effect/spawner/lootdrop/ms13/ammo/tier3 = 60,
			/obj/effect/spawner/lootdrop/ms13/ammo/tier4 = 30
			)

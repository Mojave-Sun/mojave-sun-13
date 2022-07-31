//// These spawners are GUARENTEED spawns. If you are making changes to these pools, you should probably also make changes to the non-static spawns outside of the Guarenteed folder. ////
//// The idea of these spawners it to use these SPARINGLY. Emphasis on SPARINGLY... Examples of where to use these are: High tier dungeons / Faction bases ////

/obj/effect/spawner/random/ms13/guarenteed/ammo
	name = "DO NOT USE ME - Mojave Sun ammo spawners"
	icon_state = "ms13_ammo-static"
	spawn_loot_count = 2
	spawn_loot_double = TRUE

/obj/effect/spawner/random/ms13/guarenteed/ammo/tier1
	name = "tier 1 ammo spawner"
	loot = list(
			/obj/item/ammo_box/magazine/ms13/r10,
			/obj/item/ammo_box/magazine/ms13/m22,
			/obj/item/ammo_box/ms13/c22box,
			/obj/item/ammo_box/ms13/a357box,
			/obj/item/ammo_box/magazine/ms13/m9mm,
			/obj/item/ammo_box/ms13/c10mm,
			/obj/item/ammo_box/ms13/stripper/r762,
			/obj/item/stock_parts/cell/ms13/ec,
			/obj/item/stock_parts/cell/ms13/mfc,
			/obj/item/ammo_box/ms13/shotgun/junkshot,
			/obj/item/ammo_box/ms13/c9mm
			)

/obj/effect/spawner/random/ms13/guarenteed/ammo/tier2
	name = "tier 2 ammo spawner"
	loot = list(
			/obj/item/ammo_box/magazine/ms13/m10mm,
			/obj/item/ammo_box/ms13/a357box,
			/obj/item/ammo_box/magazine/ms13/m45,
			/obj/item/ammo_box/magazine/ms13/r20,
			/obj/item/ammo_box/ms13/stripper/r762,
			/obj/item/stock_parts/cell/ms13/ec,
			/obj/item/stock_parts/cell/ms13/mfc,
			/obj/item/ammo_box/ms13/shotgun/buckshot,
			/obj/item/ammo_box/magazine/ms13/smgm9mm,
			/obj/item/ammo_box/ms13/a556/small,
			/obj/item/ammo_box/ms13/c45,
			/obj/item/ammo_box/ms13/c10mm
			)

/obj/effect/spawner/random/ms13/guarenteed/ammo/tier3
	name = "tier 3 ammo spawner"
	loot = list(
			/obj/item/ammo_box/ms13/m44box,
			/obj/item/ammo_box/ms13/c4570box,
			/obj/item/ammo_box/magazine/ms13/r20,
			/obj/item/ammo_box/magazine/ms13/r308,
			/obj/item/ammo_box/ms13/a308,
			/obj/item/ammo_box/magazine/ms13/smgm10mm,
			/obj/item/ammo_box/magazine/ms13/smgm22,
			/obj/item/ammo_box/magazine/ms13/smgm45,
			/obj/item/ammo_box/magazine/ms13/ar762,
			/obj/item/stock_parts/cell/ms13/pc,
			/obj/item/stock_parts/cell/ms13/mfc,
			/obj/item/ammo_box/ms13/shotgun/buckshot
			)

/obj/effect/spawner/random/ms13/guarenteed/ammo/tier4
	name = "tier 4 ammo spawner"
	loot = list(
			/obj/item/ammo_box/magazine/ms13/amr,
			/obj/item/ammo_box/ms13/c4570box,
			/obj/item/ammo_box/magazine/ms13/r20,
			/obj/item/ammo_box/magazine/ms13/smg12mm,
			/obj/item/ammo_box/magazine/ms13/r308_10,
			/obj/item/ammo_box/ms13/a308,
			/obj/item/ammo_box/magazine/ms13/deagle,
			/obj/item/ammo_box/magazine/ms13/m12mm,
			/obj/item/ammo_box/magazine/ms13/ar762,
			/obj/item/stock_parts/cell/ms13/pc,
			/obj/item/stock_parts/cell/ms13/mfc,
			/obj/item/stock_parts/cell/ms13/ecp
			)

/obj/effect/spawner/random/ms13/guarenteed/ammo/lowrandom
	name = "low tier random ammo spawner"
	spawn_loot_count = 1
	loot = list(
			/obj/effect/spawner/random/ms13/guarenteed/ammo/tier1 = 70,
			/obj/effect/spawner/random/ms13/guarenteed/ammo/tier2 = 30
			)

/obj/effect/spawner/random/ms13/guarenteed/ammo/highrandom
	name = "high tier random ammo spawner"
	spawn_loot_count = 1
	loot = list(
			/obj/effect/spawner/random/ms13/guarenteed/ammo/tier2 = 10,
			/obj/effect/spawner/random/ms13/guarenteed/ammo/tier3 = 60,
			/obj/effect/spawner/random/ms13/guarenteed/ammo/tier4 = 30
			)

/obj/effect/spawner/random/ms13/guarenteed/ammo/energy
	name = "energy ammo spawner"
	loot = list(
			/obj/item/stock_parts/cell/ms13/mfc = 40,
			/obj/item/stock_parts/cell/ms13/pc = 15,
			/obj/item/stock_parts/cell/ms13/ecp = 10,
			/obj/item/stock_parts/cell/ms13/ec = 35
	)

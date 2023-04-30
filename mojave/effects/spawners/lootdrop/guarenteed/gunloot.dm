//// These spawners are GUARANTEED spawns. If you are making changes to these pools, you should probably also make changes to the non-static spawns outside of the guaranteed folder. ////
//// The idea of these spawners it to use these SPARINGLY. Emphasis on SPARINGLY... Examples of where to use these are: High tier dungeons / Faction bases ////

/obj/effect/spawner/random/ms13/guaranteed/gun
	name = "DO NOT USE ME - Mojave Sun gun spawners"
	icon_state = "ms13_gun-static"

/obj/effect/spawner/random/ms13/guaranteed/gun/tier1
	name = "tier 1 gun spawner"
	spawn_loot_count = 3
	var/loot1 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm,
				/obj/item/ammo_box/magazine/ms13/m9mm,
				/obj/item/ammo_box/magazine/ms13/m9mm
				)
	var/loot2 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/chinese,
				/obj/item/ammo_box/ms13/c10mm,
				""
				)
	var/loot3 = list(
				/obj/item/gun/energy/ms13/laser/rifle/wattz,
				/obj/item/stock_parts/cell/ms13/mfc,
				""
				)
	var/loot4 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/pistol22,
				/obj/item/ammo_box/magazine/ms13/m22,
				""
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev10mm,
				/obj/item/ammo_box/ms13/c10mm,
				""
				)
	var/loot6 = list(
				/obj/item/gun/ballistic/rifle/ms13/varmint,
				/obj/item/ammo_box/magazine/ms13/r10,
				/obj/item/ammo_box/magazine/ms13/r10
				)
	var/loot7 = list(
				/obj/item/gun/ballistic/rifle/ms13/hunting/surplus,
				/obj/item/ammo_box/ms13/stripper/r762,
				/obj/item/ammo_box/ms13/stripper/r762
				)
	var/loot8 = list(
				/obj/item/gun/energy/ms13/laser/pistol/wattz,
				/obj/item/stock_parts/cell/ms13/ec,
				""
				)
	var/loot9 = list(
				/obj/item/gun/ballistic/revolver/ms13/caravan,
				/obj/item/ammo_box/ms13/shotgun/junkshot,
				""
				)
	var/loot10 = list(
				/obj/item/gun/ballistic/revolver/ms13/single,
				/obj/item/ammo_box/ms13/shotgun/junkshot,
				""
				)
	var/loot11 = list(
				/obj/item/gun/ballistic/revolver/ms13/derringer,
				/obj/item/ammo_box/ms13/a357box,
				""
				)

/obj/effect/spawner/random/ms13/guaranteed/gun/tier1/Initialize(mapload)
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8, loot9, loot10, loot11)
	. = ..()

/obj/effect/spawner/random/ms13/guaranteed/gun/tier2
	name = "tier 2 gun spawner"
	spawn_loot_count = 3
	var/loot1 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/military,
				/obj/item/ammo_box/magazine/ms13/m10mm,
				/obj/item/ammo_box/magazine/ms13/m10mm
				)
	var/loot2 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45,
				/obj/item/ammo_box/magazine/ms13/m45,
				/obj/item/ammo_box/magazine/ms13/m45
				)
	var/loot3 = list(
				/obj/item/gun/ballistic/automatic/ms13/semi/service,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)
	var/loot4 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev556,
				/obj/item/ammo_box/ms13/a556/small,
				""
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/shotgun/automatic/ms13/sks,
				/obj/item/ammo_box/ms13/stripper/r762,
				/obj/item/ammo_box/ms13/stripper/r762
				)
	var/loot6 = list(
				/obj/item/gun/ballistic/shotgun/ms13/lever/cowboy,
				/obj/item/ammo_box/ms13/a357box,
				""
				)
	var/loot7 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev357,
				/obj/item/ammo_box/ms13/a357box,
				""
				)
	var/loot8 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev357/police,
				/obj/item/ammo_box/ms13/a357box,
				""
				)
	var/loot9 = list(
				/obj/item/gun/energy/ms13/laser/pistol,
				/obj/item/stock_parts/cell/ms13/ec,
				""
				)
	var/loot10 = list(
				/obj/item/gun/energy/ms13/laser/pistol/wattz_heavy,
				/obj/item/stock_parts/cell/ms13/mfc,
				""
				)
	var/loot11 = list(
				/obj/item/gun/ballistic/shotgun/automatic/ms13/sks/scoped,
				/obj/item/ammo_box/ms13/stripper/r762,
				/obj/item/ammo_box/ms13/stripper/r762
				)
	var/loot12 = list(
				/obj/item/gun/ballistic/shotgun/ms13/lever,
				/obj/item/ammo_box/ms13/shotgun/buckshot,
				""
				)
	var/loot13 = list(
				/obj/item/gun/ballistic/revolver/ms13/caravan/sawed,
				/obj/item/ammo_box/ms13/shotgun/buckshot,
				""
				)
	var/loot14 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm,
				/obj/item/ammo_box/magazine/ms13/m10mm,
				/obj/item/ammo_box/magazine/ms13/m10mm
				)
	var/loot15 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/smg9mm,
				/obj/item/ammo_box/magazine/ms13/smgm9mm,
				""
				)

/obj/effect/spawner/random/ms13/guaranteed/gun/tier2/Initialize(mapload)
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8, loot9, loot10, loot11, loot12, loot13, loot14, loot15)
	. = ..()

/obj/effect/spawner/random/ms13/guaranteed/gun/tier3
	name = "tier 3 gun spawner"
	spawn_loot_count = 3
	var/loot1 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev44,
				/obj/item/ammo_box/ms13/m44box,
				""
				)
	var/loot2 = list(
				/obj/item/gun/ballistic/revolver/ms13/mts,
				/obj/item/ammo_box/ms13/shotgun/buckshot,
				""
				)
	var/loot3 = list(
				/obj/item/gun/ballistic/revolver/ms13/huntingrev,
				/obj/item/ammo_box/ms13/c4570box,
				""
				)
	var/loot4 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/smg22,
				"",
				""
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/shotgun/ms13/lever/trail,
				/obj/item/ammo_box/ms13/m44box,
				""
				)
	var/loot6 = list(
				/obj/item/gun/ballistic/rifle/ms13/hunting/scoped,
				/obj/item/ammo_box/magazine/ms13/r308,
				/obj/item/ammo_box/magazine/ms13/r308
				)
	var/loot7 = list(
				/obj/item/gun/ballistic/rifle/ms13/hunting,
				/obj/item/ammo_box/magazine/ms13/r308,
				/obj/item/ammo_box/magazine/ms13/r308
				)
	var/loot8 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/smg10mm,
				/obj/item/ammo_box/magazine/ms13/smgm10mm,
				""
				)
	var/loot9 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/smg45,
				"",
				""
				)
	var/loot10 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/chinese/handmade,
				/obj/item/ammo_box/magazine/ms13/ar762,
				""
				)
	var/loot11 = list(
				/obj/item/gun/ballistic/automatic/ms13/semi/marksman,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)
	var/loot12 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/proto_service,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)
	var/loot13 = list(
				/obj/item/gun/energy/ms13/laser/pistol/advanced,
				/obj/item/stock_parts/cell/ms13/mfc,
				""
				)
	var/loot14 = list(
				/obj/item/gun/energy/ms13/laser/rifle,
				/obj/item/stock_parts/cell/ms13/mfc,
				""
				)
	var/loot15 = list(
				/obj/item/gun/energy/ms13/plasma/pistol,
				/obj/item/stock_parts/cell/ms13/pc,
				""
				)
	var/loot16 = list(
				/obj/item/gun/energy/ms13/plasma/rifle/carbine,
				/obj/item/stock_parts/cell/ms13/pc,
				""
				)
	var/loot17 = list(
				/obj/item/gun/ballistic/shotgun/ms13/huntingshot,
				/obj/item/ammo_box/ms13/shotgun/buckshot,
				""
				)

/obj/effect/spawner/random/ms13/guaranteed/gun/tier3/Initialize(mapload)
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8, loot9, loot10, loot11, loot12, loot13, loot14, loot15, loot16, loot17)
	. = ..()

/obj/effect/spawner/random/ms13/guaranteed/gun/tier4
	name = "tier 4 gun spawner"
	spawn_loot_count = 3
	var/loot1 = list(
				/obj/item/gun/ballistic/rifle/ms13/hunting/scoped/amr,
				/obj/item/ammo_box/magazine/ms13/amr,
				/obj/item/ammo_box/magazine/ms13/amr
				)
	var/loot2 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/deagle,
				/obj/item/ammo_box/magazine/ms13/deagle,
				/obj/item/ammo_box/magazine/ms13/deagle
				)
	var/loot3 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/m12mm,
				/obj/item/ammo_box/magazine/ms13/m12mm,
				/obj/item/ammo_box/magazine/ms13/m12mm
				)
	var/loot4 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/chinese,
				/obj/item/ammo_box/magazine/ms13/ar762,
				""
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)
	var/loot6 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/smg12mm,
				/obj/item/ammo_box/magazine/ms13/smg12mm,
				""
				)
	var/loot7 = list(
				/obj/item/gun/ballistic/automatic/ms13/semi/sniper,
				/obj/item/ammo_box/magazine/ms13/r308,
				/obj/item/ammo_box/magazine/ms13/r308
				)
	var/loot8 = list(
				/obj/item/gun/ballistic/automatic/ms13/semi/battle,
				/obj/item/ammo_box/magazine/ms13/r308_10,
				/obj/item/ammo_box/magazine/ms13/r308_10
				)
	var/loot9 = list(
				/obj/item/gun/ballistic/shotgun/ms13/lever/brush,
				/obj/item/ammo_box/ms13/c4570box,
				""
				)
	var/loot10 = list(
				/obj/item/gun/energy/ms13/laser/pistol/advanced/defender,
				/obj/item/stock_parts/cell/ms13/mfc,
				""
				)
	var/loot11 = list(
				/obj/item/gun/energy/ms13/laser/rcw,
				"",
				""
				)
	var/loot12 = list(
				/obj/item/gun/energy/ms13/laser/rifle/wattz/sniper,
				/obj/item/stock_parts/cell/ms13/mfc,
				""
				)
	var/loot13 = list(
				/obj/item/gun/energy/ms13/laser/rifle/advanced,
				/obj/item/stock_parts/cell/ms13/mfc,
				""
				)
	var/loot14 = list(
				/obj/item/gun/energy/ms13/laser/scatter,
				/obj/item/stock_parts/cell/ms13/mfc,
				""
				)
	var/loot15 = list(
				/obj/item/gun/energy/ms13/plasma/pistol/defender,
				/obj/item/stock_parts/cell/ms13/pc,
				""
				)
	var/loot16 = list(
				/obj/item/gun/energy/ms13/plasma/rifle,
				/obj/item/stock_parts/cell/ms13/pc,
				""
				)
	var/loot17 = list(
				/obj/item/gun/energy/ms13/plasma/pistol/advanced,
				/obj/item/stock_parts/cell/ms13/pc,
				""
				)
	var/loot18 = list(
				/obj/item/gun/energy/ms13/plasma/multi,
				/obj/item/stock_parts/cell/ms13/pc,
				""
				)

/obj/effect/spawner/random/ms13/guaranteed/gun/tier4/Initialize(mapload)
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8, loot9, loot10, loot11, loot12, loot13, loot14, loot15, loot16, loot17, loot18)
	. = ..()

/obj/effect/spawner/random/ms13/guaranteed/gun/lowunique
	name = "low tier unique gun spawner"
	spawn_loot_count = 3
	var/loot1 = list(
				/obj/item/gun/ballistic/rifle/ms13/varmint/ratslayer,
				/obj/item/ammo_box/magazine/ms13/r10,
				/obj/item/ammo_box/magazine/ms13/r10
				)
	var/loot2 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev357/lucky,
				/obj/item/ammo_box/ms13/a357box,
				""
				)
	var/loot3 = list(
				/obj/item/gun/ballistic/automatic/ms13/semi/service/maquis,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)
	var/loot4 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/chinese/v420,
				/obj/item/ammo_box/ms13/c10mm,
				""
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45/stallion,
				/obj/item/ammo_box/magazine/ms13/m45,
				/obj/item/ammo_box/magazine/ms13/m45
				)

/obj/effect/spawner/random/ms13/guaranteed/gun/lowunique/Initialize(mapload)
	loot = pick(loot1, loot2, loot3, loot4, loot5)
	. = ..()

/obj/effect/spawner/random/ms13/guaranteed/gun/highunique
	name = "high tier unique gun spawner"
	spawn_loot_count = 3
	var/loot1 = list(
				/obj/item/gun/ballistic/revolver/ms13/huntingrev/sequoia,
				/obj/item/ammo_box/ms13/c4570box,
				""
				)
	var/loot2 = list(
				/obj/item/gun/ballistic/automatic/ms13/semi/marksman/american,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)
	var/loot3 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev44/mysterious,
				/obj/item/ammo_box/ms13/m44box,
				""
				)
	var/loot4 = list(
				/obj/item/gun/ballistic/automatic/ms13/semi/sniper/silencer,
				/obj/item/ammo_box/magazine/ms13/r308,
				/obj/item/ammo_box/magazine/ms13/r308
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/automatic/ms13/semi/battle/rangemaster,
				/obj/item/ammo_box/magazine/ms13/r308_10,
				/obj/item/ammo_box/magazine/ms13/r308_10
				)
	var/loot6 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/chinese/xuanlong,
				/obj/item/ammo_box/magazine/ms13/ar762,
				""
				)
	var/loot7 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/infiltrator,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)

/obj/effect/spawner/random/ms13/guaranteed/gun/highunique/Initialize(mapload)
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7)
	. = ..()

/obj/effect/spawner/random/ms13/guaranteed/gun/lowrandom
	name = "low tier random gun spawner"
	spawn_loot_count = 1
	loot = list(
			/obj/effect/spawner/random/ms13/guaranteed/gun/tier1 = 70,
			/obj/effect/spawner/random/ms13/guaranteed/gun/tier2 = 30,
			)

/obj/effect/spawner/random/ms13/guaranteed/gun/highrandom
	name = "high tier random gun spawner"
	spawn_loot_count = 1
	loot = list(
			/obj/effect/spawner/random/ms13/guaranteed/gun/tier2 = 10,
			/obj/effect/spawner/random/ms13/guaranteed/gun/tier3 = 60,
			/obj/effect/spawner/random/ms13/guaranteed/gun/tier4 = 30,
			)

/obj/effect/spawner/random/ms13/guaranteed/gun/military
	name = "military gun spawner"
	spawn_loot_count = 3
	spawn_loot_chance = 50
	var/loot1 = list(
				/obj/item/gun/ballistic/rifle/ms13/hunting/scoped/amr,
				/obj/item/ammo_box/magazine/ms13/amr,
				/obj/item/ammo_box/magazine/ms13/amr
				)
	var/loot2 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/m12mm,
				/obj/item/ammo_box/magazine/ms13/m12mm,
				/obj/item/ammo_box/magazine/ms13/m12mm
				)
	var/loot3 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/chinese,
				/obj/item/ammo_box/magazine/ms13/ar762,
				""
				)
	var/loot4 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/automatic/ms13/full/smg12mm,
				/obj/item/ammo_box/magazine/ms13/smg12mm,
				""
				)
	var/loot6 = list(
				/obj/item/gun/ballistic/automatic/ms13/semi/sniper,
				/obj/item/ammo_box/magazine/ms13/r308,
				/obj/item/ammo_box/magazine/ms13/r308
				)
	var/loot7 = list(
				/obj/item/gun/energy/ms13/laser/pistol/advanced/defender,
				/obj/item/stock_parts/cell/ms13/mfc,
				""
				)
	var/loot8 = list(
				/obj/item/gun/energy/ms13/laser/rifle/advanced,
				/obj/item/stock_parts/cell/ms13/mfc,
				""
				)
	var/loot9 = list(
				/obj/item/gun/energy/ms13/laser/scatter,
				/obj/item/stock_parts/cell/ms13/mfc,
				""
				)
	var/loot10 = list(
				/obj/item/gun/energy/ms13/plasma/pistol/defender,
				/obj/item/stock_parts/cell/ms13/pc,
				""
				)
	var/loot11 = list(
				/obj/item/gun/energy/ms13/plasma/rifle,
				/obj/item/stock_parts/cell/ms13/pc,
				""
				)
	var/loot12 = list(
				/obj/item/gun/energy/ms13/plasma/pistol/advanced,
				/obj/item/stock_parts/cell/ms13/pc,
				""
				)
	var/loot13 = list(
				/obj/item/gun/energy/ms13/plasma/multi,
				/obj/item/stock_parts/cell/ms13/pc,
				""
				)
	var/loot14 = list(
				/obj/item/gun/energy/ms13/gauss/pistol,
				/obj/item/stock_parts/cell/ms13/gauss,
				/obj/item/stock_parts/cell/ms13/gauss
				)
	var/loot15 = list(
				/obj/item/gun/energy/ms13/gauss/rifle,
				/obj/item/stock_parts/cell/ms13/gauss,
				/obj/item/stock_parts/cell/ms13/gauss
				)
	var/loot16 = list(
				/obj/item/gun/energy/ms13/gauss/sniper,
				/obj/item/stock_parts/cell/ms13/gauss,
				/obj/item/stock_parts/cell/ms13/gauss
				)

/obj/effect/spawner/random/ms13/guaranteed/gun/military/Initialize(mapload)
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8, loot9, loot10, loot11, loot12, loot13, loot14, loot15, loot16)
	. = ..()

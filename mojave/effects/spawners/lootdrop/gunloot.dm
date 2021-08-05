/obj/effect/spawner/lootdrop/ms13/gun
	name = "DO NOT USE ME - Mojave Sun gun spawners"

/obj/effect/spawner/lootdrop/ms13/gun/tier1
	name = "tier 1 gun spawner"
	lootcount = 3
	var/loot1 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm,
				/obj/item/ammo_box/magazine/ms13/m9mm,
				/obj/item/ammo_box/magazine/ms13/m9mm
				)
	var/loot2 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/chinese,
				/obj/item/ammo_box/ms13/cpistol,
				/obj/item/ammo_box/ms13/cpistol
				)
	var/loot3 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm,
				/obj/item/ammo_box/magazine/ms13/m10mm,
				/obj/item/ammo_box/magazine/ms13/m10mm
				)
	var/loot4 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/pistol22,
				/obj/item/ammo_box/magazine/ms13/m22,
				""
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev10mm,
				/obj/item/ammo_box/ms13/rev10mm,
				/obj/item/ammo_box/ms13/rev10mm
				)
	var/loot6 = list(
				/obj/item/gun/ballistic/rifle/ms13/varmint,
				/obj/item/ammo_box/magazine/ms13/r10,
				/obj/item/ammo_box/magazine/ms13/r10
				)
	var/loot7 = list(
				/obj/item/gun/ballistic/rifle/ms13/hunting/chinese,
				/obj/item/ammo_box/ms13/chinese_rifle,
				/obj/item/ammo_box/ms13/chinese_rifle
	)

/obj/effect/spawner/lootdrop/ms13/gun/tier1/Initialize()
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7)
	. = ..()

/obj/effect/spawner/lootdrop/ms13/gun/tier2
	name = "tier 2 gun spawner"
	lootcount = 3
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
				/obj/item/gun/ballistic/automatic/ms13/marksman/service,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)
	var/loot4 = list(
				/obj/item/gun/ballistic/rifle/ms13/hunting,
				/obj/item/ammo_box/magazine/ms13/r308,
				/obj/item/ammo_box/magazine/ms13/r308
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/shotgun/automatic/ms13/sks,
				/obj/item/ammo_box/ms13/sks,
				/obj/item/ammo_box/ms13/sks
				)
	var/loot6 = list(
				/obj/item/gun/ballistic/shotgun/ms13/lever/cowboy,
				/obj/item/ammo_box/ms13/tube357,
				/obj/item/ammo_box/ms13/tube357
				)
	var/loot7 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev357,
				/obj/item/ammo_box/ms13/rev357,
				/obj/item/ammo_box/ms13/rev357
				)
	var/loot8 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev357/police,
				/obj/item/ammo_box/ms13/rev357,
				/obj/item/ammo_box/ms13/rev357
				)

/obj/effect/spawner/lootdrop/ms13/gun/tier2/Initialize()
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8)
	. = ..()

/obj/effect/spawner/lootdrop/ms13/gun/tier3
	name = "tier 3 gun spawner"
	lootcount = 3
	var/loot1 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev44,
				/obj/item/ammo_box/ms13/rev44,
				/obj/item/ammo_box/ms13/rev44
				)
	var/loot2 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev44/rifle,
				/obj/item/ammo_box/ms13/rev44,
				/obj/item/ammo_box/ms13/rev44
				)
	var/loot3 = list(
				/obj/item/gun/ballistic/revolver/ms13/huntingrev,
				/obj/item/ammo_box/ms13/rev4570,
				/obj/item/ammo_box/ms13/rev4570
				)
	var/loot4 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev556,
				/obj/item/ammo_box/ms13/rev556,
				/obj/item/ammo_box/ms13/rev556
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/shotgun/ms13/lever/trail,
				/obj/item/ammo_box/ms13/tube44,
				/obj/item/ammo_box/ms13/tube44
				)
	var/loot6 = list(
				/obj/item/gun/ballistic/rifle/ms13/hunting/scoped,
				/obj/item/ammo_box/magazine/ms13/r308,
				/obj/item/ammo_box/magazine/ms13/r308
				)
	var/loot7 = list(
				/obj/item/gun/ballistic/shotgun/automatic/ms13/sks/scoped,
				/obj/item/ammo_box/ms13/sks,
				/obj/item/ammo_box/ms13/sks
				)
	var/loot8 = list(
				/obj/item/gun/ballistic/automatic/ms13/smg10mm,
				/obj/item/ammo_box/magazine/ms13/smgm10mm,
				""
				)
	var/loot9 = list(
				/obj/item/gun/ballistic/automatic/ms13/smg9mm,
				/obj/item/ammo_box/magazine/ms13/smgm9mm,
				""
				)
	var/loot10 = list(
				/obj/item/gun/ballistic/automatic/ms13/assaultrifle/chinese/handmade,
				/obj/item/ammo_box/magazine/ms13/ar762,
				""
				)
	var/loot11 = list(
				/obj/item/gun/ballistic/automatic/ms13/marksman,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)
	var/loot12 = list(
				/obj/item/gun/ballistic/automatic/ms13/marksman/service/prototype,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)

/obj/effect/spawner/lootdrop/ms13/gun/tier3/Initialize()
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8, loot9, loot10, loot11, loot12)
	. = ..()

/obj/effect/spawner/lootdrop/ms13/gun/tier4
	name = "tier 4 gun spawner"
	lootcount = 3
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
				/obj/item/gun/ballistic/automatic/ms13/assaultrifle/chinese,
				/obj/item/ammo_box/magazine/ms13/ar762,
				""
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/automatic/ms13/assaultrifle,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)
	var/loot6 = list(
				/obj/item/gun/ballistic/automatic/ms13/smg12mm,
				/obj/item/ammo_box/magazine/ms13/smg12mm,
				""
				)
	var/loot7 = list(
				/obj/item/gun/ballistic/automatic/ms13/smg22,
				"",
				""
				)
	var/loot8 = list(
				/obj/item/gun/ballistic/automatic/ms13/smg45,
				"",
				""
				)
	var/loot9 = list(
				/obj/item/gun/ballistic/automatic/ms13/marksman/sniper,
				/obj/item/ammo_box/magazine/ms13/r308,
				/obj/item/ammo_box/magazine/ms13/r308
				)
	var/loot10 = list(
				/obj/item/gun/ballistic/automatic/ms13/marksman/battle,
				/obj/item/ammo_box/magazine/ms13/r308_10,
				/obj/item/ammo_box/magazine/ms13/r308_10
				)
	var/loot11 = list(
				/obj/item/gun/ballistic/shotgun/ms13/lever/brush,
				/obj/item/ammo_box/ms13/tube4570,
				/obj/item/ammo_box/ms13/tube4570
				)

/obj/effect/spawner/lootdrop/ms13/gun/tier4/Initialize()
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8, loot9, loot10, loot11)
	. = ..()

/obj/effect/spawner/lootdrop/ms13/gun/lowunique
	name = "low tier unique gun spawner"
	lootcount = 3
	var/loot1 = list(
				/obj/item/gun/ballistic/rifle/ms13/varmint/ratslayer,
				/obj/item/ammo_box/magazine/ms13/r10,
				/obj/item/ammo_box/magazine/ms13/r10
				)
	var/loot2 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev357/lucky,
				/obj/item/ammo_box/ms13/rev357,
				/obj/item/ammo_box/ms13/rev357
				)
	var/loot3 = list(
				/obj/item/gun/ballistic/automatic/ms13/marksman/service/maquis,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)
	var/loot4 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/chinese/v420,
				/obj/item/ammo_box/ms13/cpistol,
				/obj/item/ammo_box/ms13/cpistol
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45/stallion,
				/obj/item/ammo_box/magazine/ms13/m45,
				/obj/item/ammo_box/magazine/ms13/m45
				)

/obj/effect/spawner/lootdrop/ms13/gun/lowunique/Initialize()
	loot = pick(loot1, loot2, loot3, loot4, loot5)
	. = ..()

/obj/effect/spawner/lootdrop/ms13/gun/highunique
	name = "high tier unique gun spawner"
	lootcount = 3
	var/loot1 = list(
				/obj/item/gun/ballistic/revolver/ms13/huntingrev/sequoia,
				/obj/item/ammo_box/ms13/rev4570,
				/obj/item/ammo_box/ms13/rev4570
				)
	var/loot2 = list(
				/obj/item/gun/ballistic/automatic/ms13/marksman/american,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)
	var/loot3 = list(
				/obj/item/gun/ballistic/revolver/ms13/rev44/mysterious,
				/obj/item/ammo_box/ms13/rev44,
				/obj/item/ammo_box/ms13/rev44
				)
	var/loot4 = list(
				/obj/item/gun/ballistic/automatic/ms13/marksman/sniper/silencer,
				/obj/item/ammo_box/magazine/ms13/r308,
				/obj/item/ammo_box/magazine/ms13/r308
				)
	var/loot5 = list(
				/obj/item/gun/ballistic/automatic/ms13/marksman/battle/rangemaster,
				/obj/item/ammo_box/magazine/ms13/r308_10,
				/obj/item/ammo_box/magazine/ms13/r308_10
				)
	var/loot6 = list(
				/obj/item/gun/ballistic/automatic/ms13/assaultrifle/chinese/xuanlong,
				/obj/item/ammo_box/magazine/ms13/ar762,
				""
				)
	var/loot7 = list(
				/obj/item/gun/ballistic/automatic/ms13/assaultrifle/infiltrator,
				/obj/item/ammo_box/magazine/ms13/r20,
				""
				)

/obj/effect/spawner/lootdrop/ms13/gun/highunique/Initialize()
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7)
	. = ..()

/obj/effect/spawner/lootdrop/ms13/gun/lowrandom
	name = "low tier random gun spawner"
	lootcount = 1

	loot = list(
			/obj/effect/spawner/lootdrop/ms13/gun/tier1 = 70,
			/obj/effect/spawner/lootdrop/ms13/gun/tier2 = 30,
			)

/obj/effect/spawner/lootdrop/ms13/gun/highrandom
	name = "high tier random gun spawner"
	lootcount = 1

	loot = list(
			/obj/effect/spawner/lootdrop/ms13/gun/tier2 = 10,
			/obj/effect/spawner/lootdrop/ms13/gun/tier3 = 60,
			/obj/effect/spawner/lootdrop/ms13/gun/tier4 = 30,
			)

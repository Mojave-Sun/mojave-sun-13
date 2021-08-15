/obj/effect/spawner/lootdrop/ms13/armor
	name = "DO NOT USE ME - Mojave Sun armor spawners"

/obj/effect/spawner/lootdrop/ms13/armor/tier1
	name = "tier 1 armor spawner"
	lootcount = 2
	var/loot1 = list(
				/obj/item/clothing/suit/ms13/vest,
				/obj/item/clothing/head/helmet/ms13/cowboy
				)
	var/loot2 = list(
				/obj/item/clothing/suit/ms13/vest/brown,
				/obj/item/clothing/head/helmet/ms13/cowboy
				)
	var/loot3 = list(
				/obj/item/clothing/suit/ms13/vest/black,
				/obj/item/clothing/head/helmet/ms13/cowboy/black
				)
	var/loot4 = list(
				/obj/item/clothing/suit/ms13/shawl,
				""
				)
	var/loot5 = list(
				/obj/item/clothing/suit/ms13/vest/letterman,
				""
				)
	var/loot6 = list(
				/obj/item/clothing/suit/ms13/ljacket,
				/obj/item/clothing/head/helmet/ms13/cowboy/black
				)
	var/loot7 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/brown,
				""
				)
	var/loot8 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/black,
				""
				)
	var/loot9 = list(
				/obj/item/clothing/suit/ms13/veteran_coat,
				/obj/item/clothing/head/helmet/ms13/police
				)
	var/loot10 = list(
				/obj/item/clothing/suit/ms13/duster,
				/obj/item/clothing/head/helmet/ms13/cowboy
				)
	var/loot11 = list(
				/obj/item/clothing/suit/ms13/trench,
				/obj/item/clothing/head/helmet/ms13/cowboy
				)
	var/loot12 = list(
				/obj/item/clothing/suit/ms13/trench/black,
				/obj/item/clothing/head/helmet/ms13/cowboy/black
				)
	var/loot13 = list(
				/obj/item/clothing/suit/ms13/trench/detective,
				/obj/item/clothing/head/helmet/ms13/fedora/brown
				)
	var/loot14 = list(
				/obj/item/clothing/suit/ms13/ljacket,
				""
				)
	var/loot15 = list(
				/obj/item/clothing/suit/ms13/ljacket/bomber,
				/obj/item/clothing/head/helmet/ms13/ushanka
				)
	var/loot16 = list(
				/obj/item/clothing/suit/ms13/ljacket/military,
				/obj/item/clothing/head/helmet/ms13/military
				)
	var/loot17 = list(
				/obj/item/clothing/suit/ms13/ljacket/wanderer,
				/obj/item/clothing/head/helmet/ms13/fedora/brown
				)
	var/loot18 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/blue,
				""
				)
	var/loot19 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/orange,
				""
				)
	var/loot20 = list(
				/obj/item/clothing/suit/toggle/labcoat/ms13,
				""
				)
	var/loot21 = list(
				/obj/item/clothing/suit/armor/ms13/leatherarmor
				)
	var/loot22 = list(
				/obj/item/clothing/suit/armor/ms13/kit,
				""
				)
	var/loot23 = list(
				/obj/item/clothing/mask/gas/ms13,
				""
				)
	var/loot24 = list(
				/obj/item/clothing/suit/ms13/duster,
				/obj/item/clothing/head/helmet/ms13/newsboy
				)
	var/loot25 = list(
				/obj/item/clothing/suit/ms13/ljacket/musty,
				""
				)
	var/loot26 = list(
				/obj/item/clothing/suit/ms13/trench/brown,
				""
				)


/obj/effect/spawner/lootdrop/ms13/armor/tier1/Initialize() //on mapload, pick what to spawn
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8, loot9, loot10, loot11, loot12, loot13, loot14, loot15, loot16, loot17, loot18, loot19, loot20, loot21, loot22, loot23, loot24, loot25, loot26)
	. = ..()

/obj/effect/spawner/lootdrop/ms13/armor/tier2
	name = "tier 2 armor spawner"
	lootcount = 2
	var/loot1 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/orange/reinforced,
				""
				)
	var/loot2 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/brown/reinforced,
				""
				)
	var/loot3 = list(
				/obj/item/clothing/suit/ms13/ljacket/reinforced,
				/obj/item/clothing/head/helmet/ms13/flight
				)
	var/loot4 = list(
				/obj/item/clothing/suit/ms13/duster/reinforced,
				/obj/item/clothing/head/helmet/ms13/cowboy
				)
	var/loot5 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/black/reinforced,
				/obj/item/clothing/head/helmet/ms13/cowboy/black
				)
	var/loot6 = list(
				/obj/item/clothing/suit/ms13/trench/battle,
				""
				)
	var/loot7 = list(
				/obj/item/clothing/head/helmet/riot/ms13,
				""
				)
	var/loot8 = list(
				/obj/item/clothing/suit/armor/ms13/kit/reinf,
				""
				)
	var/loot9 = list(
				/obj/item/clothing/suit/armor/ms13/leatherarmor,
				/obj/item/clothing/head/helmet/ms13/flight
				)
	var/loot10 = list(
				/obj/item/clothing/suit/armor/ms13/tire,
				)
	var/loot11 = list(
				/obj/item/clothing/suit/ms13/veteran_coat/reinf,
				)
	var/loot12 = list(
				/obj/item/clothing/suit/ms13/duster/reinforced,
				)
	var/loot13 = list(
				/obj/item/clothing/suit/armor/ms13/vest,
				/obj/item/clothing/head/helmet/ms13/military/officer
				)
	var/loot14 = list(
				/obj/item/clothing/suit/armor/ms13/vest,
				/obj/item/clothing/head/helmet/ms13/bowler
				)
	var/loot15 = list(
				/obj/item/clothing/suit/armor/ms13/metal,
				)

/obj/effect/spawner/lootdrop/ms13/armor/tier2/Initialize()
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8, loot9, loot10, loot11, loot12, loot13, loot14, loot15)
	. = ..()

/obj/effect/spawner/lootdrop/ms13/armor/tier3
	name = "tier 3 armor spawner"
	lootcount = 2
	var/loot1 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/blue/armored,
				""
				)
	var/loot2 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/black/armored,
				""
				)
	var/loot3 = list(
				/obj/item/clothing/suit/ms13/trench/black/armored,
				/obj/item/clothing/head/helmet/ms13/cowboy/black
				)
	var/loot4 = list(
				/obj/item/clothing/suit/armor/ms13/vaultvan,
				/obj/item/clothing/head/helmet/ms13/bladed
				)
	var/loot5 = list(
				/obj/item/clothing/suit/armor/ms13/metal/heavy,
				/obj/item/clothing/head/helmet/ms13/eyebot
				)
	var/loot6 = list(
				/obj/item/clothing/suit/armor/ms13/metal/reinforced,
				/obj/item/clothing/head/helmet/ms13/metal
				)
	var/loot7 = list(
				/obj/item/clothing/suit/armor/ms13/vest/military,
				/obj/item/clothing/head/helmet/ms13/military
				)
	var/loot8 = list(
				/obj/item/clothing/suit/armor/ms13/leatherarmor/reinforced,
				/obj/item/clothing/head/helmet/ms13/flight
				)
	var/loot9 = list(
				/obj/item/clothing/suit/armor/ms13/combat,
				/obj/item/clothing/head/helmet/ms13/combat
				)

/obj/effect/spawner/lootdrop/ms13/armor/tier3/Initialize()
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8, loot9)
	. = ..()

/obj/effect/spawner/lootdrop/ms13/armor/tier4
	name = "tier 4 armor spawner"
	lootcount = 2
	var/loot1 = list(
				/obj/item/clothing/suit/armor/ms13/combat,
				/obj/item/clothing/head/helmet/ms13/combat
				)
	var/loot2 = list(
				/obj/item/clothing/suit/armor/ms13/combat/advanced,
				/obj/item/clothing/head/helmet/ms13/combat/advanced
				)
	var/loot3 = list(
				/obj/item/clothing/suit/armor/ms13/tesla,
				/obj/item/clothing/head/helmet/ms13/tesla
				)
	var/loot4 = list(
				/obj/item/clothing/suit/armor/ms13/eliteriot,
				/obj/item/clothing/head/helmet/ms13/eliteriot
				)
	var/loot5 = list(
				/obj/item/clothing/suit/armor/ms13/stealth/assassin,
				)
	var/loot6 = list(
				/obj/item/clothing/suit/armor/ms13/stealth,
				/obj/item/clothing/head/helmet/ms13/stealth
				)

/obj/effect/spawner/lootdrop/ms13/armor/tier4/Initialize()
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6)
	. = ..()

/obj/effect/spawner/lootdrop/ms13/armor/lowrandom
	name = "low tier random armor spawner"
	lootcount = 1

	loot = list(
			/obj/effect/spawner/lootdrop/ms13/armor/tier1 = 60,
			/obj/effect/spawner/lootdrop/ms13/armor/tier2 = 40,
			)

/obj/effect/spawner/lootdrop/ms13/armor/highrandom
	name = "high tier random armor spawner"
	lootcount = 1

	loot = list(
			/obj/effect/spawner/lootdrop/ms13/armor/tier2 = 10,
			/obj/effect/spawner/lootdrop/ms13/armor/tier3 = 60,
			/obj/effect/spawner/lootdrop/ms13/armor/tier4 = 30,
			)

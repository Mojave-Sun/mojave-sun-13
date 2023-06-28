//// These spawners are GUARANTEED spawns. If you are making changes to these pools, you should probably also make changes to the non-static spawns outside of the guaranteed folder. ////
//// The idea of these spawners it to use these SPARINGLY. Emphasis on SPARINGLY... Examples of where to use these are: High tier dungeons / Faction bases ////

/obj/effect/spawner/random/ms13/guaranteed/armor
	name = "DO NOT USE ME - Mojave Sun armor spawners"
	icon_state = "ms13_suit-static"

/obj/effect/spawner/random/ms13/guaranteed/armor/tier1
	name = "tier 1 armor spawner"
	spawn_loot_count = 2

	var/loot1 = list(
				/obj/item/clothing/suit/ms13/vest,
				/obj/item/clothing/head/helmet/ms13/cowboy
				)
	var/loot2 = list(
				/obj/item/clothing/suit/ms13/vest/brown,
				/obj/item/clothing/head/helmet/ms13/fedora/brown
				)
	var/loot3 = list(
				/obj/item/clothing/suit/ms13/vest/black,
				/obj/item/clothing/head/helmet/ms13/fedora
				)
	var/loot4 = list(
				/obj/item/clothing/suit/ms13/vest/letterman,
				/obj/item/clothing/head/helmet/ms13/baseball
				)
	var/loot5 = list(
				/obj/item/clothing/suit/ms13/ljacket,
				/obj/item/clothing/head/helmet/ms13/cowboy/black
				)
	var/loot6 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/brown,
				/obj/item/clothing/head/helmet/ms13/ushanka
				)
	var/loot7 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/black,
				/obj/item/clothing/head/helmet/ms13/ushanka/blue
				)
	var/loot8 = list(
				/obj/item/clothing/suit/ms13/veteran_coat,
				/obj/item/clothing/head/helmet/ms13/police
				)
	var/loot9 = list(
				/obj/item/clothing/suit/ms13/veteran_coat/black,
				/obj/item/clothing/head/helmet/ms13/military/officer
				)
	var/loot10 = list(
				/obj/item/clothing/suit/ms13/duster,
				/obj/item/clothing/head/helmet/ms13/cowboy
				)
	var/loot11 = list(
				/obj/item/clothing/suit/ms13/trench/detective,
				/obj/item/clothing/head/helmet/ms13/fedora/brown
				)
	var/loot12 = list(
				/obj/item/clothing/suit/ms13/ljacket/bomber,
				/obj/item/clothing/head/helmet/ms13/ushanka
				)
	var/loot13 = list(
				/obj/item/clothing/suit/ms13/ljacket/military,
				/obj/item/clothing/head/helmet/ms13/military
				)
	var/loot14 = list(
				/obj/item/clothing/suit/ms13/ljacket/wanderer,
				/obj/item/clothing/head/ms13/hood/cowl
				)
	var/loot15 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/blue,
				/obj/item/clothing/head/helmet/ms13/ushanka/blue
				)
	var/loot16 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/orange,
				/obj/item/clothing/head/helmet/ms13/ushanka
				)
	var/loot17 = list(
				/obj/item/clothing/suit/ms13/ljacket/musty,
				/obj/item/clothing/head/ms13/hood/sack
				)
	var/loot18 = list(
				/obj/item/clothing/suit/ms13/trench/brown,
				/obj/item/clothing/head/helmet/ms13/fedora/brown
				)
	var/loot19 = list(
				/obj/item/clothing/suit/armor/ms13/tire,
				/obj/item/clothing/head/helmet/ms13/batter
				)
	var/loot20 = list(
				/obj/item/clothing/suit/ms13/ljacket/moleskin,
				/obj/item/clothing/head/helmet/ms13/skull
				)
	var/loot21 = list(
				/obj/item/clothing/suit/ms13/ljacket/biker,
				/obj/item/clothing/head/helmet/ms13/cowboy/black
				)
	var/loot22 = list(
				/obj/item/clothing/suit/ms13/trench/black/bruiser,
				/obj/item/clothing/head/helmet/ms13/batter
				)
	var/loot23 = list(
				/obj/item/clothing/suit/armor/ms13/vest/civilian,
				""
				)
	var/loot24 = list(
				/obj/item/clothing/suit/armor/ms13/kit,
				/obj/item/clothing/head/ms13/hood/sack/metal
				)
	var/loot25 = list(
				/obj/item/clothing/suit/ms13/trench/leather,
				/obj/item/clothing/head/helmet/ms13/tricorn
				)
	var/loot26 = list(
				/obj/item/clothing/suit/ms13/trench,
				/obj/item/clothing/head/helmet/ms13/fedora/brown
				)
	var/loot27 = list(
				/obj/item/clothing/suit/ms13/trench/black,
				/obj/item/clothing/head/helmet/ms13/fedora
				)

/obj/effect/spawner/random/ms13/guaranteed/armor/tier1/Initialize(mapload) //on mapload, pick what to spawn
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8, loot9, loot10, loot11, loot12, loot13, loot14, loot15, loot16, loot17, loot18, loot19, loot20, loot21, loot22, loot23, loot24, loot25, loot26, loot27)
	. = ..()

/obj/effect/spawner/random/ms13/guaranteed/armor/tier2
	name = "tier 2 armor spawner"
	spawn_loot_count = 2
	var/loot1 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/orange/reinforced,
				/obj/item/clothing/head/helmet/ms13/flight/yellow
				)
	var/loot2 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/brown/reinforced,
				/obj/item/clothing/head/helmet/ms13/flight/red
				)
	var/loot3 = list(
				/obj/item/clothing/suit/ms13/ljacket/reinforced,
				/obj/item/clothing/head/helmet/ms13/prospector
				)
	var/loot4 = list(
				/obj/item/clothing/suit/ms13/duster/reinforced,
				/obj/item/clothing/head/helmet/ms13/militia
				)
	var/loot5 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/black/reinforced,
				/obj/item/clothing/head/helmet/ms13/flight
				)
	var/loot6 = list(
				/obj/item/clothing/suit/armor/ms13/leatherarmor,
				/obj/item/clothing/head/ms13/hood/hunter
				)
	var/loot7 = list(
				/obj/item/clothing/suit/ms13/veteran_coat/reinf,
				/obj/item/clothing/head/helmet/ms13/military/officer
				)
	var/loot8 = list(
				/obj/item/clothing/suit/armor/ms13/vest,
				/obj/item/clothing/head/helmet/ms13/army/civildefence
				)
	var/loot9 = list(
				/obj/item/clothing/suit/armor/ms13/metal,
				/obj/item/clothing/head/helmet/ms13/bladed
				)
	var/loot10 = list(
				/obj/item/clothing/suit/armor/ms13/vaultvan,
				/obj/item/clothing/head/helmet/ms13/eyebot
				)
	var/loot11 = list(
				/obj/item/clothing/suit/armor/ms13/kit/reinf,
				/obj/item/clothing/head/helmet/ms13/junk
				)
	var/loot12 = list(
				/obj/item/clothing/suit/ms13/trench/black/reinf,
				/obj/item/clothing/head/helmet/ms13/bladed
				)
	var/loot13 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/blue/reinforced,
				/obj/item/clothing/head/helmet/ms13/flight
				)
	var/loot14 = list(
				/obj/item/clothing/suit/armor/ms13/radsuit,
				/obj/item/clothing/head/helmet/ms13/radiationhood
				)

/obj/effect/spawner/random/ms13/guaranteed/armor/tier2/Initialize(mapload)
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8, loot9, loot10, loot11, loot12, loot13, loot14)
	. = ..()

/obj/effect/spawner/random/ms13/guaranteed/armor/tier3
	name = "tier 3 armor spawner"
	spawn_loot_count = 2
	var/loot1 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/blue/armored,
				""
				)
	var/loot2 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/black/armored,
				""
				)
	var/loot3 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/orange/armored,
				""
				)
	var/loot4 = list(
				/obj/item/clothing/suit/toggle/ms13/wjacket/brown/armored,
				""
				)
	var/loot5 = list(
				/obj/item/clothing/suit/armor/ms13/metal/reinforced,
				/obj/item/clothing/head/helmet/ms13/assaultron
				)
	var/loot6 = list(
				/obj/item/clothing/suit/ms13/trench/black/armored,
				""
				)
	var/loot7 = list(
				/obj/item/clothing/suit/armor/ms13/leatherarmor/reinforced,
				/obj/item/clothing/head/helmet/ms13/flight
				)
	var/loot8 = list(
				/obj/item/clothing/suit/armor/ms13/combat,
				/obj/item/clothing/head/helmet/ms13/combat
				)

/obj/effect/spawner/random/ms13/guaranteed/armor/tier3/Initialize(mapload)
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7, loot8)
	. = ..()

/obj/effect/spawner/random/ms13/guaranteed/armor/tier4
	name = "tier 4 armor spawner"
	spawn_loot_count = 2
	var/loot1 = list(
				/obj/item/clothing/suit/armor/ms13/combat/advanced,
				/obj/item/clothing/head/helmet/ms13/combat/advanced
				)
	var/loot2 = list(
				/obj/item/clothing/suit/armor/ms13/tesla,
				/obj/item/clothing/head/helmet/ms13/tesla
				)
	var/loot3 = list(
				/obj/item/clothing/suit/armor/ms13/eliteriot,
				/obj/item/clothing/head/helmet/ms13/eliteriot
				)
	var/loot4 = list(
				/obj/item/clothing/suit/armor/ms13/metal/heavy,
				/obj/item/clothing/head/helmet/ms13/metal
				)
	var/loot5 = list(
				/obj/item/clothing/suit/armor/ms13/vest/military,
				/obj/item/clothing/head/helmet/ms13/army
				)
	var/loot6 = list(
				/obj/item/clothing/suit/armor/ms13/assassin,
				""
				)

/obj/effect/spawner/random/ms13/guaranteed/armor/tier4/Initialize(mapload)
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6)
	. = ..()

/obj/effect/spawner/random/ms13/guaranteed/armor/lowrandom
	name = "low tier random armor spawner"
	spawn_loot_count = 1
	loot = list(
			/obj/effect/spawner/random/ms13/guaranteed/armor/tier1 = 60,
			/obj/effect/spawner/random/ms13/guaranteed/armor/tier2 = 40,
			)

/obj/effect/spawner/random/ms13/guaranteed/armor/highrandom
	name = "high tier random armor spawner"
	spawn_loot_count = 1
	loot = list(
			/obj/effect/spawner/random/ms13/guaranteed/armor/tier2 = 10,
			/obj/effect/spawner/random/ms13/guaranteed/armor/tier3 = 60,
			/obj/effect/spawner/random/ms13/guaranteed/armor/tier4 = 30,
			)

/obj/effect/spawner/random/ms13/guaranteed/armor/headgear
	name = "miscellaneous armored headgear spawner"
	spawn_loot_count = 1
	icon_state = "ms13_helmet-static"
	loot = list(
			/obj/item/clothing/head/helmet/ms13/assaultron,
			/obj/item/clothing/head/helmet/ms13/flight,
			/obj/item/clothing/head/helmet/ms13/flight/yellow,
			/obj/item/clothing/head/helmet/ms13/flight/red,
			/obj/item/clothing/head/helmet/ms13/bladed,
			/obj/item/clothing/head/helmet/ms13/junk,
			/obj/item/clothing/head/helmet/ms13/skull,
			/obj/item/clothing/head/helmet/ms13/skull/muffalo,
			/obj/item/clothing/head/helmet/ms13/eyebot,
			/obj/item/clothing/head/helmet/ms13/medical,
			/obj/item/clothing/head/helmet/ms13/batter,
			/obj/item/clothing/head/helmet/ms13/batter/red,
			/obj/item/clothing/head/helmet/ms13/batter/blue,
			/obj/item/clothing/head/helmet/ms13/hardhat,
			/obj/item/clothing/head/hardhat/ms13/mining,
			/obj/item/clothing/head/ms13/hood/banded,
			/obj/item/clothing/head/ms13/hood/plated,
			/obj/item/clothing/head/ms13/hood/inquisitor,
			/obj/item/clothing/head/ms13/hood/sack/padded,
			/obj/item/clothing/head/ms13/hood/sack/metal,
			/obj/item/clothing/head/ms13/hood/hunter,
			/obj/item/clothing/head/welding/ms13,
			/obj/item/clothing/head/helmet/ms13/army/civildefence
			)

/obj/effect/spawner/random/ms13/guaranteed/armor/military
	name = "military armor spawner"
	spawn_loot_count = 2

	var/loot1 = list(
				/obj/item/clothing/suit/armor/ms13/combat/advanced,
				/obj/item/clothing/head/helmet/ms13/combat/advanced
				)
	var/loot2 = list(
				/obj/item/clothing/suit/armor/ms13/tesla,
				/obj/item/clothing/head/helmet/ms13/tesla
				)
	var/loot3 = list(
				/obj/item/clothing/suit/armor/ms13/eliteriot,
				/obj/item/clothing/head/helmet/ms13/eliteriot
				)
	var/loot4 = list(
				/obj/item/clothing/suit/armor/ms13/vest/military,
				/obj/item/clothing/head/helmet/ms13/army
				)
	var/loot5 = list(
				/obj/item/clothing/suit/armor/ms13/assassin,
				""
				)
	var/loot6 = list(
				/obj/item/clothing/suit/armor/ms13/combat,
				/obj/item/clothing/head/helmet/ms13/combat
				)


/obj/effect/spawner/random/ms13/guaranteed/armor/military/Initialize(mapload) //on mapload, pick what to spawn
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6)
	. = ..()

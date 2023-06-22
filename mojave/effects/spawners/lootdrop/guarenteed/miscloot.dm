//// These spawners are guaranteed spawns. If you are making changes to these pools, you should probably also make changes to the non-static spawns outside of the guaranteed folder. ////
//// The idea of these spawners it to use these SPARINGLY. Emphasis on SPARINGLY... Examples of where to use these are: High tier dungeons / Faction bases ////

/obj/effect/spawner/random/ms13/guaranteed
	name = "DO NOT USE ME - Mojave Sun loot spawners"
	icon = 'mojave/icons/effects/random_spawners.dmi'
	icon_state = "loot-static"
	spawn_loot_double = FALSE
	spawn_loot_split = TRUE
	spawn_loot_chance = 100 // HIGHLY experimental concept. Based around being able to place stuff absolutely everywhere, and have it procedurally place it all down, ideally destroying metarush. BOOM.

/obj/effect/spawner/random/ms13/guaranteed/tools
	name = "DO NOT USE ME - Mojave Sun tool/hardware spawners"
	spawn_loot_count = 1
	spawn_loot_double = FALSE

/obj/effect/spawner/random/ms13/guaranteed/tools/hardware
	name = "general hardware spawner"
	loot = list(
			/obj/effect/spawner/random/ms13/guaranteed/tools/lights = 15,
			/obj/effect/spawner/random/ms13/guaranteed/tools/tool = 50,
			/obj/effect/spawner/random/ms13/guaranteed/tools/fishing = 5,
			/obj/effect/spawner/random/ms13/guaranteed/crafting/lowrandom = 30
			)

/obj/effect/spawner/random/ms13/guaranteed/tools/tool
	name = "tool spawner"
	loot = list(
			/obj/item/ms13/hammer,
			/obj/item/ms13/handsaw,
			/obj/item/wirecutters/ms13,
			/obj/item/screwdriver/ms13,
			/obj/item/ms13/handdrill,
			/obj/item/wrench/ms13,
			/obj/item/shovel/ms13,
			/obj/item/crowbar/ms13,
			/obj/item/weldingtool/ms13,
			/obj/item/shovel/ms13/spade,
			/obj/item/shovel/ms13/snow,
			/obj/item/shovel/ms13/rake,
			/obj/item/ms13/brick,
			/obj/item/pickaxe/ms13
			)

/obj/effect/spawner/random/ms13/guaranteed/tools/lights
	name = "lighting tool spawner"
	loot = list(
			/obj/item/flashlight/flare/ms13 = 40,
			/obj/item/flashlight/ms13 = 25,
			/obj/item/flashlight/ms13/mag = 10,
			/obj/item/flashlight/ms13/crafted = 25
			)

/obj/effect/spawner/random/ms13/guaranteed/tools/radio
	name = "low tier radio spawner"
	loot = list(
			/obj/item/radio/ms13 = 75,
			/obj/item/radio/ms13/broadcast = 25
			)

/obj/effect/spawner/random/ms13/guaranteed/tools/radio/high
	name = "high tier radio spawner"
	loot = list(
			/obj/item/radio/ms13/broadcast/advanced = 65,
			/obj/item/radio/ms13/broadcast = 35
			)

/obj/effect/spawner/random/ms13/guaranteed/tools/fishing
	name = "fishing rod spawner"
	loot = list(
			/obj/item/ms13/tools/fishing_rod/basic = 70,
			/obj/item/ms13/tools/fishing_rod/telescopic = 20,
			/obj/item/ms13/tools/fishing_rod/advanced = 10
			)

//CRAFTING SPAWNERS BELOW//

/obj/effect/spawner/random/ms13/guaranteed/crafting
	name = "DO NOT USE ME - Mojave Sun crafting spawners"
	spawn_loot_count = 2
	spawn_loot_double = TRUE

/obj/effect/spawner/random/ms13/guaranteed/crafting/lowrandom
	name = "low tier random crafting spawner"
	loot = list(
			/obj/item/stack/sheet/ms13/wood/scrap_wood/two,
			/obj/item/stack/sheet/ms13/wood/plank,
			/obj/item/stack/sheet/ms13/leather/two,
			/obj/item/stack/sheet/ms13/thread/two,
			/obj/item/stack/sheet/ms13/scrap_electronics/two,
			/obj/item/stack/sheet/ms13/scrap_copper/two,
			/obj/item/stack/sheet/ms13/cloth/two,
			/obj/item/ms13/component/gunpowder/lq,
			/obj/item/ms13/component/cell,
			/obj/item/stack/sheet/ms13/scrap_lead/two,
			/obj/item/stack/sheet/ms13/scrap_silver/two,
			/obj/item/stack/sheet/ms13/scrap_gold/two,
			/obj/item/stack/sheet/ms13/scrap_alu/two,
			/obj/item/stack/sheet/ms13/scrap_brass/two,
			/obj/item/stack/sheet/ms13/scrap_steel/two,
			/obj/item/stack/sheet/ms13/glass/two,
			/obj/item/stack/sheet/ms13/ceramic/two,
			/obj/item/stack/sheet/ms13/plastic/two,
			/obj/item/stack/sheet/ms13/rubber/two,
			/obj/item/stack/sheet/ms13/scrap_parts/two,
			/obj/item/stack/sheet/ms13/scrap/two
	)

/obj/effect/spawner/random/ms13/guaranteed/crafting/highrandom
	name = "high tier random crafting spawner"
	loot = list(
			/obj/item/ms13/component/gunpowder,
			/obj/item/stack/sheet/ms13/refined_lead/two,
			/obj/item/stack/sheet/ms13/refined_silver/two,
			/obj/item/stack/sheet/ms13/refined_gold/two,
			/obj/item/stack/sheet/ms13/refined_alu/two,
			/obj/item/stack/sheet/ms13/refined_brass/two,
			/obj/item/stack/sheet/ms13/refined_steel/two,
			/obj/item/stack/sheet/ms13/refined_copper/two,
			/obj/item/stack/sheet/ms13/scrap_parts/ten,
			/obj/item/stack/sheet/ms13/circuits/two,
			/obj/item/stack/sheet/ms13/mil_fiber/two,
			/obj/item/ms13/component/plasma_battery,
			/obj/item/ms13/component/vacuum_tube
	)

/obj/effect/spawner/random/ms13/guaranteed/crafting/household
	name = "household random crafting spawner"
	loot = list(
			/obj/item/stack/sheet/ms13/thread/two,
			/obj/item/stack/sheet/ms13/scrap_electronics/two,
			/obj/item/stack/sheet/ms13/cloth/two,
			/obj/item/ms13/component/cell,
			/obj/item/stack/sheet/ms13/glass/two,
			/obj/item/stack/sheet/ms13/ceramic/two,
			/obj/item/stack/sheet/ms13/plastic/two,
			/obj/item/stack/sheet/ms13/rubber/two,
			/obj/item/stack/sheet/ms13/scrap_parts/two
	)

/obj/effect/spawner/random/ms13/guaranteed/crafting/electrical
	name = "electrical random crafting spawner"
	spawn_loot_count = 1
	loot = list(
			/obj/item/stack/sheet/ms13/scrap_electronics/two = 40,
			/obj/item/ms13/component/cell = 25,
			/obj/item/ms13/component/vacuum_tube = 10,
			/obj/item/stack/sheet/ms13/circuits/two = 10,
			/obj/item/stack/sheet/ms13/scrap_copper/two = 25
	)

/obj/effect/spawner/random/ms13/guaranteed/crafting/precious
	name = "precious metals spawner"
	loot = list(
			/obj/item/stack/sheet/ms13/scrap_silver/five = 40,
			/obj/item/stack/sheet/ms13/scrap_gold/five = 40,
			/obj/item/stack/sheet/ms13/refined_silver/two = 10,
			/obj/item/stack/sheet/ms13/refined_gold/two = 10
	)

/obj/effect/spawner/random/ms13/guaranteed/crafting/refined
	name = "refined metals spawner"
	loot = list(
			/obj/item/stack/sheet/ms13/refined_silver/two,
			/obj/item/stack/sheet/ms13/refined_gold/two,
			/obj/item/stack/sheet/ms13/refined_alu/two,
			/obj/item/stack/sheet/ms13/refined_brass/two,
			/obj/item/stack/sheet/ms13/refined_lead/two,
			/obj/item/stack/sheet/ms13/refined_steel/two,
			/obj/item/stack/sheet/ms13/refined_copper/two
	)

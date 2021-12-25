/obj/effect/spawner/random/ms13
	name = "DO NOT USE ME - Mojave Sun loot spawners"
	icon = 'mojave/icons/effects/random_spawners.dmi'
	icon_state = "loot"
	spawn_loot_double = FALSE
	spawn_loot_split = TRUE
	spawn_loot_chance = 40 // HIGHLY experimental concept. Based around being able to place stuff absolutely everywhere, and have it procedurally place it all down, ideally destroying metarush. BOOM.

/obj/effect/spawner/random/ms13/tools
	name = "DO NOT USE ME - Mojave Sun melee spawners"
	spawn_loot_count = 1
	spawn_loot_double = FALSE

/obj/effect/spawner/random/ms13/tools/hardware
	name = "general hardware spawner"
	spawn_loot_chance = 65
	loot = list(
			/obj/effect/spawner/random/ms13/tools/lights = 15,
			/obj/effect/spawner/random/ms13/tools/radio = 10,
			/obj/effect/spawner/random/ms13/tools/tool = 65,
			/obj/effect/spawner/random/ms13/tools/fishing = 10,
			)

/obj/effect/spawner/random/ms13/tools/tool
	name = "tool spawner"
	spawn_loot_chance = 90
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
			/obj/item/ms13/brick
			)

/obj/effect/spawner/random/ms13/tools/lights
	name = "lighting tool spawner"
	spawn_loot_chance = 80
	loot = list(
			/obj/item/flashlight/flare/ms13 = 35,
			/obj/item/flashlight/ms13 = 25,
			/obj/item/flashlight/ms13/mag = 10,
			/obj/item/flashlight/ms13/crafted = 30
			)

/obj/effect/spawner/random/ms13/tools/radio
	name = "low tier radio spawner"
	spawn_loot_chance = 65
	loot = list(
			/obj/item/radio/ms13 = 75,
			/obj/item/radio/ms13/broadcast = 25
			)

/obj/effect/spawner/random/ms13/tools/radio/high
	name = "high tier radio spawner"
	spawn_loot_chance = 75
	loot = list(
			/obj/item/radio/ms13/broadcast/prewar = 65,
			/obj/item/radio/ms13/broadcast = 35
			)

/obj/effect/spawner/random/ms13/tools/fishing
	name = "fishing rod spawner"
	spawn_loot_chance = 75
	loot = list(
			/obj/item/ms13/tools/fishing_rod/basic = 60,
			/obj/item/ms13/tools/fishing_rod/telescopic = 30,
			/obj/item/ms13/tools/fishing_rod/advanced = 10
			)

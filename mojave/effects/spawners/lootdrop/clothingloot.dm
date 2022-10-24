//// These spawners are NON-STATIC spawns. If you are making changes to these pools, you should probably also make changes to the static spawns outside of the guaranteed folder. ////
//// The idea of these spawners it to use these EVERYWHERE. Emphasis on EVERYWHERE!!! These are the spawners you should be slapping in every other building, so that there's variety in loot locations on a per-round basis. ////

/obj/effect/spawner/random/ms13/clothing
	name = "DO NOT USE ME - Mojave Sun clothing spawners"
	spawn_loot_chance = 65

/obj/effect/spawner/random/ms13/clothing/under
	name = "miscellaneous undersuit spawner"
	icon_state = "ms13_under"
	spawn_loot_count = 1
	loot = list(
		/obj/item/clothing/under/ms13/wasteland/caravanpants,
		/obj/item/clothing/under/ms13/wasteland/pants,
		/obj/item/clothing/under/ms13/wasteland/ghoulpants,
		/obj/item/clothing/under/ms13/wasteland/warboypants,
		/obj/item/clothing/under/ms13/wasteland/rag,
		/obj/item/clothing/under/ms13/wasteland/worn,
		/obj/item/clothing/under/ms13/wasteland/doctor,
		/obj/item/clothing/under/ms13/wasteland/peasant,
		/obj/item/clothing/under/ms13/wasteland/cowboy,
		/obj/item/clothing/under/ms13/wasteland/cowboy/grey,
		/obj/item/clothing/under/ms13/wasteland/cowboy/tan,
		/obj/item/clothing/under/ms13/wasteland/manager,
		/obj/item/clothing/under/ms13/wasteland/wanderer,
		/obj/item/clothing/under/ms13/wasteland/rancher,
		/obj/item/clothing/under/ms13/wasteland/vestslacks,
		/obj/item/clothing/under/ms13/wasteland/merchant,
		/obj/item/clothing/under/ms13/wasteland/guard,
		/obj/item/clothing/under/ms13/wasteland/caravaneer,
		/obj/item/clothing/under/ms13/wasteland/merca,
		/obj/item/clothing/under/ms13/wasteland/machinist,
		/obj/item/clothing/under/ms13/wasteland/lumberjack,
		/obj/item/clothing/under/ms13/wasteland/mercc,
		/obj/item/clothing/under/ms13/wasteland/roving,
		/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgrey,
		/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgreen,
		/obj/item/clothing/under/ms13/wasteland/heeledsuit,
		/obj/item/clothing/under/ms13/wasteland/gentlemansuit,
		/obj/item/clothing/under/ms13/wasteland/gentlemansuit/classy,
		/obj/item/clothing/under/ms13/wasteland/gentlemansuit/vintage,
		/obj/item/clothing/under/ms13/wasteland/barmansuit)

/obj/effect/spawner/random/ms13/clothing/shoe
	name = "miscellaneous shoe spawner"
	icon_state = "ms13_shoes"
	spawn_loot_count = 1
	loot = list(
		/obj/item/clothing/shoes/ms13/rag,
		/obj/item/clothing/shoes/ms13/tan,
		/obj/item/clothing/shoes/ms13/brownie,
		/obj/item/clothing/shoes/ms13/fancy,
		/obj/item/clothing/shoes/ms13/winter,
		/obj/item/clothing/shoes/ms13/winter/black,
		/obj/item/clothing/shoes/ms13/cowboy,
		/obj/item/clothing/shoes/ms13/explorer,
		/obj/item/clothing/shoes/ms13/military,
		/obj/item/clothing/shoes/ms13/military/diesel,
		/obj/item/clothing/shoes/ms13/military/diesel/female)

/obj/effect/spawner/random/ms13/clothing/glasses
	name = "miscellaneous glasses spawner"
	icon_state = "ms13_glasses"
	spawn_loot_count = 1
	loot = list(
		/obj/item/clothing/glasses/ms13/black,
		/obj/item/clothing/glasses/ms13/cap,
		/obj/item/clothing/glasses/ms13/cap/nuka,
		/obj/item/clothing/glasses/ms13/old,
		/obj/item/clothing/glasses/ms13/fashionable,
		/obj/item/clothing/glasses/ms13/leather,
		/obj/item/clothing/glasses/ms13/metal,
		/obj/item/clothing/glasses/ms13/cool,
		/obj/item/clothing/glasses/ms13/goggles,
		/obj/item/clothing/glasses/ms13/sunglasses,
		/obj/item/clothing/glasses/ms13/welding)

/obj/effect/spawner/random/ms13/clothing/gloves
	name = "miscellaneous gloves spawner"
	spawn_loot_count = 1
	loot = list(
		/obj/item/clothing/gloves/ms13/winter,
		/obj/item/clothing/gloves/ms13/winter/black,
		/obj/item/clothing/gloves/ms13/baseball,
		/obj/item/clothing/gloves/ms13/leather)

/obj/effect/spawner/random/ms13/clothing/mask
	name = "miscellaneous mask spawner"
	spawn_loot_count = 1
	loot = list(
		/obj/item/clothing/mask/ms13/bandana,
		/obj/item/clothing/mask/ms13/bandana/blue,
		/obj/item/clothing/mask/ms13/bandana/red,
		/obj/item/clothing/mask/ms13/bandana/white,
		/obj/item/clothing/mask/ms13/bandana/patriot,
		/obj/item/clothing/mask/ms13/bandana/leapord,
		/obj/item/clothing/mask/ms13/bandana/camo,
		/obj/item/clothing/mask/ms13/bandana/crips,
		/obj/item/clothing/mask/ms13/bandana/bloods,
		/obj/item/clothing/mask/ms13/bandana/grove,
		/obj/item/clothing/mask/ms13/bandana/surgical,
		/obj/item/clothing/mask/gas/ms13/modern,
		/obj/item/clothing/head/welding/ms13)

/obj/effect/spawner/random/ms13/clothing/hat
	name = "miscellaneous hat spawner"
	icon_state = "ms13_hat"
	spawn_loot_count = 1
	loot = list(
			/obj/item/clothing/head/ms13/hood/sack,
			/obj/item/clothing/head/helmet/ms13/fedora,
			/obj/item/clothing/head/helmet/ms13/fedora/blue,
			/obj/item/clothing/head/helmet/ms13/fedora/brown,
			/obj/item/clothing/head/helmet/ms13/fedora/yellow,
			/obj/item/clothing/head/helmet/ms13/bowler,
			/obj/item/clothing/head/helmet/ms13/cowboy,
			/obj/item/clothing/head/helmet/ms13/cowboy/black,
			/obj/item/clothing/head/helmet/ms13/prospector,
			/obj/item/clothing/head/helmet/ms13/militia,
			/obj/item/clothing/head/helmet/ms13/tricorn,
			/obj/item/clothing/head/helmet/ms13/tricorn/pirate,
			/obj/item/clothing/head/helmet/ms13/baseball,
			/obj/item/clothing/head/helmet/ms13/military,
			/obj/item/clothing/head/helmet/ms13/military/officer,
			/obj/item/clothing/head/helmet/ms13/military/officer/white,
			/obj/item/clothing/head/helmet/ms13/military/officer/chinese,
			/obj/item/clothing/head/helmet/ms13/sailor,
			/obj/item/clothing/head/helmet/ms13/postman,
			/obj/item/clothing/head/helmet/ms13/police,
			/obj/item/clothing/head/helmet/ms13/fisher,
			/obj/item/clothing/head/helmet/ms13/bandanacap,
			/obj/item/clothing/head/helmet/ms13/bandanacap/ms13,
			/obj/item/clothing/head/helmet/ms13/beret,
			/obj/item/clothing/head/helmet/ms13/newsboy,
			/obj/item/clothing/head/helmet/ms13/trilby,
			/obj/item/clothing/head/helmet/ms13/beanie,
			/obj/item/clothing/head/helmet/ms13/chef,
			/obj/item/clothing/head/helmet/ms13/ushanka,
			/obj/item/clothing/head/helmet/ms13/ushanka/blue,
			/obj/item/clothing/head/helmet/ms13/ushanka/green)

/obj/effect/spawner/random/ms13/clothing/backpack
	name = "standard backpack spawner"
	icon_state = "loot" //:wploot:
	spawn_loot_count = 1
	loot = list(
			/obj/item/storage/ms13/satchel,
			/obj/item/storage/ms13/nuka_bag,
			/obj/item/storage/ms13/corvega_bag,
			/obj/item/storage/ms13/leather_backpack)

/obj/effect/spawner/random/ms13/clothing/backpack/high
	name = "high tier backpack spawner"
	spawn_loot_chance = 60
	loot = list(
			/obj/item/storage/ms13/military,
			/obj/item/storage/ms13/military_duffel)

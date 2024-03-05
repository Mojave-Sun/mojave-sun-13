//// These spawners are NON-STATIC spawns. If you are making changes to these pools, you should probably also make changes to the static spawns outside of the guaranteed folder. ////
//// The idea of these spawners it to use these EVERYWHERE. Emphasis on EVERYWHERE!!! These are the spawners you should be slapping in every other building, so that there's variety in loot locations on a per-round basis. ////

/obj/effect/spawner/random/ms13/food
	name = "DO NOT USE ME - Mojave Sun food spawners"
	spawn_loot_count = 1
	spawn_loot_chance = 33 // Low spawn chance is a reoccuring theme here.

/obj/effect/spawner/random/ms13/seeds
	name = "DO NOT USE ME - Mojave Sun seed spawners"
	icon_state = "ms13_seeds"
	spawn_loot_chance = 33 // Low chance- Like I said above.

// Produce- Vegetables/Fruit //

/obj/effect/spawner/random/ms13/food/produce_random
	name = "random produce spawner"
	icon_state = "ms13_produce"
	loot = list(
		/obj/item/food/grown/ms13/barrelcactus,
		/obj/item/food/grown/ms13/mutfruit,
		/obj/item/food/grown/ms13/cmutfruit,
		/obj/item/food/grown/ms13/apple,
		/obj/item/food/grown/ms13/pricklypear,
		/obj/item/food/grown/ms13/pungafruit,
		/obj/item/food/grown/ms13/geigpungafruit,
		/obj/item/food/grown/ms13/snaptail,
		/obj/item/food/grown/ms13/tarberry,
		/obj/item/food/grown/ms13/blackberry,
		/obj/item/food/grown/ms13/radberry,
		/obj/item/food/grown/ms13/yucca,
		/obj/item/food/grown/ms13/tato,
		/obj/item/food/grown/ms13/jalepeno,
		/obj/item/food/grown/ms13/radpepper,
		/obj/item/food/grown/ms13/onion,
		/obj/item/food/grown/ms13/garlic,
		/obj/item/food/grown/ms13/xander,
		/obj/item/food/grown/ms13/carrot,
		/obj/item/food/grown/ms13/razorgrain,
		/obj/item/food/grown/ms13/baifan,
		/obj/item/food/grown/ms13/cabbage,
		/obj/item/food/grown/ms13/pinyon,
		/obj/item/food/grown/ms13/mesquite,
		/obj/item/food/grown/ms13/buffalo,
		/obj/item/food/grown/ms13/maize,
		/obj/item/food/grown/ms13/ashrose,
		/obj/item/food/grown/ms13/radrose,
		/obj/item/food/grown/ms13/soot,
		/obj/item/food/grown/ms13/toxicsoot,
		/obj/item/food/grown/ms13/datura,
		/obj/item/food/grown/ms13/radtura,
		/obj/item/food/grown/ms13/coyote,
		/obj/item/food/grown/ms13/ashblossom,
		/obj/item/food/grown/ms13/agave,
		/obj/item/food/grown/ms13/brocflower,
		/obj/item/food/grown/ms13/cavefungus,
		/obj/item/food/grown/ms13/glowfungus,
		/obj/item/food/grown/ms13/blight,
		/obj/item/food/grown/ms13/brainfung,
		/obj/item/food/grown/ms13/firecap,
		/obj/item/food/grown/ms13/gutshroom,
		/obj/item/food/grown/ms13/lureweed,
		/obj/item/food/grown/ms13/nara,
		/obj/item/food/grown/ms13/flyamanita,
		/obj/item/food/grown/ms13/pennybun,
		/obj/item/food/grown/ms13/chanterelle,
		/obj/item/food/grown/ms13/mindshroom,
		/obj/item/food/grown/ms13/gremlinstool
		)

/obj/effect/spawner/random/ms13/food/produce_safe
	name = "safe produce spawner" //For places where you might not randomly find an agressive chaos agent like brainfungus
	icon_state = "ms13_produce"
	loot = list(
		/obj/item/food/grown/ms13/barrelcactus,
		/obj/item/food/grown/ms13/mutfruit,
		/obj/item/food/grown/ms13/cmutfruit,
		/obj/item/food/grown/ms13/apple,
		/obj/item/food/grown/ms13/pricklypear,
		/obj/item/food/grown/ms13/pungafruit,
		/obj/item/food/grown/ms13/geigpungafruit,
		/obj/item/food/grown/ms13/snaptail,
		/obj/item/food/grown/ms13/tarberry,
		/obj/item/food/grown/ms13/blackberry,
		/obj/item/food/grown/ms13/radberry,
		/obj/item/food/grown/ms13/yucca,
		/obj/item/food/grown/ms13/tato,
		/obj/item/food/grown/ms13/jalepeno,
		/obj/item/food/grown/ms13/radpepper,
		/obj/item/food/grown/ms13/onion,
		/obj/item/food/grown/ms13/garlic,
		/obj/item/food/grown/ms13/xander,
		/obj/item/food/grown/ms13/carrot,
		/obj/item/food/grown/ms13/razorgrain,
		/obj/item/food/grown/ms13/baifan,
		/obj/item/food/grown/ms13/cabbage,
		/obj/item/food/grown/ms13/pinyon,
		/obj/item/food/grown/ms13/mesquite,
		/obj/item/food/grown/ms13/buffalo,
		/obj/item/food/grown/ms13/maize,
		/obj/item/food/grown/ms13/coyote,
		/obj/item/food/grown/ms13/agave,
		/obj/item/food/grown/ms13/brocflower,
		/obj/item/food/grown/ms13/cavefungus
		)

/obj/effect/spawner/random/ms13/food/produce_mushrooms
	name = "random produce spawner"
	icon_state = "ms13_mushroom"
	loot = list(
		/obj/item/food/grown/ms13/cavefungus,
		/obj/item/food/grown/ms13/glowfungus,
		/obj/item/food/grown/ms13/blight,
		/obj/item/food/grown/ms13/brainfung,
		/obj/item/food/grown/ms13/firecap,
		/obj/item/food/grown/ms13/gutshroom,
		/obj/item/food/grown/ms13/lureweed,
		/obj/item/food/grown/ms13/nara,
		/obj/item/food/grown/ms13/flyamanita,
		/obj/item/food/grown/ms13/pennybun,
		/obj/item/food/grown/ms13/chanterelle,
		/obj/item/food/grown/ms13/mindshroom,
		/obj/item/food/grown/ms13/gremlinstool
		)

// Pre-War Junkfoods //

/obj/effect/spawner/random/ms13/food/junkfood_canned
	name = "random prewar canned food spawner"
	icon_state = "loot"
	loot = list(
		/obj/item/food/ms13/prewar/canned/porknbeans,
		/obj/item/food/ms13/prewar/canned/cajunrice,
		/obj/item/food/ms13/prewar/canned/dogfood
		)

/obj/effect/spawner/random/ms13/food/junkfood_boxed
	name = "random prewar boxed food spawner"
	icon_state = "loot"
	loot = list(
		/obj/item/food/ms13/prewar/boxed/crisps,
		/obj/item/food/ms13/prewar/boxed/macncheese,
		/obj/item/food/ms13/prewar/boxed/cheesypoof,
		/obj/item/food/ms13/prewar/boxed/sugarbombs,
		/obj/item/food/ms13/prewar/boxed/deviledeggs,
		/obj/item/food/ms13/prewar/boxed/dandyapples,
		/obj/item/food/ms13/prewar/boxed/snackcake,
		/obj/item/food/ms13/prewar/boxed/salisburysteak,
		/obj/item/food/ms13/prewar/boxed/instamash
		)

// Seed spawners //

/obj/effect/spawner/random/ms13/seeds/random
	name = "seed spawner"
	loot = list(
		/obj/item/seeds/ms13/barrelcactus,
		/obj/item/seeds/ms13/mutfruit,
		/obj/item/seeds/ms13/cmutfruit,
		/obj/item/seeds/ms13/apple,
		/obj/item/seeds/ms13/pricklypear,
		/obj/item/seeds/ms13/punga,
		/obj/item/seeds/ms13/geigpunga,
		/obj/item/seeds/ms13/snaptail,
		/obj/item/seeds/ms13/tarberry,
		/obj/item/seeds/ms13/blackberry,
		/obj/item/seeds/ms13/radberry,
		/obj/item/seeds/ms13/yucca,
		/obj/item/seeds/ms13/tato,
		/obj/item/seeds/ms13/jalepeno,
		/obj/item/seeds/ms13/radpepper,
		/obj/item/seeds/ms13/onion,
		/obj/item/seeds/ms13/garlic,
		/obj/item/seeds/ms13/xander,
		/obj/item/seeds/ms13/carrot,
		/obj/item/seeds/ms13/razorgrain,
		/obj/item/seeds/ms13/baifan,
		/obj/item/seeds/ms13/cabbage,
		/obj/item/seeds/ms13/pinyon,
		/obj/item/seeds/ms13/mesquite,
		/obj/item/seeds/ms13/buffalo,
		/obj/item/seeds/ms13/maize,
		/obj/item/seeds/ms13/ashrose,
		/obj/item/seeds/ms13/radrose,
		/obj/item/seeds/ms13/soot,
		/obj/item/seeds/ms13/toxicsoot,
		/obj/item/seeds/ms13/datura,
		/obj/item/seeds/ms13/radtura,
		/obj/item/seeds/ms13/coyote,
		/obj/item/seeds/ms13/ashblossom,
		/obj/item/seeds/ms13/agave,
		/obj/item/seeds/ms13/brocflower
		)

/obj/effect/spawner/random/ms13/seeds/spores
	name = "mushroom spore spawner"
	loot = list(
		/obj/item/seeds/ms13/cavefungus,
		/obj/item/seeds/ms13/glowfungus,
		/obj/item/seeds/ms13/blight,
		/obj/item/seeds/ms13/brainfung,
		/obj/item/seeds/ms13/firecap,
		/obj/item/seeds/ms13/gutshroom,
		/obj/item/seeds/ms13/lureweed,
		/obj/item/seeds/ms13/nara,
		/obj/item/seeds/ms13/flyamanita,
		/obj/item/seeds/ms13/pennybun,
		/obj/item/seeds/ms13/chanterelle,
		/obj/item/seeds/ms13/mindshroom,
		/obj/item/seeds/ms13/gremlinstool
		)

// THE TIER FIVE PRODUCE. //

/obj/effect/spawner/random/ms13/food/unique_produce
	name = "UNIQUE produce spawner" // This is a meme.
	spawn_loot_chance = 5 // FWOOOOAH. TOMATOPOTATO. Tomatos and Potatos are supposed to be 'extict' and combined into one- A tato. I think it'd be funny to have a SUPER LOW CHANCE to find this relic of the past.
	loot = list(
		/obj/item/food/grown/ms13/potato,
		/obj/item/food/grown/ms13/tomato
		)

/obj/effect/spawner/random/ms13/seeds/unique
	name = "UNIQUE seed spawner"
	spawn_loot_chance = 5 // FWOOOOAH. TOMATOPOTATO. Tomatos and Potatos are supposed to be 'extict' and combined into one- A tato. I think it'd be funny to have a SUPER LOW CHANCE to find this relic of the past.
	loot = list(
		/obj/item/seeds/ms13/potato,
		/obj/item/seeds/ms13/tomato
		)

/obj/effect/spawner/random/ms13/food/random
	name = "random food spawner"
	spawn_loot_count = 1
	loot = list(
			/obj/effect/spawner/random/ms13/food/junkfood_boxed = 10,
			/obj/effect/spawner/random/ms13/guaranteed/food/produce_random = 60,
			/obj/effect/spawner/random/ms13/food/junkfood_canned = 30,
			)

/obj/effect/spawner/random/ms13/food/packaged
	name = "random pre-war food spawner"
	spawn_loot_count = 1
	loot = list(
			/obj/effect/spawner/random/ms13/food/junkfood_boxed = 50,
			/obj/effect/spawner/random/ms13/food/junkfood_canned = 50,
			)

/obj/effect/spawner/random/ms13/food/trash
	name = "random pre-war food trash spawner"
	spawn_loot_chance = 40
	loot = list(
		/obj/item/trash/ms13/cans/dogfood,
		/obj/item/trash/ms13/cans/porknbeans,
		/obj/item/trash/ms13/cans/seafood,
		/obj/item/trash/ms13/cans/cajunrice,
		/obj/item/trash/ms13/packaging/salisbury,
		/obj/item/trash/ms13/packaging/crisps,
		/obj/item/trash/ms13/packaging/dandy,
		/obj/item/trash/ms13/packaging/snackcake,
		/obj/item/trash/ms13/packaging/macncheese,
		/obj/item/trash/ms13/packaging/poofs,
		/obj/item/trash/ms13/packaging/sugarbombs,
		/obj/item/trash/ms13/packaging/yumegg,
		/obj/item/trash/ms13/packaging/instamash,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/plain
		)

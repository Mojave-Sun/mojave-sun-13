//// These spawners are GUARANTEED spawns. If you are making changes to these pools, you should probably also make changes to the non-static spawns outside of the guaranteed folder. ////
//// The idea of these spawners it to use these SPARINGLY. Emphasis on SPARINGLY... Examples of where to use these are: High tier dungeons / Faction bases ////

/obj/effect/spawner/random/ms13/guaranteed/currency
	name = "DO NOT USE ME - Mojave Sun currency spawners"
	icon_state = "ms13_currency-static"
	spawn_loot_chance = 100
	spawn_loot_count = 1

// Mammoth spawners //

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/lowrandom
	name = "low tier random Mammoth currency spawner"
	loot = list(
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier1 = 55,
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier2 = 30,
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier3 = 15)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/highrandom
	name = "high tier random Mammoth currency spawner"
	loot = list(
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier2 = 50,
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier3 = 35,
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier4 = 15)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier1
	name = "tier 1 Mammoth currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/ten = 55,
		/obj/item/stack/ms13/currency/ncr_dollar/five = 35,
		/obj/item/stack/ms13/currency/ncr_coin/two = 10)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier2
	name = "tier 2 Mammoth currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/twenty = 55,
		/obj/item/stack/ms13/currency/ncr_dollar/twelve = 35,
		/obj/item/stack/ms13/currency/ncr_coin/five = 10)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier3
	name = "tier 3 Mammoth currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/fifty = 55,
		/obj/item/stack/ms13/currency/ncr_dollar/thirty = 35,
		/obj/item/stack/ms13/currency/ncr_coin/ten = 10)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier4
	name = "tier 4 Mammoth currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/hunned = 60,
		/obj/item/stack/ms13/currency/ncr_dollar/sixty = 40)

// Prewar Currency spawner //

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar
	name = "DO NOT USE ME - Prewar currency spawner"

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/lowrandom
	name = "low tier random Mammoth currency spawner"
	loot = list(
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/tier1 = 55,
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/tier2 = 30,
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/tier3 = 15)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/highrandom
	name = "high tier random Mammoth currency spawner"
	loot = list(
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/tier2 = 50,
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/tier3 = 35,
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/tier4 = 15)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/tier1
	name = "tier 1 prewar Mammoth currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/five,
		/obj/item/stack/ms13/currency/prewar/ten,
		/obj/item/stack/ms13/currency/prewar/twenty,
		/obj/item/stack/ms13/currency/prewar/thirty)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/tier2
	name = "tier 2 prewar Mammoth currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/twenty,
		/obj/item/stack/ms13/currency/prewar/thirty,
		/obj/item/stack/ms13/currency/prewar/fourty,
		/obj/item/stack/ms13/currency/prewar/fifty)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/tier3
	name = "tier 3 prewar Mammoth currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/thirty,
		/obj/item/stack/ms13/currency/prewar/fourty,
		/obj/item/stack/ms13/currency/prewar/fifty,
		/obj/item/stack/ms13/currency/prewar/sixty,
		/obj/item/stack/ms13/currency/prewar/seventy)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/tier4
	name = "tier 4 prewar Mammoth currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/fifty,
		/obj/item/stack/ms13/currency/prewar/sixty,
		/obj/item/stack/ms13/currency/prewar/seventy,
		/obj/item/stack/ms13/currency/prewar/eighty,
		/obj/item/stack/ms13/currency/prewar/hunned)

// NCR Currency spawner // - These are for mostly the NCR base, to give them extra dosh laying around.

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/ncr
	name = "DO NOT USE ME - NCR currency spawner"

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/ncr/low
	name = "low budget NCR currency deficit spawner"
	loot = list(
		/obj/item/stack/ms13/currency/ncr_dollar = 5,
		/obj/item/stack/ms13/currency/ncr_dollar/five = 35,
		/obj/item/stack/ms13/currency/ncr_dollar/ten = 20,
		/obj/item/stack/ms13/currency/ncr_coin = 5,
		/obj/item/stack/ms13/currency/ncr_coin/two = 25,
		/obj/item/stack/ms13/currency/ncr_coin/five = 10)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/ncr/high
	name = "high dolla balla status NCR currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/ncr_dollar/thirty = 25,
		/obj/item/stack/ms13/currency/ncr_dollar/fourty = 30,
		/obj/item/stack/ms13/currency/ncr_dollar/fifty = 15,
		/obj/item/stack/ms13/currency/ncr_coin/ten = 20,
		/obj/item/stack/ms13/currency/ncr_coin/fifteen = 10)

// Drought currency!!!!!

/obj/effect/spawner/random/ms13/guaranteed/currency/drought

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/lowrandom
	name = "low tier random Drought currency spawner"
	loot = list(
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/tier1 = 55,
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/tier2 = 30,
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/tier3 = 15)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/highrandom
	name = "high tier random Drought currency spawner"
	loot = list(
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/tier2 = 55,
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/tier3 = 30,
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/tier4 = 15)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/tier1
	name = "tier 1 Drought currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/cap/four = 40,
		/obj/item/stack/ms13/currency/cap/ten = 20,
		/obj/item/stack/ms13/currency/cap/fifteen = 10,
		/obj/item/stack/ms13/currency/denarius/two = 10,
		/obj/item/stack/ms13/currency/denarius/five = 5,
		/obj/item/stack/ms13/currency/prewar/ten = 15)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/tier2
	name = "tier 2 Drought currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/cap/twentyfive = 45,
		/obj/item/stack/ms13/currency/cap/thirtyfive = 25,
		/obj/item/stack/ms13/currency/denarius/ten = 10,
		/obj/item/stack/ms13/currency/aurelius/two = 5,
		/obj/item/stack/ms13/currency/prewar/thirty = 10,
		/obj/item/stack/ms13/currency/prewar/fourty = 5)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/tier3
	name = "tier 3 Drought currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/cap/fifty = 45,
		/obj/item/stack/ms13/currency/cap/sixty = 25,
		/obj/item/stack/ms13/currency/denarius/twenty = 10,
		/obj/item/stack/ms13/currency/aurelius/five = 5,
		/obj/item/stack/ms13/currency/prewar/fifty = 10,
		/obj/item/stack/ms13/currency/prewar/sixty = 5)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/tier4
	name = "tier 4 Drought currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/cap/eighty = 50,
		/obj/item/stack/ms13/currency/cap/hunned = 20,
		/obj/item/stack/ms13/currency/aurelius/fifteen = 10,
		/obj/item/stack/ms13/currency/aurelius/twenty = 5,
		/obj/item/stack/ms13/currency/prewar/eighty = 10,
		/obj/item/stack/ms13/currency/prewar/hunned = 5)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/legion

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/legion/lowrandom
	name = "low tier random Legion currency spawner"
	spawn_loot_chance = 100
	loot = list(
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/legion/tier1 = 50,
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/legion/tier2 = 40,
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/legion/tier3 = 10)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/legion/highrandom
	name = "high tier random Legion currency spawner"
	spawn_loot_chance = 100
	loot = list(
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/legion/tier1 = 20,
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/legion/tier2 = 50,
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/legion/tier3 = 30)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/legion/tier1
	name = "tier 1 Legion currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/denarius/two = 25,
		/obj/item/stack/ms13/currency/denarius/five = 45,
		/obj/item/stack/ms13/currency/denarius/ten = 20,
		/obj/item/stack/ms13/currency/aurelius/two = 10)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/legion/tier2
	name = "tier 2 Legion currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/denarius/twenty = 35,
		/obj/item/stack/ms13/currency/denarius/twentyfive = 25,
		/obj/item/stack/ms13/currency/aurelius/five = 25,
		/obj/item/stack/ms13/currency/aurelius/ten = 15)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/legion/tier3
	name = "tier 3 Legion currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/denarius/thirty = 30,
		/obj/item/stack/ms13/currency/aurelius/twenty = 45,
		/obj/item/stack/ms13/currency/aurelius/twentyfive = 25)

// Drought Prewar Currency spawner //

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar
	name = "DO NOT USE ME - Drought prewar currency spawners"

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar/lowrandom
	name = "low tier random Drought currency spawner"
	spawn_loot_chance = 100
	loot = list(
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar/tier1 = 55,
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar/tier2 = 30,
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar/tier3 = 15)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar/highrandom
	name = "high tier random Drought currency spawner"
	spawn_loot_chance = 100
	loot = list(
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar/tier2 = 55,
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar/tier3 = 30,
		/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar/tier4 = 15)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar/tier1
	name = "tier 1 prewar Drought currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/five,
		/obj/item/stack/ms13/currency/prewar/ten,
		/obj/item/stack/ms13/currency/prewar/twenty,
		/obj/item/stack/ms13/currency/prewar/thirty)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar/tier2
	name = "tier 2 prewar Drought currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/twenty,
		/obj/item/stack/ms13/currency/prewar/thirty,
		/obj/item/stack/ms13/currency/prewar/fourty,
		/obj/item/stack/ms13/currency/prewar/fifty)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar/tier3
	name = "tier 3 prewar Drought currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/thirty,
		/obj/item/stack/ms13/currency/prewar/fourty,
		/obj/item/stack/ms13/currency/prewar/fifty,
		/obj/item/stack/ms13/currency/prewar/sixty,
		/obj/item/stack/ms13/currency/prewar/seventy)

/obj/effect/spawner/random/ms13/guaranteed/currency/drought/prewar/tier4
	name = "tier 4 prewar Drought currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/fifty,
		/obj/item/stack/ms13/currency/prewar/sixty,
		/obj/item/stack/ms13/currency/prewar/seventy,
		/obj/item/stack/ms13/currency/prewar/eighty,
		/obj/item/stack/ms13/currency/prewar/hunned)

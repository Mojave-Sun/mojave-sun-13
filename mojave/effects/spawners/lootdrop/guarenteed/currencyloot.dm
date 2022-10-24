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
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier1 = 50,
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier2 = 35,
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
		/obj/item/stack/ms13/currency/prewar/ten = 60,
		/obj/item/stack/ms13/currency/ncr_dollar/ten = 25,
		/obj/item/stack/ms13/currency/ncr_coin = 10,
		/obj/item/stack/ms13/currency/cap/five = 5)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier2
	name = "tier 2 Mammoth currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/twenty = 60,
		/obj/item/stack/ms13/currency/ncr_dollar/twenty = 25,
		/obj/item/stack/ms13/currency/ncr_coin/five = 15)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier3
	name = "tier 3 Mammoth currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/fifty = 60,
		/obj/item/stack/ms13/currency/ncr_dollar/fifty = 25,
		/obj/item/stack/ms13/currency/ncr_coin/ten = 15)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/tier4
	name = "tier 4 Mammoth currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/prewar/hunned = 60,
		/obj/item/stack/ms13/currency/ncr_dollar/hunned = 25)

// Prewar Currency spawner //

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar
	name = "DO NOT USE ME - Prewar currency spawner"

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/lowrandom
	name = "low tier random Mammoth currency spawner"
	loot = list(
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/tier1 = 50,
		/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/prewar/tier2 = 35,
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
	name = "low budget NCR currency deficit spawner (MFW no gold reserves... CWINGE!)"
	loot = list(
		/obj/item/stack/ms13/currency/ncr_dollar,
		/obj/item/stack/ms13/currency/ncr_dollar/five,
		/obj/item/stack/ms13/currency/ncr_dollar/ten,
		/obj/item/stack/ms13/currency/ncr_dollar/twenty,
		/obj/item/stack/ms13/currency/ncr_coin/five,
		/obj/item/stack/ms13/currency/ncr_coin/ten)

/obj/effect/spawner/random/ms13/guaranteed/currency/mammoth/ncr/high
	name = "high dolla balla status NCR currency spawner"
	loot = list(
		/obj/item/stack/ms13/currency/ncr_dollar/thirty,
		/obj/item/stack/ms13/currency/ncr_dollar/fourty,
		/obj/item/stack/ms13/currency/ncr_dollar/fifty,
		/obj/item/stack/ms13/currency/ncr_coin/ten,
		/obj/item/stack/ms13/currency/ncr_coin/twenty)

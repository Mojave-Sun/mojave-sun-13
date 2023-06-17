//// These spawners are GUARANTEED spawns. If you are making changes to these pools, you should probably also make changes to the non-static spawns outside of the guaranteed folder. ////
//// The idea of these spawners it to use these SPARINGLY. Emphasis on SPARINGLY... Examples of where to use these are: High tier dungeons / Faction bases ////

/obj/effect/spawner/random/ms13/guaranteed/melee
	name = "DO NOT USE ME - Mojave Sun melee spawners"
	icon_state = "ms13_melee-static"
	spawn_loot_count = 1
	spawn_loot_double = FALSE

/obj/effect/spawner/random/ms13/guaranteed/melee/tier1
	name = "tier 1 melee spawner"
	loot = list(
			/obj/item/knife/ms13/throwingknife,
			/obj/item/knife/ms13/switchblade/razor,
			/obj/item/knife/ms13,
			/obj/item/ms13/twohanded/spear/knife,
			/obj/item/ms13/brick,
			/obj/item/ms13/hammer,
			/obj/item/ms13/knuckles,
			/obj/item/ms13/handsaw,
			/obj/item/crowbar/ms13,
			/obj/item/shovel/ms13/snow,
			/obj/item/shovel/ms13/rake,
			/obj/item/ms13/handdrill
			)

/obj/effect/spawner/random/ms13/guaranteed/melee/tier2
	name = "tier 2 melee spawner"
	loot = list(
			/obj/item/hatchet/ms13,
			/obj/item/hatchet/ms13/icepick,
			/obj/item/hatchet/ms13/tomahawk,
			/obj/item/claymore/ms13/pipe,
			/obj/item/claymore/ms13/pipe/tireiron,
			/obj/item/claymore/ms13/baton,
			/obj/item/claymore/ms13/machete,
			/obj/item/knife/ms13/hunting,
			/obj/item/knife/ms13/switchblade,
			/obj/item/knife/butcher/ms13,
			/obj/item/ms13/knuckles/weighted,
			/obj/item/shovel/ms13,
			/obj/item/shovel/ms13/spade,
			/obj/item/ms13/twohanded/spear/throwing,
			/obj/item/ms13/twohanded/hammer/rebar,
			/obj/item/weldingtool/ms13,
			/obj/item/pickaxe/ms13
			)

/obj/effect/spawner/random/ms13/guaranteed/melee/tier3
	name = "tier 3 melee spawner"
	loot = list(
			/obj/item/claymore/ms13/machete/katana,
			/obj/item/claymore/ms13/machete/shishkebab,
			/obj/item/claymore/ms13/machete/ripper,
			/obj/item/knife/ms13/combat/soviet,
			/obj/item/knife/ms13/combat,
			/obj/item/hatchet/ms13/broad,
			/obj/item/ms13/knuckles/weighted/spiked,
			/obj/item/ms13/twohanded/hammer,
			/obj/item/ms13/twohanded/fireaxe,
			/obj/item/ms13/twohanded/spear,
			)

/obj/effect/spawner/random/ms13/guaranteed/melee/tier4
	name = "tier 4 melee spawner"
	loot = list(
			/obj/item/knife/ms13/combat/bowie,
			/obj/item/claymore/ms13/machete/ripper/advanced,
			/obj/item/ms13/knuckles/powerfist,
			/obj/item/ms13/twohanded/hammer/super,
			/obj/item/ms13/twohanded/heavy/autoaxe,
			/obj/item/ms13/twohanded/heavy/lance,
			/obj/item/ms13/twohanded/bump_sword
			)

/obj/effect/spawner/random/ms13/guaranteed/melee/unique
	name = "unique melee spawner"

	loot = list(
			/obj/item/claymore/ms13/machete/katana/immortal,
			/obj/item/claymore/ms13/pipe/humble,
			/obj/item/knife/ms13/hunting/unique,
			/obj/item/knife/butcher/ms13/unique
			)

/obj/effect/spawner/random/ms13/guaranteed/melee/lowrandom
	name = "low tier random melee spawner"
	loot = list(
			/obj/effect/spawner/random/ms13/guaranteed/melee/tier1 = 70,
			/obj/effect/spawner/random/ms13/guaranteed/melee/tier2 = 30
			)

/obj/effect/spawner/random/ms13/guaranteed/melee/highrandom
	name = "high tier random melee spawner"
	loot = list(
			/obj/effect/spawner/random/ms13/guaranteed/melee/tier2 = 10,
			/obj/effect/spawner/random/ms13/guaranteed/melee/tier3 = 60,
			/obj/effect/spawner/random/ms13/guaranteed/melee/tier4 = 30
			)

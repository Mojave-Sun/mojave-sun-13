//// These spawners are GUARENTEED spawns. If you are making changes to these pools, you should probably also make changes to the non-static spawns outside of the Guarenteed folder. ////
//// The idea of these spawners it to use these SPARINGLY. Emphasis on SPARINGLY... Examples of where to use these are: High tier dungeons / Faction bases ////

/obj/effect/spawner/random/ms13/guarenteed/medical
	name = "DO NOT USE ME - Mojave Sun medical spawners"
	icon_state = "ms13_medical-static"
	spawn_loot_count = 2
	spawn_loot_double = TRUE

/obj/effect/spawner/random/ms13/guarenteed/medical/tier1
	name = "tier 1 medical spawner"
	loot = list(
			/obj/item/stack/medical/suture/ms13/four = 30,
			/obj/item/stack/medical/gauze/ms13/half = 40,
			/obj/item/stack/medical/ointment/ms13/cream/half = 15,
			/obj/item/stack/medical/ointment/ms13/aloe = 15
			)

/obj/effect/spawner/random/ms13/guarenteed/medical/tier2
	name = "tier 2 medical spawner"
	loot = list(
			/obj/item/stack/medical/suture/ms13/eight = 35,
			/obj/item/stack/medical/ointment/ms13/cream = 20,
			/obj/item/stack/medical/gauze/ms13 = 35,
			/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak = 10
			)

/obj/effect/spawner/random/ms13/guarenteed/medical/tier3
	name = "tier 3 medical spawner"
	loot = list(
			/obj/item/stack/medical/gauze/ms13/military = 30,
			/obj/item/stack/medical/ointment/ms13 = 30,
			/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak/super = 10,
			/obj/item/stack/medical/suture/ms13 = 30
			)

/obj/effect/spawner/random/ms13/guarenteed/medical/lowrandom
	name = "low tier random medical spawner"
	spawn_loot_count = 1

	loot = list(
			/obj/effect/spawner/random/ms13/guarenteed/medical/tier1 = 70,
			/obj/effect/spawner/random/ms13/guarenteed/medical/tier2 = 30
			)

/obj/effect/spawner/random/ms13/guarenteed/medical/highrandom
	name = "high tier random medical spawner"
	spawn_loot_count = 1

	loot = list(
			/obj/effect/spawner/random/ms13/guarenteed/medical/tier2 = 45,
			/obj/effect/spawner/random/ms13/guarenteed/medical/tier3 = 55
			)

/obj/effect/spawner/random/ms13/guarenteed/medical/bloodbag
	name = "blood bag spawner"
	icon_state = "ms13_medfluid-static"
	spawn_loot_count = 1
	loot = list(
			/obj/item/reagent_containers/blood/ms13/o_minus = 80,
			/obj/item/reagent_containers/blood/ms13/radaway = 20
			)

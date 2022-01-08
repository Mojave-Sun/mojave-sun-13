/obj/effect/spawner/random/ms13/medical
	name = "DO NOT USE ME - Mojave Sun medical spawners"
	spawn_loot_count = 2
	spawn_loot_double = TRUE
	spawn_loot_chance = 45

/obj/effect/spawner/random/ms13/medical/tier1
	name = "tier 1 medical spawner"
	spawn_loot_chance = 55
	loot = list(
			/obj/item/stack/medical/suture/ms13/four = 30,
			/obj/item/stack/medical/gauze/ms13/half = 40,
			/obj/item/stack/medical/ointment/ms13/cream/half = 15,
			/obj/item/stack/medical/ointment/ms13/aloe = 15
			)

/obj/effect/spawner/random/ms13/medical/tier2
	name = "tier 2 medical spawner"
	spawn_loot_chance = 55
	loot = list(
			/obj/item/stack/medical/suture/ms13/eight = 35,
			/obj/item/stack/medical/ointment/ms13/cream = 20,
			/obj/item/stack/medical/gauze/ms13 = 35,
			/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak = 10
			)

/obj/effect/spawner/random/ms13/medical/tier3
	name = "tier 3 medical spawner"
	spawn_loot_chance = 65
	loot = list(
			/obj/item/stack/medical/gauze/ms13/military = 30,
			/obj/item/stack/medical/ointment/ms13 = 30,
			/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak/super = 10,
			/obj/item/stack/medical/suture/ms13 = 30
			)

/obj/effect/spawner/random/ms13/medical/lowrandom
	name = "low tier random medical spawner"
	spawn_loot_count = 1
	spawn_loot_chance = 100

	loot = list(
			/obj/effect/spawner/random/ms13/medical/tier1 = 70,
			/obj/effect/spawner/random/ms13/medical/tier2 = 30
			)

/obj/effect/spawner/random/ms13/medical/highrandom
	name = "high tier random medical spawner"
	spawn_loot_count = 1
	spawn_loot_chance = 100

	loot = list(
			/obj/effect/spawner/random/ms13/medical/tier2 = 55,
			/obj/effect/spawner/random/ms13/medical/tier3 = 45
			)

/obj/effect/spawner/random/ms13/medical/bloodbag
	name = "blood bag spawner"
	spawn_loot_count = 2
	spawn_loot_chance = 100
	loot = list(
			/obj/item/reagent_containers/blood/ms13/a_plus = 15,
			/obj/item/reagent_containers/blood/ms13/a_minus = 15,
			/obj/item/reagent_containers/blood/ms13/b_plus = 15,
			/obj/item/reagent_containers/blood/ms13/b_minus = 15,
			/obj/item/reagent_containers/blood/ms13/o_plus = 15,
			/obj/item/reagent_containers/blood/ms13/o_minus = 10,
			/obj/item/reagent_containers/blood/ms13/radaway = 15
			)

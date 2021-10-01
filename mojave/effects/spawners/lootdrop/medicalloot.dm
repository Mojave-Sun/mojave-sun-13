/obj/effect/spawner/random/ms13/medical
	name = "DO NOT USE ME - Mojave Sun medical spawners"
	spawn_loot_count = 2
	spawn_loot_double = TRUE

/obj/effect/spawner/random/ms13/medical/tier1
	name = "tier 1 medical spawner"

	loot = list(
			/obj/item/stack/medical/suture/ms13/four,
			/obj/item/stack/medical/gauze/ms13/half,
			/obj/item/stack/medical/ointment/ms13/cream/half,
			/obj/item/stack/medical/ointment/ms13/aloe
			)

/obj/effect/spawner/random/ms13/medical/tier2
	name = "tier 2 medical spawner"

	loot = list(
			/obj/item/stack/medical/suture/ms13/eight,
			/obj/item/stack/medical/ointment/ms13/cream,
			/obj/item/stack/medical/gauze/ms13,
			)

/obj/effect/spawner/random/ms13/medical/tier3
	name = "tier 3 medical spawner"

	loot = list(
			/obj/item/stack/medical/gauze/ms13/military,
			/obj/item/stack/medical/ointment/ms13,
			/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak,
			/obj/item/stack/medical/suture/ms13
			)

/obj/effect/spawner/random/ms13/medical/lowrandom
	name = "low tier random medical spawner"
	spawn_loot_count = 1

	loot = list(
			/obj/effect/spawner/random/ms13/medical/tier1 = 70,
			/obj/effect/spawner/random/ms13/medical/tier2 = 30
			)

/obj/effect/spawner/random/ms13/medical/highrandom
	name = "high tier random medical spawner"
	spawn_loot_count = 1

	loot = list(
			/obj/effect/spawner/random/ms13/medical/tier2 = 55,
			/obj/effect/spawner/random/ms13/medical/tier3 = 45
			)

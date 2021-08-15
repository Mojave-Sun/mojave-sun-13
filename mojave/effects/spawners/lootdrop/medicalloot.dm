/obj/effect/spawner/lootdrop/ms13/medical
	name = "DO NOT USE ME - Mojave Sun medical spawners"
	lootcount = 2
	lootdoubles = TRUE

/obj/effect/spawner/lootdrop/ms13/medical/tier1
	name = "tier 1 medical spawner"

	loot = list(
			/obj/item/stack/medical/suture/ms13/half,
			/obj/item/stack/medical/gauze/ms13/half
			)

/obj/effect/spawner/lootdrop/ms13/medical/tier2
	name = "tier 2 medical spawner"

	loot = list(
			/obj/item/stack/medical/suture/ms13,
			/obj/item/stack/medical/ointment/ms13/cream,
			/obj/item/stack/medical/gauze/ms13
			)

/obj/effect/spawner/lootdrop/ms13/medical/tier3
	name = "tier 3 medical spawner"

	loot = list(
			/obj/item/stack/medical/gauze/ms13/military,
			/obj/item/stack/medical/ointment/ms13,
			/obj/item/reagent_containers/hypospray/medipen/stimpak
			)

/obj/effect/spawner/lootdrop/ms13/medical/lowrandom
	name = "low tier random medical spawner"
	lootcount = 1

	loot = list(
			/obj/effect/spawner/lootdrop/ms13/medical/tier1 = 65,
			/obj/effect/spawner/lootdrop/ms13/medical/tier2 = 35
			)

/obj/effect/spawner/lootdrop/ms13/medical/highrandom
	name = "high tier random medical spawner"
	lootcount = 1

	loot = list(
			/obj/effect/spawner/lootdrop/ms13/medical/tier1 = 10,
			/obj/effect/spawner/lootdrop/ms13/medical/tier2 = 40,
			/obj/effect/spawner/lootdrop/ms13/medical/tier3 = 50
			)

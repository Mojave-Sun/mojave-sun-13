//// These spawners are GUARANTEED spawns. If you are making changes to these pools, you should probably also make changes to the non-static spawns outside of the guaranteed folder. ////
//// The idea of these spawners it to use these SPARINGLY. Emphasis on SPARINGLY... Examples of where to use these are: High tier dungeons / Faction bases ////

/obj/effect/spawner/random/ms13/guaranteed/medical
	name = "DO NOT USE ME - Mojave Sun medical spawners"
	icon_state = "ms13_medical-static"
	spawn_loot_count = 2
	spawn_loot_double = TRUE

/obj/effect/spawner/random/ms13/guaranteed/medical/tier1
	name = "tier 1 medical spawner"
	loot = list(
			/obj/item/stack/medical/suture/ms13/four = 25,
			/obj/item/stack/medical/gauze/ms13/half = 40,
			/obj/item/stack/medical/ointment/ms13/half = 25,
			/obj/item/stack/medical/splint/ms13/wooden = 10
			)

/obj/effect/spawner/random/ms13/guaranteed/medical/tier2
	name = "tier 2 medical spawner"
	loot = list(
			/obj/item/stack/medical/suture/ms13/eight = 25,
			/obj/item/stack/medical/ointment/ms13 = 25,
			/obj/item/stack/medical/gauze/ms13 = 30,
			/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak = 10,
			/obj/item/stack/medical/splint/ms13 = 10
			)

/obj/effect/spawner/random/ms13/guaranteed/medical/tier3
	name = "tier 3 medical spawner"
	loot = list(
			/obj/item/stack/medical/gauze/ms13/military = 30,
			/obj/item/stack/medical/ointment/ms13/dressing = 30,
			/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak/super = 10,
			/obj/item/stack/medical/suture/ms13 = 30
			)

/obj/effect/spawner/random/ms13/guaranteed/medical/lowrandom
	name = "low tier random medical spawner"
	spawn_loot_count = 1

	loot = list(
			/obj/effect/spawner/random/ms13/guaranteed/medical/tier1 = 70,
			/obj/effect/spawner/random/ms13/guaranteed/medical/tier2 = 30
			)

/obj/effect/spawner/random/ms13/guaranteed/medical/highrandom
	name = "high tier random medical spawner"
	spawn_loot_count = 1

	loot = list(
			/obj/effect/spawner/random/ms13/guaranteed/medical/tier2 = 45,
			/obj/effect/spawner/random/ms13/guaranteed/medical/tier3 = 55
			)

/obj/effect/spawner/random/ms13/guaranteed/medical/herbal
	name = "herbal medicine spawner"
	spawn_loot_count = 1
	loot = list(
			/obj/item/stack/medical/ms13/healing_powder = 35,
			/obj/item/stack/medical/ms13/healing_powder/burn = 35,
			/obj/item/stack/medical/ms13/healing_powder/poultice = 15,
			/obj/item/reagent_containers/ms13/flask/bitter_drink = 15
			)

/obj/effect/spawner/random/ms13/guaranteed/medical/bloodbag
	name = "blood bag spawner"
	icon_state = "ms13_medfluid-static"
	spawn_loot_count = 1
	loot = list(
			/obj/item/reagent_containers/blood/ms13/o_minus = 80,
			/obj/item/reagent_containers/blood/ms13/radaway = 20
			)

/obj/effect/spawner/random/ms13/guaranteed/medical/surgical
	name = "surgical item spawner"
	icon_state = "loot-static"
	spawn_loot_count = 1
	loot = list(
			/obj/item/hemostat/ms13,
			/obj/item/retractor/ms13,
			/obj/item/ms13/handsaw/bone,
			/obj/item/cautery/ms13,
			/obj/item/scalpel/ms13,
			/obj/item/surgical_drapes/ms13,
			/obj/item/stack/medical/bone_gel/ms13,
			/obj/item/stack/sticky_tape/surgical/ms13
			)

/obj/effect/spawner/random/ms13/guaranteed/medical/medkit
	name = "random medkit spawner"
	icon_state = "ms13_medicalbag-static"
	spawn_loot_count = 1
	loot = list(
		/obj/item/storage/firstaid/ms13,
		/obj/item/storage/firstaid/ms13/regular,
		/obj/item/storage/firstaid/ms13/quality)

/obj/effect/spawner/random/ms13/guaranteed/medical/dbag
	name = "random doctor bag spawner"
	icon_state = "ms13_medicalbag-static"
	spawn_loot_count = 1
	loot = list(
		/obj/item/storage/firstaid/ms13/bag,
		/obj/item/storage/firstaid/ms13/bag/filled)

/obj/effect/spawner/random/ms13/guaranteed/drugs
	name = "DO NOT USE ME - Mojave Sun drug spawners"
	icon_state = "ms13_medical-static"
	spawn_loot_count = 1
	spawn_loot_chance = 100

/obj/effect/spawner/random/ms13/guaranteed/drugs/tier1
	name = "tier 1 drug spawner"
	loot = list(
			/obj/item/reagent_containers/hypospray/medipen/ms13/calmex = 20,
			/obj/item/reagent_containers/ms13/inhaler/jet = 20,
			/obj/item/storage/pill_bottle/ms13/cateye = 10,
			/obj/item/storage/pill_bottle/ms13/mentat = 20,
			/obj/item/storage/pill_bottle/ms13/daytripper = 10,
			/obj/item/storage/pill_bottle/ms13/radx = 20
			)

/obj/effect/spawner/random/ms13/guaranteed/drugs/tier2
	name = "tier 2 drug spawner"
	loot = list(
			/obj/item/reagent_containers/ms13/inhaler/rocket,
			/obj/item/reagent_containers/hypospray/medipen/ms13/medx,
			/obj/item/reagent_containers/hypospray/medipen/ms13/psycho,
			/obj/item/reagent_containers/ms13/inhaler/hydra
			)

/obj/effect/spawner/random/ms13/guaranteed/drugs/tier3
	name = "tier 3 drug spawner"
	loot = list(
			/obj/item/reagent_containers/hypospray/medipen/ms13/overdrive,
			/obj/item/reagent_containers/hypospray/medipen/ms13/addictol,
			/obj/item/reagent_containers/ms13/inhaler/turbo,
			/obj/item/storage/pill_bottle/ms13/buffout
			)

/obj/effect/spawner/random/ms13/guaranteed/drugs/lowrandom
	name = "low tier random drug spawner"
	spawn_loot_count = 1
	loot = list(
			/obj/effect/spawner/random/ms13/guaranteed/drugs/tier1 = 70,
			/obj/effect/spawner/random/ms13/guaranteed/drugs/tier2 = 30
			)

/obj/effect/spawner/random/ms13/guaranteed/drugs/highrandom
	name = "high tier random drug spawner"
	spawn_loot_count = 1
	loot = list(
			/obj/effect/spawner/random/ms13/guaranteed/drugs/tier2 = 45,
			/obj/effect/spawner/random/ms13/guaranteed/drugs/tier3 = 55
			)

/obj/effect/spawner/random/ms13/guaranteed/drugs/prewar
	name = "pre-war drug spawner"
	loot = list(
			/obj/item/reagent_containers/hypospray/medipen/ms13/calmex = 15,
			/obj/item/storage/pill_bottle/ms13/cateye = 10,
			/obj/item/storage/pill_bottle/ms13/mentat = 15,
			/obj/item/storage/pill_bottle/ms13/daytripper = 10,
			/obj/item/storage/pill_bottle/ms13/radx = 15,
			/obj/item/storage/pill_bottle/ms13/buffout = 10,
			/obj/item/reagent_containers/hypospray/medipen/ms13/medx = 15,
			/obj/item/reagent_containers/hypospray/medipen/ms13/psycho = 5,
			/obj/item/reagent_containers/hypospray/medipen/ms13/addictol = 5
			)

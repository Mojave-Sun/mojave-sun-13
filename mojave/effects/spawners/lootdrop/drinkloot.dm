//// These spawners are NON-STATIC spawns. If you are making changes to these pools, you should probably also make changes to the static spawns outside of the guaranteed folder. ////
//// The idea of these spawners it to use these EVERYWHERE. Emphasis on EVERYWHERE!!! These are the spawners you should be slapping in every other building, so that there's variety in loot locations on a per-round basis. ////

/obj/effect/spawner/random/ms13/drink
	name = "DO NOT USE ME - Mojave Sun drink spawners"
	spawn_loot_count = 1
	spawn_loot_chance = 55

/obj/effect/spawner/random/ms13/drink/soda
	name = "cola spawner"
	icon_state = "ms13_cola"
	loot = list(
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_cola,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/sarsaparilla,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_cherry,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_grape,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_orange,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_lime,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_wild,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_victory,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_quartz,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_cranberry,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_quantum
		)

/obj/effect/spawner/random/ms13/drink/soda_uncommon
	name = "uncommon cola spawner"
	icon_state = "ms13_cola"
	spawn_loot_chance = 35
	loot = list(
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_quartz,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_cranberry,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_quantum
		)


// Alcohol spawners //

/obj/effect/spawner/random/ms13/drink/alcohol
	name = "broad alcoholic spawner"
	icon_state = "ms13_alcohol"

	loot = list(
		/obj/item/reagent_containers/food/drinks/bottle/ms13/trooper_beer,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/caligary_beer,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/plain,
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_dark,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/moonshine,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/whiskey,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/vodka,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/tequila,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/kaluha,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/wine,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/gin,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/sake,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/vermouth,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/triple_sec,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/rum,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/absinthe,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/champagne,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/cognac,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/nukashine
		)

/obj/effect/spawner/random/ms13/drink/alcohol_beer
	name = "beer spawner"
	icon_state = "ms13_beer"
	spawn_loot_chance = 45

	loot = list(
		/obj/item/reagent_containers/food/drinks/bottle/ms13/trooper_beer,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/caligary_beer,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/plain,
		)

/obj/effect/spawner/random/ms13/drink/alcohol_uncommon // Breathe some artificial inflation up in there
	name = "uncommon alcohol spawner"
	icon_state = "ms13_alcohol"
	spawn_loot_chance = 35

	loot = list(
		/obj/item/reagent_containers/food/drinks/bottle/ms13/sake,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/vermouth,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/champagne,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/cognac,
		/obj/item/reagent_containers/food/drinks/bottle/ms13/nukashine
		)


// Random trader vendortron spawners - Shouldn't be more than three of these on the map, really.

/obj/effect/spawner/random/ms13/trader
	name = "DO NOT USE ME - Trader spawns"
	icon = 'mojave/icons/effects/random_spawners.dmi'
	icon_state = "loot"
	spawn_loot_double = FALSE
	spawn_loot_split = FALSE
	spawn_loot_chance = 100

/obj/effect/spawner/random/ms13/trader
	name = "Random vendortron spawn"
	loot = list(
		/mob/living/simple_animal/hostile/retaliate/trader/ms13/armor,
		/mob/living/simple_animal/hostile/retaliate/trader/ms13/gunrunner,
		/mob/living/simple_animal/hostile/retaliate/trader/ms13/medtek,
		/mob/living/simple_animal/hostile/retaliate/trader/ms13/robco,
		/mob/living/simple_animal/hostile/retaliate/trader/ms13/tools)

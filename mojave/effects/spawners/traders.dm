// Random trader vendortron spawners - Shouldn't be more than three of these on the map, really. These are just here to mirror the guaranteed ones //

/obj/effect/spawner/random/ms13/locked
	name = "DO NOT USE ME - Mojave Sun locked things chance"
	icon = 'mojave/icons/effects/mapping_helpers.dmi'
	icon_state = "random"
	spawn_loot_double = FALSE
	spawn_loot_split = FALSE
	spawn_loot_chance = 40

/obj/effect/spawner/random/ms13/locked/beginner
	name = "DO NOT USE ME - Mojave Sun beginner locks"
	loot = list(
		/mob/living/simple_animal/hostile/retaliate/trader/ms13/armor,
		/mob/living/simple_animal/hostile/retaliate/trader/ms13/gunrunner,
		/mob/living/simple_animal/hostile/retaliate/trader/ms13/medtek,
		/mob/living/simple_animal/hostile/retaliate/trader/ms13/robco,
		/mob/living/simple_animal/hostile/retaliate/trader/ms13/tools)

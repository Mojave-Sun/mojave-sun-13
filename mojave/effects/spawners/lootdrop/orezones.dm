/// TO BE USED SPARINGLY. SPECIFICALLY THEMED SPAWNERS FOR SPECIFIC TYPES OF ORE
/obj/effect/spawner/random/ms13/ore_node
	name = "DO NOT USE ME - Mojave Sun ore node spawner"
	spawn_loot_chance = 35

/obj/effect/spawner/random/ms13/ore_node/sulfur
	name = "DO NOT USE ME - Mojave Sun ore node spawner"
	spawn_loot_chance = 100
	spawn_scatter_radius = 3
	loot = list(/obj/structure/ms13/ore_deposit/sulfur/growth = 100)

/obj/effect/spawner/random/ms13/ore_node/sulfur/Initialize(mapload) //on mapload, pick what to spawn
	spawn_loot_count = rand(1,3)
	. = ..()

// Random locked object spawner - Place these over things you want to have a CHANCE of being locked! //

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
		/obj/effect/mapping_helpers/atom_injector/element_injector/ms13/lockedpickable/beginner)

/obj/effect/spawner/random/ms13/locked/beginner/lowchance
	name = "beginner lock low chance spawner"
	spawn_loot_chance = 25

/obj/effect/spawner/random/ms13/locked/beginner/medchance
	name = "beginner lock medium chance spawner"
	spawn_loot_chance = 50

/obj/effect/spawner/random/ms13/locked/beginner/highchance
	name = "beginner lock high chance spawner"
	spawn_loot_chance = 75

/obj/effect/spawner/random/ms13/locked/novice
	name = "DO NOT USE ME - Mojave Sun novice locks"
	loot = list(
		/obj/effect/mapping_helpers/atom_injector/element_injector/ms13/lockedpickable/novice)

/obj/effect/spawner/random/ms13/locked/novice/lowchance
	name = "novice lock low chance spawner"
	spawn_loot_chance = 25

/obj/effect/spawner/random/ms13/locked/novice/medchance
	name = "novice lock medium chance spawner"
	spawn_loot_chance = 50

/obj/effect/spawner/random/ms13/locked/novice/highchance
	name = "novice lock high chance spawner"
	spawn_loot_chance = 75

/obj/effect/spawner/random/ms13/locked/standard
	name = "DO NOT USE ME - Mojave Sun standard locks"
	loot = list(
		/obj/effect/mapping_helpers/atom_injector/element_injector/ms13/lockedpickable/standard)

/obj/effect/spawner/random/ms13/locked/standard/lowchance
	name = "standard lock low chance spawner"
	spawn_loot_chance = 25

/obj/effect/spawner/random/ms13/locked/standard/medchance
	name = "standard lock medium chance spawner"
	spawn_loot_chance = 50

/obj/effect/spawner/random/ms13/locked/standard/highchance
	name = "standard lock high chance spawner"
	spawn_loot_chance = 75

/obj/effect/spawner/random/ms13/locked/expert
	name = "DO NOT USE ME - Mojave Sun expert locks"
	loot = list(
		/obj/effect/mapping_helpers/atom_injector/element_injector/ms13/lockedpickable/expert)

/obj/effect/spawner/random/ms13/locked/expert/lowchance
	name = "expert lock low chance spawner"
	spawn_loot_chance = 25

/obj/effect/spawner/random/ms13/locked/expert/medchance
	name = "expert lock medium chance spawner"
	spawn_loot_chance = 50

/obj/effect/spawner/random/ms13/locked/expert/highchance
	name = "expert lock high chance spawner"
	spawn_loot_chance = 75

/obj/effect/spawner/random/ms13/locked/master
	name = "DO NOT USE ME - Mojave Sun master locks"
	loot = list(
		/obj/effect/mapping_helpers/atom_injector/element_injector/ms13/lockedpickable/master)

/obj/effect/spawner/random/ms13/locked/master/lowchance
	name = "master lock low chance spawner"
	spawn_loot_chance = 25

/obj/effect/spawner/random/ms13/locked/master/medchance
	name = "master lock medium chance spawner"
	spawn_loot_chance = 50

/obj/effect/spawner/random/ms13/locked/master/highchance
	name = "master lock high chance spawner"
	spawn_loot_chance = 75

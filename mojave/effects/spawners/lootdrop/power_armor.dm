
/obj/effect/spawner/random/ms13/power_armor
	name = "DO NOT USE ME - base type power armor spawner"
	spawn_loot_chance = 20
	spawn_loot_count = 1
	loot = list(
			/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/random
			)

/obj/effect/spawner/random/ms13/power_armor/lowrandom
	name = "low tier random power armor spawner"
	spawn_loot_chance = 10
	loot = list(
			/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/random = 40,
			/obj/item/clothing/suit/space/hardsuit/ms13/power_armor = 60
			)

/obj/effect/spawner/random/ms13/power_armor/highrandom
	name = "high tier random power armor spawner"
	spawn_loot_chance = 15
	loot = list(
			/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/t51/random = 35,
			/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/t45/random = 65
			)

/obj/effect/spawner/random/ms13/power_armor/parts
	name = "random power armor parts spawner"
	spawn_loot_chance = 40
	loot = list(
			/obj/effect/spawner/random/ms13/power_armor/t51_parts = 35,
			/obj/effect/spawner/random/ms13/power_armor/t45_parts = 65
			)

/obj/effect/spawner/random/ms13/power_armor/t45_parts
	name = "T-45 parts spawner"
	spawn_loot_chance = 100 //used to populate the random parts spawner above
	loot = list(
			/obj/item/ms13/power_armor/head/t45,
			/obj/item/ms13/power_armor/chest/t45,
			/obj/item/ms13/power_armor/arm/left/t45,
			/obj/item/ms13/power_armor/arm/right/t45,
			/obj/item/ms13/power_armor/leg/left/t45,
			/obj/item/ms13/power_armor/leg/right/t45
			)

/obj/effect/spawner/random/ms13/power_armor/t51_parts
	name = "T-51 parts spawner"
	spawn_loot_chance = 100 //used to populate the random parts spawner above
	loot = list(
			/obj/item/ms13/power_armor/head/t51,
			/obj/item/ms13/power_armor/chest/t51,
			/obj/item/ms13/power_armor/arm/left/t51,
			/obj/item/ms13/power_armor/arm/right/t51,
			/obj/item/ms13/power_armor/leg/left/t51,
			/obj/item/ms13/power_armor/leg/right/t51
			)

/* /obj/effect/spawner/random/ms13/power_armor/frame //Commenting these out for now as we won't be using them for now
	name = "Frame PA"
	spawn_loot_chance = 30
	loot = list(
		/obj/item/clothing/suit/space/hardsuit/ms13/power_armor
	)

/obj/effect/spawner/random/ms13/power_armor/t45
	name = "T45 PA"
	spawn_loot_chance = 15
	loot = list(
		/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/t45/random
	)

/obj/effect/spawner/random/ms13/power_armor/t51
	name = "T51 PA"
	spawn_loot_chance = 15
	loot = list(
		/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/t51/random
	)

/obj/effect/spawner/random/ms13/power_armor/advanced
	name = "APA"
	spawn_loot_chance = 1
	loot = list(
		/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/advanced/random
	) */

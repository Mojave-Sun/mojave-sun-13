//Recipes for all kinds of ammo crafting

//AMMO CRAFTING

/datum/crafting_recipe/junk_casings
	name = "twenty junk bullet casings"
	result = /obj/item/stack/sheet/ms13/junk_casings/twenty
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_brass = 5)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junk_bullets
	name = "twenty junk bullets"
	result = /obj/item/stack/sheet/ms13/junk_bullets/twenty
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_lead = 5)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junk_22lr
	name = "junk .22 ammo box"
	result = /obj/item/ammo_box/ms13/c22box/junk
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/junk_bullets = 32,
				/obj/item/stack/sheet/ms13/junk_casings = 32,
				/obj/item/ms13/component/gunpowder/lq = 1
				)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junk_9mm
	name = "junk 9mm ammo box"
	result = /obj/item/ammo_box/ms13/c9mm/junk
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/junk_bullets = 30,
				/obj/item/stack/sheet/ms13/junk_casings = 30,
				/obj/item/ms13/component/gunpowder/lq = 1
				)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junk_10mm
	name = "junk 10mm ammo box"
	result = /obj/item/ammo_box/ms13/c10mm/junk
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/junk_bullets = 24,
				/obj/item/stack/sheet/ms13/junk_casings = 24,
				/obj/item/ms13/component/gunpowder/lq = 1
				)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junk_45cal
	name = "junk .45 ammo box"
	result = /obj/item/ammo_box/ms13/c45/junk
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/junk_bullets = 21,
				/obj/item/stack/sheet/ms13/junk_casings = 21,
				/obj/item/ms13/component/gunpowder/lq = 1
				)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junk_556mm
	name = "junk 5.56 ammo box"
	result = /obj/item/ammo_box/ms13/a556/junk
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/junk_bullets = 40,
				/obj/item/stack/sheet/ms13/junk_casings = 40,
				/obj/item/ms13/component/gunpowder/lq = 2
				)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junk_44mag
	name = "junk .44 ammo box"
	result = /obj/item/ammo_box/ms13/m44box/junk
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/junk_bullets = 24,
				/obj/item/stack/sheet/ms13/junk_casings = 24,
				/obj/item/ms13/component/gunpowder/lq = 2
				)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junk_357mag
	name = "junk .357 ammo box"
	result = /obj/item/ammo_box/ms13/a357box/junk
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/junk_bullets = 18,
				/obj/item/stack/sheet/ms13/junk_casings = 18,
				/obj/item/ms13/component/gunpowder/lq = 1
				)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junk_308
	name = "junk .308 ammo box"
	result = /obj/item/ammo_box/ms13/a308/junk
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/junk_bullets = 20,
				/obj/item/stack/sheet/ms13/junk_casings = 20,
				/obj/item/ms13/component/gunpowder/lq = 2
				)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junk_762
	name = "junk 7.62 ammo box"
	result = /obj/item/ammo_box/ms13/a762/junk
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/junk_bullets = 24,
				/obj/item/stack/sheet/ms13/junk_casings = 24,
				/obj/item/ms13/component/gunpowder/lq = 2
				)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junkshot
	name = "12 gauge junkshot shotgun ammo box"
	result = /obj/item/ammo_box/ms13/shotgun/junkshot
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/plastic = 10,
				/obj/item/stack/sheet/ms13/scrap_lead = 8,
				/obj/item/ms13/component/gunpowder/lq = 1
				)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/hq_casings
	name = "twenty high quality bullet casings"
	result = /obj/item/stack/sheet/ms13/hq_casings/twenty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/refined_brass = 2)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/hq_bullets
	name = "twenty high quality bullets"
	result = /obj/item/stack/sheet/ms13/hq_bullets/twenty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/refined_lead = 2)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/stan_22lr
	name = "standard .22 ammo box"
	result = /obj/item/ammo_box/ms13/c22box
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 32,
				/obj/item/stack/sheet/ms13/hq_casings = 32,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/stan_9mm
	name = "standard 9mm ammo box"
	result = /obj/item/ammo_box/ms13/c9mm
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 30,
				/obj/item/stack/sheet/ms13/hq_casings = 30,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/stan_10mm
	name = "standard 10mm ammo box"
	result = /obj/item/ammo_box/ms13/c10mm
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 24,
				/obj/item/stack/sheet/ms13/hq_casings = 24,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/stan_45cal
	name = "standard .45 ammo box"
	result = /obj/item/ammo_box/ms13/c45
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 21,
				/obj/item/stack/sheet/ms13/hq_casings = 21,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/stan_556mm
	name = "standard 5.56 ammo box"
	result = /obj/item/ammo_box/ms13/a556
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 40,
				/obj/item/stack/sheet/ms13/hq_casings = 40,
				/obj/item/ms13/component/gunpowder = 2
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/stan_44mag
	name = "standard .44 ammo box"
	result = /obj/item/ammo_box/ms13/m44box
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 24,
				/obj/item/stack/sheet/ms13/hq_casings = 24,
				/obj/item/ms13/component/gunpowder = 2
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/stan_357mag
	name = "standard .357 ammo box"
	result = /obj/item/ammo_box/ms13/a357box
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 18,
				/obj/item/stack/sheet/ms13/hq_casings = 18,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/stan_308
	name = "standard .308 ammo box"
	result = /obj/item/ammo_box/ms13/a308
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 20,
				/obj/item/stack/sheet/ms13/hq_casings = 20,
				/obj/item/ms13/component/gunpowder = 2
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/stan_762
	name = "standard 7.62 ammo box"
	result = /obj/item/ammo_box/ms13/a762
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 24,
				/obj/item/stack/sheet/ms13/hq_casings = 24,
				/obj/item/ms13/component/gunpowder = 2
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/buckshot
	name = "12 gauge buckshot shotgun ammo box"
	result = /obj/item/ammo_box/ms13/shotgun/buckshot
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/plastic = 8,
				/obj/item/stack/sheet/ms13/refined_lead = 2,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

//DRYLANDER SHAMAN RECIPES

/datum/crafting_recipe/shaman_casings
	name = "conjure bullet casings"
	result = /obj/item/stack/sheet/ms13/junk_casings/twelve
	time = 8 SECONDS
	trait = TRAIT_DRY_SHAMAN
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/scrap_brass = 3)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/shaman_bullets
	name = "conjure bullets"
	result = /obj/item/stack/sheet/ms13/junk_bullets/twelve
	time = 8 SECONDS
	trait = TRAIT_DRY_SHAMAN
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/scrap_lead = 3)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/shaman_762
	name = "conjure 7.62 ammo"
	result = /obj/item/ammo_box/ms13/a762/junk
	time = 18 SECONDS
	trait = TRAIT_DRY_SHAMAN
	tool_behaviors = list()
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/junk_bullets = 24,
				/obj/item/stack/sheet/ms13/junk_casings = 24,
				/obj/item/ms13/component/gunpowder/lq = 2
				)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/ap_762
	name = "armor piercing 7.62 ammo box"
	result = /obj/item/ammo_box/ms13/a762/ap
	time = 16 SECONDS
	trait = TRAIT_DRY_SHAMAN
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 24,
				/obj/item/stack/sheet/ms13/hq_casings = 24,
				/obj/item/ms13/component/gunpowder = 4
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/hv_762
	name = "high velocity 7.62 ammo box"
	result = /obj/item/ammo_box/ms13/a762/hv
	time = 16 SECONDS
	trait = TRAIT_DRY_SHAMAN
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 24,
				/obj/item/stack/sheet/ms13/hq_casings = 24,
				/obj/item/ms13/component/gunpowder = 4
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/stan_4570
	name = "standard .45-70 ammo box"
	result = /obj/item/ammo_box/ms13/c4570box
	time = 12 SECONDS
	trait = TRAIT_DRY_SHAMAN
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 16,
				/obj/item/stack/sheet/ms13/hq_casings = 16,
				/obj/item/ms13/component/gunpowder = 2
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/ap_4570
	name = "armor piercing .45-70 ammo box"
	result = /obj/item/ammo_box/ms13/c4570box/ap
	time = 16 SECONDS
	trait = TRAIT_DRY_SHAMAN
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 16,
				/obj/item/stack/sheet/ms13/hq_casings = 16,
				/obj/item/ms13/component/gunpowder = 4
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/hv_4570
	name = "high velocity .45-70 ammo box"
	result = /obj/item/ammo_box/ms13/c4570box/hv
	time = 16 SECONDS
	trait = TRAIT_DRY_SHAMAN
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 16,
				/obj/item/stack/sheet/ms13/hq_casings = 16,
				/obj/item/ms13/component/gunpowder = 4
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/slugs
	name = "12 gauge slug shotgun ammo box"
	result = /obj/item/ammo_box/ms13/shotgun/slug
	time = 14 SECONDS
	trait = TRAIT_DRY_SHAMAN
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/plastic = 8,
				/obj/item/stack/sheet/ms13/refined_lead = 4,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING


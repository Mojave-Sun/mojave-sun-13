//Recipes for all kinds of weapon crafting

//WEAPON CRAFTING

/datum/crafting_recipe/knife_spear
	name = "knife spear"
	result = /obj/item/ms13/twohanded/spear/knife
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/knife/ms13=1,
				/obj/item/stack/sheet/ms13/cloth = 4,
				/obj/item/stack/sheet/ms13/scrap = 4)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/throwing_spear
	name = "throwing spear"
	result = /obj/item/ms13/twohanded/spear/throwing
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SAW)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/scrap_steel = 6,
				/obj/item/stack/sheet/ms13/scrap = 6,
				/obj/item/stack/sheet/ms13/wood/plank = 2)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/metal_spear
	name = "metal spear"
	result = /obj/item/ms13/twohanded/spear
	time = 20 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WELDER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/refined_steel = 4,
				/obj/item/stack/sheet/ms13/scrap_parts = 6)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/machete
	name = "machete"
	result = /obj/item/claymore/ms13/machete
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SAW)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/wood/scrap_wood = 3,
				/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/scrap = 6,
				/obj/item/stack/sheet/ms13/scrap_steel = 6)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/tomahawk
	name = "tomahawk"
	result = /obj/item/hatchet/ms13/tomahawk
	time = 12 SECONDS
	tool_behaviors = list(TOOL_DRILL)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/claymore/ms13/pipe = 1,
				/obj/item/stack/sheet/ms13/scrap_parts = 2,
				/obj/item/stack/sheet/ms13/scrap_steel = 3,
				/obj/item/stack/sheet/ms13/scrap = 2)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/broad_hatchet
	name = "broad hatchet"
	result = /obj/item/hatchet/ms13/broad
	time = 20 SECONDS
	tool_behaviors = list(TOOL_WELDER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/hatchet/ms13 = 1,
				/obj/item/stack/sheet/ms13/refined_steel = 6)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/brass_knuckle
	name = "brass knuckle"
	result = /obj/item/ms13/knuckles
	time = 8 SECONDS
	tool_behaviors = list()
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_brass = 8)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/steel_knuckle
	name = "steel knuckle"
	result = /obj/item/ms13/knuckles/weighted
	time = 12 SECONDS
	tool_behaviors = list()
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_steel = 6,
				/obj/item/stack/sheet/ms13/scrap = 6)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/spiked_knuckle
	name = "spiked knuckle"
	result = /obj/item/ms13/knuckles/weighted/spiked
	time = 15 SECONDS
	tool_behaviors = list(TOOL_WELDER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/ms13/knuckles/weighted = 1,
				/obj/item/stack/sheet/ms13/refined_steel = 3,
				/obj/item/stack/sheet/ms13/scrap_parts = 5)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/shishkebab
	name = "shishkebab"
	result = /obj/item/claymore/ms13/machete/shishkebab
	time = 20 SECONDS
	tool_behaviors = list(TOOL_DRILL, TOOL_SCREWDRIVER, TOOL_WRENCH)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap = 10,
				/obj/item/stack/sheet/ms13/refined_steel = 4,
				/obj/item/stack/sheet/ms13/scrap_parts = 10)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

//Legion crafting
/datum/crafting_recipe/throwing_spear_legion
	name = "Legion throwing spear"
	result = /obj/item/ms13/twohanded/spear/throwing
	time = 10 SECONDS
	tool_behaviors = list(TOOL_SAW)
	tool_paths = list(/obj/item/ms13/hammer)
	trait = TRAIT_LEGION_SMITHING
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/scrap_steel = 5,
				/obj/item/stack/sheet/ms13/scrap = 5,
				/obj/item/stack/sheet/ms13/wood/plank = 2)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/metal_spear_legion
	name = "Legion metal spear"
	result = /obj/item/ms13/twohanded/spear
	time = 15 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WELDER)
	tool_paths = list(/obj/item/ms13/hammer)
	trait = TRAIT_LEGION_SMITHING
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/refined_steel = 3,
				/obj/item/stack/sheet/ms13/scrap_parts = 4)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/machete_legion
	name = "Legion machete"
	result = /obj/item/claymore/ms13/machete
	time = 10 SECONDS
	tool_behaviors = list(TOOL_SAW)
	tool_paths = list(/obj/item/ms13/hammer)
	trait = TRAIT_LEGION_SMITHING
	reqs = list(/obj/item/stack/sheet/ms13/wood/scrap_wood = 2,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/scrap = 5,
				/obj/item/stack/sheet/ms13/scrap_steel = 5)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/machete_gladius_legion
	name = "Legion machete gladius"
	result = /obj/item/claymore/ms13/machete/gladius
	time = 15 SECONDS
	tool_behaviors = list(TOOL_WELDER)
	tool_paths = list(/obj/item/ms13/hammer)
	trait = TRAIT_LEGION_SMITHING
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/refined_steel = 4)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/tomahawk_legion
	name = "Legion tomahawk"
	result = /obj/item/hatchet/ms13/tomahawk
	time = 10 SECONDS
	tool_behaviors = list(TOOL_DRILL)
	tool_paths = list(/obj/item/ms13/hammer)
	trait = TRAIT_LEGION_SMITHING
	reqs = list(/obj/item/claymore/ms13/pipe = 1,
				/obj/item/stack/sheet/ms13/scrap_parts = 2,
				/obj/item/stack/sheet/ms13/scrap_steel = 3)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/bumper_sword_legion
	name = "Legion bumper sword"
	result = /obj/item/ms13/twohanded/bump_sword
	time = 25 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WELDER, TOOL_DRILL, TOOL_KNIFE)
	tool_paths = list(/obj/item/ms13/hammer)
	trait = TRAIT_LEGION_SMITHING
	reqs = list(/obj/item/stack/sheet/ms13/refined_steel = 9,
				/obj/item/stack/sheet/ms13/refined_alu = 3,
				/obj/item/stack/sheet/ms13/scrap_parts = 4,
				/obj/item/stack/sheet/ms13/leather = 3)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

//GUN CRAFTING
/* I don't feel like deleting all of this so I'm just going to comment it - Hekzder
/datum/crafting_recipe/pistol_9mm
	name = "9mm pistol"
	result = /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	time = 18 SECONDS
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_SAW)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(
				/obj/item/stack/sheet/ms13/refined_steel = 3,
				/obj/item/stack/sheet/ms13/scrap_parts = 5,
				/obj/item/stack/sheet/ms13/plank = 1,
				/obj/item/stack/sheet/ms13/refined_alu = 1
				)
	category = CAT_GUNS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/single_shotgun
	name = "single shotgun"
	result = /obj/item/gun/ballistic/revolver/ms13/single
	time = 18 SECONDS
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_SAW)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(
				/obj/item/stack/sheet/ms13/refined_steel = 3,
				/obj/item/stack/sheet/ms13/scrap_parts = 4,
				/obj/item/stack/sheet/ms13/plank = 3
				)
	category = CAT_GUNS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/cara_shotgun
	name = "caravan shotgun"
	result = /obj/item/gun/ballistic/revolver/ms13/caravan
	time = 18 SECONDS
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_SAW)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(
				/obj/item/stack/sheet/ms13/refined_steel = 4,
				/obj/item/stack/sheet/ms13/scrap_parts = 5,
				/obj/item/stack/sheet/ms13/plank = 4
				)
	category = CAT_GUNS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/var_rifle
	name = "varmint rifle"
	result = /obj/item/gun/ballistic/rifle/ms13/varmint
	time = 18 SECONDS
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_SAW)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(
				/obj/item/stack/sheet/ms13/refined_steel = 4,
				/obj/item/stack/sheet/ms13/scrap_parts = 6,
				/obj/item/stack/sheet/ms13/plank = 3,
				/obj/item/stack/sheet/ms13/refined_alu = 2
				)
	category = CAT_GUNS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/rev_10mm
	name = "10mm revolver"
	result = /obj/item/gun/ballistic/revolver/ms13/rev10mm
	time = 18 SECONDS
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_SAW)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(
				/obj/item/stack/sheet/ms13/refined_steel = 3,
				/obj/item/stack/sheet/ms13/scrap_parts = 6,
				/obj/item/stack/sheet/ms13/plank = 2,
				/obj/item/stack/sheet/ms13/refined_alu = 2
				)
	category = CAT_GUNS
	crafting_interface = CRAFTING_BENCH_WEAPONS

*/

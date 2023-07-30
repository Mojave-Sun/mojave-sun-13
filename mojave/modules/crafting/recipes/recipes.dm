//This file contains various misc. crafting recipes that don't warrant their own file, as well as the guide below for how this all works

// Used to filter crafting recipes based on what you are crafting with
// i.e CRAFTING_BENCH_HANDS is the default crafting menu (hidden at time of writing)
// the general crafting bench only shows recipes with CRAFTING_BENCH_GENERAL, etc.
// treat this is a flag, so recipes can be shared between (i.e bandages on GENERAL and ARMTAILOR)
/datum/crafting_recipe/var/crafting_interface = CRAFTING_BENCH_HANDS

// Used to display relevant recipes - match to the recipe's crafting_interface
/datum/component/personal_crafting/var/crafting_interface = CRAFTING_BENCH_HANDS

//UTILITY ITEM CRAFTING

/datum/crafting_recipe/lockpick
	name = "lockpick"
	result = /obj/item/ms13/lockpick/basic
	time = 6 SECONDS
	tool_behaviors = list()
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/scrap = 3)
	category = CAT_UTILITY
	crafting_interface = CRAFTING_BENCH_GENERAL

/datum/crafting_recipe/fishing_rod
	name = "wooden fishing rod"
	result = /obj/item/ms13/tools/fishing_rod/basic
	time = 15 SECONDS
	tool_behaviors = list(TOOL_KNIFE, TOOL_SAW, TOOL_SCREWDRIVER, TOOL_WRENCH)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/wood/plank = 3,
				/obj/item/stack/sheet/ms13/thread = 6,
				/obj/item/stack/sheet/ms13/scrap_parts = 3,
				/obj/item/stack/sheet/ms13/scrap = 3)
	category = CAT_UTILITY
	crafting_interface = CRAFTING_BENCH_GENERAL

/datum/crafting_recipe/ms13_handcuffs
	name = "handcuffs"
	result = /obj/item/restraints/handcuffs
	time = 8 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/scrap_parts = 4,
				/obj/item/stack/sheet/ms13/scrap = 4)
	category = CAT_UTILITY
	crafting_interface = CRAFTING_BENCH_GENERAL

/datum/crafting_recipe/flask
	name = "ceramic flask"
	result = /obj/item/reagent_containers/ms13/flask
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/ceramic = 2)
	category = CAT_UTILITY
	crafting_interface = CRAFTING_BENCH_GENERAL

/datum/crafting_recipe/ferti_bag
	name = "empty fertilizer bag"
	result = /obj/item/ms13/fertilizer
	time = 8 SECONDS
	tool_paths = list()
	trait = TRAIT_SNOWCREST_TAILOR
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 8,
				/obj/item/stack/sheet/ms13/thread = 5)
	category = CAT_UTILITY
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR


//SMELTER CRAFTING

/datum/crafting_recipe/refined_steel
	name = "refined steel from scrap"
	result = /obj/item/stack/sheet/ms13/refined_steel
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_steel = 4,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/refined_alu
	name = "refined aluminum from scrap"
	result = /obj/item/stack/sheet/ms13/refined_alu
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_alu = 4,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/refined_lead
	name = "refined lead from scrap"
	result = /obj/item/stack/sheet/ms13/refined_lead
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_lead = 4,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/refined_copper
	name = "refined copper from scrap"
	result = /obj/item/stack/sheet/ms13/refined_copper
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_copper = 4,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/refined_brass
	name = "refined brass from scrap"
	result = /obj/item/stack/sheet/ms13/refined_brass
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_brass = 4,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/refined_silver
	name = "refined silver from scrap"
	result = /obj/item/stack/sheet/ms13/refined_silver
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_silver = 4,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/refined_gold
	name = "refined gold from scrap"
	result = /obj/item/stack/sheet/ms13/refined_gold
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_gold = 4,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_steel_beams
	name = "melt down refined steel"
	result = /obj/item/stack/sheet/ms13/scrap_steel/four
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_steel = 1,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_alu
	name = "melt down refined aluminum"
	result = /obj/item/stack/sheet/ms13/scrap_alu/four
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_alu = 1,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_lead
	name = "melt down refined lead"
	result = /obj/item/stack/sheet/ms13/scrap_lead/four
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_lead = 1,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_copper
	name = "melt down refined copper"
	result = /obj/item/stack/sheet/ms13/scrap_copper/four
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_copper = 1,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_brass
	name = "melt down refined brass"
	result = /obj/item/stack/sheet/ms13/scrap_brass/four
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_brass = 1,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_silver
	name = "melt down refined silver"
	result = /obj/item/stack/sheet/ms13/scrap_silver/four
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_silver = 1,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_gold
	name = "melt down refined gold"
	result = /obj/item/stack/sheet/ms13/scrap_gold/four
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_gold = 1,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_ncr
	name = "melt down and reforge NCR coins"
	result = /obj/item/stack/sheet/ms13/refined_gold
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/ms13/currency/ncr_coin = 8,
				/obj/item/stack/sheet/ms13/wood = 1)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_denarius
	name = "melt down and reforge Legion denarii"
	result = /obj/item/stack/sheet/ms13/refined_silver
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/ms13/currency/denarius = 8,
				/obj/item/stack/sheet/ms13/wood = 1)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_aurelius
	name = "melt down and reforge Legion aurelii"
	result = /obj/item/stack/sheet/ms13/refined_gold
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/ms13/currency/aurelius = 3,
				/obj/item/stack/sheet/ms13/wood = 1)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_bottlecap
	name = "melt down bottle caps"
	result = /obj/item/stack/sheet/ms13/scrap_alu/five
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/ms13/currency/cap = 15,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/*/datum/crafting_recipe/melt_scrap_parts //Commented out for the same reason as smashing circuits and fission batteries are. Crafting recipes don't support lists - Hekzder 2022
	name = "melt down scrap parts"
	result = list(/obj/item/stack/sheet/ms13/scrap_steel = 1, /obj/item/stack/sheet/ms13/scrap_alu = 1, /obj/item/stack/sheet/ms13/scrap = 2)
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/scrap_parts = 5,
				/obj/item/stack/sheet/ms13/plank = 1)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER*/

/datum/crafting_recipe/smelt_copper
	name = "refined copper from ore"
	result = /obj/item/stack/sheet/ms13/refined_copper
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/nugget/nugget_copper = 4,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/smelt_lead
	name = "refined lead from ore"
	result = /obj/item/stack/sheet/ms13/refined_lead
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/nugget/nugget_lead = 4,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/smelt_alu
	name = "refined aluminum from ore"
	result = /obj/item/stack/sheet/ms13/refined_alu
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/nugget/nugget_alu = 4,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/smelt_silver
	name = "refined silver from ore"
	result = /obj/item/stack/sheet/ms13/refined_silver
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/nugget/nugget_silver = 4,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/smelt_gold
	name = "refined gold from ore"
	result = /obj/item/stack/sheet/ms13/refined_gold
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/nugget/nugget_gold = 4,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

// /datum/crafting_recipe/smelt_uranium
// 	name = "refine pitchblende ore"
// 	result = To be added later
// 	time = 3 SECONDS
//	tool_paths = list(/obj/item/ms13/hammer)
// 	reqs = list(/obj/item/stack/sheet/ms13/nugget/nugget_uranium = 4,
// 				/obj/item/stack/sheet/ms13/wood = 2)
// 	category = CAT_SMELTER
// 	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/smelt_iron
	name = "refined steel from ore"
	result = /obj/item/stack/sheet/ms13/refined_steel
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/nugget/nugget_iron = 4,
				/obj/item/stack/sheet/ms13/nugget/nugget_coal = 2,
				/obj/item/stack/sheet/ms13/wood = 1)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/smelt_zinc
	name = "refined brass from ore"
	result = /obj/item/stack/sheet/ms13/refined_brass
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/nugget/nugget_copper = 3,
				/obj/item/stack/sheet/ms13/nugget/nugget_zinc = 2,
				/obj/item/stack/sheet/ms13/wood = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

//FARMING RECIPES

/datum/crafting_recipe/fertilizer_ms13
	name = "fertilizer"
	result = /obj/item/stack/ms13/fertilizer
	time = 8 SECONDS
	reqs = list(/obj/item/ms13/fertilizer = 1,
				/obj/item/food/badrecipe/moldy/ms13 = 8)
	category = CAT_FARMING
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

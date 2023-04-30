//Recipes for all kinds of electronics crafting

//ELECTRONICS CRAFTING

/datum/crafting_recipe/shart_flashlight
	name = "homemade flashlight"
	result = /obj/item/flashlight/ms13/crafted
	time = 6 SECONDS
	tool_paths = list(/obj/item/wirecutters/ms13)
	reqs = list(/obj/item/light/ms13/bulb = 1,
				/obj/item/ms13/component/cell = 1,
				/obj/item/stack/sheet/ms13/scrap_copper = 2,
				/obj/item/stack/sheet/ms13/scrap_electronics = 2)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/flashlight
	name = "flashlight"
	result = /obj/item/flashlight/ms13
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	reqs = list(/obj/item/ms13/component/cell = 2,
				/obj/item/stack/sheet/ms13/scrap_copper = 5,
				/obj/item/stack/sheet/ms13/scrap_electronics = 5,
				/obj/item/stack/sheet/ms13/refined_alu = 1,
				/obj/item/stack/sheet/ms13/scrap_parts = 4,
				/obj/item/stack/sheet/ms13/glass = 5,
				/obj/item/stack/sheet/ms13/circuits = 1)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/stick_flashlight
	name = "stick flashlight"
	result = /obj/item/flashlight/ms13/mag
	time = 20 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH)
	tool_paths = list(/obj/item/wirecutters/ms13)
	trait = TRAIT_SCRIBE_TRAINING
	reqs = list(/obj/item/ms13/component/cell = 2,
				/obj/item/stack/sheet/ms13/scrap_copper = 8,
				/obj/item/stack/sheet/ms13/scrap_electronics = 8,
				/obj/item/stack/sheet/ms13/refined_alu = 3,
				/obj/item/stack/sheet/ms13/scrap_parts = 8,
				/obj/item/stack/sheet/ms13/glass = 8,
				/obj/item/stack/sheet/ms13/circuits = 5)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/receiver_radio
	name = "receiver hand radio"
	result = /obj/item/radio/ms13
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	reqs = list(/obj/item/ms13/component/cell = 1,
				/obj/item/ms13/component/vacuum_tube = 1,
				/obj/item/stack/sheet/ms13/scrap_copper = 5,
				/obj/item/stack/sheet/ms13/scrap_electronics = 5,
				/obj/item/stack/sheet/ms13/plastic = 6,
				/obj/item/stack/sheet/ms13/scrap_parts = 4,
				/obj/item/stack/sheet/ms13/circuits = 2)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/broadcast_radio
	name = "broadcast hand radio"
	result = /obj/item/radio/ms13/broadcast
	time = 18 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	reqs = list(/obj/item/radio/ms13 = 1,
				/obj/item/ms13/component/cell = 1,
				/obj/item/ms13/component/vacuum_tube = 1,
				/obj/item/stack/sheet/ms13/scrap_copper = 6,
				/obj/item/stack/sheet/ms13/scrap_electronics = 6,
				/obj/item/stack/sheet/ms13/scrap_parts = 4,
				/obj/item/stack/sheet/ms13/circuits = 3)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/advanced_radio
	name = "advanced hand radio"
	result = /obj/item/radio/ms13/broadcast/advanced
	time = 20 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	trait = TRAIT_SCRIBE_TRAINING
	reqs = list(/obj/item/radio/ms13/broadcast = 1,
				/obj/item/ms13/component/cell = 2,
				/obj/item/ms13/component/vacuum_tube = 2,
				/obj/item/stack/sheet/ms13/scrap_copper = 8,
				/obj/item/stack/sheet/ms13/scrap_electronics = 8,
				/obj/item/stack/sheet/ms13/scrap_parts = 5,
				/obj/item/stack/sheet/ms13/circuits = 5)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/energy_cell
	name = "energy cell"
	result = /obj/item/stock_parts/cell/ms13/ec
	time = 10 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	reqs = list(/obj/item/ms13/component/cell = 1,
				/obj/item/stack/sheet/ms13/refined_copper = 2,
				/obj/item/stack/sheet/ms13/scrap_electronics = 5,
				/obj/item/stack/sheet/ms13/plastic = 3)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/mfc
	name = "microfusion cell"
	result = /obj/item/stock_parts/cell/ms13/mfc
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	trait = TRAIT_SCRIBE_TRAINING
	reqs = list(/obj/item/ms13/component/cell = 2,
				/obj/item/stack/sheet/ms13/refined_copper = 3,
				/obj/item/stack/sheet/ms13/scrap_electronics = 8,
				/obj/item/stack/sheet/ms13/refined_lead = 1,
				/obj/item/stack/sheet/ms13/plastic = 4)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/ecp
	name = "electron charge pack"
	result = /obj/item/stock_parts/cell/ms13/ecp
	time = 15 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	trait = TRAIT_SCRIBE_TRAINING
	reqs = list(/obj/item/ms13/component/cell = 2,
				/obj/item/stack/sheet/ms13/refined_copper = 4,
				/obj/item/stack/sheet/ms13/scrap_electronics = 10,
				/obj/item/stack/sheet/ms13/refined_lead = 2,
				/obj/item/stack/sheet/ms13/plastic = 5)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/pc
	name = "plasma cell"
	result = /obj/item/stock_parts/cell/ms13/pc
	time = 15 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	trait = TRAIT_SCRIBE_TRAINING
	reqs = list(/obj/item/ms13/component/plasma_battery = 2,
				/obj/item/stack/sheet/ms13/refined_copper = 5,
				/obj/item/stack/sheet/ms13/refined_lead = 2,
				/obj/item/stack/sheet/ms13/plastic = 6)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/*/datum/crafting_recipe/smash_circuits //These are commented out for now because crafting recipes don't support list results. I am crying. - Hekzder 2022
	name = "smash apart circuits"
	result = list(/obj/item/stack/sheet/ms13/scrap_electronics = 6, /obj/item/stack/sheet/ms13/scrap_copper = 4)
	time = 4 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/circuits = 2)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/smash_fusioncell
	name = "smash apart fusion cell"
	result = list(/obj/item/stack/sheet/ms13/scrap_lead = 2, /obj/item/stack/sheet/ms13/scrap_copper = 2)
	time = 4 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/ms13/component/cell = 1)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ELECTRIC*/

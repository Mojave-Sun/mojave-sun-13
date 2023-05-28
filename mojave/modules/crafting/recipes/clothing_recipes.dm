//Recipes for all kinds of clothing crafting, including armor

//ARMOR CRAFTING

/datum/crafting_recipe/leather_armor
	name = "leather armor"
	result = /obj/item/clothing/suit/armor/ms13/leatherarmor
	time = 12 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 8,
				/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_leather_armor
	name = "reinforced leather armor"
	result = /obj/item/clothing/suit/armor/ms13/leatherarmor/reinforced
	time = 15 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/armor/ms13/leatherarmor = 1,
				/obj/item/stack/sheet/ms13/leather = 5,
				/obj/item/stack/sheet/ms13/ceramic = 8,
				/obj/item/stack/sheet/ms13/mil_fiber = 3,
				/obj/item/stack/sheet/ms13/thread = 3)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/tire_armor
	name = "tire armor"
	result = /obj/item/clothing/suit/armor/ms13/tire
	time = 10 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/rubber = 6,
				/obj/item/stack/sheet/ms13/cloth = 4)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/mole_jacket
	name = "ratskin jacket"
	result = /obj/item/clothing/suit/ms13/ljacket/moleskin
	time = 10 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/ms13/hide/pigrat = 1,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/leather_vest
	name = "leather vest"
	result = /obj/item/clothing/suit/ms13/vest
	time = 10 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 5,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/armor_kit
	name = "armor kit"
	result = /obj/item/clothing/suit/armor/ms13/kit
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/scrap = 6)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_armor_kit
	name = "reinforced armor kit"
	result = /obj/item/clothing/suit/armor/ms13/kit/reinf
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/suit/armor/ms13/kit = 1,
				/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/scrap_steel = 4,
				/obj/item/stack/sheet/ms13/scrap_parts = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_ljacket
	name = "reinforced leather jacket"
	result = /obj/item/clothing/suit/ms13/ljacket/reinforced
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/ms13/ljacket = 1,
				/obj/item/stack/sheet/ms13/leather = 5,
				/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_trench
	name = "reinforced black trenchcoat"
	result = /obj/item/clothing/suit/ms13/trench/black/reinf
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/suit/ms13/trench/black = 1,
				/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/scrap_steel = 4,
				/obj/item/stack/sheet/ms13/scrap_parts = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/armor_trench
	name = "armored black trenchcoat"
	result = /obj/item/clothing/suit/ms13/trench/black/armored
	time = 15 SECONDS
	tool_behaviors = list(TOOL_WELDER, TOOL_WRENCH, TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/suit/ms13/trench/black/reinf = 1,
				/obj/item/stack/sheet/ms13/refined_steel = 3,
				/obj/item/stack/sheet/ms13/leather = 4,
				/obj/item/stack/sheet/ms13/scrap_parts = 5,
				/obj/item/stack/sheet/ms13/mil_fiber = 2,
				/obj/item/stack/sheet/ms13/thread = 3)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_veteran
	name = "reinforced veteran coat"
	result = /obj/item/clothing/suit/ms13/veteran_coat/reinf
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/ms13/veteran_coat = 1,
				/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/scrap = 2,
				/obj/item/stack/sheet/ms13/mil_fiber = 1,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/duster
	name = "duster"
	result = /obj/item/clothing/suit/ms13/duster
	time = 10 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 4,
				/obj/item/stack/sheet/ms13/cloth = 4,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_duster
	name = "reinforced duster"
	result = /obj/item/clothing/suit/ms13/duster/reinforced
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/ms13/duster = 1,
				/obj/item/stack/sheet/ms13/leather = 5,
				/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_orange_jacket
	name = "reinforced orange winter jacket"
	result = /obj/item/clothing/suit/toggle/ms13/wjacket/orange/reinforced
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/toggle/ms13/wjacket/orange = 1,
				/obj/item/stack/sheet/ms13/leather = 5,
				/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_brown_jacket
	name = "reinforced brown winter jacket"
	result = /obj/item/clothing/suit/toggle/ms13/wjacket/brown/reinforced
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/toggle/ms13/wjacket/brown = 1,
				/obj/item/stack/sheet/ms13/leather = 5,
				/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_blue_jacket
	name = "reinforced blue winter jacket"
	result = /obj/item/clothing/suit/toggle/ms13/wjacket/blue/reinforced
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/toggle/ms13/wjacket/blue = 1,
				/obj/item/stack/sheet/ms13/leather = 5,
				/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_black_jacket
	name = "reinforced black winter jacket"
	result = /obj/item/clothing/suit/toggle/ms13/wjacket/black/reinforced
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/toggle/ms13/wjacket/black = 1,
				/obj/item/stack/sheet/ms13/leather = 5,
				/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/armor_orange_jacket
	name = "armored orange winter jacket"
	result = /obj/item/clothing/suit/toggle/ms13/wjacket/orange/armored
	time = 15 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	tool_behaviors = list(TOOL_WELDER)
	reqs = list(/obj/item/clothing/suit/toggle/ms13/wjacket/orange/reinforced = 1,
				/obj/item/stack/sheet/ms13/refined_steel = 3,
				/obj/item/stack/sheet/ms13/leather = 5,
				/obj/item/stack/sheet/ms13/scrap_parts = 3,
				/obj/item/stack/sheet/ms13/mil_fiber = 2,
				/obj/item/stack/sheet/ms13/thread = 3)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/armor_brown_jacket
	name = "armored brown winter jacket"
	result = /obj/item/clothing/suit/toggle/ms13/wjacket/brown/armored
	time = 15 SECONDS
	tool_paths = list()
	tool_behaviors = list(TOOL_KNIFE)
	reqs = list(/obj/item/clothing/suit/toggle/ms13/wjacket/brown/reinforced = 1,
				/obj/item/stack/sheet/ms13/leather = 6,
				/obj/item/stack/sheet/ms13/mil_fiber = 4,
				/obj/item/stack/sheet/ms13/thread = 4)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/armor_blue_jacket
	name = "armored blue winter jacket"
	result = /obj/item/clothing/suit/toggle/ms13/wjacket/blue/armored
	time = 15 SECONDS
	tool_paths = list()
	tool_behaviors = list(TOOL_KNIFE)
	reqs = list(/obj/item/clothing/suit/toggle/ms13/wjacket/blue/reinforced = 1,
				/obj/item/stack/sheet/ms13/leather = 6,
				/obj/item/stack/sheet/ms13/mil_fiber = 4,
				/obj/item/stack/sheet/ms13/thread = 4)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/armor_black_jacket
	name = "armored black winter jacket"
	result = /obj/item/clothing/suit/toggle/ms13/wjacket/black/armored
	time = 15 SECONDS
	tool_paths = list()
	tool_behaviors = list(TOOL_KNIFE)
	reqs = list(/obj/item/clothing/suit/toggle/ms13/wjacket/black/reinforced = 1,
				/obj/item/stack/sheet/ms13/leather = 6,
				/obj/item/stack/sheet/ms13/mil_fiber = 4,
				/obj/item/stack/sheet/ms13/thread = 4)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//HEADGEAR CRAFTING

/datum/crafting_recipe/radstag_skull
	name = "radstag skull helmet"
	result = /obj/item/clothing/head/helmet/ms13/skull
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/ms13/animalitem/radstag/antlers = 2,
				/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/brahmiluff_skull
	name = "brahmiluff skull helmet"
	result = /obj/item/clothing/head/helmet/ms13/skull/muffalo
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/ms13/animalitem/brahmiluff/horns = 2,
				/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_hat
	name = "cowboy hat"
	result = /obj/item/clothing/head/helmet/ms13/cowboy
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/cloth = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_hat_black
	name = "black cowboy hat"
	result = /obj/item/clothing/head/helmet/ms13/cowboy/black
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/cloth = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/prospector_hat
	name = "prospector hat"
	result = /obj/item/clothing/head/helmet/ms13/prospector
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/prospector_hat_brown
	name = "brown prospector hat"
	result = /obj/item/clothing/head/helmet/ms13/prospector/brown
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/militia_hat
	name = "militia hat"
	result = /obj/item/clothing/head/helmet/ms13/militia
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowl
	name = "cowl"
	result = /obj/item/clothing/head/ms13/hood/cowl
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/plated_cowl
	name = "plated cowl"
	result = /obj/item/clothing/head/ms13/hood/plated
	time = 8 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/head/ms13/hood/cowl = 1,
				/obj/item/stack/sheet/ms13/scrap = 4,
				/obj/item/stack/sheet/ms13/scrap_parts = 3)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/green_hood
	name = "green hood"
	result = /obj/item/clothing/head/ms13/hood/green
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/cloth = 1,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/hunter_hood
	name = "hunter hood"
	result = /obj/item/clothing/head/ms13/hood/hunter
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/head/ms13/hood/green = 1,
				/obj/item/stack/sheet/ms13/leather = 4,
				/obj/item/clothing/mask/ms13/bandana/red = 1,
				/obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/sackhood
	name = "sack hood"
	result = /obj/item/clothing/head/ms13/hood/sack
	time = 6 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/sackhood_padded
	name = "padded sack hood"
	result = /obj/item/clothing/head/ms13/hood/sack/padded
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/head/ms13/hood/sack = 1,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/sackhood_reinf
	name = "reinforced sack hood"
	result = /obj/item/clothing/head/ms13/hood/sack/metal
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/head/ms13/hood/sack = 1,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/scrap = 5,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/bladed_helmet
	name = "bladed helmet"
	result = /obj/item/clothing/head/helmet/ms13/bladed
	time = 10 SECONDS
	tool_behaviors = list(TOOL_DRILL)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 4,
				/obj/item/stack/sheet/ms13/scrap_steel = 5)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/banded_helmet
	name = "banded helmet"
	result = /obj/item/clothing/head/ms13/hood/banded
	time = 8 SECONDS
	tool_behaviors = list(TOOL_DRILL)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/head/ms13/hood/cowl = 1,
				/obj/item/stack/sheet/ms13/scrap_steel = 3,
				/obj/item/stack/sheet/ms13/scrap = 3)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/junk_helmet
	name = "junk helmet"
	result = /obj/item/clothing/head/helmet/ms13/junk
	time = 10 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/scrap = 5,
				/obj/item/stack/sheet/ms13/scrap_parts = 4)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//UNDER/CLOTHING CRAFTING

/datum/crafting_recipe/caravan_pants
	name = "caravan pants"
	result = /obj/item/clothing/under/ms13/wasteland/caravanpants
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cloth_pants
	name = "cloth pants"
	result = /obj/item/clothing/under/ms13/wasteland/pants
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/leather_pants
	name = "leather pants"
	result = /obj/item/clothing/under/ms13/wasteland/warboypants
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 1,
				/obj/item/stack/sheet/ms13/leather = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/clothing_rags
	name = "rags"
	result = /obj/item/clothing/under/ms13/wasteland/rag
	time = 5 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/doctor_uniform
	name = "wasteland doctor uniform"
	result = /obj/item/clothing/under/ms13/wasteland/doctor
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/homemade_garbs
	name = "homemade garbs"
	result = /obj/item/clothing/under/ms13/wasteland/peasant
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_outfit
	name = "classic cowboy outfit"
	result = /obj/item/clothing/under/ms13/wasteland/cowboy
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/leather = 1,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_outfit_dark
	name = "dark cowboy outfit"
	result = /obj/item/clothing/under/ms13/wasteland/cowboy/grey
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/leather = 1,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_outfit_tan
	name = "tan cowboy outfit"
	result = /obj/item/clothing/under/ms13/wasteland/cowboy/tan
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/leather = 1,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/guard_clothes
	name = "guard clothes"
	result = /obj/item/clothing/under/ms13/wasteland/guard
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/wanderer_clothes
	name = "wanderer clothes"
	result = /obj/item/clothing/under/ms13/wasteland/wanderer
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/rancher_clothes
	name = "ranchers clothes"
	result = /obj/item/clothing/under/ms13/wasteland/rancher
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/leather = 1,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/merchant_clothes
	name = "merchants' clothes"
	result = /obj/item/clothing/under/ms13/wasteland/merchant
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/caravan_clothes
	name = "caravaneer clothes"
	result = /obj/item/clothing/under/ms13/wasteland/caravaneer
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/merc_clothes
	name = "mercenary clothes"
	result = /obj/item/clothing/under/ms13/wasteland/merca
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/mercvet_clothes
	name = "merc veteran clothes"
	result = /obj/item/clothing/under/ms13/wasteland/mercc
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/roving_clothes
	name = "roving traders' clothes"
	result = /obj/item/clothing/under/ms13/wasteland/roving
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//LEGION CRAFTING

/datum/crafting_recipe/leg_fatigues
	name = "Legion fatigues"
	result = /obj/item/clothing/under/ms13/legion/fatigues
	time = 8 SECONDS
	tool_paths = list()
	trait = TRAIT_LEGION_SMITHING
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/leather = 1,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/leg_recruit
	name = "Legion recruit armor"
	result = /obj/item/clothing/suit/armor/ms13/legion/recruit
	time = 12 SECONDS
	tool_behaviors = list()
	tool_paths = list(/obj/item/ms13/hammer)
	trait = TRAIT_LEGION_SMITHING
	reqs = list(/obj/item/stack/sheet/ms13/leather = 5,
				/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/thread = 2,
				/obj/item/stack/sheet/ms13/scrap = 2
				)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/leg_recruithelm
	name = "Legion recruit helmet"
	result = /obj/item/clothing/head/helmet/ms13/legion/recruit
	time = 8 SECONDS
	tool_paths = list()
	trait = TRAIT_LEGION_SMITHING
	reqs = list(/obj/item/stack/sheet/ms13/leather = 4,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/leg_prime
	name = "Legion prime armor"
	result = /obj/item/clothing/suit/armor/ms13/legion/prime
	time = 15 SECONDS
	tool_behaviors = list()
	tool_paths = list(/obj/item/ms13/hammer)
	trait = TRAIT_LEGION_SMITHING
	reqs = list(/obj/item/stack/sheet/ms13/leather = 5,
				/obj/item/stack/sheet/ms13/thread = 1,
				/obj/item/stack/sheet/ms13/scrap_steel = 6,
				/obj/item/clothing/suit/armor/ms13/legion/recruit = 1
				)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/leg_primehelm
	name = "Legion prime helmet"
	result = /obj/item/clothing/head/helmet/ms13/legion/prime
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	trait = TRAIT_LEGION_SMITHING
	reqs = list(/obj/item/stack/sheet/ms13/leather = 4,
				/obj/item/stack/sheet/ms13/cloth = 3,
				/obj/item/clothing/head/helmet/ms13/legion/recruit = 1
				)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//MISC CLOTHING ITEMS (GLOVES, SHOES, MASKS)

/datum/crafting_recipe/leather_gloves
	name = "leather gloves"
	result = /obj/item/clothing/gloves/ms13/leather
	time = 5 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 1,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/fingerless_gloves
	name = "fingerless gloves"
	result = /obj/item/clothing/gloves/ms13/fingerless
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 1,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/brown_winter_gloves
	name = "brown winter gloves"
	result = /obj/item/clothing/gloves/ms13/winter
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 1,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/dark_winter_gloves
	name = "dark winter gloves"
	result = /obj/item/clothing/gloves/ms13/winter/black
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 1,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/footcloth
	name = "footcloths"
	result = /obj/item/clothing/shoes/ms13/rag
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/crude_treads
	name = "crude treads"
	result = /obj/item/clothing/shoes/ms13/crude
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 1,
				/obj/item/stack/sheet/ms13/leather = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/brownie_shoes
	name = "brown leather shoes"
	result = /obj/item/clothing/shoes/ms13/brownie
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/tannie_shoes
	name = "tan leather shoes"
	result = /obj/item/clothing/shoes/ms13/tan
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_boots
	name = "cowboy boots"
	result = /obj/item/clothing/shoes/ms13/cowboy
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/thread = 1,
				/obj/item/stack/sheet/ms13/scrap = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/brown_winter_boots
	name = "brown winter boots"
	result = /obj/item/clothing/shoes/ms13/winter
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/thread = 1,
				/obj/item/stack/sheet/ms13/cloth = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/dark_winter_boots
	name = "dark winter boots"
	result = /obj/item/clothing/shoes/ms13/winter/black
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/thread = 1,
				/obj/item/stack/sheet/ms13/cloth = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/explore_boots
	name = "explorer boots"
	result = /obj/item/clothing/shoes/ms13/explorer
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/thread = 1,
				/obj/item/stack/sheet/ms13/cloth = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/black_bandana
	name = "black bandana"
	result = /obj/item/clothing/mask/ms13/bandana
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/blue_bandana
	name = "blue bandana"
	result = /obj/item/clothing/mask/ms13/bandana/blue
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/red_bandana
	name = "red bandana"
	result = /obj/item/clothing/mask/ms13/bandana/red
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/white_bandana
	name = "white bandana"
	result = /obj/item/clothing/mask/ms13/bandana/white
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/green_bandana
	name = "green bandana"
	result = /obj/item/clothing/mask/ms13/bandana/green
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/shawl
	name = "leather shawl"
	result = /obj/item/clothing/neck/cloak/ms13/shawl
	time = 8 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 3)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

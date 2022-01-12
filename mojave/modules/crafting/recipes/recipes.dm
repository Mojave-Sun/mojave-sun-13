


// Used to filter crafting recipes based on what you are crafting with
// i.e CRAFTING_BENCH_HANDS is the default crafting menu (hidden at time of writing)
// the general crafting bench only shows recipes with CRAFTING_BENCH_GENERAL, etc.
// treat this is a flag, so recipes can be shared between (i.e bandages on GENERAL and ARMTAILOR)
/datum/crafting_recipe/var/crafting_interface = CRAFTING_BENCH_HANDS

// Used to display relevant recipes - match to the recipe's crafting_interface
/datum/component/personal_crafting/var/crafting_interface = CRAFTING_BENCH_HANDS

//MEDICAL CRAFTING
/datum/crafting_recipe/three_gauze
	name = "three rolls of gauze"
	result = /obj/item/stack/medical/gauze/ms13/three
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 4)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/four_suture
	name = "four use suture"
	result = /obj/item/stack/medical/suture/ms13/four
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/thread = 4, /obj/item/stack/sheet/ms13/scrap = 2)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/full_gauze
	name = "twelve rolls of gauze"
	result = /obj/item/stack/medical/gauze/ms13
	time = 15 SECONDS
	tool_paths = list()
	trait = TRAIT_MEDICAL_TRAINING
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 10)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/full_suture
	name = "twelve use suture"
	result = /obj/item/stack/medical/suture/ms13
	time = 18 SECONDS
	tool_paths = list()
	trait = TRAIT_MEDICAL_TRAINING
	reqs = list(/obj/item/stack/sheet/ms13/thread = 8, /obj/item/stack/sheet/ms13/scrap = 6)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/mil_gauze
	name = "military gauze"
	result = /obj/item/stack/medical/gauze/ms13/military
	time = 20 SECONDS
	tool_paths = list()
	trait = TRAIT_MEDICAL_TRAINING
	reqs = list(/obj/item/stack/sheet/ms13/mil_fiber = 6)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//ARMOR CRAFTING

/datum/crafting_recipe/leather_armor
	name = "leather armor"
	result = /obj/item/clothing/suit/armor/ms13/leatherarmor
	time = 12 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 8, /obj/item/stack/medical/gauze/ms13/cloth = 2, /obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_leather_armor
	name = "reinforced leather armor"
	result = /obj/item/clothing/suit/armor/ms13/leatherarmor/reinforced
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/armor/ms13/leatherarmor = 1, /obj/item/stack/sheet/ms13/leather = 4, /obj/item/stack/sheet/ms13/ceramic = 10, /obj/item/stack/sheet/ms13/mil_fiber = 2, /obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/tire_armor
	name = "tire armor"
	result = /obj/item/clothing/suit/armor/ms13/tire
	time = 10 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/rubber = 6, /obj/item/stack/medical/gauze/ms13/cloth = 4)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/mole_jacket
	name = "moleskin jacket"
	result = /obj/item/clothing/suit/ms13/ljacket/moleskin
	time = 10 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/ms13/hide/molerat = 2, /obj/item/stack/medical/gauze/ms13/cloth = 2, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/shawl
	name = "leather shawl"
	result = /obj/item/clothing/suit/ms13/shawl
	time = 10 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 6)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/leather_vest
	name = "leather vest"
	result = /obj/item/clothing/suit/ms13/vest
	time = 10 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 5, /obj/item/stack/medical/gauze/ms13/cloth = 2, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/armor_kit
	name = "armor kit"
	result = /obj/item/clothing/suit/armor/ms13/kit
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2, /obj/item/stack/medical/gauze/ms13/cloth = 4, /obj/item/stack/sheet/ms13/scrap = 10)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_armor_kit
	name = "reinforced armor kit"
	result = /obj/item/clothing/suit/armor/ms13/kit/reinf
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/suit/armor/ms13/kit = 1, /obj/item/stack/sheet/ms13/leather = 3, /obj/item/stack/medical/gauze/ms13/cloth = 2, /obj/item/stack/sheet/ms13/scrap_steel = 8, /obj/item/stack/sheet/ms13/scrap_parts = 4)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_ljacket
	name = "reinforced leather jacket"
	result = /obj/item/clothing/suit/ms13/ljacket/reinforced
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/ms13/ljacket = 1, /obj/item/stack/sheet/ms13/leather = 5, /obj/item/stack/medical/gauze/ms13/cloth = 3, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_trench
	name = "reinforced black trenchcoat"
	result = /obj/item/clothing/suit/ms13/trench/black/reinf
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/suit/ms13/trench/black = 1, /obj/item/stack/sheet/ms13/scrap_steel = 6, /obj/item/stack/sheet/ms13/leather = 4, /obj/item/stack/sheet/ms13/scrap = 4, /obj/item/stack/sheet/ms13/scrap_parts = 2, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/armor_trench
	name = "armored black trenchcoat"
	result = /obj/item/clothing/suit/ms13/trench/black/armored
	time = 18 SECONDS
	tool_behaviors = list(TOOL_WELDER, TOOL_WRENCH, TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/suit/ms13/trench/black/reinf = 1, /obj/item/stack/sheet/ms13/refined_steel = 4, /obj/item/stack/sheet/ms13/leather = 6, /obj/item/stack/sheet/ms13/scrap_parts = 8, /obj/item/stack/sheet/ms13/mil_fiber = 3, /obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_veteran
	name = "reinforced veteran coat"
	result = /obj/item/clothing/suit/ms13/veteran_coat/reinf
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/ms13/veteran_coat = 1, /obj/item/stack/sheet/ms13/leather = 2, /obj/item/stack/sheet/ms13/scrap = 2, /obj/item/stack/sheet/ms13/mil_fiber = 1, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/duster
	name = "duster"
	result = /obj/item/clothing/suit/ms13/duster
	time = 10 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 4, /obj/item/stack/medical/gauze/ms13/cloth = 4, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_duster
	name = "reinforced duster"
	result = /obj/item/clothing/suit/ms13/duster/reinforced
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/ms13/duster = 1, /obj/item/stack/sheet/ms13/leather = 5, /obj/item/stack/medical/gauze/ms13/cloth = 3, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

//HEADGEAR CRAFTING

/datum/crafting_recipe/radstag_skull
	name = "radstag skull helmet"
	result = /obj/item/clothing/head/helmet/ms13/skull
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/ms13/animalitem/radstag/antlers = 2, /obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/brahmiluff_skull
	name = "brahmiluff skull helmet"
	result = /obj/item/clothing/head/helmet/ms13/skull/muffalo
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/ms13/animalitem/brahmiluff/horns = 2, /obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_hat
	name = "cowboy hat"
	result = /obj/item/clothing/head/helmet/ms13/cowboy
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2, /obj/item/stack/medical/gauze/ms13/cloth = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_hat_black
	name = "black cowboy hat"
	result = /obj/item/clothing/head/helmet/ms13/cowboy/black
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2, /obj/item/stack/medical/gauze/ms13/cloth = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/prospector_hat
	name = "prospector hat"
	result = /obj/item/clothing/head/helmet/ms13/prospector
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 3, /obj/item/stack/medical/gauze/ms13/cloth = 2, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/prospector_hat_brown
	name = "brown prospector hat"
	result = /obj/item/clothing/head/helmet/ms13/prospector/brown
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 3, /obj/item/stack/medical/gauze/ms13/cloth = 2, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/militia_hat
	name = "militia hat"
	result = /obj/item/clothing/head/helmet/ms13/militia
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 3, /obj/item/stack/medical/gauze/ms13/cloth = 2, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowl
	name = "cowl"
	result = /obj/item/clothing/head/ms13/hood/cowl
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/plated_cowl
	name = "plated cowl"
	result = /obj/item/clothing/head/ms13/hood/plated
	time = 8 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/head/ms13/hood/cowl = 1, /obj/item/stack/sheet/ms13/scrap = 4, /obj/item/stack/sheet/ms13/scrap_parts = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/green_hood
	name = "green hood"
	result = /obj/item/clothing/head/ms13/hood/green
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 3, /obj/item/stack/medical/gauze/ms13/cloth = 2, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/hunter_hood
	name = "hunter hood"
	result = /obj/item/clothing/head/ms13/hood/hunter
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/head/ms13/hood/green = 1, /obj/item/stack/sheet/ms13/leather = 4, /obj/item/stack/medical/gauze/ms13/cloth = 3, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/sackhood
	name = "sack hood"
	result = /obj/item/clothing/head/ms13/hood/sack
	time = 6 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/sackhood_padded
	name = "padded sack hood"
	result = /obj/item/clothing/head/ms13/hood/sack/padded
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/head/ms13/hood/sack = 1, /obj/item/stack/medical/gauze/ms13/cloth = 2, /obj/item/stack/sheet/ms13/leather = 2, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/sackhood_reinf
	name = "reinforced sack hood"
	result = /obj/item/clothing/head/ms13/hood/sack/metal
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/head/ms13/hood/sack = 1, /obj/item/stack/medical/gauze/ms13/cloth = 3, /obj/item/stack/sheet/ms13/scrap = 6, /obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/bladed_helmet
	name = "bladed helmet"
	result = /obj/item/clothing/head/helmet/ms13/bladed
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 4, /obj/item/stack/sheet/ms13/scrap_steel = 6)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/banded_helmet
	name = "banded helmet"
	result = /obj/item/clothing/head/ms13/hood/banded
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/head/ms13/hood/cowl = 1, /obj/item/stack/sheet/ms13/scrap_steel = 4, /obj/item/stack/sheet/ms13/scrap = 4)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/junk_helmet
	name = "junk helmet"
	result = /obj/item/clothing/head/helmet/ms13/junk
	time = 10 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2, /obj/item/stack/sheet/ms13/scrap = 6, /obj/item/stack/sheet/ms13/scrap_parts = 2)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/metal_helmet
	name = "heavy metal helmet"
	result = /obj/item/clothing/head/helmet/ms13/metal
	time = 15 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/refined_steel = 5, /obj/item/stack/medical/gauze/ms13/cloth = 4, /obj/item/stack/sheet/ms13/scrap_parts = 6, /obj/item/stack/sheet/ms13/mil_fiber = 2, /obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR




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
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 4)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/four_suture
	name = "four use suture"
	result = /obj/item/stack/medical/suture/ms13/four
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/thread = 4, 
				/obj/item/stack/sheet/ms13/scrap = 2)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/full_gauze
	name = "twelve rolls of gauze"
	result = /obj/item/stack/medical/gauze/ms13
	time = 15 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
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
	reqs = list(/obj/item/stack/sheet/ms13/thread = 8, 
				/obj/item/stack/sheet/ms13/scrap = 6)
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
	reqs = list(/obj/item/stack/sheet/ms13/leather = 8, 
				/obj/item/stack/medical/gauze/ms13/cloth = 2, 
				/obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_leather_armor
	name = "reinforced leather armor"
	result = /obj/item/clothing/suit/armor/ms13/leatherarmor/reinforced
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/armor/ms13/leatherarmor = 1, 
				/obj/item/stack/sheet/ms13/leather = 4, 
				/obj/item/stack/sheet/ms13/ceramic = 10, 
				/obj/item/stack/sheet/ms13/mil_fiber = 2, 
				/obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/tire_armor
	name = "tire armor"
	result = /obj/item/clothing/suit/armor/ms13/tire
	time = 10 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/rubber = 6, 
				/obj/item/stack/medical/gauze/ms13/cloth = 4)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/mole_jacket
	name = "moleskin jacket"
	result = /obj/item/clothing/suit/ms13/ljacket/moleskin
	time = 10 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/ms13/hide/molerat = 2, 
				/obj/item/stack/medical/gauze/ms13/cloth = 2, 
				/obj/item/stack/sheet/ms13/thread = 1)
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
	reqs = list(/obj/item/stack/sheet/ms13/leather = 5, 
				/obj/item/stack/medical/gauze/ms13/cloth = 2, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/armor_kit
	name = "armor kit"
	result = /obj/item/clothing/suit/armor/ms13/kit
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2, 
				/obj/item/stack/medical/gauze/ms13/cloth = 4, 
				/obj/item/stack/sheet/ms13/scrap = 10)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_armor_kit
	name = "reinforced armor kit"
	result = /obj/item/clothing/suit/armor/ms13/kit/reinf
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/suit/armor/ms13/kit = 1, 
				/obj/item/stack/sheet/ms13/leather = 3, 
				/obj/item/stack/medical/gauze/ms13/cloth = 2, 
				/obj/item/stack/sheet/ms13/scrap_steel = 8, 
				/obj/item/stack/sheet/ms13/scrap_parts = 4)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_ljacket
	name = "reinforced leather jacket"
	result = /obj/item/clothing/suit/ms13/ljacket/reinforced
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/clothing/suit/ms13/ljacket = 1, 
				/obj/item/stack/sheet/ms13/leather = 5, 
				/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/reinf_trench
	name = "reinforced black trenchcoat"
	result = /obj/item/clothing/suit/ms13/trench/black/reinf
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/suit/ms13/trench/black = 1, 
				/obj/item/stack/sheet/ms13/scrap_steel = 6,
				/obj/item/stack/sheet/ms13/leather = 4, 
				/obj/item/stack/sheet/ms13/scrap = 4, 
				/obj/item/stack/sheet/ms13/scrap_parts = 2, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/armor_trench
	name = "armored black trenchcoat"
	result = /obj/item/clothing/suit/ms13/trench/black/armored
	time = 18 SECONDS
	tool_behaviors = list(TOOL_WELDER, TOOL_WRENCH, TOOL_SCREWDRIVER, TOOL_DRILL)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/suit/ms13/trench/black/reinf = 1, 
				/obj/item/stack/sheet/ms13/refined_steel = 4, 
				/obj/item/stack/sheet/ms13/leather = 6, 
				/obj/item/stack/sheet/ms13/scrap_parts = 8, 
				/obj/item/stack/sheet/ms13/mil_fiber = 3, 
				/obj/item/stack/sheet/ms13/thread = 2)
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
				/obj/item/stack/medical/gauze/ms13/cloth = 4, 
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
				/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

//HEADGEAR CRAFTING

/datum/crafting_recipe/radstag_skull
	name = "radstag skull helmet"
	result = /obj/item/clothing/head/helmet/ms13/skull
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/ms13/animalitem/radstag/antlers = 2, 
				/obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/brahmiluff_skull
	name = "brahmiluff skull helmet"
	result = /obj/item/clothing/head/helmet/ms13/skull/muffalo
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/ms13/animalitem/brahmiluff/horns = 2, 
				/obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_hat
	name = "cowboy hat"
	result = /obj/item/clothing/head/helmet/ms13/cowboy
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2, 
				/obj/item/stack/medical/gauze/ms13/cloth = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_hat_black
	name = "black cowboy hat"
	result = /obj/item/clothing/head/helmet/ms13/cowboy/black
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2, 
				/obj/item/stack/medical/gauze/ms13/cloth = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/prospector_hat
	name = "prospector hat"
	result = /obj/item/clothing/head/helmet/ms13/prospector
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 3, 
				/obj/item/stack/medical/gauze/ms13/cloth = 2, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/prospector_hat_brown
	name = "brown prospector hat"
	result = /obj/item/clothing/head/helmet/ms13/prospector/brown
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 3, 
				/obj/item/stack/medical/gauze/ms13/cloth = 2, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/militia_hat
	name = "militia hat"
	result = /obj/item/clothing/head/helmet/ms13/militia
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 3, 
				/obj/item/stack/medical/gauze/ms13/cloth = 2, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowl
	name = "cowl"
	result = /obj/item/clothing/head/ms13/hood/cowl
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/plated_cowl
	name = "plated cowl"
	result = /obj/item/clothing/head/ms13/hood/plated
	time = 8 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_DRILL)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/clothing/head/ms13/hood/cowl = 1, 
				/obj/item/stack/sheet/ms13/scrap = 4, 
				/obj/item/stack/sheet/ms13/scrap_parts = 3)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/green_hood
	name = "green hood"
	result = /obj/item/clothing/head/ms13/hood/green
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 3, 
				/obj/item/stack/medical/gauze/ms13/cloth = 2, 
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
				/obj/item/stack/sheet/ms13/thread = 1)
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
	reqs = list(/obj/item/clothing/head/ms13/hood/sack = 1, 
				/obj/item/stack/medical/gauze/ms13/cloth = 2, 
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
				/obj/item/stack/medical/gauze/ms13/cloth = 2, 
				/obj/item/stack/sheet/ms13/scrap = 6, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/bladed_helmet
	name = "bladed helmet"
	result = /obj/item/clothing/head/helmet/ms13/bladed
	time = 10 SECONDS
	tool_behaviors = list(TOOL_DRILL)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 4, 
				/obj/item/stack/sheet/ms13/scrap_steel = 6)
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
				/obj/item/stack/sheet/ms13/scrap = 4)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/junk_helmet
	name = "junk helmet"
	result = /obj/item/clothing/head/helmet/ms13/junk
	time = 10 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_DRILL)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/scrap = 6, 
				/obj/item/stack/sheet/ms13/scrap_parts = 3)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/metal_helmet
	name = "heavy metal helmet"
	result = /obj/item/clothing/head/helmet/ms13/metal
	time = 20 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER, TOOL_DRILL)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/refined_steel = 5, 
				/obj/item/stack/sheet/ms13/scrap_steel = 5, 
				/obj/item/stack/medical/gauze/ms13/cloth = 4, 
				/obj/item/stack/sheet/ms13/scrap_parts = 10, 
				/obj/item/stack/sheet/ms13/mil_fiber = 2, 
				/obj/item/stack/sheet/ms13/thread = 2)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//UNDER/CLOTHING CRAFTING

/datum/crafting_recipe/caravan_pants
	name = "caravan pants"
	result = /obj/item/clothing/under/ms13/wasteland/caravanpants
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cloth_pants
	name = "cloth pants"
	result = /obj/item/clothing/under/ms13/wasteland/pants
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/leather_pants
	name = "leather pants"
	result = /obj/item/clothing/under/ms13/wasteland/warboypants
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 1, 
				/obj/item/stack/sheet/ms13/leather = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/clothing_rags
	name = "rags"
	result = /obj/item/clothing/under/ms13/wasteland/rag
	time = 5 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/doctor_uniform
	name = "wasteland doctor uniform"
	result = /obj/item/clothing/under/ms13/wasteland/doctor
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/homemade_garbs
	name = "homemade garbs"
	result = /obj/item/clothing/under/ms13/wasteland/peasant
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_outfit
	name = "classic cowboy outfit"
	result = /obj/item/clothing/under/ms13/wasteland/cowboy
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2, 
				/obj/item/stack/sheet/ms13/leather = 1, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_outfit_dark
	name = "dark cowboy outfit"
	result = /obj/item/clothing/under/ms13/wasteland/cowboy/grey
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2, 
				/obj/item/stack/sheet/ms13/leather = 1, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/cowboy_outfit_tan
	name = "tan cowboy outfit"
	result = /obj/item/clothing/under/ms13/wasteland/cowboy/tan
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2, 
				/obj/item/stack/sheet/ms13/leather = 1, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/guard_clothes
	name = "guard clothes"
	result = /obj/item/clothing/under/ms13/wasteland/guard
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/wanderer_clothes
	name = "wanderer clothes"
	result = /obj/item/clothing/under/ms13/wasteland/wanderer
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/rancher_clothes
	name = "ranchers clothes"
	result = /obj/item/clothing/under/ms13/wasteland/rancher
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2, 
				/obj/item/stack/sheet/ms13/leather = 1, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/merchant_clothes
	name = "merchants' clothes"
	result = /obj/item/clothing/under/ms13/wasteland/merchant
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/caravan_clothes
	name = "caravaneer clothes"
	result = /obj/item/clothing/under/ms13/wasteland/caravaneer
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/merc_clothes
	name = "mercenary clothes"
	result = /obj/item/clothing/under/ms13/wasteland/merca
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/mercvet_clothes
	name = "merc veteran clothes"
	result = /obj/item/clothing/under/ms13/wasteland/mercc
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/roving_clothes
	name = "roving traders' clothes"
	result = /obj/item/clothing/under/ms13/wasteland/roving
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_UNDER
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
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 1, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/brown_winter_gloves
	name = "brown winter gloves"
	result = /obj/item/clothing/gloves/ms13/winter
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 1, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/dark_winter_gloves
	name = "dark winter gloves"
	result = /obj/item/clothing/gloves/ms13/winter/black
	time = 5 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 1, 
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/footcloth
	name = "footcloths"
	result = /obj/item/clothing/shoes/ms13/rag
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/crude_treads
	name = "crude treads"
	result = /obj/item/clothing/shoes/ms13/crude
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 1,
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
				/obj/item/stack/medical/gauze/ms13/cloth = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/dark_winter_boots
	name = "dark winter boots"
	result = /obj/item/clothing/shoes/ms13/winter/black
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2, 
				/obj/item/stack/sheet/ms13/thread = 1, 
				/obj/item/stack/medical/gauze/ms13/cloth = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/explore_boots
	name = "explorer boots"
	result = /obj/item/clothing/shoes/ms13/explorer
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2, 
				/obj/item/stack/sheet/ms13/thread = 1, 
				/obj/item/stack/medical/gauze/ms13/cloth = 1)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/black_bandana
	name = "black bandana"
	result = /obj/item/clothing/mask/ms13/bandana
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/blue_bandana
	name = "blue bandana"
	result = /obj/item/clothing/mask/ms13/bandana/blue
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/red_bandana
	name = "red bandana"
	result = /obj/item/clothing/mask/ms13/bandana/red
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/white_bandana
	name = "white bandana"
	result = /obj/item/clothing/mask/ms13/bandana/white
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/green_bandana
	name = "green bandana"
	result = /obj/item/clothing/mask/ms13/bandana/green
	time = 4 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 2)
	category = CAT_MISCCLOTHING
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

//WEAPON CRAFTING

/datum/crafting_recipe/knife_spear
	name = "knife spear"
	result = /obj/item/ms13/twohanded/spear/knife
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/knife/ms13=1, 
				/obj/item/stack/medical/gauze/ms13/cloth = 4,
				/obj/item/stack/sheet/ms13/scrap = 4)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/throwing_spear
	name = "throwing spear"
	result = /obj/item/ms13/twohanded/spear/throwing
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SAW)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/scrap_steel = 8,
				/obj/item/stack/sheet/ms13/scrap = 8,
				/obj/item/stack/sheet/ms13/plank = 2)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/metal_spear
	name = "metal spear"
	result = /obj/item/ms13/twohanded/spear
	time = 20 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WELDER)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/medical/gauze/ms13/cloth = 3,
				/obj/item/stack/sheet/ms13/refined_steel = 5,
				/obj/item/stack/sheet/ms13/scrap_parts = 5)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/machete
	name = "machete"
	result = /obj/item/claymore/ms13/machete
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SAW)
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_wood = 3,
				/obj/item/stack/medical/gauze/ms13/cloth = 3,
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
				/obj/item/stack/sheet/ms13/scrap_steel = 4,
				/obj/item/stack/sheet/ms13/scrap = 2)
	category = CAT_WEAPONS
	crafting_interface = CRAFTING_BENCH_WEAPONS

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
				/obj/item/stack/sheet/ms13/scrap_copper = 6,
				/obj/item/stack/sheet/ms13/scrap_electronics = 6,
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
				/obj/item/stack/sheet/ms13/scrap_copper = 10,
				/obj/item/stack/sheet/ms13/scrap_electronics = 10,
				/obj/item/stack/sheet/ms13/refined_alu = 4,
				/obj/item/stack/sheet/ms13/scrap_parts = 10,
				/obj/item/stack/sheet/ms13/glass = 10,
				/obj/item/stack/sheet/ms13/circuits = 6)
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
				/obj/item/stack/sheet/ms13/scrap_copper = 6,
				/obj/item/stack/sheet/ms13/scrap_electronics = 6,
				/obj/item/stack/sheet/ms13/plastic = 8,
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
				/obj/item/ms13/component/cell = 2,
				/obj/item/ms13/component/vacuum_tube = 2,
				/obj/item/stack/sheet/ms13/scrap_copper = 8,
				/obj/item/stack/sheet/ms13/scrap_electronics = 8,
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
				/obj/item/stack/sheet/ms13/scrap_copper = 10,
				/obj/item/stack/sheet/ms13/scrap_electronics = 10,
				/obj/item/stack/sheet/ms13/scrap_parts = 6,
				/obj/item/stack/sheet/ms13/circuits = 5)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/energy_cell
	name = "energy cell"
	result = /obj/item/stock_parts/cell/ms13/ec
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	reqs = list(/obj/item/ms13/component/cell = 1,
				/obj/item/stack/sheet/ms13/refined_copper = 2,
				/obj/item/stack/sheet/ms13/scrap_electronics = 4,
				/obj/item/stack/sheet/ms13/refined_lead = 2,
				/obj/item/stack/sheet/ms13/plastic = 5)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/mfc
	name = "microfusion cell"
	result = /obj/item/stock_parts/cell/ms13/mfc
	time = 18 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	trait = TRAIT_SCRIBE_TRAINING
	reqs = list(/obj/item/ms13/component/cell = 2,
				/obj/item/stack/sheet/ms13/refined_copper = 3,
				/obj/item/stack/sheet/ms13/scrap_electronics = 6,
				/obj/item/stack/sheet/ms13/refined_lead = 3,
				/obj/item/stack/sheet/ms13/plastic = 8)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/ecp
	name = "electron charge pack"
	result = /obj/item/stock_parts/cell/ms13/ecp
	time = 20 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	trait = TRAIT_SCRIBE_TRAINING
	reqs = list(/obj/item/ms13/component/cell = 2,
				/obj/item/stack/sheet/ms13/refined_copper = 5,
				/obj/item/stack/sheet/ms13/scrap_electronics = 10,
				/obj/item/stack/sheet/ms13/refined_lead = 5,
				/obj/item/stack/sheet/ms13/plastic = 10)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/pc
	name = "plasma cell"
	result = /obj/item/stock_parts/cell/ms13/pc
	time = 20 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	trait = TRAIT_SCRIBE_TRAINING
	reqs = list(/obj/item/ms13/component/plasma_battery = 2,
				/obj/item/stack/sheet/ms13/refined_copper = 6,
				/obj/item/stack/sheet/ms13/refined_lead = 6,
				/obj/item/stack/sheet/ms13/plastic = 10)
	category = CAT_ELECTRONICS
	crafting_interface = CRAFTING_BENCH_ELECTRIC

//UTILITY ITEM CRAFTING

/datum/crafting_recipe/fishing_rod
	name = "wooden fishing rod"
	result = /obj/item/ms13/tools/fishing_rod/basic
	time = 15 SECONDS
	tool_behaviors = list(TOOL_KNIFE, TOOL_SAW, TOOL_SCREWDRIVER, TOOL_WRENCH)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/plank = 3,
				/obj/item/stack/sheet/ms13/thread = 5,
				/obj/item/stack/sheet/ms13/scrap_parts = 3,
				/obj/item/stack/sheet/ms13/scrap = 4)
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




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
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 4)
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
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 10)
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
	reqs = list(/obj/item/stack/sheet/ms13/mil_fiber = 5)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/splint
	name = "wood splint"
	result = /obj/item/stack/medical/splint/ms13/wooden
	time = 10 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/plank = 2)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_GENERAL

/datum/crafting_recipe/splint
	name = "metal splint"
	result = /obj/item/stack/medical/splint/ms13
	time = 12 SECONDS
	tool_paths = list()
	trait = TRAIT_MEDICAL_TRAINING
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/scrap_steel = 2)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_GENERAL

//Herbal crafting
/datum/crafting_recipe/healing_powder
	name = "healing powder"
	result = /obj/item/stack/medical/ms13/healing_powder
	time = 10 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/food/grown/ms13/xander = 2,
				/obj/item/food/grown/ms13/brocflower = 2,
				/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/burn_powder
	name = "burn powder"
	result = /obj/item/stack/medical/ms13/healing_powder/burn
	time = 10 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/food/grown/ms13/ashrose = 2,
				/obj/item/food/grown/ms13/aster = 2,
				/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/healing_poultice
	name = "healing poultice"
	result = /obj/item/stack/medical/ms13/healing_powder/poultice
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/food/grown/ms13/xander = 1,
				/obj/item/food/grown/ms13/brocflower = 1,
				/obj/item/food/grown/ms13/cavefungus = 2,
				/obj/item/food/grown/ms13/ashrose = 2,
				/obj/item/stack/sheet/ms13/cloth = 2)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/bitter_drink
	name = "bitter drink"
	result = /obj/item/reagent_containers/ms13/flask/bitter_drink
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/reagent_containers/ms13/flask = 1,
			/obj/item/food/grown/ms13/brocflower = 3,
			/obj/item/food/grown/ms13/xander = 3)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/bitter_drink_refill
	name = "bitter drink flask refill"
	result = /obj/item/reagent_containers/ms13/flask/bitter_drink
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/reagent_containers/ms13/flask/bitter_drink = 1,
			/obj/item/food/grown/ms13/brocflower = 3,
			/obj/item/food/grown/ms13/xander = 3)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

//ARMOR CRAFTING

/datum/crafting_recipe/leather_armor
	name = "leather armor"
	result = /obj/item/clothing/suit/armor/ms13/leatherarmor
	time = 12 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 8,
				/obj/item/stack/sheet/ms13/cloth = 2,
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
				/obj/item/stack/sheet/ms13/cloth = 4)
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/mole_jacket
	name = "moleskin jacket"
	result = /obj/item/clothing/suit/ms13/ljacket/moleskin
	time = 10 SECONDS
	tool_behaviors = list(TOOL_KNIFE)
	tool_paths = list()
	reqs = list(/obj/item/ms13/hide/molerat = 1,
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
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/leather = 2,
				/obj/item/stack/sheet/ms13/cloth = 4,
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
				/obj/item/stack/sheet/ms13/cloth = 2,
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
				/obj/item/stack/sheet/ms13/cloth = 3,
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
	reqs = list(/obj/item/stack/sheet/ms13/leather = 3,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/prospector_hat_brown
	name = "brown prospector hat"
	result = /obj/item/clothing/head/helmet/ms13/prospector/brown
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 3,
				/obj/item/stack/sheet/ms13/cloth = 2,
				/obj/item/stack/sheet/ms13/thread = 1)
	category = CAT_HEADGEAR
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ARMTAILOR

/datum/crafting_recipe/militia_hat
	name = "militia hat"
	result = /obj/item/clothing/head/helmet/ms13/militia
	time = 8 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/leather = 3,
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
				/obj/item/stack/sheet/ms13/cloth = 2,
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
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 4,
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
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
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
				/obj/item/stack/sheet/ms13/cloth = 4,
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
	reqs = list(/obj/item/stack/sheet/ms13/cloth = 3,
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
	reqs = list(/obj/item/stack/sheet/ms13/scrap = 8,
				/obj/item/stack/sheet/ms13/refined_steel = 4,
				/obj/item/stack/sheet/ms13/scrap_parts = 10)
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
	time = 10 SECONDS
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
	time = 12 SECONDS
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
	time = 15 SECONDS
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
	time = 15 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/wirecutters/ms13)
	trait = TRAIT_SCRIBE_TRAINING
	reqs = list(/obj/item/ms13/component/plasma_battery = 2,
				/obj/item/stack/sheet/ms13/refined_copper = 6,
				/obj/item/stack/sheet/ms13/refined_lead = 6,
				/obj/item/stack/sheet/ms13/plastic = 10)
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

/datum/crafting_recipe/flask
	name = "ceramic flask"
	result = /obj/item/reagent_containers/ms13/flask
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/ceramic = 2)
	category = CAT_UTILITY
	crafting_interface = CRAFTING_BENCH_GENERAL

//SMELTER CRAFTING

/datum/crafting_recipe/refined_steel
	name = "smelt refined steel ingot"
	result = /obj/item/stack/sheet/ms13/refined_steel
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_steel = 5,
				/obj/item/stack/sheet/ms13/plank = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/refined_alu
	name = "smelt refined aluminum ingot"
	result = /obj/item/stack/sheet/ms13/refined_alu
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_alu = 5,
				/obj/item/stack/sheet/ms13/plank = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/refined_lead
	name = "smelt refined lead ingot"
	result = /obj/item/stack/sheet/ms13/refined_lead
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_lead = 5,
				/obj/item/stack/sheet/ms13/plank = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/refined_copper
	name = "smelt refined copper ingot"
	result = /obj/item/stack/sheet/ms13/refined_copper
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_copper = 5,
				/obj/item/stack/sheet/ms13/plank = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/refined_brass
	name = "smelt refined brass ingot"
	result = /obj/item/stack/sheet/ms13/refined_brass
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_brass = 5,
				/obj/item/stack/sheet/ms13/plank = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/refined_silver
	name = "smelt refined silver ingot"
	result = /obj/item/stack/sheet/ms13/refined_silver
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_silver = 5,
				/obj/item/stack/sheet/ms13/plank = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/refined_gold
	name = "smelt refined gold ingot"
	result = /obj/item/stack/sheet/ms13/refined_gold
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_gold = 5,
				/obj/item/stack/sheet/ms13/plank = 2)
	category = CAT_SMELTER
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_steel_beams
	name = "melt down refined steel"
	result = /obj/item/stack/sheet/ms13/scrap_steel/five
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_steel = 1,
				/obj/item/stack/sheet/ms13/plank = 1)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_alu
	name = "melt down refined aluminum"
	result = /obj/item/stack/sheet/ms13/scrap_alu/five
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_alu = 1,
				/obj/item/stack/sheet/ms13/plank = 1)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_lead
	name = "melt down refined lead"
	result = /obj/item/stack/sheet/ms13/scrap_lead/five
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_lead = 1,
				/obj/item/stack/sheet/ms13/plank = 1)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_copper
	name = "melt down refined copper"
	result = /obj/item/stack/sheet/ms13/scrap_copper/five
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_copper = 1,
				/obj/item/stack/sheet/ms13/plank = 1)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_brass
	name = "melt down refined brass"
	result = /obj/item/stack/sheet/ms13/scrap_brass/five
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_brass = 1,
				/obj/item/stack/sheet/ms13/plank = 1)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_silver
	name = "melt down refined silver"
	result = /obj/item/stack/sheet/ms13/scrap_silver/five
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_silver = 1,
				/obj/item/stack/sheet/ms13/plank = 1)
	category = CAT_MELT
	crafting_interface = CRAFTING_BENCH_SMELTER

/datum/crafting_recipe/melt_gold
	name = "melt down refined gold"
	result = /obj/item/stack/sheet/ms13/scrap_gold/five
	time = 6 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/refined_gold = 1,
				/obj/item/stack/sheet/ms13/plank = 1)
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

//AMMO CRAFTING

/datum/crafting_recipe/junk_casings
	name = "fifteen junk bullet casings"
	result = /obj/item/stack/sheet/ms13/junk_casings/fifteen
	time = 6 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_brass = 6)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junk_bullets
	name = "fifteen junk bullets"
	result = /obj/item/stack/sheet/ms13/junk_bullets/fifteen
	time = 6 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_lead = 6)
	category = CAT_JUNK_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/junk_22lr
	name = "junk .22 ammo box"
	result = /obj/item/ammo_box/ms13/c22/junk
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
	name = "fifteen high quality bullet casings"
	result = /obj/item/stack/sheet/ms13/hq_casings/fifteen
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/refined_brass = 2)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/hq_bullets
	name = "fifteen high quality bullets"
	result = /obj/item/stack/sheet/ms13/hq_bullets/fifteen
	time = 8 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/refined_lead = 2)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/stan_22lr
	name = "standard .22 ammo box"
	result = /obj/item/ammo_box/ms13/c22
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
	reqs = list(/obj/item/stack/sheet/ms13/plastic = 10,
				/obj/item/stack/sheet/ms13/refined_lead = 3,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STAN_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

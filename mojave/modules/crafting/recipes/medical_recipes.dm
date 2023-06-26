//Recipes for medical items

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
				/obj/item/stack/sheet/ms13/scrap = 5)
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
				/obj/item/stack/sheet/ms13/wood/plank = 2)
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

/datum/crafting_recipe/burn_remedy
	name = "burn remedy"
	result = /obj/item/reagent_containers/ms13/flask/burn_remedy
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/reagent_containers/ms13/flask = 1,
			/obj/item/food/grown/ms13/jalepeno = 3,
			/obj/item/food/grown/ms13/tato = 2,
			/obj/item/food/grown/ms13/garlic = 3)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/blood_remedy
	name = "blood remedy"
	result = /obj/item/reagent_containers/ms13/flask/blood_remedy
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/reagent_containers/ms13/flask = 1,
			/obj/item/food/grown/ms13/barrelcactus = 3,
			/obj/item/food/grown/ms13/mesquite = 2,
			/obj/item/food/grown/ms13/blight = 2)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/herb_antitox
	name = "herbal anti-toxin"
	result = /obj/item/reagent_containers/ms13/flask/herbal_antitox
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/reagent_containers/ms13/flask = 1,
			/obj/item/food/grown/ms13/datura = 2,
			/obj/item/food/grown/ms13/toxicsoot = 3,
			/obj/item/food/grown/ms13/xander = 2)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/trail_brew
	name = "trail brew"
	result = /obj/item/reagent_containers/ms13/flask/trail_brew
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/reagent_containers/ms13/flask = 1,
			/obj/item/food/grown/ms13/cmutfruit = 3,
			/obj/item/food/grown/ms13/pinyon = 2,
			/obj/item/food/grown/ms13/snaptail = 3)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/radtura_flask
	name = "radtura mix"
	result = /obj/item/reagent_containers/ms13/flask/radtura_flask
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/reagent_containers/ms13/flask = 1,
			/obj/item/food/grown/ms13/radtura = 3,
			/obj/item/food/grown/ms13/brocflower = 4,
			/obj/item/food/grown/ms13/razorgrain = 3)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/dark_datflask
	name = "dark datura flask"
	result = /obj/item/reagent_containers/ms13/flask/dark_datflask
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/reagent_containers/ms13/flask = 1,
			/obj/item/food/grown/ms13/datura = 6,
			/obj/item/food/grown/ms13/radrose = 4)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/hydra
	name = "hydra"
	result = /obj/item/reagent_containers/ms13/inhaler/hydra
	time = 12 SECONDS
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/glass = 3,
			/obj/item/ms13/animalitem/molerat/teeth = 2,
			/obj/item/food/grown/ms13/gutshroom = 2,
			/obj/item/food/grown/ms13/cavefungus = 4
			)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

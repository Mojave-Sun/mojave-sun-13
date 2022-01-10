


// Used to filter crafting recipes based on what you are crafting with
// i.e CRAFTING_BENCH_HANDS is the default crafting menu (hidden at time of writing)
// the general crafting bench only shows recipes with CRAFTING_BENCH_GENERAL, etc.
// treat this is a flag, so recipes can be shared between (i.e bandages on GENERAL and ARMTAILOR)
/datum/crafting_recipe/var/crafting_interface = CRAFTING_BENCH_HANDS

// Used to display relevant recipes - match to the recipe's crafting_interface
/datum/component/personal_crafting/var/crafting_interface = CRAFTING_BENCH_HANDS



// TG Recipes carried over
/datum/crafting_recipe/spear/crafting_interface = CRAFTING_BENCH_HANDS | CRAFTING_BENCH_GENERAL
/datum/crafting_recipe/ipickaxe/crafting_interface = CRAFTING_BENCH_HANDS | CRAFTING_BENCH_GENERAL

/datum/crafting_recipe/sutures_shitty
	name = "Jurry-Rigged Sutures"
	result = /obj/item/stack/medical/suture/emergency
	time = 10
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/scrap=1, /obj/item/stack/sheet/cloth = 3)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_GENERAL

// Requires medical training
/datum/crafting_recipe/sutures
	name = "Quality Sutures"
	result = /obj/item/stack/medical/suture
	time = 10
	tool_paths = list()
	trait = TRAIT_MEDICAL_TRAINING
	reqs = list(/obj/item/stack/sheet/ms13/scrap=1, /obj/item/stack/sheet/cloth = 3)
	category = CAT_MEDICAL
	crafting_interface = CRAFTING_BENCH_GENERAL



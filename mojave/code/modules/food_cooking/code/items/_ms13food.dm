/////////////////////////////////////////////////////////////
///////// MOJAVE SUN BASE CLASS FOOD ITEM DIRECTORY /////////
/////////////////////////////////////////////////////////////

/obj/item/food/ms13
	name = "base class ms13 food"
	desc = "Yo chucklefuck, spawn the ingredient or meal subtype you animal."
	w_class = WEIGHT_CLASS_SMALL
	lefthand_file = 'mojave/code/modules/food_cooking/icons/inhands/food_lefthand.dmi'
	righthand_file = 'mojave/code/modules/food_cooking/icons/inhands/food_righthand.dmi'
	obj_flags = UNIQUE_RENAME
	grind_results = list()
	///List of reagents this food gets on creation
	food_reagents = list()
	///Extra flags for things such as if the food is in a container or not
	food_flags
	///Bitflag of the types of food type this food is (sorta fluff) (MEAT, ETC), will be used for cooking quality when mixing ingredients.
	foodtypes
	///Amount of reagent volume the food can contain
	max_volume = 100
	///How long it will take to eat this food without any other modifiers
	eat_time = 3 SECONDS
	///Tastes to describe this food, larger number = more prevalent taste.
	tastes = list()
	///How much reagents per bite
	bite_consumption
	///Type of atom thats spawned after eating this item, set to null for nothing.
	trash_type
	///Minimum cooking time. (defined in SECONDS)
	var/min_cook
	///Maximum cooking time. (defined in SECONDS)
	var/max_cook
	///The type of food that this is, contributes to nutrition functions
	var/list/nutrition
	///Toggles whether this food can be grilled or not, use in conjunction with the boil and fry (not deep fry foo) properties.
	var/can_be_grilled = FALSE
	///Toggles whether this food can be fried or not, use in conjunction with the boil and base TG grilling properties.
	var/can_be_fried = FALSE
	///Toggles whether this food can be grilled or not, use in conjunction with the base TG grilling and frying properties.
	var/can_be_boiled = FALSE
	///The created product from grilling an item (if allowed), seperate to allow for different cooking result.
	var/grill_result
	///The created product from frying an item (if allowed), seperate to allow for different cooking result.
	var/fry_result
	///The created product from boiling an item (if allowed), seperate to allow for different cooking result.
	var/boil_result
	///The identifier for this food in use on overlays
	var/overlay_state

/obj/item/food/ms13/Initialize()
	. = ..()
	if(!can_be_grilled)
		burns_on_grill = TRUE
	MakeFryable()
	MakeBoilable()

/obj/item/food/ms13/MakeGrillable()
	if(burns_on_grill)
		AddComponent(/datum/component/grillable, /obj/item/food/badrecipe, rand(20 SECONDS, 30 SECONDS), FALSE)
	else
		AddComponent(/datum/component/grillable, grill_result, rand(min_cook, max_cook), TRUE)

/obj/item/food/ms13/proc/MakeFryable()
	. = ..()
	if(!can_be_fried)
		return
	else
		AddComponent(/datum/component/fryable, fry_result, rand(min_cook, max_cook))

/obj/item/food/ms13/proc/MakeBoilable()
	. = ..()
	if(!can_be_boiled)
		return
	else
		AddComponent(/datum/component/boilable, boil_result, rand(min_cook, max_cook))

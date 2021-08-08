//Pre-War Meats

/obj/item/food/ms13/ingredient/dogfood
	name = "dog food"
	desc = "A portion of century old beef, gravy and barely recognizable vegetables, made for mutts, are you really that desperate?"
	icon_state = "dog_food"
	foodtypes = MEAT | VEGETABLES | GROSS | JUNKFOOD
	tastes = list(MEATY = 3, SOUR = 1, OLD = 1)
	nutrition = list(MEAT_N = 3, VEG_N = 1, JUNKFOOD_N = 3, BAD_N = 3)
	max_volume = 20
	bite_consumption = 4
	can_be_boiled = TRUE //Dog Food Stew
	can_be_fried = TRUE //Fried Dogmeat Nuggets
	//boil_result =
	//fry_result =
	min_cook = 120 SECONDS
	min_cook = 200 SECONDS
	overlay_state = "dogmeat"

/obj/item/food/ms13/ingredient/cram
	name = "cram"
	desc = "A block of processed cram meat, rumored to last forever in its salty, fatty goodness."
	icon_state = "cram"
	foodtypes = MEAT | GROSS
	tastes = list(MEATY = 3, SLIMEY = 4, SALTY = 1) //ayo this motherfucker forgot to cook the cram!
	nutrition = list(MEAT_N = 15, BAD_N = 10, JUNKFOOD_N = 5)
	max_volume = 60
	bite_consumption = 8
	can_be_boiled = TRUE //Cram Stew
	can_be_fried = TRUE //Fried Cram
	can_be_grilled = TRUE //Grilled Cram
	//boil_result =
	//fry_result =
	//grill_result =
	min_cook = 30 SECONDS
	min_cook = 90 SECONDS
	overlay_state = "cram"

/obj/item/food/ms13/ingredient/seafood
	name = "imitation seafood"
	desc = "A block of fake seafood tasting ... meat? Maybe, who even knows what this durable block of goop contains, who cares, tastes like nothing else!"
	icon_state = "seafood"
	foodtypes = MEAT | GROSS
	tastes = list(SWEET = 2, MEATY = 3, SLIMEY = 4, PUNGENT = 2, SPICY = 1)
	nutrition = list(MEAT_N = 10, DAIRY_N = 3, JUNKFOOD_N = 2)
	max_volume = 40
	bite_consumption = 4
	can_be_boiled = TRUE //Seafood Soup
	can_be_fried = TRUE //Fried Seafood
	can_be_grilled = TRUE //Grilled Seafood
	//boil_result =
	//fry_result =
	//grill_result =
	min_cook = 200 SECONDS
	min_cook = 220 SECONDS
	overlay_state = "seafood"

/obj/item/food/ms13/ingredient/salisburysteak
	name = "salisbury steak"
	desc = "A freeze dried ancient imitation steak of meats and gravy, compressed into patty form for your post-war dining."
	icon_state = "s_steak"
	foodtypes = MEAT | JUNKFOOD | GRAIN
	tastes = list(MEATY = 5, SAVOURY = 3, SALTY = 1, OLD = 1)
	nutrition = list(MEAT_N = 7, GRAIN_N = 3, JUNKFOOD_N = 5)
	max_volume = 30
	bite_consumption = 5
	can_be_boiled = TRUE //Salisbury Soup
	can_be_fried = TRUE //Fried Salisbury Steak
	can_be_grilled = TRUE //Grilled Salisbury Steak
	//boil_result =
	//fry_result =
	//grill_result =
	min_cook = 40 SECONDS
	min_cook = 80 SECONDS
	overlay_state = "salisbury"

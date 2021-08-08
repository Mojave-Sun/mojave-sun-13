//Pre-War Junkfood

/obj/item/food/ms13/ingredient/porknbeans
	name = "pork and beans"
	desc = "A meaty portion of a century old classic serving of the ol' greasy inspectors pork' n' beans. Yeehaw!"
	icon_state = "pork_n_beans"
	foodtypes = MEAT | VEGETABLES | JUNKFOOD
	tastes = list(MEATY = 3, SAVOURY = 2, BUTTERY = 1)
	nutrition = list(VEG_N = 4, MEAT_N = 3, JUNKFOOD_N = 3)
	max_volume = 20
	bite_consumption = 3
	can_be_boiled = TRUE //Pork N' Beans Stew
	//boil_result =
	min_cook = 80 SECONDS
	min_cook = 120 SECONDS
	overlay_state = "beans"

/obj/item/food/ms13/ingredient/cajunrice
	name = "cajun rice and beans"
	desc = "A serving of hearty survivalist cajun rice and beans, extremely filling and tastes like the memories of civilisations past."
	icon_state = "cajun_rice"
	foodtypes = VEGETABLES | JUNKFOOD | GRAIN
	tastes = list(SAVOURY = 2, EARTHY = 2, SPICY = 1)
	nutrition = list(VEG_N = 2, GRAIN_N = 6, SUGAR_N = 2)
	max_volume = 20
	bite_consumption = 2
	can_be_boiled = TRUE //Cajun Rice Bowl
	//boil_result =
	min_cook = 60 SECONDS
	min_cook = 80 SECONDS
	overlay_state = "cajun"

/obj/item/food/ms13/ingredient/crisps
	name = "crisps"
	desc = "A portion of dainty potato chips, also known as crisps to the wealthy. Cause' they sure are crispy."
	icon_state = "crisps"
	foodtypes = VEGETABLES | JUNKFOOD
	tastes = list(EARTHY = 1, SALTY = 2, SAVOURY = 2)
	nutrition = list(VEG_N = 1, JUNKFOOD_N = 4)
	max_volume = 20
	bite_consumption = 2
	powderable = TRUE //Crisp Breading
	//powder_result =
	overlay_state = "crisp"

/obj/item/food/ms13/ingredient/macncheese
	name = "macaroni and cheese"
	desc = "A handful of old pre-war macaronis covered in a fake cheese dust, prime time Americas favourite food!"
	icon_state = "macaronies"
	foodtypes = JUNKFOOD | GRAIN | DAIRY
	tastes = list(SALTY = 1, CHEESEY = 3, SAVOURY = 1)
	nutrition = list(GRAIN_N = 3, JUNKFOOD_N = 1, DAIRY_N = 2)
	max_volume = 20
	bite_consumption = 4
	can_be_boiled = TRUE //Mac N' Cheese
	powderable = TRUE //Macaroni Crumb
	//boil_result =
	//powder_result =
	min_cook = 120 SECONDS
	min_cook = 180 SECONDS
	overlay_state = "mac"

/obj/item/food/ms13/ingredient/cheesypoof
	name = "cheesy poofs"
	desc = "Succelent cheddar infused puffed corn chips, number one in whatever Canada used to be"
	icon_state = "poofs"
	foodtypes = MEAT | VEGETABLES | GROSS | JUNKFOOD | GRAIN | FRUIT | DAIRY
	tastes = list(CHEESEY = 9, SALTY = 1)
	nutrition = list(GRAIN_N = 4, JUNKFOOD_N = 2, DAIRY_N = 1)
	max_volume = 20
	bite_consumption = 3
	powderable = TRUE //Poof Crumb
	//powder_result =
	overlay_state = "poof"

/obj/item/food/ms13/ingredient/sugarbombs
	name = "sugar bombs cereal"
	desc = "An extremely sweet pre-war breakfast food, guaranteed to get your day started, no matter the circumstances! (be it nuclear war, etc.)"
	icon_state = "sugar_bombs"
	foodtypes = JUNKFOOD | GRAIN | SUGAR
	tastes = list(SWEET = 5, HARSH = 5)
	nutrition = list(SUGAR_N = 5, JUNKFOOD_N = 2, GRAIN_N = 1)
	max_volume = 20
	bite_consumption = 5
	powderable = TRUE //Cereal Crumbing
	//powder_result =
	overlay_state = "cereal"

/obj/item/food/ms13/ingredient/deviledeggs
	name = "yum yum deviled egs"
	desc = "Fun fact, this ancient preserved egg snack does not infact contain the devil"
	icon_state = "yum_egg"
	foodtypes = MEAT | JUNKFOOD
	tastes = list(SALTY = 1, CREAMY = 1, BUTTERY = 1, OLD = 1)
	nutrition = list(MEAT_N = 5, JUNKFOOD_N = 2)
	max_volume = 60
	bite_consumption = 2
	can_be_boiled = TRUE //Twice Boiled Yum Yum
	can_be_fried = TRUE //Fried Yum Yum
	//boil_result =
	//fry_result =
	min_cook = 40 SECONDS
	min_cook = 80 SECONDS
	overlay_state = "egg"

/obj/item/food/ms13/ingredient/dandyapples
	name = "dandy boy apple"
	desc = "A freeze dried imitation glazed apple, straight from the Dandy Boy himself!"
	icon_state = "dandy_apple"
	foodtypes = VEGETABLES | JUNKFOOD | FRUIT | SUGAR
	tastes = list(SWEET = 5, BITTER = 1, FRUITY = 1)
	nutrition = list(FRUIT_N = 2, JUNKFOOD_N = 1, SUGAR_N = 2)
	max_volume = 40
	bite_consumption = 1
	overlay_state = "apple"

/obj/item/food/ms13/ingredient/snackcake
	name = "fancy lad snack cake"
	desc = "A single starchy preserved snack cake, a sweet treat thats fun to eat!"
	icon_state = "snack_cake"
	foodtypes = JUNKFOOD | SUGAR
	tastes = list(SWEET = 5, OLD = 1)
	nutrition = list(SUGAR_N = 3, JUNKFOOD_N = 2)
	max_volume = 20
	bite_consumption = 2
	powderable = TRUE //Cake Breading
	//powder_result =
	overlay_state = "snackers"

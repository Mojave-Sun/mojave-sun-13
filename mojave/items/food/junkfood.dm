//Pre-War Junkfood

/obj/item/food/ms13/prewar
	name = "junkfood"
	desc = "LOOK AWAY, YOU'RE NOT SUPPOSED TO SEE THIS!"
	icon = 'mojave/icons/objects/food/prewar_food.dmi'

	var/emptiness = 0

/obj/item/food/ms13/prewar/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/item_scaling, 0.50, 1)

/obj/item/food/ms13/prewar/MakeEdible()
    AddComponent(/datum/component/edible,\
                initial_reagents = food_reagents,\
                food_flags = food_flags,\
                foodtypes = foodtypes,\
                volume = max_volume,\
                eat_time = eat_time,\
                tastes = tastes,\
                eatverbs = eatverbs,\
                bite_consumption = bite_consumption,\
                microwaved_type = microwaved_type,\
                junkiness = junkiness,\
                after_eat = CALLBACK(src, .proc/after_bite))

/obj/item/food/ms13/prewar/proc/after_bite(mob/living/eater, mob/living/feeder, bitecount)
	emptiness += 1 // Every time a bite of the food is eaten, it gets emptier
	icon_state = "[initial(icon_state)]_[emptiness]"

// SUBTYPE FOR CANS + CAN OPENING

/obj/item/food/ms13/prewar/canned
	name = "generic can"
	desc = "This shouldn't be here."
	grid_height = 64
	grid_width = 32

	var/canned_open = FALSE

/obj/item/food/ms13/prewar/canned/proc/open_can(mob/user)
	to_chat(user, span_notice("You pull back the tab of \the [src]."))
	playsound(user.loc, 'sound/items/foodcanopen.ogg', 50)
	canned_open = TRUE

/obj/item/food/ms13/prewar/canned/attack_self(mob/user)
	if(!canned_open)
		open_can(user)
		icon_state = "[icon_state]_open"
	return ..()

/obj/item/food/ms13/prewar/canned/attack(mob/living/target, mob/user, def_zone)
	if (!canned_open)
		to_chat(user, span_warning("[src]'s lid hasn't been opened!"))
		return FALSE
	return ..()

// END OF CAN OPENING
// BOXED SUBTYPE + BOX OPENING

/obj/item/food/ms13/prewar/boxed
	name = "generic box"
	desc = "LOOK AWAY! This doesn't exist!"
	var/boxed_open = FALSE
	grid_height = 32
	grid_width = 64

/obj/item/food/ms13/prewar/boxed/proc/open_box(mob/user)
	to_chat(user, span_notice("You open the cardboard box of [src]."))
	boxed_open = TRUE

/obj/item/food/ms13/prewar/boxed/attack_self(mob/user)
	if(!boxed_open)
		open_box(user)
		icon_state = "[icon_state]_open"
	return ..()

/obj/item/food/ms13/prewar/boxed/attack(mob/living/target, mob/user, def_zone)
	if (!boxed_open)
		to_chat(user, span_warning("The box hasn't been opened!"))
		return FALSE
	return ..()

//END OF BOX OPENING
//THE MEAT AND POTATOES

/obj/item/food/ms13/prewar/canned/porknbeans
	name = "pork and beans"
	desc = "A meaty portion of a century old classic serving of the ol' greasy inspectors pork' n' beans. Yeehaw!"
	icon_state = "porknbean"
	foodtypes = MEAT | VEGETABLES | JUNKFOOD
	tastes = list("meaty" = 3, "savory" = 2, "buttery" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/protein = 15)
	max_volume = 25
	bite_consumption = 5
	trash_type = /obj/item/trash/ms13/cans/porknbeans

/obj/item/food/ms13/prewar/canned/cajunrice
	name = "cajun rice and beans"
	desc = "A serving of hearty survivalist cajun rice and beans, extremely filling and tastes like the memories of civilisations past."
	icon_state = "cajunrice"
	foodtypes = VEGETABLES | JUNKFOOD | GRAIN
	tastes = list("savory" = 2, "earthy" = 2, "spicy" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/protein = 8)
	max_volume = 16
	bite_consumption = 8
	trash_type = /obj/item/trash/ms13/cans/cajunrice

/obj/item/food/ms13/prewar/canned/dogfood
	name = "dog food"
	desc = "A portion of century old beef, gravy and barely recognizable vegetables, made for mutts, are you really that desperate?"
	icon_state = "dogfood"
	foodtypes = MEAT | VEGETABLES | GROSS | JUNKFOOD
	tastes = list("meaty" = 3, "sour" = 1, "old" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/nutriment/protein = 8)
	max_volume = 20
	bite_consumption = 5
	trash_type = /obj/item/trash/ms13/cans/dogfood

/obj/item/food/ms13/prewar/canned/seafood
	name = "imitation seafood"
	desc = "A block of fake seafood tasting ... meat? Maybe, who even knows what this durable block of goop contains, who cares, tastes like nothing else!"
	icon_state = "seafood"
	foodtypes = MEAT | GROSS
	tastes = list("sweet" = 2, "meaty" = 3, "slimey" = 4, "pungent" = 2, "spicy" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 15, /datum/reagent/consumable/nutriment/protein = 5)
	max_volume = 20
	bite_consumption = 10
	trash_type = /obj/item/trash/ms13/cans/seafood
	grid_height = 32
	grid_width = 64

/obj/item/food/ms13/prewar/boxed/salisburysteak
	name = "salisbury steak"
	desc = "A freeze dried ancient imitation steak of meats and gravy, compressed into patty form for your post-war dining."
	icon_state = "salisbury"
	foodtypes = MEAT | JUNKFOOD | GRAIN
	tastes = list("meaty" = 5, "savory" = 3, "salty" = 1, "old" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/protein = 15)
	max_volume = 20
	bite_consumption = 10
	trash_type = /obj/item/trash/ms13/packaging/salisbury

/obj/item/food/ms13/prewar/boxed/crisps
	name = "crisps"
	desc = "A portion of dainty potato chips, also known as crisps to the wealthy. Cause' they sure are crispy."
	icon_state = "crisps"
	foodtypes = VEGETABLES | JUNKFOOD
	tastes = list("earthy" = 1, "salty" = 2, "savory" = 2)
	food_reagents = list(/datum/reagent/consumable/nutriment = 12)
	max_volume = 12
	bite_consumption = 4
	trash_type = /obj/item/trash/ms13/packaging/crisps
	grid_height = 64
	grid_width = 32

/obj/item/food/ms13/prewar/boxed/macncheese
	name = "macaroni and cheese"
	desc = "A handful of old pre-war macaronis covered in a fake cheese dust, prime time Americas favourite food!"
	icon_state = "macncheese"
	foodtypes = JUNKFOOD | GRAIN | DAIRY
	tastes = list("salty" = 1, "cheesy" = 3, "savory" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 14, /datum/reagent/consumable/nutriment/protein = 2)
	max_volume = 20
	bite_consumption = 5
	trash_type = /obj/item/trash/ms13/packaging/macncheese
	grid_height = 64
	grid_width = 32

/obj/item/food/ms13/prewar/boxed/cheesypoof
	name = "cheesy poofs"
	desc = "Succelent cheddar infused puffed corn chips, number one in whatever Canada used to be"
	icon_state = "poofs"
	foodtypes = MEAT | VEGETABLES | GROSS | JUNKFOOD | GRAIN | FRUIT | DAIRY
	tastes = list("cheesy" = 9, "salty" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 12)
	max_volume = 12
	bite_consumption = 3
	trash_type = /obj/item/trash/ms13/packaging/poofs
	grid_height = 64
	grid_width = 32

/obj/item/food/ms13/prewar/boxed/sugarbombs
	name = "sugar bombs cereal"
	desc = "An extremely sweet pre-war breakfast food, guaranteed to get your day started, no matter the circumstances! (be it nuclear war, etc.)"
	icon_state = "sugarbombs"
	foodtypes = JUNKFOOD | GRAIN | SUGAR
	tastes = list("sweet" = 5, "harsh" = 5)
	food_reagents = list(/datum/reagent/consumable/nutriment = 16, /datum/reagent/consumable/sugar = 8)
	max_volume = 24
	bite_consumption = 6
	trash_type = /obj/item/trash/ms13/packaging/sugarbombs
	grid_height = 64
	grid_width = 32

/obj/item/food/ms13/prewar/boxed/deviledeggs
	name = "yum yum deviled eggs"
	desc = "Fun fact, this ancient preserved egg snack does not infact contain the devil"
	icon_state = "yumegg"
	foodtypes = MEAT | JUNKFOOD
	tastes = list("salty" = 1, "creamy" = 1, "buttery" = 1, "old" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/protein = 6)
	max_volume = 16
	bite_consumption = 4
	trash_type = /obj/item/trash/ms13/packaging/yumegg
	grid_height = 64
	grid_width = 32

/obj/item/food/ms13/prewar/boxed/dandyapples
	name = "dandy boy apple"
	desc = "A box of freeze dried imitation glazed apples, straight from the Dandy Boy himself!"
	icon_state = "dandy"
	foodtypes = VEGETABLES | JUNKFOOD | FRUIT | SUGAR
	tastes = list("sweet" = 5, "bitter" = 1, "fruity" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/sugar = 10)
	max_volume = 15
	bite_consumption = 5
	trash_type = /obj/item/trash/ms13/packaging/dandy

/obj/item/food/ms13/prewar/boxed/snackcake
	name = "fancy lad snack cakes"
	desc = "A box of starchy preserved snack cakes, a sweet treat thats fun to eat!"
	icon_state = "snackcake"
	foodtypes = JUNKFOOD | SUGAR
	tastes = list("sweet" = 5, "old" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/sugar = 20)
	max_volume = 30
	bite_consumption = 5
	trash_type = /obj/item/trash/ms13/packaging/snackcake

/obj/item/food/ms13/prewar/boxed/instamash
	name = "instamash"
	desc = "Lumps of starch. Allegedly, these are potatoes."
	icon_state = "instamash"
	foodtypes = VEGETABLES | JUNKFOOD | GRAIN
	tastes = list("starchy" = 2, "salty" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 16)
	max_volume = 16
	bite_consumption = 8
	trash_type = /obj/item/trash/ms13/packaging/instamash

//Pre-War Junkfood

/obj/item/food/ms13/prewarfood
	name = "junkfood"
	desc = "LOOK AWAY, YOU'RE NOT SUPPOSED TO SEE THIS!"
	icon = 'mojave/icons/objects/food/prewar_food.dmi'

	var/bite_states = 4
	var/bitecount = 0

/obj/item/food/ms13/prewarfood/Initialize(mapload)
	. = ..()
	bite_consumption = reagents.total_volume / bite_states
	update_icon()

/obj/item/food/ms13/prewarfood/update_icon()
	. = ..()
	if(!bitecount)
		. += initial(icon_state)
		return
	. += "[initial(icon_state)]_[min(bitecount, 3)]"

/obj/item/food/ms13/prewarfood/proc/after_bite(mob/living/eater, mob/living/feeder, bitecount)
	src.bitecount = bitecount
	update_appearance()

// SUBTYPE FOR CANS + CAN OPENING

/obj/item/food/ms13/prewarfood/canned
	name = "generic can"
	desc = "This shouldn't be here."

	var/canned_open = FALSE

/obj/item/food/ms13/prewarfood/canned/proc/open_can(mob/user)
	to_chat(user, span_notice("You pull back the tab of \the [src]."))
	playsound(user.loc, 'sound/items/foodcanopen.ogg', 50)
	canned_open = TRUE

/obj/item/food/ms13/prewarfood/canned/attack_self(mob/user)
	if(!canned_open)
		open_can(user)
		icon_state = "[icon_state]_open"
	return ..()

/obj/item/food/ms13/prewarfood/canned/attack(mob/living/target, mob/user, def_zone)
	if (!canned_open)
		to_chat(user, span_warning("[src]'s lid hasn't been opened!"))
		return FALSE
	return ..()

// END OF CAN OPENING
// BOXED SUBTYPE + BOX OPENING

obj/item/food/ms13/prewarfood/boxed
	name = "generic box"
	desc = "LOOK AWAY! This doesn't exist!"
	var/boxed_open = FALSE

/obj/item/food/ms13/prewarfood/boxed/proc/open_box(mob/user)
	to_chat(user, span_notice("You open the cardboard box of [src]."))
	boxed_open = TRUE

/obj/item/food/ms13/prewarfood/boxed/attack_self(mob/user)
	if(!boxed_open)
		open_box(user)
		icon_state = "[icon_state]_open"
	return ..()

/obj/item/food/ms13/prewarfood/boxed/attack(mob/living/target, mob/user, def_zone)
	if (!boxed_open)
		to_chat(user, span_warning("The box hasn't been opened!"))
		return FALSE
	return ..()

//END OF BOX OPENING
//THE MEAT AND POTATOES

/obj/item/food/ms13/prewarfood/canned/porknbeans
	name = "pork and beans"
	desc = "A meaty portion of a century old classic serving of the ol' greasy inspectors pork' n' beans. Yeehaw!"
	icon_state = "porknbean"
	foodtypes = MEAT | VEGETABLES | JUNKFOOD
	tastes = list("meaty" = 3, "savory" = 2, "buttery" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 14, /datum/reagent/consumable/nutriment/protein = 18)
	max_volume = 32
	bite_states = 4

/obj/item/food/ms13/prewarfood/canned/cajunrice
	name = "cajun rice and beans"
	desc = "A serving of hearty survivalist cajun rice and beans, extremely filling and tastes like the memories of civilisations past."
	icon_state = "cajunrice"
	foodtypes = VEGETABLES | JUNKFOOD | GRAIN
	tastes = list("savory" = 2, "earthy" = 2, "spicy" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 16, /datum/reagent/consumable/nutriment/protein = 16)
	max_volume = 32
	bite_states = 2

/obj/item/food/ms13/prewarfood/crisps
	name = "crisps"
	desc = "A portion of dainty potato chips, also known as crisps to the wealthy. Cause' they sure are crispy."
	icon_state = "crisps"
	foodtypes = VEGETABLES | JUNKFOOD
	tastes = list("earthy" = 1, "salty" = 2, "savory" = 2)
	food_reagents = list(/datum/reagent/consumable/nutriment = 20)
	max_volume = 20
	bite_states = 3

/obj/item/food/ms13/prewarfood/macncheese
	name = "macaroni and cheese"
	desc = "A handful of old pre-war macaronis covered in a fake cheese dust, prime time Americas favourite food!"
	icon_state = "macncheese"
	foodtypes = JUNKFOOD | GRAIN | DAIRY
	tastes = list("salty" = 1, "cheesy" = 3, "savory" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 14, /datum/reagent/consumable/nutriment/protein = 6)
	max_volume = 20
	bite_consumption = 4

/obj/item/food/ms13/prewarfood/cheesypoof
	name = "cheesy poofs"
	desc = "Succelent cheddar infused puffed corn chips, number one in whatever Canada used to be"
	icon_state = "poofs"
	foodtypes = MEAT | VEGETABLES | GROSS | JUNKFOOD | GRAIN | FRUIT | DAIRY
	tastes = list("cheesy" = 9, "salty" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 20)
	max_volume = 20
	bite_consumption = 4

/obj/item/food/ms13/prewarfood/sugarbombs
	name = "sugar bombs cereal"
	desc = "An extremely sweet pre-war breakfast food, guaranteed to get your day started, no matter the circumstances! (be it nuclear war, etc.)"
	icon_state = "sugarbombs"
	foodtypes = JUNKFOOD | GRAIN | SUGAR
	tastes = list("sweet" = 5, "harsh" = 5)
	food_reagents = list(/datum/reagent/consumable/nutriment = 16, /datum/reagent/consumable/sugar = 8)
	max_volume = 24
	bite_consumption = 4

/obj/item/food/ms13/prewarfood/deviledeggs
	name = "yum yum deviled eggs"
	desc = "Fun fact, this ancient preserved egg snack does not infact contain the devil"
	icon_state = "yumegg"
	foodtypes = MEAT | JUNKFOOD
	tastes = list("salty" = 1, "creamy" = 1, "buttery" = 1, "old" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 16, /datum/reagent/consumable/nutriment/protein = 4)
	max_volume = 20
	bite_consumption = 4

/obj/item/food/ms13/prewarfood/dandyapples
	name = "dandy boy apple"
	desc = "A box of freeze dried imitation glazed apples, straight from the Dandy Boy himself!"
	icon_state = "dandy"
	foodtypes = VEGETABLES | JUNKFOOD | FRUIT | SUGAR
	tastes = list("sweet" = 5, "bitter" = 1, "fruity" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/sugar = 10)
	max_volume = 15
	bite_consumption = 3

/obj/item/food/ms13/prewarfood/snackcake
	name = "fancy lad snack cakes"
	desc = "A box of starchy preserved snack cakes, a sweet treat thats fun to eat!"
	icon_state = "snackcake"
	foodtypes = JUNKFOOD | SUGAR
	tastes = list("sweet" = 5, "old" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/sugar = 20)
	max_volume = 30
	bite_consumption = 6

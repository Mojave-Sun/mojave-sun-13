/obj/item/food/ms13/ingredient
	name = "base class ms13 ingredient"
	desc = "Yo chucklefuck, spawn in an actual thing you BEAST."
	w_class = WEIGHT_CLASS_SMALL
	icon = 'mojave/code/modules/food_cooking/icons/ingredients.dmi'
	food_flags = INGREDIENT
	tastes = list()
	nutrition = list()
	max_volume = 20
	bite_consumption = 4
	//Generic Cooking time, ideally we want to make this slightly long ao people cant just shit out food at mach ten speeds.
	min_cook = 60 SECONDS
	min_cook = 80 SECONDS
	//Enables crushing a food item for battering, dusting or bulking out a food
	var/powderable = FALSE
	var/powder_result
	//The colour this ingredient has when used in overlays/when necessary/automated
	var/food_colour = "#554734"

/obj/item/food/ms13/ingredient/MakeProcessable()
	. = ..()
	if(powderable)
		AddElement(/datum/element/processable, TOOL_ROLLINGPIN, powder_result, 2, 30 SECONDS)

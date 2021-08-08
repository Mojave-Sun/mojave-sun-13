//Randomised food gloops for variety and F U N.

/obj/item/food/ms13/ingredient/random
	name = "randomized food gloop"
	desc = "A to be randomized portion of food determined by the canned code, dont spawn this in by itself :mutant:."
	icon_state = ""
	max_volume = 40
	bite_consumption = 3

/obj/item/food/ms13/ingredient/random/Initialize()
	. = ..()
	switch(name) //oh boy here we go
		if("canned ham")
			color = "#ae9595"
		if("canned tuna")
			color = "#b39477"
		if("canned salmon")
			color = "#cba1ad"
		if("corned beef")
			color = "#6b4c33"
		if("minced sardine")
			color = "#857f76"
		if("sausage meat")
			color = "#857f76"
		if("canned beef")
			color = "#857f76"
		if("canned chicken")
			color = "#857f76"
		if("brahmin slurry")
			color = "#724d45"
		if("strange meat")
			color = "#5f1d1d"
		if("canned mushroom")
			color = "#9fa082"
		if("canned asparagus")
			color = "#556753"
		if("canned potato")
			color = "#556753"
		if("canned tomato")
			color = "#7d1616"
		if("canned carrots")
			color = "#7d1616"
		if("canned peas")
			color = "#3b5f26"
		if("canned spinach")
			color = "#26341e"
		if("canned corn")
			color = "#8a780d"
		if("canned pineapple")
			color = "#8a6832"
		if("canned pear")
			color = "#82a047"
		if("canned apple")
			color = "#882730"
		if("mystery fruit")
			color = "#7a47a0"

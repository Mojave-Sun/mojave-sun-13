//Storage containers for food, cans, packets, boxes, etc.
//Dosent use fancy because its garbagecode.

/obj/item/storage/ms13/container/food
	name = "base class ms13 food container"
	desc = "Contains jack shit cause its the BASE CLASS foool! Its literally an ERROR SIGN, ADMIN, THINK!"
	w_class = WEIGHT_CLASS_NORMAL
	icon = 'mojave/code/modules/food_cooking/icons/containers.dmi'
	icon_state = "cram"
	appearance_flags = KEEP_TOGETHER
	//The food item in the object
	var/food_type = /obj/item/food/ms13/ingredient
	//How many items spawn in the object
	var/servings = 4
	//Is this a can or not? Used for opening one-way or not (cant close an open can)
	var/can = FALSE
	//The Trashed path of the object
	var/obj/trash
	//What can be stored inside of the object
	var/list/holdable = list(/obj/item/food/ms13/ingredient)
	/// Whether the container is open or not
	var/is_open = FALSE

/obj/item/storage/ms13/container/food/examine(mob/user)
	. = ..()
	var/obj/item/food/ms13/ingredient/food = locate(/obj/item/food/ms13/ingredient) in contents
	if(!is_open)
		return
	if(length(contents) == 1)
		. += "There is one [food.name] portion left."
	else
		. += "There are [contents.len <= 0 ? "no" : "[contents.len]"] [food.name] portion left."

/obj/item/storage/ms13/container/food/Exited(atom/movable/gone, direction)
	. = ..()
	is_open = TRUE
	update_appearance()

/obj/item/storage/ms13/container/food/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	is_open = TRUE
	update_appearance()

/obj/item/storage/ms13/container/food/attack_self(mob/user)
	if(!can)
		is_open = !is_open
	else if(do_after(user, 3 SECONDS))
		to_chat(user, "<span class='notice'>You crack open the can with a satisfying hiss.</span>")
		playsound(src, 'mojave/code/modules/food_cooking/sounds/can_hiss.ogg', 50)
		sleep(2)
		is_open = TRUE

	update_appearance()
	if(!contents.len)
		new trash(user.drop_location())
		to_chat(user, "<span class='notice'>You the crush the [src].</span>")
		qdel(src)

/obj/item/storage/ms13/container/food/after_throw(datum/callback/callback)
	. = ..()
	if(contents.len)
		return
	new trash(src.loc)
	qdel(src)

/obj/item/storage/ms13/container/food/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = servings
	STR.set_holdable(holdable)

/obj/item/storage/ms13/container/food/PopulateContents()
	. = ..()
	var/obj/item/food/ms13/ingredient/food = locate(/obj/item/food/ms13/ingredient) in contents
	if(!food)
		return
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	for(var/i = 1 to STR.max_items)
		new food_type(src)
	update_appearance()

/obj/item/storage/ms13/container/food/update_icon_state()
	if(is_open)
		icon_state = "[initial(icon_state)]_open"
	else
		icon_state = initial(icon_state)
	. = ..()

/obj/item/storage/ms13/container/food/update_overlays()
	. = ..()
	var/obj/item/food/ms13/ingredient/food = locate(/obj/item/food/ms13/ingredient) in contents
	if(!contents.len)
		return

	var/item_position = 1
	var/mutable_appearance/inserted_overlay = mutable_appearance(icon)

	inserted_overlay.icon_state = "[food.overlay_state]_[item_position]"

	if(food.color)
		inserted_overlay.color = "[food.color]"

	cut_overlays() //should stop it stacking the overlay
	. += inserted_overlay
	item_position++

//Random Generic Scav Cans

/obj/item/storage/ms13/container/food/can
	can = TRUE //wild

/obj/item/storage/ms13/container/food/can/generic
	name = "unlabelled can"
	desc = "A mysterious pre-war can of food, who knows what wonders you could find inside?"
	icon_state = "can_1"
	food_type = /obj/item/food/ms13/ingredient/random
	trash = /obj/item/storage/ms13/container/food/can
	holdable = /obj/item/food/ms13/ingredient/random
	var/can_shape

/obj/item/storage/ms13/container/food/can/generic/Initialize()
	. = ..()
	icon_state = pick("can_1", "can_2", "can_3")
	Randomise()

/obj/item/storage/ms13/container/food/can/generic/proc/Randomise()

	var/obj/item/food/ms13/ingredient/food = locate(/obj/item/food/ms13/ingredient) in contents

	switch(icon_state)
		if("can_1")
			servings = 4
			can_shape = 1
		if("can_2")
			servings = 2
			can_shape = 2
			trash = /obj/item/trash/ms13/container/can/alt1
		if("can_3")
			servings = 3
			can_shape = 3
			trash = /obj/item/trash/ms13/container/can/alt2

	food.foodtypes = (pick(MEAT, VEGETABLES, FRUIT) | JUNKFOOD)
	switch(food.foodtypes)
		if(MEAT)
			food.name = pick("canned ham", "canned tuna", "canned salmon", "corned beef", "minced sardine", "sausage meat", "canned beef", "canned chicken", "brahmin slurry", "strange meat")
			food.tastes = list(pick(MEATY, SOUR, SAVOURY, SALTY) = rand(0,10), pick(SWEET, SPICY, BURNT, OLD) = rand(0,10), pick(MEATY, SOUR, SAVOURY, SLIMEY) = rand(0,10))
			food.nutrition = list(MEAT_N = rand(0,10), pick(MEAT_N, VEG_N, JUNKFOOD_N) = rand(0,5), pick(JUNKFOOD_N, BAD_N) = rand(0,5))
			food.icon_state = "meat_greyscale"
			food.overlay_state = "meat_[can_shape]_g"
		if(VEGETABLES)
			food.name = pick("canned mushroom", "canned asparagus", "canned potato", "canned tomato", "canned carrots", "canned peas", "canned spinach", "canned corn")
			food.tastes = list(pick(BITTER, SOUR, SAVOURY, SALTY) = rand(0,10), pick(SWEET, SPICY, BURNT, OLD) = rand(0,10), pick(EARTHY, YEASTY, SAVOURY) = rand(0,10))
			food.nutrition = list(VEG_N = rand(0,7), pick(VEG_N, SUGAR_N, JUNKFOOD_N) = rand(0,5), pick(JUNKFOOD_N, BAD_N) = rand(0,5))
			food.icon_state = "veg_greyscale"
			food.overlay_state = "veg_[can_shape]_g"
		if(FRUIT)
			food.name = pick("canned pineapple", "canned pear", "canned apple", "mystery fruit")
			food.tastes = list(pick(BITTER, SOUR, SWEET, FRUITY) = rand(0,10), pick(SWEET, FRUITY, CAUSTIC, OLD) = rand(0,10), pick(SOUR, FRUITY) = rand(0,10))
			food.nutrition = list(FRUIT_N = rand(0,5), pick(FRUIT_N, SUGAR_N, JUNKFOOD_N) = rand(0,5), pick(JUNKFOOD_N, BAD_N) = rand(0,5))
			food.icon_state = "fruit_greyscale"
			food.overlay_state = "fruit_[can_shape]_g"

	food.min_cook = rand(40 SECONDS, 100 SECONDS)
	food.max_cook = rand((food.min_cook + 40 SECONDS), (food.min_cook + 200 SECONDS))

/obj/item/storage/fancy/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]_[is_open ? contents.len : null]" // gotta add the _

//Junk Food Containers

/obj/item/storage/ms13/container/food/can/dogfood
	name = "\improper Dinky-D Dogfood can"
	desc = "A whole can of Doghouse brand beef stew. For any survivor who isn't particularly picky or is particularly desperate. However, still contains traces of radiation."
	icon_state = "dog"
	servings = 4
	food_type = /obj/item/food/ms13/ingredient/dogfood
	trash = /obj/item/trash/ms13/container/can/dogfood
	holdable = /obj/item/food/ms13/ingredient/dogfood

/obj/item/storage/ms13/container/food/can/cram
	name = "\improper Cram can"
	desc = "A Cram Classic Can of pre-War precooked processed meat, found in blue cardboard boxes and tins. A bygone staple of most American households."
	icon_state = "cram"
	servings = 4
	food_type = /obj/item/food/ms13/ingredient/cram
	trash = /obj/item/trash/ms13/container/can/cram
	holdable = /obj/item/food/ms13/ingredient/cram

/obj/item/storage/ms13/container/food/can/seafood
	name = "imitation seafood can"
	desc = "Alleged Seafood in a can. It doesn't spoil, making it perfect for survivalists. Pretty nasty until cooked."
	icon_state = "seafood"
	servings = 2
	food_type = /obj/item/food/ms13/ingredient/seafood
	trash = /obj/item/trash/ms13/container/can/seafood
	holdable = /obj/item/food/ms13/ingredient/seafood

/obj/item/storage/ms13/container/food/salisburysteak
	name = "packaged Salisbury Steak"
	desc = "Some ground meat and gravy pre-war steaks. Packaged in a small, red box, just like mee-maw used to make it."
	icon_state = "salsibury"
	servings = 2
	food_type = /obj/item/food/ms13/ingredient/salisburysteak
	trash = /obj/item/trash/ms13/container/salisbury
	holdable = /obj/item/food/ms13/ingredient/salisburysteak

/obj/item/storage/ms13/container/food/can/porknbeans
	name = "\improper Pork n' Beans can"
	desc = "A can of Greasy Prospector Improved Pork And Beans, ie. the good ol' beans, pork n' chunks of pig fat cured and cooked in hickory smoke stewed in a tomato sauce to bring you pre-war cowboy cookin. "
	icon_state = "porknbean"
	servings = 4
	food_type = /obj/item/food/ms13/ingredient/porknbeans
	trash = /obj/item/trash/ms13/container/can/porknbeans
	holdable = /obj/item/food/ms13/ingredient/porknbeans

/obj/item/storage/ms13/container/food/can/cajunrice
	name = "cajun rice & beans can"
	desc = "A can of preserved flavourful cajun rice and beans which is a favorite of survivalists and spice lovers wasteland-wide."
	icon_state = "cajun"
	servings = 2
	food_type = /obj/item/food/ms13/ingredient/cajunrice
	trash = /obj/item/trash/ms13/container/can/cajun
	holdable = /obj/item/food/ms13/ingredient/cajunrice

/obj/item/storage/ms13/container/food/crisps
	name = "\improper Spring Valley Potato Crisps can"
	desc = "A tube of Spring Valley Potato Crisps packaged in a long pink and cyan can, filled with crispy goodness."
	icon_state = "crisps"
	servings = 3
	food_type = /obj/item/food/ms13/ingredient/crisps
	trash = /obj/item/trash/ms13/container/can/crisps
	holdable = /obj/item/food/ms13/ingredient/crisps

/obj/item/storage/ms13/container/food/macncheese
	name = "\improper Blamco Mac & Cheese"
	desc = "A pre-packaged serving box of the classic macaroni and cheese from BlamCo, found in rectangular cyan boxes, which feature both a picture of the product contained within, and exploding! With flavour."
	icon_state = "macncheese"
	servings = 4
	food_type = /obj/item/food/ms13/ingredient/macncheese
	trash = /obj/item/trash/ms13/container/macncheese
	holdable = /obj/item/food/ms13/ingredient/macncheese

/obj/item/storage/ms13/container/food/cheesypoof
	name = "\improper Cheezy Poofs box"
	desc = "A mysterious pre-War snack, this item is typically associated with obese boys from backwater towns, or rather, used to be. The preservatives used in these snacks make them edible even 160 years after the apocalypse: A testament to their unhealthy nature."
	icon_state = "poofs"
	servings = 4
	food_type = /obj/item/food/ms13/ingredient/cheesypoof
	trash = /obj/item/trash/ms13/container/poofs
	holdable = /obj/item/food/ms13/ingredient/cheesypoof

/obj/item/storage/ms13/container/food/sugarbombs
	name = "\improper Sugar Bombs cereal box"
	desc = "A pack of sugary cereal that holds 100% of the recommended daily amount of sugar. It can be found all around the Wasteland, packaged in white and blue boxes containing cereal pieces thats are modeled after atomic bombs, resembling mini nukes."
	icon_state = "sugarbombs"
	servings = 4
	food_type = /obj/item/food/ms13/ingredient/sugarbombs
	trash = /obj/item/trash/ms13/container/sugarbombs
	holdable = /obj/item/food/ms13/ingredient/sugarbombs

/obj/item/storage/ms13/container/food/deviledeggs
	name = "\improper Yum Yum's Devilled Eggs box"
	desc = "A box of hard-boiled chicken eggs, shelled, and filled with the hard-boiled egg's yolk mixed with other ingredients such as mayonnaise and mustard. The YumYum brand eggs inside have been dried and prepared to last centuries in edible condition."
	icon_state = "yumegg"
	servings = 4
	food_type = /obj/item/food/ms13/ingredient/deviledeggs
	trash = /obj/item/trash/ms13/container/yumyum
	holdable = /obj/item/food/ms13/ingredient/deviledeggs

/obj/item/storage/ms13/container/food/dandyapples
	name = "\improper Dandy Boy Apples box"
	desc = "A box of pre-war candied Dandy Boy apples, Featuring an some sort of apple mascot with a bowler hat, monocle, and mustache. The back of the box sports the product's slogan, :apples so good they never go bad!"
	icon_state = "dandy"
	servings = 6
	food_type = /obj/item/food/ms13/ingredient/dandyapples
	trash = /obj/item/trash/ms13/container/dandyapples
	holdable = /obj/item/food/ms13/ingredient/dandyapples

/obj/item/storage/ms13/container/food/snackcake
	name = "\improper Fancy Lads' Snack Cakes box"
	desc = "A tasteful pink packaging of Fancy Lad Snack Cakes, pre-war frosted treats for the dainty."
	icon_state = "snackcake"
	servings = 6
	food_type = /obj/item/food/ms13/ingredient/snackcake
	trash = /obj/item/trash/ms13/container/fancylad
	holdable = /obj/item/food/ms13/ingredient/snackcake

//Container Trash

/obj/item/trash/ms13/container
	name = "base class ms13 container trash"
	desc = "Discarded food packaging, has been made completely useless and irredeemable."
	w_class = WEIGHT_CLASS_SMALL
	icon = 'mojave/code/modules/food_cooking/icons/containers.dmi'

/obj/item/trash/ms13/container/salisbury
	name = "empty Salisbury Steak box"
	icon_state = "salisbury_r"

/obj/item/trash/ms13/container/macncheese
	name = "empty Blamco Mac & Cheese box"
	icon_state = "macnchese_r"

/obj/item/trash/ms13/container/poofs
	name = "empty Cheezy Poofs box"
	icon_state = "poofs_r"

/obj/item/trash/ms13/container/sugarbombs
	name = "empty Sugar Bombs cereal"
	icon_state = "sugarbombs_r"

/obj/item/trash/ms13/container/yumyum
	name = "empty yum yum eggs box"
	icon_state = "yumegg_r"

/obj/item/trash/ms13/container/dandyapples
	name = "empty dandy boy apples box"
	icon_state = "dandy_r"

/obj/item/trash/ms13/container/fancylad
	name = "empty snack cakes box"
	icon_state = "snackcake_r"

/obj/item/trash/ms13/container/can
	name = "unlabelled crushed can"
	desc = "A unusuable piece of junk."
	icon_state = "can_1_r"
	throwforce = 2

/obj/item/trash/ms13/container/can/alt1
	icon_state = "can_2_r"

/obj/item/trash/ms13/container/can/alt2
	icon_state = "can_3_r"

/obj/item/trash/ms13/container/can/dogfood
	name = "empty dogfood can"
	icon_state = "dog_r"

/obj/item/trash/ms13/container/can/cram
	name = "empty Cram can"
	icon_state = "cram_r"

/obj/item/trash/ms13/container/can/seafood
	name = "empty seafood can"
	icon_state = "seafood_r"

/obj/item/trash/ms13/container/can/porknbeans
	name = "empty Pork n' Beans can"
	icon_state = "porknbean_r"

/obj/item/trash/ms13/container/can/cajun
	name = "empty cajun rice & beans can"
	icon_state = "cajun_r"

/obj/item/trash/ms13/container/can/crisps
	name = "empty crisps can"
	icon_state = "crisps_r"

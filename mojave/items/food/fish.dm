// Fish

/obj/item/food/meat/slab/ms13/fish
	name = "fish"
	desc = "You shouldn't be seeing this."
	icon = 'mojave/icons/objects/food/fish/fish_world.dmi'
	bite_consumption = 4
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 6)
	foodtypes = MEAT | RAW
	w_class = WEIGHT_CLASS_NORMAL
	grid_height = 64
	grid_width = 96
	//Tells the initialize function which icon to pick
	var/fish_type = "fish"
	//Determines what kind of fillet you get when cut
	var/fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish
	var/fish_size = 1

/obj/item/food/meat/slab/ms13/fish/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  fillet_type, fish_size * 2, 15 SECONDS * toolspeed)

/obj/item/food/meat/slab/ms13/fish/Initialize()
	fish_size = rand(1,3)
	icon_state = "[fish_type]-[fish_size]"
	bite_consumption = fish_size * 2
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/food/fish/fish_inventory.dmi')
	return ..()

/obj/item/food/meat/slab/ms13/fish/sockeye
	fish_type = "sockeye"
	name = "sockeye salmon"
	desc = "A sockeye salmon, delicious! And not a bad catch."
	icon_state = "sockeye_cutlet"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/sockeye

/obj/item/food/meat/slab/ms13/fish/smallmouth
	fish_type = "smallmouth"
	name = "smallmouth bass"
	desc = "A smallmouth bass. A game fish, it had a reputation for fighting."
	icon_state = "smallmouth_cutlet"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/smallmouth

/obj/item/food/meat/slab/ms13/fish/largemouth
	fish_type = "largemouth"
	name = "largemouth bass"
	desc = "A largemouth bass. It's meat is usually mushy, gross!"
	icon_state = "largemouth_cutlet"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/largemouth

/obj/item/food/meat/slab/ms13/fish/lamprey
	fish_type = "lamprey"
	name = "lamprey"
	desc = "Typically mislabeled as an eel, the lamprey was highly appreciated by Ancient Romans."
	icon_state = "lamprey_cutlet"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/lamprey

/obj/item/food/meat/slab/ms13/fish/pink
	fish_type = "pink"
	name = "pink salmon"
	desc = "Pink salmon used to be canned or salted pre-war, and was a staple food of sorts."
	icon_state = "pink_cutlet"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/pink

/obj/item/food/meat/slab/ms13/fish/chum
	fish_type = "chum"
	name = "chum salmon"
	desc = "Generally considered cheap and low-quality, the chum salmon is an unlucky catch."
	icon_state = "chum_cutlet"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/chum

/obj/item/food/meat/slab/ms13/fish/sturgeon
	fish_type = "sturgeon"
	name = "white sturgeon"
	desc = "Sturgeon can grow to pretty mind-boggling size. They used to be poached for their caviar."
	icon_state = "sturgeon_cutlet"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/sturgeon

/obj/item/food/meat/slab/ms13/fish/asian
	fish_type = "asian"
	name = "asian carp"
	desc = "An invasive species, the Asian carp has endured even nuclear holocaust."
	icon_state = "asian_cutlet"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/asian

/obj/item/food/meat/slab/ms13/fish/blinky
	fish_type = "blinky"
	name = "blinky"
	desc = "A very strange looking fish, likely a product of lots and lots of radiation."
	icon_state = "blinky_cutlet"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/blinky

// Raw fish fillets

/obj/item/food/meat/rawcutlet/ms13/fish
	name = "raw fish fillet"
	desc = "A raw fish fillet. You shouldn't be seeing this."
	icon = 'mojave/icons/objects/food/fish/fish_world.dmi'
	icon_state = "sockeye_cutlet"
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 32
	grid_width = 64
	var/fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish
	bite_consumption = 3
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 3)
	tastes = list("fish" = 8)
	foodtypes = MEAT | RAW

/obj/item/food/meat/rawcutlet/ms13/fish/MakeGrillable()
	AddComponent(/datum/component/grillable, fish_cooked_type, rand(30 SECONDS, 60 SECONDS), TRUE, TRUE)


/obj/item/food/meat/rawcutlet/ms13/fish/Initialize()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/food/fish/fish_inventory.dmi')
	return ..()

/obj/item/food/meat/rawcutlet/ms13/fish/sockeye
	name = "raw sockeye fillet"
	desc = "A raw fillet of sockeye salmon. Red and tasty."
	icon_state = "sockeye_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/sockeye

/obj/item/food/meat/rawcutlet/ms13/fish/smallmouth
	name = "raw smallmouth fillet"
	desc = "A raw smallmouth bass fillet."
	icon_state = "smallmouth_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/smallmouth

/obj/item/food/meat/rawcutlet/ms13/fish/largemouth
	name = "raw largemouth fillet"
	desc = "A raw largemouth bass fillet. Kind of mushy, gross."
	icon_state = "largemouth_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/largemouth

/obj/item/food/meat/rawcutlet/ms13/fish/lamprey
	name = "raw lamprey fillet"
	desc = "A raw lamprey fillet. Meaty."
	icon_state = "lamprey_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/lamprey

/obj/item/food/meat/rawcutlet/ms13/fish/pink
	name = "raw pink salmon fillet"
	desc = "A raw pink salmon fillet, not canned, not salted, just fresh."
	icon_state = "pink_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/pink

/obj/item/food/meat/rawcutlet/ms13/fish/chum
	name = "raw chum salmon fillet"
	desc = "A raw chum salmon fillet. Low-quality and cheap, just like you."
	icon_state = "chum_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/chum

/obj/item/food/meat/rawcutlet/ms13/fish/sturgeon
	name = "raw sturgeon fillet"
	desc = "A raw white sturgeon fillet. The largest of white sturgeons used to feed whole tribes of natives."
	icon_state = "sturgeon_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/sturgeon

/obj/item/food/meat/rawcutlet/ms13/fish/asian
	name = "raw asian carp fillet"
	desc = "A raw Asian carp fillet. Soy sauce not included."
	icon_state = "asian_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/asian

/obj/item/food/meat/rawcutlet/ms13/fish/blinky
	name = "raw blinky fillet"
	desc = "A raw fillet from a Blinky fish. What's a Blinky? Try it and find out."
	icon_state = "blinky_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/blinky
	tastes = list("what...?" =1, "fish" = 2)

// Cooked fish fillets

/obj/item/food/meat/cutlet/ms13/fish
	name = "cooked fish fillet"
	desc = "A cooked fish fillet."
	icon = 'mojave/icons/objects/food/fish/fish_world.dmi'
	icon_state = "sockeye_cutlet"
	bite_consumption = 5
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 4, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("fish" = 5)
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 32
	grid_width = 64
	foodtypes = MEAT

/obj/item/food/meat/cutlet/ms13/fish/Initialize()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/food/fish/fish_inventory.dmi')
	return ..()


/obj/item/food/meat/cutlet/ms13/fish/sockeye
	name = "cooked sockeye fillet"
	desc = "A nice and tasty sockeye fillet. Good eating."
	icon_state = "sockeye_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/smallmouth
	name = "cooked smallmouth fillet"
	desc = "A smallmouth bass fillet, despite being a game fish, it does not taste like game."
	icon_state = "smallmouth_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/largemouth
	name = "cooked largemouth fillet"
	desc = "A largemouth bass fillet. Mushy and gross, you must be desperate."
	icon_state = "largemouth_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/lamprey
	name = "cooked lamprey fillet"
	desc = "A lamprey fillet. Vedius Pollio would be jealous."
	icon_state = "lamprey_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/pink
	name = "cooked pink salmon fillet"
	desc = "A pink salmon fillet. Maybe put it in a salad."
	icon_state = "pink_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/chum
	name = "cooked chum salmon fillet"
	desc = "A chum salmon fillet. You can taste the poverty."
	icon_state = "chum_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/sturgeon
	name = "cooked sturgeon fillet"
	desc = "A white sturgeon fillet."
	icon_state = "sturgeon_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/asian
	name = "cooked asian carp fillet"
	desc = "An Asian carp fillet."
	icon_state = "asian_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/blinky
	name = "cooked blinky fillet"
	desc = "A blinky fillet. What...?"
	icon_state = "blinky_cutlet"
	tastes = list("what...?" = 4, "fish" = 4)

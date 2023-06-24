////////////////MOJAVE SUN CUSTOM ROLLIES STORAGE/////////////////

//rolling papers

/obj/item/ms13/rolling_paper
	name = "\improper rolling paper"
	desc = "A clean and processed piece of paper, thin enough to roll into a fine rizzla."
	icon = 'mojave/icons/objects/smokeables/smokeables_world.dmi'
	icon_state = "rollie_paper"
	inventory_state = "rollie_paper"
	world_state = "rollie_paper"
	inhand_icon_state = "paper"
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	grid_height = 32
	grid_width = 32
	//The type of thing the rollie is filled with first
	var/obj/doobie_filling_1
	//The type of thing the rollie is filled with second, final filling
	var/obj/doobie_filling_2

/obj/item/ms13/rolling_paper/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/smokeables/smokeables_inventory.dmi', world_state, inventory_state)
	AddElement(/datum/element/rollable, "rollie", 10 SECONDS)

/obj/item/ms13/rolling_paper/update_overlays()
	. = ..()
	cut_overlays()

//custom smigglerettes

/obj/item/ms13/cigarette/custom
	name = "generic custom smigglerette"
	desc = "THE COMPONENT FUCKED UP, ABORT ABORT, DO NOT SMOKE."
	obj_flags = UNIQUE_RENAME | UNIQUE_RENAME_NO_DESCRIPTION
	list_reagents = null
	nicotine_potency = 0.10 //less potent
	smoking_damage = 0.005 //organic
	//used by component to find filling
	var/filling_identifier

/obj/item/ms13/cigarette/custom/rollie
	name = "handmade rollie"
	desc = "A rolled joint of paper, filled with various coloured dried plant matter."
	icon_state = "rollie"
	inventory_state = "rollie"
	world_state = "rollie"
	worn_icon_state = "rollie"
	inhand_icon_state = "rollie"
	lit_type = "rollit"
	butt_icon = "roach"
	butt_name = "roach"
	butt_desc = "The burnt end of a rollie, really scraping the barrel if you smoke this."

/obj/item/ms13/cigarette/custom/cig
	name = "handmade cigarette"
	desc = "A fine handmade cigarette, filled with various coloured dried plant matter."
	icon_state = "rollie"
	icon_state = "cigarette"
	inventory_state = "cigarette"
	world_state = "cigarette"
	worn_icon_state = "cigarette"
	inhand_icon_state = "cigarette"
	lit_type = "ciglit"
	butt_icon = "butt"
	butt_name = "butt"
	butt_desc = "A used cigarette butt, still holds a little filling."

/obj/item/ms13/cigarette/custom/Initialize()
	. = ..()
	wrap_up()

/obj/item/ms13/cigarette/custom/proc/wrap_up()
	//internal fillings
	switch(filling_identifier)
		if("xx")
			//brute heal medium, high smoke damage
			list_reagents = list(/datum/reagent/ms13/medicine/concentrated_xander = 10)
			nicotine_potency = 0
			smoking_damage = 0.2
		if("xb", "bx")
			//weaker bitter drink, medium smoke damage
			list_reagents = list(/datum/reagent/ms13/medicine/bitter_mix = 18)
			nicotine_potency = 0
			smoking_damage = 0.1
		if("xt", "tx")
			//half nic, brute heal minor
			list_reagents = list(/datum/reagent/ms13/nicotine = 7, /datum/reagent/ms13/medicine/dried_xander = 7)
			nicotine_potency = 0.05
			smoking_damage = 0.05
		if("bb")
			//burn heal medium, high smoke damage
			list_reagents = list(/datum/reagent/ms13/medicine/concentrated_broc = 10)
			nicotine_potency = 0
			smoking_damage = 0.2
		if("bt", "tb")
			//half nic, burn heal minor
			list_reagents = list(/datum/reagent/ms13/nicotine = 7, /datum/reagent/ms13/medicine/dried_broc = 7)
			nicotine_potency = 0.05
			smoking_damage = 0.05
		if("tt")
			//slightly more potent rollie
			list_reagents = list(/datum/reagent/ms13/nicotine = 24)
			nicotine_potency = 0.16
			smoking_damage = 0.006
	reagents.add_reagent_list(list_reagents)

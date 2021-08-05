//I'm going to hold off on this personally. Feel free to find out what to do with these damn things.//
/obj/item/stack/medical/suture/ms13/tourniquet
	name = "tourniquet"
	desc = "A high quality tourniquet designed for the purpose of slowing blood flow in bleeding and cutting off toxin travel. It's got a crank to tighten it."
	singular_name = "tourniquet"
	icon_state = "tourniquet"
	self_delay = 6 SECONDS
	other_delay = 3 SECONDS
	amount = 1
	max_amount = 1
	repeating = FALSE
	heal_brute = 0
	stop_bleeding = 1
	grind_results = null
	merge_type = null

/obj/item/stack/medical/suture/ms13/tourniquet/belt
	name = "belt"
	desc = "A stury leather belt. You could probably tie it around a limb to prevent the flow of blood."
	singular_name = "belt"
	icon_state = "belt"
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	self_delay = 7 SECONDS
	other_delay = 4 SECONDS
	stop_bleeding = 0.6

/obj/item/stack/medical/suture/ms13/tourniquet/snakebite
	name = "snakebite tourniquet"
	desc = "An anti-toxin soaked tourniquet made specifically to cut the flow of any venom while actively eliminating it."
	singular_name = "tourniquet"
	icon_state = "torniquet_sb"
	stop_bleeding = 0.6

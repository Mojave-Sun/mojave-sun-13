// For bottles and drink containers //

/obj/item/reagent_containers/glass/ms13
	name = "glass"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5, 10, 15, 20, 25, 30, 50)
	volume = 50
	reagent_flags = OPENCONTAINER | DUNKABLE
	spillable = TRUE
	resistance_flags = ACID_PROOF

/obj/item/reagent_containers/food/drinks/bottle/ms13
	name = "bottle"
	icon = 'mojave/icons/objects/food/liquids/drink_containers_world.dmi'
	icon_state = "bottle"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5, 10, 15, 20, 25, 30, 50)
	volume = 50
	reagent_flags = OPENCONTAINER | DUNKABLE
	spillable = FALSE
	list_reagents = list(/datum/reagent/consumable/ms13/gagquik = 50)
	foodtype = ALCOHOL
	var/sealed = TRUE

/obj/item/reagent_containers/food/drinks/bottle/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/food/liquids/drink_containers_inventory.dmi')

/obj/item/reagent_containers/food/drinks/bottle/ms13/attack_self(mob/user)
	if(!is_drainable())
		if(sealed == TRUE)
			to_chat(user, "You pop open \the [src] and the bottle cap falls to the ground.")
//			new /obj/item/stack/f13Cash/bottle_cap(user.loc)
		else
			to_chat(user, "You pull back the tab of \the [src] with a satisfying pop.") //Ahhhhhhhh
		reagents.flags |= OPENCONTAINER
		playsound(src, "can_open", 50, 1)
		spillable = TRUE
		return

/obj/item/reagent_containers/food/drinks/bottle/ms13/attack_self_secondary(mob/user)
	change_transfer_amount(user, FORWARD)

// E for Everyone! - Generic Drinks//


// A for adult - Alcoholic containers //

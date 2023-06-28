/obj/item/reagent_containers/hypospray/medipen/ms13
	name = "Generic ms13 medipen moment"
	desc = "Shove it into your arm. Go ahead."
	icon = 'mojave/icons/objects/drugs.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_misc.dmi'
	worn_icon_state = "empty_placeholder"
	slot_flags = ITEM_SLOT_BELT
	reagent_flags = null
	grid_height = 32
	grid_width = 32
	var/use_sound

/obj/item/reagent_containers/hypospray/medipen/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.45, 1)

/obj/item/reagent_containers/hypospray/medipen/ms13/inject(mob/living/M, mob/user)
	. = ..()
	playsound(src.loc, use_sound, 40, FALSE)
	update_icon_state()

/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak
	name = "stimpak"
	desc = "A basic stimpak. It's a quick and easy way to ensure you continue to live as long as you avoid battle while your wounds mend."
	icon_state = "stim"
	inhand_icon_state = "stim"
	volume = 10
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/ms13/medicine/stimpak_fluid = 10)
	ignore_flags = 0
	grid_height = 64
	grid_width = 32
	use_sound = 'mojave/sound/ms13items/stimpak_inject.ogg'

/obj/item/reagent_containers/hypospray/medipen/ms13/attack(mob/living/M, mob/user)
	if(do_after(user, 0.65 SECONDS))
		inject(M, user)

/obj/item/reagent_containers/hypospray/medipen/ms13/attack_self(mob/user/)
	if(!reagents.total_volume)
		return
	if(!user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK, FALSE, FLOOR_OKAY))
		return
	if(do_after(user, 0.65 SECONDS))
		inject(user)
		update_icon_state()

/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak/update_icon_state()
	. = ..()
	if(reagents.total_volume > 0)
		icon_state = initial(icon_state)
		inhand_icon_state = initial(inhand_icon_state)
	else
		icon_state = "[initial(icon_state)]0"
		inhand_icon_state = "[initial(inhand_icon_state)]0"

/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak/super
	name = "super stimpak"
	desc = "A stimpak augmented with an additional vial of chemicals and a belt to strap it to the point of injection."
	icon_state = "superstim"
	inhand_icon_state = "superstim"
	list_reagents = list(/datum/reagent/ms13/medicine/stimpak_fluid/super = 10)

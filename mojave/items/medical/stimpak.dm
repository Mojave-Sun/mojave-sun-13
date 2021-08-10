/obj/item/reagent_containers/hypospray/medipen/stimpak
	name = "stimpak"
	desc = "A basic stimpak. It's a quick and easy way to ensure you continue to live as long as you avoid battle while your wounds mend."
	icon = 'mojave/icons/objects/medical/medical_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	icon_state = "stim"
	inhand_icon_state = "stim"
	volume = 10
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/ms13/medicine/stimpak_fluid = 10)
	ignore_flags = 0

/obj/item/reagent_containers/hypospray/medipen/stimpak/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/medical/medical_inventory.dmi')

/obj/item/reagent_containers/hypospray/medipen/stimpak/update_icon_state()
	. = ..()
	if(reagents.total_volume > 0)
		icon_state = initial(inhand_icon_state)
	else
		icon_state = "[initial(inhand_icon_state)]0"

/obj/item/reagent_containers/hypospray/medipen/stimpak/super
	name = "super stimpak"
	icon_state = "superstim"
	inhand_icon_state = "superstim"
	list_reagents = list(/datum/reagent/ms13/medicine/super_stimpak_fluid = 10)

/datum/reagent/ms13/medicine/stimpak_fluid
	name = "stimpak fluid"
	description = "stimpak"
	reagent_state = LIQUID
	color = "#FF0000"
	metabolization_rate = 2.5 * REAGENTS_METABOLISM
	overdose_threshold = 15

/datum/reagent/ms13/medicine/stimpak_fluid/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-4.0*REM, 0)
	M.adjustOxyLoss(-4.0*REM, 0)
	M.adjustBruteLoss(-4.0*REM, 0)
	M.adjustFireLoss(-4.0*REM, 0)
	..()
	. = 1

/datum/reagent/ms13/medicine/stimpak_fluid/overdose_process(mob/living/M)
	M.adjustToxLoss(8.0*REM, 0)
	M.adjustOxyLoss(8.0*REM, 0)
	M.adjustBruteLoss(4.0*REM, 0)
	M.adjustFireLoss(4.0*REM, 0)
	..()
	. = 1

/datum/reagent/ms13/medicine/super_stimpak_fluid
	name = "super stimpak fluid"
	reagent_state = LIQUID
	color = "#da2a2a"
	metabolization_rate = 2 * REAGENTS_METABOLISM
	overdose_threshold = 15

/datum/reagent/ms13/medicine/super_stimpak_fluid/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-8.0*REM, 0)
	M.adjustOxyLoss(-8.0*REM, 0)
	M.adjustBruteLoss(-10.0*REM, 0)
	M.adjustFireLoss(-10.0*REM, 0)
	..()
	. = 1

/datum/reagent/ms13/medicine/super_stimpak_fluid/overdose_process(mob/living/M)
	M.adjustToxLoss(16.0*REM, 0)
	M.adjustOxyLoss(16.0*REM, 0)
	M.adjustBruteLoss(8.0*REM, 0)
	M.adjustFireLoss(8.0*REM, 0)
	..()
	. = 1

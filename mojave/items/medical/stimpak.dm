/obj/item/reagent_containers/hypospray/medipen/ms13/
	name = "Generic ms13 medipen moment"
	desc = "Shove it into your arm. Go ahead."
	icon = 'mojave/icons/objects/medical/medical_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_misc.dmi'
	worn_icon_state = "empty_placeholder"
	slot_flags = ITEM_SLOT_BELT

/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak
	name = "stimpak"
	desc = "A basic stimpak. It's a quick and easy way to ensure you continue to live as long as you avoid battle while your wounds mend."
	icon_state = "stim"
	inhand_icon_state = "stim"
	volume = 10
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/ms13/medicine/stimpak_fluid = 10)
	ignore_flags = 0

/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/medical/medical_inventory.dmi')

/obj/item/reagent_containers/hypospray/medipen/ms13/attack(mob/living/M, mob/user)
	if(do_after(M, 0.75 SECONDS))
		inject(M, user)

/obj/item/reagent_containers/hypospray/medipen/ms13/inject(mob/living/M, mob/user)
	. = ..()
	playsound(src.loc, 'mojave/sound/ms13items/stimpak_inject.ogg', 40, FALSE)
	update_icon_state()

/obj/item/reagent_containers/hypospray/medipen/ms13/attack_self(mob/user/)
	if(!reagents.total_volume)
		return
	if(!user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK, FALSE, FLOOR_OKAY))
		return
	if(do_after(user, 0.75 SECONDS))
		inject(user)
		update_icon_state()
		playsound(src.loc, 'mojave/sound/ms13items/stimpak_inject.ogg', 40, FALSE)

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
	icon_state = "superstim"
	inhand_icon_state = "superstim"
	list_reagents = list(/datum/reagent/ms13/medicine/stimpak_fluid/super = 10)

/datum/reagent/ms13/medicine/stimpak_fluid
	name = "stimpak fluid"
	description = "stimpak"
	reagent_state = LIQUID
	color = "#ad1717"
	metabolization_rate = 1.6
	overdose_threshold = 15
	/// The value to subtract from the mob's damage, as well as the value to base the ODing off
	var/heal_Rate = 10
	/// Let's do some damage.
	var/OD_multiplier = 1
	/// To prevent double dosing of super/regular stimpaks, avoiding OD
	var/forbidden_double_dose = /datum/reagent/ms13/medicine/stimpak_fluid/super
	/// Super stimpak moment
	var/stamina_damage = 0
// Blatant rip from the coagulant reagent //
	/// The bloodiest wound that the patient has will have its blood_flow reduced by about half this much each second
	var/clot_rate = 0.5
	/// While this reagent is in our bloodstream, we reduce all bleeding by this factor
	var/passive_bleed_modifier = 0.2
	/// For tracking when we tell the person we're no longer bleeding
	var/was_working

/datum/reagent/ms13/medicine/stimpak_fluid/on_mob_metabolize(mob/living/M)
	ADD_TRAIT(M, TRAIT_COAGULATING, /datum/reagent/ms13/medicine/stimpak_fluid)
	return ..()

/datum/reagent/ms13/medicine/stimpak_fluid/on_mob_end_metabolize(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_COAGULATING, /datum/reagent/ms13/medicine/stimpak_fluid)
	return ..()

/datum/reagent/ms13/medicine/stimpak_fluid/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	. = ..()

	var/obj/item/organ/heart/our_heart = M.getorganslot(ORGAN_SLOT_HEART)

	if(!M.reagents.has_reagent((forbidden_double_dose))) // Stacking healing items? Yeah right.
		M.adjustBruteLoss(-(heal_Rate), 0)
		M.adjustFireLoss(-(heal_Rate), 0)
		M.adjustStaminaLoss((stamina_damage), 0)
		if(!M.blood_volume || !M.all_wounds)
			return

		var/datum/wound/bloodiest_wound
		for(var/i in M.all_wounds)
			var/datum/wound/iter_wound = i
			if(iter_wound.blood_flow)
				if(iter_wound.blood_flow > bloodiest_wound?.blood_flow)
					bloodiest_wound = iter_wound

		if(bloodiest_wound)
			if(!was_working)
				to_chat(M, span_green("I can already feel my wounds closing!"))
				was_working = TRUE
			bloodiest_wound.blood_flow = max(0, bloodiest_wound.blood_flow - (clot_rate * REM * delta_time))
		else if(was_working)
			was_working = FALSE

	else
		to_chat(M, span_userdanger("Oh dear god... Shouldn't do that..."))
		our_heart.applyOrganDamage(9.5 * (OD_multiplier))
		if(DT_PROB(14.5, delta_time))
			M.losebreath += rand(4, 8)
			M.adjustOxyLoss(rand(3, 8))
			if(prob(25 * (OD_multiplier)))
				to_chat(M, span_userdanger("Oh this is bad..."))
				M.vomit(20)
				M.adjustOxyLoss(rand(4, 7))
				M.Stun(35)

/datum/reagent/ms13/medicine/stimpak_fluid/overdose_process(mob/living/carbon/human/M, delta_time, times_fired)
	. = ..()
	if(!M.blood_volume)
		return

	var/obj/item/organ/heart/our_heart = M.getorganslot(ORGAN_SLOT_HEART)
	our_heart.applyOrganDamage(9.5 * (OD_multiplier))

	if(DT_PROB(7.5, delta_time))
		M.losebreath += rand(2, 4)
		M.adjustOxyLoss(rand(1, 3))
		if(prob(25 * (OD_multiplier)))
			to_chat(M, span_userdanger("Can't catch my breath..."))
			M.adjustOxyLoss(rand(3, 4))
			M.Stun(35)

/datum/reagent/ms13/medicine/stimpak_fluid/on_mob_metabolize(mob/living/M)
	if(!ishuman(M))
		return

	var/mob/living/carbon/human/blood_boy = M
	blood_boy.physiology?.bleed_mod *= passive_bleed_modifier

/datum/reagent/ms13/medicine/stimpak_fluid/super
	name = "super stimpak fluid"
	reagent_state = LIQUID
	color = "#c73131"
	metabolization_rate = 1.6
	overdose_threshold = 15
	heal_Rate = 20
	OD_multiplier = 1.5
	forbidden_double_dose = /datum/reagent/ms13/medicine/stimpak_fluid/
	stamina_damage = 20
	clot_rate = 0.6
	passive_bleed_modifier = 0.4

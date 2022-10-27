// Injectables

/obj/item/reagent_containers/hypospray/medipen/ms13/psycho
	name = "psycho injector"
	desc = "Bottled up rage, ready to inject straight into your veins."
	icon_state = "psycho"
	base_icon_state = "psycho"
	volume = 20
	amount_per_transfer_from_this = 20
	list_reagents = list(/datum/reagent/ms13/psycho = 20)

/obj/item/reagent_containers/hypospray/medipen/ms13/overdrive
	name = "overdrive injector"
	desc = "An extremely potent and dangerous combat enhancing chem. Caution should be used."
	icon_state = "overdrive"
	base_icon_state = "overdrive"
	volume = 25
	amount_per_transfer_from_this = 25
	list_reagents = list(/datum/reagent/ms13/overdrive = 25)

/obj/item/reagent_containers/hypospray/medipen/ms13/calmex
	name = "calmex injector"
	desc = "A preloaded rapid-inject calmex syringe. Rotate the piston handle completely around to release the optimal stream."
	icon_state = "calmex"
	base_icon_state = "calmex"
	volume = 20
	amount_per_transfer_from_this = 20
	list_reagents = list(/datum/reagent/ms13/calmex = 20)

/obj/item/reagent_containers/hypospray/medipen/ms13/medx
	name = "med-x injector"
	desc = "A preloaded rapid-inject med-x syringe. Rotate the piston handle completely around to release the optimal stream."
	icon_state = "medx"
	base_icon_state = "medx"
	volume = 20
	amount_per_transfer_from_this = 20
	list_reagents = list(/datum/reagent/ms13/medx = 20)

/obj/item/reagent_containers/hypospray/medipen/ms13/addictol
	name = "addictol injector"
	desc = "A pre-war chemically induced get out of jail free card. Issued to addicts who simply couldn't kick it."
	icon_state = "addictol"
	base_icon_state = "addictol"
	volume = 8
	amount_per_transfer_from_this = 8
	list_reagents = list(/datum/reagent/ms13/addictol = 8)


// Huffables

/obj/item/reagent_containers/ms13/inhaler
	name = "base type MS13 inhaler" // crack pipe
	desc = "if you find this, do NOT shoot this shit into your lungs. WORST mistake of my life."
	icon = 'mojave/icons/objects/drugs.dmi'
	icon_state = ""
	volume = 10
	amount_per_transfer_from_this = 10
	list_reagents = list()
	var/use_sound = "mojave/sound/ms13items/crackpipe_huff.ogg"
	var/infinite = FALSE

/obj/item/reagent_containers/ms13/inhaler/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.45, 1)

/obj/item/reagent_containers/ms13/inhaler/attack(mob/living/affected_mob, mob/user)
	if(!reagents.total_volume)
		to_chat(user, span_warning("[src] is empty!"))
		return

	else if(do_after(user, 0.65 SECONDS))
		inhale(affected_mob, user)

///Handles all inhaling checks, inhaling and logging.
/obj/item/reagent_containers/ms13/inhaler/proc/inhale(mob/living/affected_mob, mob/user)
	if(!reagents.total_volume)
		to_chat(user, span_warning("[src] is empty!"))
		return FALSE
	if(!iscarbon(affected_mob))
		return FALSE
	//Always log attemped inhales for admins
	var/list/inhaled = list()
	for(var/datum/reagent/inhaled_reagent in reagents.reagent_list)
		inhaled += inhaled_reagent.name
	var/contained = english_list(inhaled)
	log_combat(user, affected_mob, "attempted to make inhale", src, "([contained])")

	if(reagents.total_volume)
		update_icon_state()
		to_chat(affected_mob, span_warning("You feel the vapor hit your lungs!"))
		to_chat(user, span_notice("You make [affected_mob] inhale off the [src]."))
		playsound(src, use_sound, 40, TRUE)
		var/fraction = min(amount_per_transfer_from_this/reagents.total_volume, 1)


		if(affected_mob.reagents)
			var/trans = 0
			if(!infinite)
				trans = reagents.trans_to(affected_mob, amount_per_transfer_from_this, transfered_by = user, methods = INJECT)
			else
				reagents.expose(affected_mob, INJECT, fraction)
				trans = reagents.copy_to(affected_mob, amount_per_transfer_from_this)
			to_chat(user, span_notice("[trans] unit\s inhaled. [reagents.total_volume] unit\s remaining in [src]."))
			log_combat(user, affected_mob, "inhaled", src, "([contained])")
		return TRUE
	return FALSE

/obj/item/reagent_containers/ms13/inhaler/update_icon_state()
	. = ..()
	if(reagents.total_volume > 0)
		icon_state = initial(icon_state)
		inhand_icon_state = initial(inhand_icon_state)
	else
		icon_state = "[initial(icon_state)]0"
		inhand_icon_state = "[initial(inhand_icon_state)]0"

/obj/item/reagent_containers/ms13/inhaler/jet
	name = "jet inhaler"
	desc = "An inhaler filled with the infamous sweet red juice that everyone craves."
	icon_state = "jet"
	base_icon_state = "jet"
	volume = 15
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/ms13/jet = 15)

/obj/item/reagent_containers/ms13/inhaler/rocket
	name = "rocket inhaler"
	desc = "A more potent version of Jet, streamlined to minimize the drool-y parts and maximize the focus-y part."
	icon_state = "rocket"
	base_icon_state = "rocket"
	volume = 20
	amount_per_transfer_from_this = 20
	list_reagents = list(/datum/reagent/ms13/rocket = 20)

/obj/item/reagent_containers/ms13/inhaler/turbo
	name = "turbo inhaler"
	desc = "A chem that alters your perception of time and allows your body to overexert itself to move as fast as you can perceive. Tends to cause soreness afterwards."
	icon_state = "turbo"
	base_icon_state = "turbo"
	volume = 15
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/ms13/turbo = 15)


/obj/item/reagent_containers/ms13/inhaler/hydra
	name = "hydra inhaler"
	desc = "A somewhat 'natural' remedy condensed into a potent miracle medicine. This has the ability to mend even some of your worst fractures, simply huff the fun mystery gasses that brew in its container."
	icon_state = "hydra"
	base_icon_state = "hydra"
	volume = 15
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/ms13/hydra = 15)

// Pills

/obj/item/reagent_containers/pill/ms13
	name = "pill"
	desc = "A tablet or capsule."
	icon = 'mojave/icons/objects/drugs.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_misc.dmi'
	icon_state = ""
	worn_icon_state = ""
	volume = 10
	grind_results = list()
	self_delay = 0.5
	chompsound = "mojave/sound/ms13items/pill_swallow.ogg"

/obj/item/reagent_containers/pill/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.35, 1)

/obj/item/reagent_containers/pill/ms13/mentat
	desc = "A small red pill that is partially depressed in the center. Otherwise unnoteworthy."
	icon_state = "mentats"
	list_reagents = list(/datum/reagent/ms13/mentats = 10)

/obj/item/reagent_containers/pill/ms13/buffout
	desc = "A green pill. It has a large 'X' cut across the face of it."
	icon_state = "buffout"
	list_reagents = list(/datum/reagent/ms13/buffout = 10)

/obj/item/reagent_containers/pill/ms13/cateye
	desc = "A green pill. It has an engraved ellipse across the face of it."
	icon_state = "cateye"
	list_reagents = list(/datum/reagent/ms13/cateye = 10)

/obj/item/reagent_containers/pill/ms13/day_tripper
	desc = "A blue and white capsule."
	icon_state = "daytripper"
	list_reagents = list(/datum/reagent/ms13/day_tripper = 10)

/obj/item/reagent_containers/pill/ms13/radx
	desc = "A white and red capsule."
	icon_state = "radx"
	list_reagents = list(/datum/reagent/ms13/radx = 10)

// Pill bottles //

/obj/item/storage/pill_bottle/ms13
	name = "pill bottle"
	desc = "A simple bottle with a cork top used to store medicine capsules."
	icon = 'mojave/icons/objects/drugs.dmi'
	icon_state = "bottle_closed"
	inhand_icon_state = "contsolid"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	component_type = /datum/component/storage/concrete/ms13/pillbottle
	grid_height = 64
	grid_width = 32

/obj/item/storage/pill_bottle/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.35, 1)

/obj/item/storage/pill_bottle/ms13/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_TINY
	STR.max_items = 8
	STR.max_combined_w_class = 8
	STR.set_holdable(list(
		/obj/item/reagent_containers/pill,
		/obj/item/ammo_casing,
		))

/obj/item/storage/pill_bottle/ms13/radx
	name = "bottle of rad-x pills"
	desc = "Contains pills used to counter radiation."

/obj/item/storage/pill_bottle/ms13/radx/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/ms13/radx(src)

/obj/item/storage/pill_bottle/ms13/cateye
	name = "bottle of cateye pills"
	desc = "Contains pills used to enhance low-light vision."

/obj/item/storage/pill_bottle/ms13/cateye/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/pill/ms13/cateye(src)

/obj/item/storage/pill_bottle/ms13/buffout
	name = "bottle of buffout pills"
	desc = "Contains pills used to bolster endurance of pain."

/obj/item/storage/pill_bottle/ms13/buffout/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/ms13/buffout(src)

/obj/item/storage/pill_bottle/ms13/mentat
	name = "bottle of mentat pills"
	desc = "Contains pills used to enhance mental fortitude and increase intelligence."

/obj/item/storage/pill_bottle/ms13/mentat/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/ms13/mentat(src)

/obj/item/storage/pill_bottle/ms13/daytripper
	name = "bottle of day tripper pills"
	desc = "Contains pills used to make life seem just a tiny bit more tolerable."

/obj/item/storage/pill_bottle/ms13/daytripper/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/ms13/day_tripper(src)

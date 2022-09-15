/obj/item/reagent_containers/ms13
	name = "MS13 base type reagent container"
	desc = "A base type reagent container for MS13."
	icon = 'mojave/icons/objects/medical/medical_inventory.dmi'
	w_class = WEIGHT_CLASS_TINY
	volume = 30

/obj/item/reagent_containers/ms13/flask
	name = "ceramic flask"
	desc = "A crudely sealed, rounded ceramic flask, can be used to store liquids. <b>If it is open when dropped or put in a bag, it will roll over and spill! <br> Alt-Click to open or close it.</b>"
	icon_state = "ceramic_flask"
	volume = 15
	throwforce = 10
	grid_width = 32
	grid_height = 64

/obj/item/reagent_containers/ms13/flask/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.45, 1)

/obj/item/reagent_containers/ms13/flask/AltClick(mob/user)
	. = ..()
	if(do_after(user, 0.75 SECONDS))
		if(!spillable)
			spillable = TRUE
			playsound(src, "mojave/sound/ms13effects/bottle_open.ogg", 35, TRUE, 2)
			icon_state = "[initial(icon_state)]-open"
		else
			spillable = FALSE
			icon_state = initial(icon_state)

/obj/item/reagent_containers/ms13/flask/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	new /obj/item/stack/sheet/ms13/ceramic(loc)
	playsound(src, "shatter", 70, TRUE)
	qdel(src)

/obj/item/reagent_containers/ms13/flask/dropped(mob/user, silent)
	. = ..()
	if(spillable)
		for(var/datum/reagent/reagent as anything in reagents.reagent_list)
		if(reagents)
			reagents.clear_reagents()
			visible_message(span_notice("[src] spills its contents."))
		else
			return

/obj/item/reagent_containers/ms13/flask/attack(mob/M, mob/living/user, obj/target)
	if(!canconsume(M, user))
		return

	if(!spillable)
		return

	if(!reagents || !reagents.total_volume)
		to_chat(user, span_warning("[src] is empty!"))
		return

	if(istype(M))
		if(M != user)
			M.visible_message(span_danger("[user] attempts to feed [M] something from [src]."), \
						span_userdanger("[user] attempts to feed you something from [src]."))
			if(!do_mob(user, M))
				return
			if(!reagents || !reagents.total_volume)
				return // The drink might be empty after the delay, such as by spam-feeding
			M.visible_message(span_danger("[user] feeds [M] something from [src]."), \
						span_userdanger("[user] feeds you something from [src]."))
			log_combat(user, M, "fed", reagents.log_list())
		else
			to_chat(user, span_notice("You swallow a gulp of [src]."))
		SEND_SIGNAL(src, COMSIG_GLASS_DRANK, M, user)
		addtimer(CALLBACK(reagents, /datum/reagents.proc/trans_to, M, 5, TRUE, TRUE, FALSE, user, FALSE, INGEST), 5)
		playsound(src, "mojave/sound/ms13effects/drinking_redux.ogg", 45, TRUE, 2)

/obj/item/reagent_containers/ms13/flask/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()
	if (!spillable)
		context[SCREENTIP_CONTEXT_ALT_LMB] = "Open"
	else
		context[SCREENTIP_CONTEXT_ALT_LMB] = "Close"

	return CONTEXTUAL_SCREENTIP_SET

/obj/item/reagent_containers/ms13/flask/bitter_drink
	name = "bitter drink flask"
	desc = "A painted round bottom ceramic flask, the rim smells of bitterness. <b>If it is open when dropped or put in a bag, it will roll over and spill! <br> Alt-Click to open or close it.</b>"
	icon_state = "bitter_drink"
	volume = 15
	list_reagents = list(/datum/reagent/medicine/bitter_drink = 15)

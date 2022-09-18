//Blood//

/obj/item/reagent_containers/blood/ms13
	icon = 'mojave/icons/objects/medical/medical_world.dmi'
	icon_state = "iv_empty"
	desc = "A bag for injecting fluids intravenously, it can be hooked to an IV drip or used in the field."
	w_class = WEIGHT_CLASS_SMALL
	grid_width = 64
	grid_height = 32
	fill_icon_thresholds = list(25, 50, 75, 100)
	filling_file = 'mojave/icons/objects/medical/iv_fillings.dmi'

	var/mob/living/carbon/human/attached

/obj/item/reagent_containers/blood/ms13/Destroy()
	STOP_PROCESSING(SSobj,src)
	attached = null
	. = ..()

/obj/item/reagent_containers/blood/ms13/MouseDrop(mob/living/target)
	if(!ishuman(usr) || !usr.canUseTopic(src, BE_CLOSE) || !isliving(target))
		return
	if(attached)
		visible_message("\The [attached] is taken off \the [src]")
		attached = null
		icon_state = "iv_empty"
		update_appearance()
	else
		field_transfusion(target, usr)

/obj/item/reagent_containers/blood/ms13/process(delta_time)
	if(!(get_dist(src, attached) <= 1 && isturf(attached.loc)))
		attached = null
		visible_message("\The [attached] detaches from \the [src]")
		attached = null
		update_appearance()
		return PROCESS_KILL

	var/mob/M = loc
	if(M.held_items[LEFT_HANDS] != src && M.held_items[RIGHT_HANDS] != src)
		visible_message("\The [attached] detaches from \the [src]")
		attached = null
		update_appearance()
		return PROCESS_KILL

	if(!reagents.total_volume)
		return

	update_appearance()
	reagents.trans_to(attached, 2 * delta_time, methods = INJECT, show_message = FALSE)

/obj/item/reagent_containers/blood/ms13/proc/field_transfusion(mob/living/target, mob/user)
	loc.visible_message(span_warning("[usr] begins attaching [src] to [target]..."), span_warning("You begin attaching [src] to [target]."))
	if(do_after(usr, 1 SECONDS, target))
		usr.visible_message(span_warning("[usr] attaches [src] to [target]."), span_notice("You attach [src] to [target]."))
		log_combat(usr, target, "attached", src, "containing: ([reagents.log_list()])")
		add_fingerprint(usr)
		attached = target
		icon_state = "iv_empty_injecting"
		update_appearance()
		START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/blood/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/medical/medical_inventory.dmi')

/obj/item/reagent_containers/blood/ms13/a_plus
	blood_type = "A+"

/obj/item/reagent_containers/blood/ms13/a_minus
	blood_type = "A-"

/obj/item/reagent_containers/blood/ms13/b_plus
	blood_type = "B+"

/obj/item/reagent_containers/blood/ms13/b_minus
	blood_type = "B-"

/obj/item/reagent_containers/blood/ms13/o_plus
	blood_type = "O+"

/obj/item/reagent_containers/blood/ms13/o_minus
	blood_type = "O-"

//Misc//

/obj/item/reagent_containers/blood/ms13/radaway
	name = "RadAway"
	desc = "RadAway is an intravenous chemical solution that bonds with radiation and toxin particles and passes them through the body's system. It takes some time to work and is a potent diuretic."
	icon_state = "iv_empty"
	labelled = 1
	blood_type = null
	volume = 200
	list_reagents = list(/datum/reagent/ms13/medicine/radaway = 200)

/datum/reagent/ms13/medicine/radaway
	name = "Radaway"
	description = "A potent anti-toxin drug."
	reagent_state = LIQUID
	color = "#ff7200"
	metabolization_rate = 2 * REAGENTS_METABOLISM

/datum/reagent/ms13/medicine/radaway/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjustToxLoss(-3*REM)
	. = 1
	..()

//Blood//

/obj/item/reagent_containers/blood/ms13
	icon = 'mojave/icons/objects/medical/medical_world.dmi'
	icon_state = "bag_r"
	desc = "A bag for injecting fluids intravenously, it can be hooked to an IV drip or used in the field."
	w_class = WEIGHT_CLASS_SMALL
	grid_width = 64
	grid_height = 32

	var/mob/living/carbon/human/attached

/obj/item/reagent_containers/blood/ms13/examine(mob/user)
	. = ..()
	. += span_notice("Drag-click the bag onto someone, or yourself to do a field transfusion.")

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
	else
		field_transfusion(target, usr)

/obj/item/reagent_containers/blood/ms13/process(delta_time)
	if(!ismob(loc))
		return PROCESS_KILL

	if(attached)
		if(!loc.Adjacent(attached))
			attached = null
			visible_message("\The [attached] detaches from \the [src]")
			return PROCESS_KILL
	else
		return PROCESS_KILL

	var/mob/M = loc
	if(M.held_items[LEFT_HANDS] != src && M.held_items[RIGHT_HANDS] != src)
		return

	if(!reagents.total_volume)
		return

	reagents.trans_to(attached, 2 * delta_time, methods = INJECT, show_message = FALSE)

/obj/item/reagent_containers/blood/ms13/proc/field_transfusion(mob/living/target, mob/user)
	loc.visible_message(span_warning("[usr] begins attaching [src] to [target]..."), span_warning("You begin attaching [src] to [target]."))
	if(!do_after(usr, 1 SECONDS, target))
		return
	usr.visible_message(span_warning("[usr] attaches [src] to [target]."), span_notice("You attach [src] to [target]."))
	log_combat(usr, target, "attached", src, "containing: ([reagents.log_list()])")
	add_fingerprint(usr)
	attached = target
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
	icon_state = "bag_y"
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

/obj/item/organ
	food_reagents = list(
		/datum/reagent/consumable/nutriment/organ_tissue = 5,
		/datum/reagent/consumable/nutriment/protein = 1,
	)
	/// Type of food we turn into when grilled, should probably keep it as what it is here
	var/grilled_type = /obj/item/food/meat/steak/plain/ms13/organ

/obj/item/organ/Initialize(mapload)
	. = ..()
	if((organ_flags & ORGAN_EDIBLE) && grilled_type)
		AddComponent(/datum/component/grillable, grilled_type, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE)
		RegisterSignal(src, COMSIG_GRILL_COMPLETED, .proc/on_grill_completed)

/obj/item/organ/proc/on_grill_completed(datum/source, obj/item/grill_result)
	SIGNAL_HANDLER

	if(istype(grill_result, /obj/item/food/meat/steak/plain/ms13/organ))
		var/obj/item/food/meat/steak/plain/ms13/organ/organ_meat = grill_result
		organ_meat.get_inheritance(src)

/obj/item/organ
	food_reagents = list(
		/datum/reagent/consumable/nutriment/organ_tissue = 5,
		/datum/reagent/consumable/nutriment/protein = 1,
	)
	/// Type of food we turn into when grilled, should probably keep it as what it is here
	var/grilled_type = /obj/item/food/meat/slab/ms13/organ

/obj/item/organ/Initialize(mapload)
	. = ..()
	if((organ_flags & ORGAN_EDIBLE) && grilled_type)
		AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/plain/ms13/organ, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE)

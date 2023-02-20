/obj/item/food/meat/steak/plain/ms13/organ
	name = "roasted organ"
	desc = "Probably the nastiest \"steak\" ever. At least it's not raw."
	icon_state = "fatty_roasted"
	tastes = list("gamey meat" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment/organ_tissue = 4,
						/datum/reagent/consumable/nutriment/protein = 4,
						/datum/reagent/consumable/nutriment/vitamin = 1)

/obj/item/food/meat/slab/ms13/organ/Initialize(mapload, amount, obj/item/organ/organ_parent)
	. = ..()
	if(!organ_parent)
		return
	get_inheritance(organ_parent)

/obj/item/food/meat/slab/ms13/organ/proc/get_inheritance(obj/item/organ/organ_parent)
	icon_state = ""
	cut_overlays()
	var/mutable_appearance/parent_appearance = new(organ_parent)
	parent_appearance.transform = matrix() //resets the transform because le shrink element shenanigans
	add_overlay(organ_parent)
	name = "roasted [organ_parent]"
	color = COLOR_DARK_ORANGE

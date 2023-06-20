/obj/item/food/meat/steak/plain/ms13/organ
	name = "roasted organ"
	desc = "Probably the nastiest \"steak\" ever. At least it's not raw."
	icon_state = "fatty_roasted"
	tastes = list("gamey meat" = 1)
	food_reagents = list(
		/datum/reagent/consumable/nutriment/organ_tissue = 4,
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	color = COLOR_DARK_ORANGE

/obj/item/food/meat/steak/plain/ms13/organ/proc/get_inheritance(obj/item/organ/organ_parent)
	//ooh yeah baby this is stupid!!!!
	var/old_flags = organ_parent.item_flags
	organ_parent.item_flags |= IN_INVENTORY
	organ_parent.update_appearance()
	organ_parent.item_flags = old_flags
	icon = organ_parent.icon
	icon_state = organ_parent.icon_state
	name = "roasted [organ_parent.name]"
	color = COLOR_DARK_ORANGE

/obj/item/food/meat/steak/plain/ms13/organ/brain
	name = "roasted brain"
	desc = "Looks repugnant... But it's probably a delicacy in one of those weird eastern countries, right?"
	icon = 'mojave/icons/objects/organs/organs_inventory.dmi'
	icon_state = "brain"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/organ_tissue = 4,
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/protein/prions = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)

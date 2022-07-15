/obj/item/reagent_containers/ms13
	name = "MS13 base type reagent container"
	desc = "A base type reagent container for MS13."
	icon = 'mojave/icons/objects/medical/medical_inventory.dmi'
	w_class = WEIGHT_CLASS_TINY
	amount_per_transfer_from_this = 5
	list/possible_transfer_amounts = list(5,10,15,20,25,30)
	amount_list_position = 1
	volume = 30
	list/list_reagents = null
	spawned_disease = null
	disease_amount = 20
	spillable = FALSE
	list/fill_icon_thresholds = null
	fill_icon_state = null // Optional custom name for reagent fill icon_state prefix

/obj/item/reagent_containers/ms13/flask
	name = "ceramic flask"
	desc = "A crude ceramic flask, can be used to store liquids."
	icon_state = "ceramic_flask"
	volume = 15

/obj/item/reagent_containers/ms13/bitter_drink
	name = "Bitter drink"
	desc = "A bitter drink. Super bitter. Brewed from Broc flower and Xander root."
	icon_state = "bitter_drink"
	volume = 15
	list_reagents = list(/datum/reagent/medicine/bitter_drink = 15)

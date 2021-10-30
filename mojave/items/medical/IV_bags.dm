//Blood//

/obj/item/reagent_containers/blood/ms13
	icon = 'mojave/icons/objects/medical/medical_world.dmi'
	icon_state = "bag_r"

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
	M.radiation -= min(M.radiation, 16)
	. = 1
	..()

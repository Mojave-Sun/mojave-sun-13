/datum/job/ms13/town_drought/clinician
	title = "Town Clinician"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Baron and his Enforcers"
	description = "Aid any patients that come in and ensure the residents of the Town are well cared for."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town_drought/clinician

	display_order = JOB_DISPLAY_ORDER_MS13_CLINICIAN

	mind_traits = list(TRAIT_MEDICAL_TRAINING)

/datum/outfit/job/ms13/town_drought/clinician
	name = "_Town Clinician"
	jobtype = /datum/job/ms13/town_drought/clinician

	id = 		 /obj/item/card/id/ms13/drought_doctor
	suit =       /obj/item/clothing/suit/toggle/labcoat/ms13
	uniform =    /obj/item/clothing/under/ms13/wasteland/whiteshirt
	shoes =  	 /obj/item/clothing/shoes/ms13/tan
	belt = 		 /obj/item/storage/firstaid/ms13/regular
	r_hand =     /obj/item/storage/firstaid/ms13/bag/filled
	r_pocket =   /obj/item/stack/ms13/currency/cap/hunned
	back =       /obj/item/storage/ms13/satchel

/datum/outfit/job/ms13/town_drought/clinician/pre_equip(mob/living/carbon/human/H)
	..()

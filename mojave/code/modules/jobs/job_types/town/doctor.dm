/datum/job/ms13/town/doctor
	title = "Snowcrest Doctor"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor"
	description = "Aid any patients that come in and ensure the residents of Snowcrest are well cared for."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/doctor

	display_order = JOB_DISPLAY_ORDER_MS13_DOCTOR

	mind_traits = list(TRAIT_MEDICAL_TRAINING, TRAIT_DRUGGIE)

/datum/outfit/job/ms13/town/doctor
	name = "_Snowcrest Doctor"
	jobtype = /datum/job/ms13/town/doctor

	id = 		 /obj/item/card/id/ms13/doctor
	suit =       /obj/item/clothing/suit/toggle/labcoat/ms13
	uniform = 	 /obj/item/clothing/under/ms13/wasteland/snowcrest/medical
	belt = 		 /obj/item/storage/firstaid/ms13/regular
	shoes = 	 /obj/item/clothing/shoes/ms13/fancy
	gloves =	 /obj/item/clothing/gloves/ms13/nitrile
	r_pocket =   /obj/item/stack/ms13/currency/prewar/hunnedeighty
	back =       /obj/item/storage/ms13/satchel

/datum/outfit/job/ms13/town/doctor/pre_equip(mob/living/carbon/human/H)
	..()

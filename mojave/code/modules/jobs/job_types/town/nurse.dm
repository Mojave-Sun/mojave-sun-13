/datum/job/ms13/town/nurse
	title = "Snowcrest Nurse"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Doctor and the Mayor"
	description = "Assist the Snowcrest medical staff in whatever they may need."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/nurse

	display_order = JOB_DISPLAY_ORDER_MS13_NURSE

	mind_traits = list(TRAIT_MEDICAL_TRAINING)

/datum/outfit/job/ms13/town/nurse
	name = "_Snowcrest Nurse"
	jobtype = /datum/job/ms13/town/nurse

	id =		 /obj/item/card/id/ms13/doctor/nurse
	belt = 		 /obj/item/storage/firstaid/ms13/regular
	uniform = 	 /obj/item/clothing/under/ms13/wasteland/snowcrest/medical
	r_pocket =   /obj/item/stack/ms13/currency/prewar/hunned
	shoes = 	 /obj/item/clothing/shoes/ms13/winter
	back =       /obj/item/storage/ms13/satchel

/datum/outfit/job/ms13/town/nurse/pre_equip(mob/living/carbon/human/H)
	..()

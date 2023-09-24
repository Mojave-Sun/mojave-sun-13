/datum/job/ms13/ncr/mp_medic
	title = "NCR MP Medic"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Sergeant primarily and firstly, the Snowcrest Doctor as needed and during medical operations."
	description = "You are the sole medical personnel assigned to the NCR garrison at Snowcrest. Work with the town medical staff to ensure the health and wellbeing of the town of Snowcrest, and also ensure your comrades stay alive and well."

	outfit = /datum/outfit/job/ms13/ncr/mp_medic

	display_order = JOB_DISPLAY_ORDER_MS13_MPMEDIC

	mind_traits = list(TRAIT_MEDICAL_TRAINING)

/datum/outfit/job/ms13/ncr/mp_medic
	name = "_NCR MP Medic"
	jobtype = /datum/job/ms13/ncr/mp_medic
	id = 		 /obj/item/card/id/ms13/ncr/medic/mp
	uniform = 	 /obj/item/clothing/under/ms13/ncr/fatigues/medic
	gloves = 	 /obj/item/clothing/gloves/ms13/nitrile
	belt = 		 /obj/item/storage/firstaid/ms13/regular
	r_pocket = 	 /obj/item/radio/ms13
	l_pocket =	 /obj/item/gun/ballistic/revolver/ms13/rev357/police
	back =		 /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/half=1, \
		/obj/item/stack/medical/ointment/ms13/half=1, \
		/obj/item/stack/ms13/currency/ncr_dollar/thirty=1)

/datum/outfit/job/ms13/ncr/mp_medic/pre_equip(mob/living/carbon/human/H)
	..()

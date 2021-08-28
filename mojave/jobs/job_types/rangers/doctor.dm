/datum/job/ms13/ranger/doctor
	title = "Ranger Doctor"
	total_positions = 5
	spawn_positions = 5
	supervisors = "The Rangers"
	description = "A doctor working alongside the Rangers in order to aid the public when needed. Maintain health of the Rangers and any bystanders."

	outfit = /datum/outfit/job/ms13/ranger/doctor

	display_order = JOB_DISPLAY_ORDER_MS13_RANGERDOCTOR

/datum/outfit/job/ms13/ranger/doctor
	name = "_Ranger Doctor"
	jobtype = 	 /datum/job/ms13/ranger/doctor
	id = 		 /obj/item/card/id/ms13/ranger_doctor
	r_hand = 	 /obj/item/storage/firstaid/ms13/regular
	uniform = 	 /obj/item/clothing/under/ms13/wasteland/doctor
	backpack_contents = list(/obj/item/stack/medical/ointment/ms13/cream=1,\
		/obj/item/stack/medical/suture/ms13=1,\
		/obj/item/stack/medical/gauze/ms13=1)

/datum/outfit/job/ms13/ranger/doctor/pre_equip(mob/living/carbon/human/H)
	..()

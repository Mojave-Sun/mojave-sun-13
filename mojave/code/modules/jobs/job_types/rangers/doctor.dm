/datum/job/ms13/ranger/doctor
	title = "Desert Ranger Doctor"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Rangers"
	description = "A doctor working alongside the Rangers in order to aid the public when needed. Maintain health of the Rangers and any bystanders."

	outfit = /datum/outfit/job/ms13/ranger/doctor

	display_order = JOB_DISPLAY_ORDER_MS13_RANGERDOCTOR

/datum/outfit/job/ms13/ranger/doctor
	name = "_Desert Ranger Doctor"
	jobtype = 	 /datum/job/ms13/ranger/doctor
	id = 		 /obj/item/card/id/ms13/ranger_doctor
	belt = 	     /obj/item/storage/firstaid/ms13/regular
	r_hand =     /obj/item/storage/firstaid/ms13/bag/filled
	r_pocket =   /obj/item/gun/ballistic/revolver/ms13/rev357/police
	l_pocket =   /obj/item/stack/ms13/currency/prewar/thirty
	back =       /obj/item/storage/ms13/satchel
	uniform = 	 /obj/item/clothing/under/ms13/wasteland/doctor
	backpack_contents = list(/obj/item/stack/medical/ointment/ms13/half=1,\
		/obj/item/stack/medical/suture/ms13/eight=1,\
		/obj/item/stack/medical/gauze/ms13/half=1)

/datum/outfit/job/ms13/ranger/doctor/pre_equip(mob/living/carbon/human/H)
	..()

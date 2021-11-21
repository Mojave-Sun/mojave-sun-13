/datum/job/ms13/town/doctor
	title = "Town Doctor"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Mayor and the Sheriff"
	description = "Aid any patients that come in and ensure the residents of the town are well cared for."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/doctor

	display_order = JOB_DISPLAY_ORDER_MS13_DOCTOR

/datum/outfit/job/ms13/town/doctor
	name = "_Town Doctor"
	jobtype = /datum/job/ms13/town/doctor

	suit =       /obj/item/clothing/suit/ms13/vaultlab
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/color/latex/nitrile
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack
	belt = 		 /obj/item/storage/firstaid/ms13/regular

/datum/outfit/job/ms13/town/doctor/pre_equip(mob/living/carbon/human/H)
	..()

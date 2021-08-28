/datum/job/ms13/town/nurse
	title = "Town Nurse"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Doctors, Mayor and Sheriff."
	description = "Assist the Town's doctors in whatever they may need."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/nurse

	display_order = JOB_DISPLAY_ORDER_MS13_NURSE

/datum/outfit/job/ms13/town/nurse
	name = "_Town Nurse"
	jobtype = /datum/job/ms13/town/nurse

	suit =       /obj/item/clothing/suit/apron/surgical
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/color/latex/nitrile
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/

/datum/outfit/job/ms13/town/nurse/pre_equip(mob/living/carbon/human/H)
	..()

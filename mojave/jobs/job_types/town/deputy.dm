/datum/job/ms13/town/deputy
	title = "Town Deputy"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Mayor and the Sheriff."
	description = "Assist the law enforcement of the Sheriff and do as they say."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/deputy

	display_order = JOB_DISPLAY_ORDER_MS13_DEPUTY

/datum/outfit/job/ms13/town/deputy
	name = "_Town Deputy"
	jobtype = /datum/job/ms13/town/deputy

	id = 		 /obj/item/card/id/ms13/deputy
	head =		 /obj/item/clothing/head/helmet/ms13/utilitycap/deputy
	mask =		 /obj/item/clothing/mask/ms13/facewrap/halfwrap
	suit =       /obj/item/clothing/suit/armor/ms13/vest/vault
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/ms13/vault
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/satchel/leather
	belt = 	 /obj/item/storage/belt/holster/ms13/sheriff/full_357

/datum/outfit/job/ms13/town/deputy/pre_equip(mob/living/carbon/human/H)
	..()

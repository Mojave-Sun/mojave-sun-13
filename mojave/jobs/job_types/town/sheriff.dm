/datum/job/ms13/town/sheriff
	title = "Town Sheriff"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor."
	description = "Enforce the Mayor's law upon the Town with the assistance of your Deputies by any means possible."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/sheriff

	display_order = JOB_DISPLAY_ORDER_MS13_SHERIFF

/datum/outfit/job/ms13/town/sheriff
	name = "_Town Sheriff"
	jobtype = /datum/job/ms13/town/sheriff

	id = 		 /obj/item/card/id/ms13/sheriff
	head = 	     /obj/item/clothing/head/helmet/ms13/sheriff
	suit =       /obj/item/clothing/suit/toggle/ms13/wjacket/brown/armored
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/ms13/vault
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/satchel/leather
	belt =	 /obj/item/storage/belt/holster/ms13/sheriff/full_44
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever/cowboy
	r_pocket = /obj/item/ammo_box/ms13/tube357

/datum/outfit/job/ms13/town/sheriff/pre_equip(mob/living/carbon/human/H)
	..()

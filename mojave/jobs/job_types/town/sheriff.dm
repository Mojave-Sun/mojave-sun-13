/datum/job/ms13/town/sheriff
	title = "Town Sheriff"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor."
	description = "Enforce the Mayor's law upon the Town with the assistance of your Deputies."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/sheriff

	display_order = JOB_DISPLAY_ORDER_MS13_SHERIFF

/datum/outfit/job/ms13/town/sheriff
	name = "_Town Sheriff"
	jobtype = /datum/job/ms13/town/sheriff

	id = 		 /obj/item/card/id/ms13/sheriff
	head = 	     /obj/item/clothing/head/helmet/ms13/sheriff
	suit =       /obj/item/clothing/suit/armor/ms13/vest/vault
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/ms13/vault
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/satchel/leather
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever/trail
	belt = 		 /obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/military
	r_pocket =   /obj/item/ammo_box/magazine/ms13/m10mm
	l_pocket = 	 /obj/item/knife/ms13/combat
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/half=1, \
		/obj/item/stack/medical/ointment/ms13/cream/half=1, \
		/obj/item/clothing/head/helmet/ms13/vaulthelmet=1, \
		/obj/item/claymore/ms13/baton=1, \
		/obj/item/ammo_box/ms13/tube44=2)

/datum/outfit/job/ms13/town/sheriff/pre_equip(mob/living/carbon/human/H)
	..()

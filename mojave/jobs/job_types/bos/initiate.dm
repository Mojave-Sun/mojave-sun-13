/datum/job/ms13/bos/initiate
	title = "_BoS Initiate"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Knights and Paladins"
	description = "It's time for you to learn the ropes of what it means to be Brotherhood. Listen to your superiors carefully and help accomplish their goals. One day, you'll get there, too."

	outfit = /datum/outfit/job/ms13/bos/initiate

	display_order = JOB_DISPLAY_ORDER_MS13_INITIATE

/datum/outfit/job/ms13/bos/initiate
	name = "_BoS Initiate"
	jobtype = /datum/job/ms13/bos/initiate

	id = /obj/item/card/id/ms13/bos/initiate
	head = /obj/item/clothing/head/helmet/ms13/initiate
	mask = /obj/item/clothing/mask/ms13/bos
	uniform =  /obj/item/clothing/under/ms13/bos
	gloves = /obj/item/clothing/gloves/ms13/bos
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	suit = /obj/item/clothing/suit/armor/ms13/vest/bos
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/m10mm
	r_pocket = /obj/item/ammo_box/magazine/ms13/m10mm

/datum/outfit/job/ms13/bos/initiate/pre_equip(mob/living/carbon/human/H)
	..()

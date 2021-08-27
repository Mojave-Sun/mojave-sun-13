/datum/job/ms13/raiders/sawbone
	title = "Sawbone"
	total_positions = 2
	spawn_positions = 2
	supervisors = ""
	description = "Fix up the boys whenever they get fucked up. While you may not be an expert- Sometimes the blood letting and chainsaw improv works out."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/raiders/sawbone

	display_order = JOB_DISPLAY_ORDER_MS13_SAWBONE

/datum/outfit/job/ms13/raiders/sawbone
	name = "_Raider"
	jobtype = /datum/job/ms13/raiders/sawbone

	head = 		/obj/item/clothing/head/helmet/ms13/hockey
	neck =		/obj/item/clothing/neck/cloak/ms13/mantle
	id = 		/obj/item/card/id/ms13/sawbone
	suit = 		/obj/item/clothing/suit/apron/surgical
	uniform =	/obj/item/clothing/under/ms13/wasteland/doctor
	shoes = 	/obj/item/clothing/shoes/ms13/military

/datum/outfit/job/ms13/raiders/sawbone/pre_equip(mob/living/carbon/human/H)
	..()

	back = pick(
		/obj/item/storage/backpack/satchel/leather,\
		/obj/item/storage/backpack)

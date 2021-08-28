/datum/job/ms13/raiders/sawbone
	title = "Sawbone"
	total_positions = 2
	spawn_positions = 2
	supervisors = ""
	description = "Fix up the boys whenever they get fucked up. While you may not be an expert- Sometimes the blood letting and chainsaw improv works out."
	forbid = ""
	enforce = "Fixxing up the boys. Perhaps cutting some deals with the locals."

	outfit = /datum/outfit/job/ms13/raiders/sawbone

	display_order = JOB_DISPLAY_ORDER_MS13_SAWBONE

/datum/outfit/job/ms13/raiders/sawbone
	name = "_Raider Sawbone"
	jobtype = /datum/job/ms13/raiders/sawbone

	head = 		/obj/item/clothing/head/ms13/hood/sack
	id = 		/obj/item/card/id/ms13/sawbone
	suit = 		/obj/item/clothing/suit/ms13/shawl
	uniform =	/obj/item/clothing/under/ms13/wasteland/worn
	shoes = 	/obj/item/clothing/shoes/ms13/military
	suit_store = /obj/item/claymore/ms13/machete/ripper

/datum/outfit/job/ms13/raiders/sawbone/pre_equip(mob/living/carbon/human/H)
	..()

	back = pick(
		/obj/item/storage/backpack/satchel/leather,\
		/obj/item/storage/backpack)

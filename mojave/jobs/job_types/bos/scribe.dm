/datum/job/ms13/bos/scribe
	title = "_BoS Scribe"
	department_head = list("Head Scribe")
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Head Scribe"
	description = "Ensure the bunker is up to standards, ensure everyone is in good health. Assist the Knight and Paladins as you can, but listen to the Head Scribe above all else."

	outfit = /datum/outfit/job/ms13/bos/scribe

	display_order = JOB_DISPLAY_ORDER_MS13_SCRIBE

/datum/outfit/job/ms13/bos/scribe
	name = "_BoS Scribe"
	jobtype = /datum/job/ms13/bos/scribe

	id = /obj/item/card/id/ms13/bos/scribe
	suit = /obj/item/clothing/suit/armor/ms13/scribe
	uniform =  /obj/item/clothing/under/ms13/bos
	belt = /obj/item/gun/energy/ms13/laser/pistol
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	back = /obj/item/storage/backpack/satchel

/datum/outfit/job/ms13/bos/scribe/pre_equip(mob/living/carbon/human/H)
	..()

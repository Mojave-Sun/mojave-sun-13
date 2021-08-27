/datum/job/ms13/raiders/enforcer
	title = "Raider Enforcer"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Boss"
	description = "Make sure your Boss' words are heard. Beat the boys until they carry his will."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/raiders/enforcer

	display_order = JOB_DISPLAY_ORDER_MS13_ENFORCER

/datum/outfit/job/ms13/raiders/enforcer
	name = "_Raider Enforcer"
	jobtype = /datum/job/ms13/raiders/enforcer

	head = 		/obj/item/clothing/head/helmet/ms13/combat/reinforced
	id = 		/obj/item/card/id/ms13/enforcer
	suit = 		/obj/item/clothing/suit/ms13/trench/enforcercoat
	uniform =	/obj/item/clothing/under/ms13/wasteland/mercc
	gloves =	/obj/item/clothing/gloves/ms13/leather
	shoes = 	/obj/item/clothing/shoes/ms13/military/diesel

/datum/outfit/job/ms13/raiders/enforcer/pre_equip(mob/living/carbon/human/H)
	..()

	back = pick(
		/obj/item/storage/backpack/satchel/leather,\
		/obj/item/storage/backpack)

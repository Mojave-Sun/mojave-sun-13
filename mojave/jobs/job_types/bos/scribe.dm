/datum/job/ms13/bos/scribe
	title = "_BoS Scribe"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list("Head Scribe")
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Head Scribe"
	description = ""
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/bos/scribe

	display_order = JOB_DISPLAY_ORDER_MS13_SCRIBE

/datum/outfit/job/ms13/bos/scribe
	name = "BoS Scribe"
	jobtype = /datum/job/ms13/bos/scribe

	id = /obj/item/card/id/ms13/bos
	uniform =  /obj/item/clothing/under/ms13/bos
	suit = /obj/item/clothing/suit/armor/ms13/scribe
	shoes = /obj/item/clothing/shoes/ms13/military/bos

/datum/outfit/job/ms13/bos/scribe/pre_equip(mob/living/carbon/human/H)
	..()

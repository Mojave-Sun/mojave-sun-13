/datum/job/ms13/bos/head_scribe
	title = "_BoS Head Scribe"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list("Brotherhood High Command")
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Elder (if present) and Brotherhood High Command"
	req_admin_notify = 1
	description = ""
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/bos/head_scribe

	display_order = JOB_DISPLAY_ORDER_MS13_HEAD_SCRIBE

/datum/outfit/job/ms13/bos/head_scribe
	name = "BoS Head Scribe"
	jobtype = /datum/job/ms13/bos/head_scribe

	id = /obj/item/card/id/ms13/bos
	uniform =  /obj/item/clothing/under/ms13/bos/officer
	suit = /obj/item/clothing/suit/armor/ms13/scribe/head
	shoes = /obj/item/clothing/shoes/ms13/military/bos

/datum/outfit/job/ms13/bos/head_scribe/pre_equip(mob/living/carbon/human/H)
	..()

/datum/job/ms13/bos/head_paladin
	title = "_BoS Head Paladin"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list("Brotherhood High Command")
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Elder (if present) and Brotherhood High Command"
	req_admin_notify = 1
	description = ""
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/bos/head_paladin

	display_order = JOB_DISPLAY_ORDER_MS13_HEAD_PALADIN

/datum/outfit/job/ms13/bos/head_paladin
	name = "BoS Head Paladin"
	jobtype = /datum/job/ms13/bos/head_paladin

	id = /obj/item/card/id/ms13/bos
	gloves = /obj/item/clothing/gloves/ms13/bos
	uniform =  /obj/item/clothing/under/ms13/bos/officer
	suit = /obj/item/clothing/suit/armor/ms13/head_paladin
	shoes = /obj/item/clothing/shoes/ms13/military/bos

/datum/outfit/job/ms13/bos/head_paladin/pre_equip(mob/living/carbon/human/H)
	..()

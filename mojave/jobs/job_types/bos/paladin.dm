/datum/job/ms13/bos/paladin
	title = "_BoS Paladin"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list("Head Paladin")
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Head Paladin"
	req_admin_notify = 1
	description = ""
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/bos/paladin

	display_order = JOB_DISPLAY_ORDER_MS13_PALADIN

/datum/outfit/job/ms13/bos/paladin
	name = "BoS Paladin"
	jobtype = /datum/job/ms13/bos/paladin

	id = /obj/item/card/id/ms13/bos
	gloves = /obj/item/clothing/gloves/ms13/bos
	uniform =  /obj/item/clothing/under/ms13/bos/officer
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	mask = /obj/item/clothing/mask/ms13/bos

/datum/outfit/job/ms13/bos/paladin/pre_equip(mob/living/carbon/human/H)
	..()

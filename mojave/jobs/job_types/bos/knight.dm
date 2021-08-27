/datum/job/ms13/bos/knight
	title = "_BoS Knight"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list("Head Paladin")
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Paladin and Head Paladin"
	description = ""
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/bos/knight

	display_order = JOB_DISPLAY_ORDER_MS13_KNIGHT

/datum/outfit/job/ms13/bos/knight
	name = "BoS Knight"
	jobtype = /datum/job/ms13/bos/knight

	id = /obj/item/card/id/ms13/bos
	gloves = /obj/item/clothing/gloves/ms13/bos
	uniform =  /obj/item/clothing/under/ms13/bos
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	mask = /obj/item/clothing/mask/ms13/bos

/datum/outfit/job/ms13/bos/knight/combat
	name = "BoS Knight (Combat)"

	id = /obj/item/card/id/ms13/bos
	gloves = /obj/item/clothing/gloves/ms13/bos
	uniform =  /obj/item/clothing/under/ms13/bos
	suit = /obj/item/clothing/suit/armor/ms13/combat/bos
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	head = /obj/item/clothing/head/helmet/ms13/combat/bos
	mask = /obj/item/clothing/mask/ms13/bos

/datum/outfit/job/ms13/bos/knight/pre_equip(mob/living/carbon/human/H)
	..()

/datum/job/ms13/bos/head_scribe
	title = "_BoS Head Scribe"
	department_head = list("Brotherhood High Command")
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Elder (if present) and Brotherhood High Command"
	req_admin_notify = 1
	description = "Lead your team of scribes. Keep productivity up and cooperate with the Paladin's chain."

	outfit = /datum/outfit/job/ms13/bos/head_scribe

	display_order = JOB_DISPLAY_ORDER_MS13_HEAD_SCRIBE

/datum/outfit/job/ms13/bos/head_scribe
	name = "_BoS Head Scribe"
	jobtype = /datum/job/ms13/bos/head_scribe

	id = /obj/item/card/id/ms13/bos/headscribe
	suit = /obj/item/clothing/suit/armor/ms13/scribe/head
	uniform =  /obj/item/clothing/under/ms13/bos
	belt = /obj/item/gun/energy/ms13/laser/pistol/advanced/brotherhood
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	r_pocket = 	/obj/item/stock_parts/cell/ms13/mfc
	back = /obj/item/storage/backpack/satchel

/datum/outfit/job/ms13/bos/head_scribe/pre_equip(mob/living/carbon/human/H)
	..()

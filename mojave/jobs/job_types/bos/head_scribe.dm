/datum/job/ms13/bos/head_scribe
	title = "BoS Head Scribe"
	department_head = list("Brotherhood High Command")
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Elder (if present) and Brotherhood High Command"
	req_admin_notify = 1
	description = "Lead and organize your team of scribes. Ensure that the technology and overall workings of the bunker are in order. Provide medical assistance to Brotherhood operations as needed. You're currently at edge with the NCR, though not at war, yet."

	outfit = /datum/outfit/job/ms13/bos/head_scribe

	display_order = JOB_DISPLAY_ORDER_MS13_HEAD_SCRIBE

	mind_traits = list(TRAIT_MEDICAL_TRAINING, TRAIT_SCRIBE_TRAINING)

/datum/outfit/job/ms13/bos/head_scribe
	name = "_BoS Head Scribe"
	jobtype = /datum/job/ms13/bos/head_scribe

	id = /obj/item/card/id/ms13/bos/headscribe
	suit = /obj/item/clothing/suit/armor/ms13/scribe/head
	uniform =  /obj/item/clothing/under/ms13/bos/officer
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	suit_store = /obj/item/gun/energy/ms13/laser/pistol/advanced/brotherhood
	r_pocket = 	/obj/item/stock_parts/cell/ms13/mfc
	l_pocket =  /obj/item/knife/ms13/combat
	back =      /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/half=1, \
		/obj/item/stack/medical/ointment/ms13/half=1, \
		/obj/item/stack/ms13/currency/prewar/eighty=1, \
		/obj/item/radio/ms13/broadcast/advanced=1)

/datum/outfit/job/ms13/bos/head_scribe/pre_equip(mob/living/carbon/human/H)
	..()

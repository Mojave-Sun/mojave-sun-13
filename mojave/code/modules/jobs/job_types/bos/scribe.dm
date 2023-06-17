/datum/job/ms13/bos/scribe
	title = "BoS Scribe"
	department_head = list("Head Scribe")
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Head Scribe"
	description = "Ensure the bunker is up to standards, ensure everyone is in good health, and ensure the technology of the Brotherhood is well maintained. Obey orders from the Head Scribe. You're currently at edge with the NCR, though not at war, yet."

	outfit = /datum/outfit/job/ms13/bos/scribe

	display_order = JOB_DISPLAY_ORDER_MS13_SCRIBE

	mind_traits = list(TRAIT_MEDICAL_TRAINING, TRAIT_SCRIBE_TRAINING)

/datum/outfit/job/ms13/bos/scribe
	name = "_BoS Scribe"
	jobtype = /datum/job/ms13/bos/scribe

	id = /obj/item/card/id/ms13/bos/scribe
	suit = /obj/item/clothing/suit/armor/ms13/scribe
	uniform =  /obj/item/clothing/under/ms13/bos
	belt = /obj/item/storage/firstaid/ms13/regular
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	suit_store = /obj/item/gun/energy/ms13/laser/pistol
	r_pocket = /obj/item/stock_parts/cell/ms13/ec
	back =      /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/half=1)

/datum/outfit/job/ms13/bos/scribe/pre_equip(mob/living/carbon/human/H)
	..()

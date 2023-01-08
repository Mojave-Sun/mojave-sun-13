/datum/job/ms13/bos/paladin
	title = "BoS Paladin"
	department_head = list("Head Paladin")
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Head Paladin"
	req_admin_notify = 1
	description = "Lead and coordinate the Knights while following and relaying the orders of the Head Paladin. Cooperate with the Scribes to ensure smooth operations in the region and the safety of your bunker. You're currently at edge with the NCR, though not at war, yet."

	outfit = /datum/outfit/job/ms13/bos/paladin

	display_order = JOB_DISPLAY_ORDER_MS13_PALADIN

/datum/outfit/job/ms13/bos/paladin
	name = "_BoS Paladin"
	jobtype = /datum/job/ms13/bos/paladin

	id = /obj/item/card/id/ms13/bos/paladin
	mask = /obj/item/clothing/mask/ms13/bos
	suit = /obj/item/clothing/suit/armor/ms13/combat/bos
	uniform =  /obj/item/clothing/under/ms13/bos/officer
	belt = /obj/item/gun/energy/ms13/laser/pistol/advanced
	gloves = /obj/item/clothing/gloves/ms13/bos
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	suit_store = /obj/item/gun/energy/ms13/laser/rifle/advanced
	r_pocket = 	/obj/item/stock_parts/cell/ms13/mfc
	l_pocket =  /obj/item/knife/ms13/combat
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/half=1, \
		/obj/item/stack/medical/ointment/ms13/half=1, \
		/obj/item/stack/ms13/currency/prewar/sixty=1)

/datum/outfit/job/ms13/bos/paladin/pre_equip(mob/living/carbon/human/H)
	..()

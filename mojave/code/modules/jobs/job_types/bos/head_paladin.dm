/datum/job/ms13/bos/head_paladin
	title = "BoS Head Paladin"
	department_head = list("Brotherhood High Command")
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Elder (if present) and Brotherhood High Command"
	req_admin_notify = 1
	description = "Give orders to your Paladin and ensure the Knights are working properly in the region. Work with the Head Scribe to coordinate efforts for the Brotherhood's mission in the region. You're currently at edge with the NCR, though not at war, yet."

	outfit = /datum/outfit/job/ms13/bos/head_paladin

	display_order = JOB_DISPLAY_ORDER_MS13_HEAD_PALADIN

/datum/outfit/job/ms13/bos/head_paladin
	name = "_BoS Head Paladin"
	jobtype = /datum/job/ms13/bos/head_paladin

	id = /obj/item/card/id/ms13/bos/headpaladin
	suit = /obj/item/clothing/suit/armor/ms13/head_paladin
	uniform =  /obj/item/clothing/under/ms13/bos/officer
	belt = /obj/item/gun/energy/ms13/laser/pistol/advanced
	gloves = /obj/item/clothing/gloves/ms13/bos
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	suit_store = /obj/item/gun/energy/ms13/laser/scatter
	r_pocket = 	/obj/item/stock_parts/cell/ms13/mfc
	l_pocket =  /obj/item/knife/ms13/combat
	back =      /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/stock_parts/cell/ms13/mfc=1,\
		/obj/item/stack/medical/gauze/ms13/half=1, \
		/obj/item/stack/medical/ointment/ms13/half=1, \
		/obj/item/stack/ms13/currency/prewar/eighty=1)

/datum/outfit/job/ms13/bos/head_paladin/pre_equip(mob/living/carbon/human/H)
	..()

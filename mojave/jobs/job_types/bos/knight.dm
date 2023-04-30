/datum/job/ms13/bos/knight
	title = "BoS Knight"
	department_head = list("Head Paladin")
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Paladin and Head Paladin"
	description = "Follow the orders of your superiors and ensure weaponized technology in the wastes is kept contained and in check. You're currently at edge with the NCR, though not at war, yet."

	outfit = /datum/outfit/job/ms13/bos/knight

	display_order = JOB_DISPLAY_ORDER_MS13_KNIGHT

/datum/outfit/job/ms13/bos/knight
	name = "_BoS Knight"

	id = /obj/item/card/id/ms13/bos/knight
	head = /obj/item/clothing/head/helmet/ms13/combat/bos
	mask = /obj/item/clothing/mask/ms13/bos
	suit = /obj/item/clothing/suit/armor/ms13/combat/bos
	uniform =  /obj/item/clothing/under/ms13/bos
	belt = /obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/military
	gloves = /obj/item/clothing/gloves/ms13/bos
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	suit_store = /obj/item/gun/energy/ms13/laser/rifle
	r_pocket = 	/obj/item/stock_parts/cell/ms13/mfc
	l_pocket =  /obj/item/knife/ms13/combat
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1, \
		/obj/item/flashlight/ms13=1, \
		/obj/item/ammo_box/magazine/ms13/m10mm=1, \
		/obj/item/radio/ms13/broadcast/advanced=1)

/datum/outfit/job/ms13/bos/knight/pre_equip(mob/living/carbon/human/H)
	..()

/datum/job/ms13/bos/initiate
	title = "BoS Initiate"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Knights, Scribes, and above"
	description = "You are an inexperienced Brotherhood recruit. Learn what it means to be a member of the Brotherhood and execute orders given to you by anyone that is not a fellow Initiate. You're currently at edge with the NCR, though not at war, yet."

	outfit = /datum/outfit/job/ms13/bos/initiate

	display_order = JOB_DISPLAY_ORDER_MS13_INITIATE

/datum/outfit/job/ms13/bos/initiate
	name = "_BoS Initiate"
	jobtype = /datum/job/ms13/bos/initiate

	id = /obj/item/card/id/ms13/bos/initiate
	head = /obj/item/clothing/head/helmet/ms13/initiate
	uniform =  /obj/item/clothing/under/ms13/bos
	gloves = /obj/item/clothing/gloves/ms13/bos
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	suit = /obj/item/clothing/suit/armor/ms13/vest/bos
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/m10mm
	belt = /obj/item/claymore/ms13/baton
	r_pocket = /obj/item/ammo_box/magazine/ms13/m10mm
	l_pocket = /obj/item/ammo_box/magazine/ms13/m10mm
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1)

/datum/outfit/job/ms13/bos/initiate/pre_equip(mob/living/carbon/human/H)
	..()

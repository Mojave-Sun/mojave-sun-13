/datum/job/ms13/ncr/engineer
	title = "NCR Engineer"
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Lieutenant, Staff Sergeants, and Sergeants. In that order."
	description = "You are in charge of fortifying and building for NCR strategic locations throughout the region. You're currently at edge with the BoS, though not at war, yet."

	outfit = /datum/outfit/job/ms13/ncr/engineer

	display_order = JOB_DISPLAY_ORDER_MS13_ENGINEER

/datum/outfit/job/ms13/ncr/engineer
	name = "_NCR Engineer"
	jobtype = /datum/job/ms13/ncr/engineer
	id = 		 /obj/item/card/id/ms13/ncr/engineer
	head =       /obj/item/clothing/head/helmet/ms13/ncr //Temporarily don't get the proper NCR engineer helmet until we fix it with FOV - Hekzder
	suit =       /obj/item/clothing/suit/armor/ms13/ncr
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	belt =		 /obj/item/weldingtool/ms13
	r_pocket =   /obj/item/ammo_box/magazine/ms13/m9mm
	l_pocket =	 /obj/item/knife/ms13/hunting
	r_hand =     /obj/item/clothing/glasses/ms13/welding
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=1, \
		/obj/item/wrench/ms13=1, \
		/obj/item/wirecutters/ms13=1, \
		/obj/item/screwdriver/ms13=1, \
		/obj/item/ms13/handsaw=1, \
		/obj/item/ms13/hammer=1, \
		/obj/item/stack/medical/gauze/ms13/three=1)

/datum/outfit/job/ms13/ncr/engineer/pre_equip(mob/living/carbon/human/H)
	..()

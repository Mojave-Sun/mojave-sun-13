/datum/job/ms13/ncr/trooper
	title = "NCR Trooper"
	total_positions = 8
	spawn_positions = 8
	supervisors = "Sergeants and above."
	description = "Follow and execute orders given to you by your superiors. You're currently at edge with the BoS, though not at war, yet."

	outfit = /datum/outfit/job/ms13/ncr/trooper

	display_order = JOB_DISPLAY_ORDER_MS13_TROOPER

/datum/outfit/job/ms13/ncr/trooper
	name = "_NCR Trooper"
	jobtype = 	 /datum/job/ms13/ncr/trooper
	id = 		 /obj/item/card/id/ms13/ncr
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr
	suit =       /obj/item/clothing/suit/armor/ms13/ncr
	suit_store = /obj/item/gun/ballistic/automatic/ms13/semi/service
	r_pocket = 	 /obj/item/ammo_box/magazine/ms13/r20
	l_pocket =	 /obj/item/knife/ms13/hunting
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1, \
		/obj/item/clothing/mask/ms13/ncr=1)

/datum/outfit/job/ms13/ncr/trooper/pre_equip(mob/living/carbon/human/H)
	..()

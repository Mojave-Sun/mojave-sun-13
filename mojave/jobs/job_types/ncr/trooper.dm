/datum/job/ms13/ncr/trooper
	title = "NCR Trooper"
	total_positions = 10
	spawn_positions = 10
	supervisors = "The Lieutenant, Staff Sergeants, and Sergeants.  In that order."
	description = "Hold the line, and do as ordered."

	outfit = /datum/outfit/job/ms13/ncr/trooper

	display_order = JOB_DISPLAY_ORDER_MS13_TROOPER

/datum/outfit/job/ms13/ncr/trooper
	name = "_NCR Trooper"
	jobtype = 	 /datum/job/ms13/ncr/trooper
	id = 		 /obj/item/card/id/ms13/ncrtrooper
	uniform =    /obj/item/clothing/under/ms13/ncr/fatigues
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr
	mask = 		 /obj/item/clothing/mask/ms13/ncr
	suit =       /obj/item/clothing/suit/armor/ms13/ncr
	suit_store = /obj/item/gun/ballistic/automatic/ms13/marksman/service
	ears = 		 null
	glasses =	 null
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/r20=1, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/food/bread/plain=1)

/datum/outfit/job/ms13/ncr/trooper/pre_equip(mob/living/carbon/human/H)
	..()



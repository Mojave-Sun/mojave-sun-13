/datum/job/ms13/ncr/engineer
	title = "NCR Engineer"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Lieutenant, Staff Sergeants, and Sergeants.  In that order."
	description = "You are in charge of fortifying and building for NCR strategic locations throughout the region."

	outfit = /datum/outfit/job/ms13/ncr/engineer

	display_order = JOB_DISPLAY_ORDER_MS13_ENGINEER

/datum/outfit/job/ms13/ncr/engineer
	name = "_NCR Engineer"
	jobtype = /datum/job/ms13/ncr/engineer
	id = 		 /obj/item/card/id/ms13/ncrtrooper
	uniform =    /obj/item/clothing/under/ms13/ncr/fatigues
	head = 	     /obj/item/clothing/head/hardhat
	suit =       /obj/item/clothing/suit/armor/ms13/ncr
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	belt = 		 /obj/item/storage/belt/utility/full
	ears = 		 /obj/item/radio/headset
	glasses =	 /obj/item/clothing/glasses/welding
	gloves =	 /obj/item/clothing/gloves/color/yellow
	r_pocket =   /obj/item/reagent_containers/hypospray/medipen/stimpak
	l_pocket =   /obj/item/stack/medical/gauze
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=2, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/food/bread/plain=1)

/datum/outfit/job/ms13/ncr/engineer/pre_equip(mob/living/carbon/human/H)
	..()

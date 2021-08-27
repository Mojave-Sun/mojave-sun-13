/datum/job/ms13/ncr/radioman
	title = "NCR Radioman"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Lieutenant, Staff Sergeants, and Sergeants.  In that order."
	description = "Relay messages, obey orders and relay changes in situations to keep command up to date. Your radiopack functions as a backpack, and should be worn as such."

	outfit = /datum/outfit/job/ms13/ncr/radioman

	display_order = JOB_DISPLAY_ORDER_MS13_RADIOMAN

/datum/outfit/job/ms13/ncr/radioman
	name = "_NCR Radioman"
	jobtype = 	 /datum/job/ms13/ncr/radioman
	id = 		 /obj/item/card/id/ms13/ncrtrooper
	uniform = 	 /obj/item/clothing/under/ms13/ncr/fatigues
	head = 		 /obj/item/clothing/head/helmet/ms13/ncr
	suit = 		 /obj/item/clothing/suit/armor/ms13/ncr
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	ears = 		 null
	glasses = 	 /obj/item/clothing/glasses/sunglasses/big
	back = 		 /obj/item/ms13/storage/backpack/radiopack
	r_pocket = 	 /obj/item/reagent_containers/hypospray/medipen/stimpak
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=2, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/stack/medical/gauze=1)

/datum/outfit/job/ms13/ncr/radioman/pre_equip(mob/living/carbon/human/H)
	..()

/datum/job/ms13/ncr/medic
	title = "NCR Medic"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Sergeants and above"
	description = "You are one of the few NCR medics in the region in charge of providing medical support to your platoon and their operations. You are primarily a non-combat role and as such, should focus on self preservation to ensure you can continue to save the lives of your comrades. You're currently at edge with the BoS, though not at war, yet."

	outfit = /datum/outfit/job/ms13/ncr/medic

	display_order = JOB_DISPLAY_ORDER_MS13_MEDIC

	mind_traits = list(TRAIT_MEDICAL_TRAINING)

/datum/outfit/job/ms13/ncr/medic
	name = "_NCR Medic"
	jobtype = /datum/job/ms13/ncr/medic
	id = 		 /obj/item/card/id/ms13/ncr/medic
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr/medic
	suit =       /obj/item/clothing/suit/armor/ms13/ncr
	gloves = 	 null
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	belt = 		 /obj/item/storage/firstaid/ms13/regular
	r_pocket = 	 /obj/item/ammo_box/magazine/ms13/m9mm
	l_pocket =	 /obj/item/knife/ms13/hunting
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=1, \
		/obj/item/stack/medical/gauze/ms13/half=1)

/datum/outfit/job/ms13/ncr/medic/pre_equip(mob/living/carbon/human/H)
	..()

/datum/job/ms13/ranger/deputychief
	title = "Ranger Deputy-Chief"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Chief and Rangers of equal status."
	description = "Ensure peace in the region, Lead your outpost fairly and protect the wasteland. Aid those in need."

	outfit = /datum/outfit/job/ms13/ranger/deputychief

	display_order = JOB_DISPLAY_ORDER_MS13_RANGERDEPUTYCHIEF

/datum/outfit/job/ms13/ranger/deputychief
	name = "_Ranger Deputy-Chief"
	jobtype = 	 /datum/job/ms13/ranger/deputychief
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/ranger
	suit = 	  	 /obj/item/clothing/suit/armor/ms13/vest
	belt =  	 /obj/item/gun/ballistic/revolver/ms13/huntingrev/sequoia
	id = 		 /obj/item/card/id/ms13/ranger_chief
	r_pocket = 	 /obj/item/ammo_box/ms13/tube4570
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever
	backpack_contents = list(
		/obj/item/ammo_box/ms13/tube4570=2,\
		/obj/item/kitchen/knife/ms13/combat/bowie=1,\
		/obj/item/stack/medical/gauze/ms13=1,\
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=1)

/datum/outfit/job/ms13/ranger/deputychief/pre_equip(mob/living/carbon/human/H)
	..()

	uniform = pick(/obj/item/clothing/under/ms13/ranger,\
		/obj/item/clothing/under/ms13/ranger/casual,\
		/obj/item/clothing/under/ms13/ranger/patrol)

/datum/job/ms13/ranger/deputychief
	title = "Desert Ranger Deputy-Chief"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Ranger Chief, if present."
	description = "Ensure peace in the region. Lead your outpost fairly and protect the wasteland. Aid those in need."

	outfit = /datum/outfit/job/ms13/ranger/deputychief

	display_order = JOB_DISPLAY_ORDER_MS13_RANGERDEPUTYCHIEF

/datum/outfit/job/ms13/ranger/deputychief
	name = "_Desert Ranger Deputy-Chief"
	jobtype = 	 /datum/job/ms13/ranger/deputychief
	suit = 	  	 /obj/item/clothing/suit/ms13/vest/brown
	head =       /obj/item/clothing/head/helmet/ms13/cowboy/ranger
	glasses =	 /obj/item/clothing/glasses/ms13/sunglasses
	uniform =    /obj/item/clothing/under/ms13/ranger/casual
	belt =  	 /obj/item/gun/ballistic/revolver/ms13/rev44
	id = 		 /obj/item/card/id/ms13/ranger_chief
	r_pocket = 	 /obj/item/knife/ms13/combat
	l_pocket =   /obj/item/flashlight/ms13
	suit_store = /obj/item/gun/ballistic/revolver/ms13/mts
	backpack_contents = list(
		/obj/item/ammo_box/ms13/m44box=1,\
		/obj/item/ammo_box/ms13/shotgun/buckshot=1,\
		/obj/item/stack/medical/gauze/ms13/half=1,\
		/obj/item/stack/medical/ointment/ms13/half=1,\
		/obj/item/radio/ms13=1,\
		/obj/item/stack/ms13/currency/prewar/sixty=1)

/datum/outfit/job/ms13/ranger/deputychief/pre_equip(mob/living/carbon/human/H)
	..()

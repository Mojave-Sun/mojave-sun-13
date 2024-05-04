/datum/job/ms13/ranger/standard
	title = "Desert Ranger"
	total_positions = 2
	spawn_positions = 2
	supervisors = "A Deputy-Chief, if present"
	description = "Scout the region and provide aid to the downtrodden and needy when possible. Establish friendly relations with the locals."

	outfit = /datum/outfit/job/ms13/ranger/standard

	display_order = JOB_DISPLAY_ORDER_MS13_RANGER

/datum/outfit/job/ms13/ranger/standard
	name = "_Desert Ranger"
	jobtype = 	 /datum/job/ms13/ranger/standard
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/ranger
	mask =		 /obj/item/clothing/mask/gas/ms13/ranger
	suit = 	  	 /obj/item/clothing/suit/armor/ms13/combat/ranger
	uniform =	 /obj/item/clothing/under/ms13/ranger
	gloves =     /obj/item/clothing/gloves/ms13/ranger
	belt = 		 /obj/item/gun/ballistic/revolver/ms13/rev44
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever/trail
	r_pocket = 	 /obj/item/knife/ms13/combat
	l_pocket =   /obj/item/flashlight/ms13
	id = 		 /obj/item/card/id/ms13/ranger
	back =		 /obj/item/storage/ms13/military
	backpack_contents = list(
		/obj/item/ammo_box/ms13/m44box=1,\
		/obj/item/stack/medical/gauze/ms13/three=1,\
		/obj/item/stack/ms13/currency/prewar/sixty=1,\
		/obj/item/radio/ms13/broadcast=1)

/datum/outfit/job/ms13/ranger/standard/pre_equip(mob/living/carbon/human/H)
	..()

/datum/job/ms13/ranger/standard
	title = "Desert Ranger"
	total_positions = 6
	spawn_positions = 6
	supervisors = "Elite Rangers and The Deputy-Chief"
	description = "Ensure peace in the region. Follow the word of the Deputy-Chief."

	outfit = /datum/outfit/job/ms13/ranger/standard

	display_order = JOB_DISPLAY_ORDER_MS13_RANGER

/datum/outfit/job/ms13/ranger/standard
	name = "_Desert Ranger"
	jobtype = 	 /datum/job/ms13/ranger/standard
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/ranger
	suit = 	  	 /obj/item/clothing/suit/armor/ms13/combat/ranger
	gloves =     /obj/item/clothing/gloves/ms13/ranger
	belt = 		 /obj/item/gun/ballistic/revolver/ms13/rev357
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever/trail
	r_pocket = 	 /obj/item/knife/ms13/combat
	l_pocket =   /obj/item/flashlight/flare/ms13
	id = 		 /obj/item/card/id/ms13/ranger
	backpack_contents = list(
		/obj/item/ammo_box/ms13/m44box=1,\
		/obj/item/ammo_box/ms13/a357box=1,\
		/obj/item/stack/medical/gauze/ms13/three=1,\
		/obj/item/stack/ms13/currency/prewar/twenty=1)

/datum/outfit/job/ms13/ranger/standard/pre_equip(mob/living/carbon/human/H)
	..()

	uniform = pick(/obj/item/clothing/under/ms13/ranger,\
		/obj/item/clothing/under/ms13/ranger/casual,\
		/obj/item/clothing/under/ms13/ranger/patrol)

	if(prob(50))
		r_hand = /obj/item/clothing/mask/gas/ms13/ranger
	else
		r_hand = null

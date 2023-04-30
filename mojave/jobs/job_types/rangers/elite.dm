/datum/job/ms13/ranger/elite
	title = "Elite Desert Ranger"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Deputy-Chief"
	description = "Ensure peace in the region. Collaborate with other Rangers and lead them as needed. Follow the word of the Deputy-Chief."

	outfit = /datum/outfit/job/ms13/ranger/elite

	display_order = JOB_DISPLAY_ORDER_MS13_RANGERELITE

/datum/outfit/job/ms13/ranger/elite
	name = "_Desert Ranger Elite"
	jobtype = 	 /datum/job/ms13/ranger/elite
	head = 		 /obj/item/clothing/head/helmet/ms13/eliteriot/ranger
	suit = 	  	 /obj/item/clothing/suit/armor/ms13/eliteriot/ranger
	gloves =     /obj/item/clothing/gloves/ms13/ranger
	belt =  	 /obj/item/gun/ballistic/revolver/ms13/huntingrev
	id = 		 /obj/item/card/id/ms13/ranger_elite
	r_pocket = 	 /obj/item/knife/ms13/combat
	l_pocket =   /obj/item/flashlight/ms13
	suit_store = /obj/item/gun/ballistic/rifle/ms13/hunting/scoped
	backpack_contents = list(
		/obj/item/ammo_box/ms13/c4570box=1,\
		/obj/item/ammo_box/magazine/ms13/r308=2,\
		/obj/item/stack/medical/gauze/ms13/half=1,\
		/obj/item/stack/medical/ointment/ms13/half=1,\
		/obj/item/radio/ms13/broadcast/advanced=1,\
		/obj/item/stack/ms13/currency/prewar/fourty=1)

/datum/outfit/job/ms13/ranger/elite/pre_equip(mob/living/carbon/human/H)
	..()

	uniform = pick(/obj/item/clothing/under/ms13/ranger,\
		/obj/item/clothing/under/ms13/ranger/patrol,\
		/obj/item/clothing/under/ms13/ranger/casual)

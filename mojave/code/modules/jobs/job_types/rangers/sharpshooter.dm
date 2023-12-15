/datum/job/ms13/ranger/sharpshooter
	title = "Desert Ranger Sharpshooter"
	total_positions = 1
	spawn_positions = 1
	supervisors = "A Deputy-Chief, if present."
	description = "Scout the region and provide aid to the downtrodden and needy when possible. Establish friendly relations with the locals."

	outfit = /datum/outfit/job/ms13/ranger/sharpshooter

	display_order = JOB_DISPLAY_ORDER_MS13_RANGERSHARP

/datum/outfit/job/ms13/ranger/sharpshooter
	name = "_Desert Ranger Sharpshooter"
	jobtype = 	 /datum/job/ms13/ranger/sharpshooter
	id = 		 /obj/item/card/id/ms13/ranger
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/ranger
	glasses =	 /obj/item/clothing/glasses/ms13/sunglasses
	suit =       /obj/item/clothing/suit/ms13/duster/ranger
	uniform =	 /obj/item/clothing/under/ms13/ranger/patrol
	belt =		 /obj/item/gun/ballistic/revolver/ms13/rev357
	suit_store = /obj/item/gun/ballistic/rifle/ms13/hunting/scoped
	r_pocket =   /obj/item/knife/ms13/hunting
	l_pocket =	 /obj/item/flashlight/flare/ms13
	back =		 /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/ms13/a357box=1,\
		/obj/item/ammo_box/magazine/ms13/r308=2,\
		/obj/item/stack/medical/gauze/ms13/three=1,\
		/obj/item/stack/ms13/currency/prewar/sixty=1,\
		/obj/item/radio/ms13/broadcast=1)

/datum/outfit/job/ms13/ranger/sharpshooter/pre_equip(mob/living/carbon/human/H)
	..()

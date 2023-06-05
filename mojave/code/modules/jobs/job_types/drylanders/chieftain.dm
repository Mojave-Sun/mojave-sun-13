/datum/job/ms13/drylander/chieftain
	title = "Drylander Chieftain"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The well being and survival of your tribe."
	description = "You are the chief and leader of the Drylander tribe. Navigate your tribe through this tumultuous and rapidly changing period, and make the ultimate decisions for the tribe."

	outfit = /datum/outfit/job/ms13/drylander/chieftain

	display_order = JOB_DISPLAY_ORDER_MS13_CHIEFTAIN

/datum/outfit/job/ms13/drylander/chieftain
	name = "_Drylander Chieftain"
	jobtype = /datum/job/ms13/drylander/chieftain

	id =         /obj/item/card/id/ms13/drylander/chief
	suit =       /obj/item/clothing/suit/ms13/drylander/chief
	head =		 /obj/item/clothing/head/helmet/ms13/drylander/chief
	suit_store = /obj/item/gun/ballistic/revolver/ms13/caravan/sawed
	belt =		 /obj/item/knife/ms13/combat/bowie
	r_pocket =   /obj/item/stack/medical/ms13/healing_powder/poultice
	l_pocket =   /obj/item/stack/ms13/currency/aurelius/five
	r_hand =     /obj/item/flashlight/ms13/crafted
	l_hand =     /obj/item/ammo_box/ms13/shotgun/slug
	back =       null

/datum/outfit/job/ms13/drylander/chieftain/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/ms13/drylander/chieftain/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender != MALE)
		H.gender = MALE
		H.body_type = MALE

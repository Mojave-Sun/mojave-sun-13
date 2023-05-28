/datum/job/ms13/drylander/headtaker
	title = "Drylander Headtaker"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Chieftain"
	description = "You are an elite and hardened veteran of the Drylander tribe. Skilled in sniping, scouting, and covert operations. Carry out the will of the chieftain using your expertise."

	outfit = /datum/outfit/job/ms13/drylander/headtaker

	display_order = JOB_DISPLAY_ORDER_MS13_HEADTAKER

/datum/outfit/job/ms13/drylander/headtaker
	name = "_Drylander Headtaker"
	jobtype = /datum/job/ms13/drylander/headtaker

	id =         /obj/item/card/id/ms13/drylander/headtaker
	suit =       /obj/item/clothing/suit/ms13/drylander/headtaker
	head =       /obj/item/clothing/head/helmet/ms13/drylander/headtaker
	suit_store = /obj/item/gun/ballistic/rifle/ms13/antique_sniper
	belt =		 /obj/item/knife/ms13/hunting
	r_pocket =   /obj/item/flashlight/ms13/crafted
	l_pocket =   /obj/item/stack/ms13/currency/denarius/ten
	back =       /obj/item/storage/ms13/satchel
	backpack_contents = list(
					/obj/item/stack/medical/ms13/healing_powder=1, \
					/obj/item/stack/medical/ms13/healing_powder/burn=1, \
					/obj/item/ammo_box/ms13/c4570box/ap=1, \
					/obj/item/flashlight/flare/ms13=1
	)

/datum/outfit/job/ms13/drylander/headtaker/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/ms13/drylander/headtaker/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender != MALE)
		H.gender = MALE
		H.body_type = MALE

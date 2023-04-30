/datum/job/ms13/town_drought/baron
	title = "Town Baron"
	total_positions = 1
	spawn_positions = 1
	supervisors = "No one but yourself."
	description = "You are the supreme leader of the Town. Enact your will as you see fit and navigate the Town through these changing times however you like. Remember, you answer to no one but yourself!"
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town_drought/baron

	display_order = JOB_DISPLAY_ORDER_MS13_BARON

/datum/outfit/job/ms13/town_drought/baron
	name = "_Town Baron"
	jobtype = /datum/job/ms13/town_drought/baron

	id =         /obj/item/card/id/ms13/drought_baron
	head =		 /obj/item/clothing/head/helmet/ms13/metal/baron
	neck = 		 /obj/item/clothing/neck/cloak/ms13/baron
	uniform =    /obj/item/clothing/under/ms13/wasteland/baron
	shoes =      /obj/item/clothing/shoes/ms13/military/diesel
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/pistol45
	belt =		 /obj/item/knife/ms13/switchblade
	r_pocket =   /obj/item/ammo_box/magazine/ms13/m45
	r_hand =     /obj/item/radio/ms13/broadcast
	l_pocket =   /obj/item/stack/ms13/currency/cap/baron
	back =       null

/datum/outfit/job/ms13/town_drought/baron/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/ms13/town_drought/baron/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender != MALE)
		H.gender = MALE
		H.body_type = MALE
		H.real_name = random_unique_raider_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

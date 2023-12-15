/datum/job/ms13/highwaymen/qm
	title = "Highwaymen Quartermaster"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Overseer."
	description = "Assist and advise the Overseer in matters. Organize and keep stock of the group's supplies. Engage in matters on the Overseer's behalf as needed."

	outfit = /datum/outfit/job/ms13/highwaymen/qm

	display_order = JOB_DISPLAY_ORDER_MS13_HWYMNQM

	mind_traits = list(TRAIT_HIGHQM)

/datum/outfit/job/ms13/highwaymen/qm
	name = "_Highwaymen Quartermaster"
	jobtype = 	 /datum/job/ms13/highwaymen/qm
	id =		 /obj/item/card/id/ms13/highwayman/qm
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/highwaymen/veteran
	uniform =	 /obj/item/clothing/under/ms13/highwaymen/leader
	suit =		 /obj/item/clothing/suit/ms13/highwaymen/quartermas
	belt =		 /obj/item/gun/ballistic/automatic/pistol/ms13/pistol45
	r_pocket = 	 /obj/item/radio/ms13/broadcast
	l_pocket = 	 /obj/item/flashlight/ms13
	shoes =		 /obj/item/clothing/shoes/ms13/fancy
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever
	back =		 /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/half=1,\
		/obj/item/stack/medical/ointment/ms13/half=1,\
		/obj/item/stack/ms13/currency/cap/hunned=1,\
		/obj/item/ammo_box/magazine/ms13/m45=2, \
		/obj/item/ammo_box/ms13/shotgun/buckshot=1,\
		/obj/item/knife/ms13/hunting=1)

/datum/outfit/job/ms13/highwaymen/qm/pre_equip(mob/living/carbon/human/H)
	..()

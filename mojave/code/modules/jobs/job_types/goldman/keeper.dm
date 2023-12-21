/datum/job/ms13/goldman/keeper
	title = "Goldman Keeper"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Ringleader."
	description = "Assist and advise the Ringleader in matters. Organize and keep stock of the group's supplies. Engage in matters on the Ringleader's behalf as needed."

	outfit = /datum/outfit/job/ms13/goldman/keeper

	display_order = JOB_DISPLAY_ORDER_MS13_GLDMNKEEPER

	mind_traits = list(TRAIT_GOLDQM)

/datum/outfit/job/ms13/goldman/keeper
	name = "_Goldman Keeper"
	jobtype = 	 /datum/job/ms13/goldman/keeper
	id =		 /obj/item/card/id/ms13/goldman/keeper
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/goldman/veteran
	uniform =	 /obj/item/clothing/under/ms13/goldman/leader
	suit =		 /obj/item/clothing/suit/ms13/goldman/keeper
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

/datum/outfit/job/ms13/goldman/keeper/pre_equip(mob/living/carbon/human/H)
	..()

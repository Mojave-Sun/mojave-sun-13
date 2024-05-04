/datum/job/ms13/goldman/ringleader
	title = "Goldman Ringleader"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Principles of the Goldman Posse."
	description = "Assist and advise the Ringleader in matters. Organize and keep stock of the group's supplies. "

	outfit = /datum/outfit/job/ms13/goldman/ringleader

	display_order = JOB_DISPLAY_ORDER_MS13_GLDMNOVER

/datum/outfit/job/ms13/goldman/ringleader
	name = "_Goldman Ringleader"
	jobtype = 	 /datum/job/ms13/goldman/ringleader
	id =		 /obj/item/card/id/ms13/goldman/ringleader
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/goldman/leader
	uniform =	 /obj/item/clothing/under/ms13/goldman/leader
	suit =		 /obj/item/clothing/suit/ms13/goldman/leader
	belt =		 /obj/item/claymore/ms13/machete/ripper
	r_pocket = 	 /obj/item/radio/ms13/broadcast
	l_pocket = 	 /obj/item/flashlight/ms13
	shoes =		 /obj/item/clothing/shoes/ms13/military
	suit_store = /obj/item/gun/ballistic/revolver/ms13/huntingrev
	back =		 /obj/item/storage/ms13/satchel
	gloves =	 /obj/item/clothing/gloves/ms13/military
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/half=1,\
		/obj/item/stack/medical/ointment/ms13/half=1,\
		/obj/item/clothing/mask/ms13/bandana/goldman=1,\
		/obj/item/stack/medical/ms13/healing_powder=1,\
		/obj/item/stack/ms13/currency/cap/hunned=1,\
		/obj/item/ammo_box/ms13/c4570box=1)

/datum/outfit/job/ms13/goldman/ringleader/pre_equip(mob/living/carbon/human/H)
	..()

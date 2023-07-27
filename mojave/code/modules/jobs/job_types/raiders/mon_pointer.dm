/datum/job/ms13/raiders/mon_pointer
	title = "Mon City Pointman"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Captain"
	description = "Work with the rest of your mercenary squad and follow the orders of your Captain in an effort to find work and most importantly establish yourselves in Mammoth. The fate of the company is riding on your shoulders."
	forbid = ""
	enforce = "The Mon City Mercs expect: No disobedience, following the orders of superiors to the letter, getting the job done no matter what. Failure is not an option."

	outfit = /datum/outfit/job/ms13/raiders/mon_pointer

	display_order = JOB_DISPLAY_ORDER_MS13_MONPOINTMAN

/datum/outfit/job/ms13/raiders/mon_pointer
	name = "_Mon City Pointman"
	jobtype = /datum/job/ms13/raiders/mon_pointer

	uniform =	 /obj/item/clothing/under/ms13/mon_city/padded
	suit =		 /obj/item/clothing/suit/ms13/veteran_coat/reinf/mon_city/pointman
	shoes =		 /obj/item/clothing/shoes/ms13/military
	gloves =	 /obj/item/clothing/gloves/ms13/winter
	mask =		 /obj/item/clothing/mask/gas/ms13/mon_city/pointer
	head =		 /obj/item/clothing/head/helmet/ms13/ushanka/mon_city
	belt =		 /obj/item/gun/ballistic/revolver/ms13/caravan/sawed
	suit_store = /obj/item/gun/ballistic/automatic/ms13/full/smg9mm
	r_pocket =	 /obj/item/ms13/knuckles/weighted/spiked
	l_pocket =	 /obj/item/flashlight/ms13
	backpack_contents = list(
			/obj/item/stack/ms13/currency/prewar/fourty=1,\
			/obj/item/stack/medical/gauze/ms13/three=1,\
			/obj/item/ammo_box/ms13/shotgun/junkshot=1,\
			/obj/item/ammo_box/magazine/ms13/smgm9mm=1,\
			/obj/item/radio/ms13=1)

/datum/outfit/job/ms13/raiders/mon_pointer/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/ms13/raiders/mon_pointer/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()

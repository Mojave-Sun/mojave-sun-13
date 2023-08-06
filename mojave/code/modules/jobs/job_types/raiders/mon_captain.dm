/datum/job/ms13/raiders/mon_captain
	title = "Mon City Captain"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Major, if present"
	description = "Organize your mercs to establish a foothold in the region of Mammoth and find some work to start working on rebuilding the Mon City Mercs. The fate of the company is riding on your shoulders."
	forbid = ""
	enforce = "The Mon City Mercs expect: No disobedience, following the orders of superiors to the letter, getting the job done no matter what. Failure is not an option."

	outfit = /datum/outfit/job/ms13/raiders/mon_captain

	display_order = JOB_DISPLAY_ORDER_MS13_MONCAPT

/datum/outfit/job/ms13/raiders/mon_captain
	name = "_Mon City Captain"
	jobtype = /datum/job/ms13/raiders/mon_captain

	uniform =	 /obj/item/clothing/under/ms13/mon_city/padded
	suit =		 /obj/item/clothing/suit/ms13/veteran_coat/reinf/mon_city/captain
	shoes =		 /obj/item/clothing/shoes/ms13/explorer
	gloves =	 /obj/item/clothing/gloves/ms13/military
	head =		 /obj/item/clothing/head/helmet/ms13/combat/mon_city
	id =		 /obj/item/card/id/ms13/mon_captain
	belt =		 /obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/military
	suit_store = /obj/item/gun/ballistic/automatic/ms13/full/assaultrifle
	r_pocket =	 /obj/item/knife/ms13/combat
	l_pocket =	 /obj/item/flashlight/ms13
	backpack_contents = list(
			/obj/item/stack/ms13/currency/prewar/seventy=1,\
			/obj/item/stack/medical/gauze/ms13/half=1,\
			/obj/item/ammo_box/magazine/ms13/m10mm=2,\
			/obj/item/ammo_box/magazine/ms13/r20=1,\
			/obj/item/radio/ms13/broadcast=1,\
			/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=1, \
			/obj/item/restraints/handcuffs/ms13=1)

/datum/outfit/job/ms13/raiders/mon_captain/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/ms13/raiders/mon_captain/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()

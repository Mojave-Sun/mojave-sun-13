/datum/job/ms13/raiders/mon_marksman
	title = "Mon City Marksman"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Captain"
	description = "Work with the rest of your mercenary squad and follow the orders of your Captain in an effort to find work and most importantly establish yourselves in Mammoth. The fate of the company is riding on your shoulders."
	forbid = ""
	enforce = "The Mon City Mercs expect: No disobedience, following the orders of superiors to the letter, getting the job done no matter what. Failure is not an option."

	outfit = /datum/outfit/job/ms13/raiders/mon_marksman

	display_order = JOB_DISPLAY_ORDER_MS13_MONMARKSMAN

/datum/outfit/job/ms13/raiders/mon_marksman
	name = "_Mon City Marksman"
	jobtype = /datum/job/ms13/raiders/mon_marksman

	uniform =	 /obj/item/clothing/under/ms13/mon_city
	suit =		 /obj/item/clothing/suit/hooded/ms13/mon_city
	shoes =		 /obj/item/clothing/shoes/ms13/explorer
	gloves =	 /obj/item/clothing/gloves/ms13/winter
	mask =		 /obj/item/clothing/mask/ms13/facewrap/mon_city
	belt =		 /obj/item/gun/ballistic/automatic/pistol/ms13/pistol22
	suit_store = /obj/item/gun/ballistic/rifle/ms13/hunting/scoped
	r_pocket =	 /obj/item/knife/ms13/hunting
	l_pocket =	 /obj/item/flashlight/flare/ms13
	backpack_contents = list(
			/obj/item/stack/ms13/currency/prewar/fourty=1,\
			/obj/item/stack/medical/gauze/ms13/three=1,\
			/obj/item/ammo_box/magazine/ms13/r308=2,\
			/obj/item/ammo_box/magazine/ms13/m22=1,\
			/obj/item/reagent_containers/pill/ms13/cateye=1,\
			/obj/item/radio/ms13=1)

/datum/outfit/job/ms13/raiders/mon_marksman/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/ms13/raiders/mon_marksman/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()

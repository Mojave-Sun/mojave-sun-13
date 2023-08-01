/datum/job/ms13/town_drought/barkeep
	title = "Town Barkeep"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Baron and his Enforcers."
	description = "Tend to the town's bar and food services."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town_drought/barkeep

	display_order = JOB_DISPLAY_ORDER_MS13_BARKEEP

/datum/outfit/job/ms13/town_drought/barkeep
	name = "_Town Barkeep"
	jobtype = /datum/job/ms13/town_drought/barkeep

	id =		 /obj/item/card/id/ms13/drought_barkeep
	suit =       /obj/item/clothing/suit/ms13/vest
	uniform =    /obj/item/clothing/under/ms13/wasteland/vestslacks
	shoes =  	 /obj/item/clothing/shoes/ms13/brownie
	suit_store = /obj/item/gun/ballistic/revolver/ms13/caravan
	r_pocket   = /obj/item/ammo_box/ms13/shotgun/buckshot
	l_pocket =   /obj/item/stack/ms13/currency/cap/hunned
	back =       null

/datum/outfit/job/ms13/town_drought/barkeep/pre_equip(mob/living/carbon/human/H)
	..()

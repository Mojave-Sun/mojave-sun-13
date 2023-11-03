/datum/job/ms13/town_drought/laborer
	title = "Barony Laborer"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Baron and his Enforcers."
	description = "Provide vital labor for the Barony in the form of production, construction, engineering, maintenance. You name it!"
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town_drought/laborer

	display_order = JOB_DISPLAY_ORDER_MS13_LABORER

/datum/outfit/job/ms13/town_drought/laborer
	name = "_Barony Laborer"
	jobtype = /datum/job/ms13/town_drought/laborer

	id = 		 /obj/item/card/id/ms13/drought_slave
	shoes =  	 /obj/item/clothing/shoes/ms13/explorer
	r_pocket =   /obj/item/flashlight/flare/ms13
	l_pocket =	 /obj/item/stack/ms13/currency/cap/eighty
	r_hand =	 /obj/item/storage/ms13/toolbox/filled


/datum/outfit/job/ms13/town_drought/laborer/pre_equip(mob/living/carbon/human/H)
	..()

	uniform = pick(
			/obj/item/clothing/under/ms13/wasteland/machinist,\
			/obj/item/clothing/under/ms13/wasteland/lumberjack,\
			/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgrey,\
			/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgreen)

/datum/job/ms13/town_drought/laborer
	title = "Town Laborer"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Baron and his Enforcers."
	description = "Provide vital labor for the Town in the form of production, construction, engineering, maintenance. You name it!"
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town_drought/laborer

	display_order = JOB_DISPLAY_ORDER_MS13_LABORER

/datum/outfit/job/ms13/town_drought/laborer
	name = "_Town Laborer"
	jobtype = /datum/job/ms13/town_drought/laborer

	id = 		 /obj/item/card/id/ms13/drought_slave
	shoes =  	 /obj/item/clothing/shoes/ms13/explorer
	belt =		 /obj/item/weldingtool/ms13
	r_pocket =   /obj/item/wirecutters/ms13
	l_pocket =	 /obj/item/stack/ms13/currency/cap/sixty
	backpack_contents = list(
		/obj/item/clothing/glasses/ms13/welding=1, \
		/obj/item/wrench/ms13=1, \
		/obj/item/ms13/handsaw=1, \
		/obj/item/ms13/hammer=1, \
		/obj/item/screwdriver/ms13=1, \
		/obj/item/flashlight/flare/ms13=1)


/datum/outfit/job/ms13/town_drought/laborer/pre_equip(mob/living/carbon/human/H)
	..()

	uniform = pick(
			/obj/item/clothing/under/ms13/wasteland/machinist,\
			/obj/item/clothing/under/ms13/wasteland/lumberjack,\
			/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgrey,\
			/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgreen)

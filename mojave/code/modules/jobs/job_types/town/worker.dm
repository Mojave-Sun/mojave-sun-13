/datum/job/ms13/town/worker
	title = "Snowcrest Worker"
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Mayor"
	description = "Provide vital labor for Snowcrest in the form of production, construction, engineering, maintenance. You name it!"
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/worker

	display_order = JOB_DISPLAY_ORDER_MS13_WORKER

	mind_traits = list(TRAIT_SNOWCREST_TAILOR)

/datum/outfit/job/ms13/town/worker
	name = "_Snowcrest Worker"
	jobtype = /datum/job/ms13/town/worker

	id = 		 /obj/item/card/id/ms13/town/worker
	head =       /obj/item/clothing/head/helmet/ms13/hardhat
	belt =		 /obj/item/weldingtool/ms13
	shoes = 	 /obj/item/clothing/shoes/ms13/winter/black
	r_pocket =   /obj/item/wirecutters/ms13
	l_pocket =	 /obj/item/stack/ms13/currency/prewar/hunned
	backpack_contents = list(
		/obj/item/clothing/glasses/ms13/welding=1, \
		/obj/item/wrench/ms13=1, \
		/obj/item/ms13/handsaw=1, \
		/obj/item/ms13/hammer=1, \
		/obj/item/screwdriver/ms13=1, \
		/obj/item/radio/ms13=1)


/datum/outfit/job/ms13/town/worker/pre_equip(mob/living/carbon/human/H)
	..()

	uniform = pick(
		/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgrey,\
		/obj/item/clothing/under/ms13/wasteland/lumberjack,\
		/obj/item/clothing/under/ms13/wasteland/machinist,\
		/obj/item/clothing/under/ms13/wasteland/snowcrest)

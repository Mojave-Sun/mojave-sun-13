/datum/job/ms13/town/worker
	title = "Town Worker"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Mayor and the Sheriff."
	description = "Provide vital labor for the Town in the form of production, construction, engineering, maintenance. You name it!"
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/worker

	display_order = JOB_DISPLAY_ORDER_MS13_WORKER

/datum/outfit/job/ms13/town/worker
	name = "_Town Worker"
	jobtype = /datum/job/ms13/town/worker

	id = 		 /obj/item/card/id/ms13/town/worker
	head =       /obj/item/clothing/head/helmet/ms13/hardhat
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/ms13/vault
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	belt =		 /obj/item/weldingtool/ms13
	r_pocket =   /obj/item/wirecutters/ms13
	l_pocket =	 /obj/item/stack/ms13/currency/prewar/eighty
	back =       /obj/item/storage/ms13/vault
	backpack_contents = list(
		/obj/item/clothing/glasses/ms13/welding=1, \
		/obj/item/wrench/ms13=1, \
		/obj/item/ms13/handsaw=1, \
		/obj/item/ms13/hammer=1, \
		/obj/item/screwdriver/ms13=1, \
		/obj/item/radio/ms13=1)


/datum/outfit/job/ms13/town/worker/pre_equip(mob/living/carbon/human/H)
	..()

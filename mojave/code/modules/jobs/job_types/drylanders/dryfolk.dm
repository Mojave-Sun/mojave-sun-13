/datum/job/ms13/drylander/dryfolk
	title = "Drylander Folk"
	total_positions = 6
	spawn_positions = 6
	supervisors = "The Chieftain and the Shaman"
	description = "You are a proud member of the Drylander tribe. You have no particular role or specialization, but should do what you can to help the tribe prosper. Listen to the Chieftain and Shaman's orders."

	outfit = /datum/outfit/job/ms13/drylander/dryfolk

	display_order = JOB_DISPLAY_ORDER_MS13_DRYFOLK

/datum/outfit/job/ms13/drylander/dryfolk
	name = "_Drylander Folk"
	jobtype = /datum/job/ms13/drylander/dryfolk

	id =         /obj/item/card/id/ms13/drylander/dryfolk
	belt =		 /obj/item/knife/ms13/tribal
	back =       null

/datum/outfit/job/ms13/drylander/dryfolk/pre_equip(mob/living/carbon/human/H)
	..()

	head = pick(/obj/item/clothing/head/helmet/ms13/drylander/hood,\
	/obj/item/clothing/head/helmet/ms13/drylander/wrap,\
	/obj/item/clothing/head/helmet/ms13/drylander/goggles,\
	/obj/item/clothing/head/helmet/ms13/drylander/shemagh)

	suit = pick(/obj/item/clothing/suit/ms13/drylander/simple,\
	/obj/item/clothing/suit/ms13/drylander/poncho,\
	/obj/item/clothing/suit/ms13/drylander/forager,\
	/obj/item/clothing/suit/ms13/drylander/bando)

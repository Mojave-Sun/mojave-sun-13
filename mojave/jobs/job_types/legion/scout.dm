/datum/job/ms13/legion/scout
	title = "Legion Scout"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion, Speculatores, Explorers."
	description = "Assist the Legion by scouting out the land, taking out targets strategically."

	outfit = /datum/outfit/job/ms13/legion/scout

	display_order = JOB_DISPLAY_ORDER_MS13_SCOUT

/datum/outfit/job/ms13/legion/scout
	name = "_Legion Scout"
	jobtype = /datum/job/ms13/legion/scout

	head = /obj/item/clothing/head/helmet/ms13/legion/scout
	back = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues/brownstealth
	shoes = /obj/item/clothing/shoes/ms13/military/legion/cleats
	suit = /obj/item/clothing/suit/armor/ms13/legion/scout
	suit_store = /obj/item/gun/ballistic/rifle/ms13/hunting
	l_pocket = /obj/item/ammo_box/magazine/ms13/r308 

/datum/outfit/job/ms13/legion/scout/pre_equip(mob/living/carbon/human/H)
	..()

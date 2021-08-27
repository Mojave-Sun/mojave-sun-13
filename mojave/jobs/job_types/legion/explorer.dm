/datum/job/ms13/legion/explorer
	title = "Legion Explorer"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion, Speculatores."
	description = "Assist the Legion by scouting out the land, taking out targets strategically."

	outfit = /datum/outfit/job/ms13/legion/explorer

	display_order = JOB_DISPLAY_ORDER_MS13_EXPLORER

/datum/outfit/job/ms13/legion/explorer
	name = "_Legion Explorer"
	jobtype = /datum/job/ms13/legion/explorer

	head = /obj/item/clothing/head/helmet/ms13/legion/explorer
	back = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues/brownstealth
	shoes = /obj/item/clothing/shoes/ms13/military/legion/cleats
	suit = /obj/item/clothing/suit/armor/ms13/legion/explorer
	gloves = /obj/item/clothing/gloves/ms13/legion/bracers
	suit_store = /obj/item/gun/ballistic/rifle/ms13/hunting/scoped
	l_pocket = /obj/item/ammo_box/magazine/ms13/r308

/datum/outfit/job/ms13/legion/explorer/pre_equip(mob/living/carbon/human/H)
	..()

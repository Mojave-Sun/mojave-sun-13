/datum/job/ms13/legion/centurion
	title = "Legion Centurion"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Praetorians, The Legate, and Caesar."
	description = "Command your Centura, leading them to glorious victory at all costs."
	enforce = "The Legion expects you to lead them effectively. Do not be a coward."

	outfit = /datum/outfit/job/ms13/legion/centurion

	display_order = JOB_DISPLAY_ORDER_MS13_CENTURION

/datum/outfit/job/ms13/legion/centurion
	name = "_Legion Centurion"
	jobtype = /datum/job/ms13/legion/centurion

	head = /obj/item/clothing/head/helmet/ms13/legion/centurion
	glasses = /obj/item/clothing/glasses/sunglasses/big
	backpack = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues/redpadded
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/centurion
	suit_store = /obj/item/gun/ballistic/automatic/ms13/smg10mm
	r_pocket = /obj/item/ammo_box/magazine/ms13/smgm10mm

/datum/outfit/job/ms13/legion/centurion/pre_equip(mob/living/carbon/human/H)
	..()

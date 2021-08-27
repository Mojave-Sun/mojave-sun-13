/datum/job/ms13/legion/recruitlegionary
	title = "Recruit Legionary"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion, any Decanus."
	description = "Fight in the name of Caesar, and claim the lands for the Bull! Listen to your superiors, they will guide you to victory."

	outfit = /datum/outfit/job/ms13/legion/recruitlegionary

	display_order = JOB_DISPLAY_ORDER_MS13_RECRUITLEGIONARY

/datum/outfit/job/ms13/legion/recruitlegionary
	name = "_Legion Recruit"
	jobtype = /datum/job/ms13/legion/recruitlegionary

	head = /obj/item/clothing/head/helmet/ms13/legion/recruit
	glasses = /obj/item/clothing/glasses/sunglasses/big
	back = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues/red
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/recruit
	gloves = /obj/item/clothing/gloves/ms13/legion/darkwraps
	suit_store = /obj/item/gun/ballistic/automatic/ms13/smg9mm
	l_pocket = /obj/item/ammo_box/magazine/ms13/smgm9mm

/datum/outfit/job/ms13/legion/recruitlegionary/pre_equip(mob/living/carbon/human/H)
	..()

/datum/job/ms13/legion/recruitdecanus
	title = "Legion Recruit Decanus"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion, Higher Decanii."
	description = "Assist the higher ranks in handling your soldiers, keep them in line and focused on the goals at hand."

	outfit = /datum/outfit/job/ms13/legion/recruitdecanus

	display_order = JOB_DISPLAY_ORDER_MS13_RECRUITDECANUS

/datum/outfit/job/ms13/legion/recruitdecanus
	name = "_Legion Recruit Decanus"
	jobtype = /datum/job/ms13/legion/recruitdecanus

	head = /obj/item/clothing/head/helmet/ms13/legion/decanus/recruit
	glasses = /obj/item/clothing/glasses/sunglasses/big
	back = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues/brownpadded
	shoes = /obj/item/clothing/shoes/ms13/military/legion/tanboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/recruit
	gloves = /obj/item/clothing/gloves/ms13/legion/tanwraps
	mask = /obj/item/clothing/mask/ms13/legion/clothmask
	suit_store = /obj/item/gun/ballistic/automatic/ms13/smg9mm
	l_pocket = /obj/item/ammo_box/magazine/ms13/smgm9mm

/datum/outfit/job/ms13/legion/recruitdecanus/pre_equip(mob/living/carbon/human/H)
	..()

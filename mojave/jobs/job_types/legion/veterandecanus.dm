/datum/job/ms13/legion/veterandecanus
	title = "Legion Veteran Decanus"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion."
	description = "Assist the Centurion in handling your soldiers, keep them in line and focused on the goals at hand."

	outfit = /datum/outfit/job/ms13/legion/veterandecanus

	display_order = JOB_DISPLAY_ORDER_MS13_VETERANDECANUS

/datum/outfit/job/ms13/legion/veterandecanus
	name = "_Legion Veteran Decanus"
	jobtype = /datum/job/ms13/legion/veterandecanus

	head = /obj/item/clothing/head/helmet/ms13/legion/decanus/veteran
	glasses = /obj/item/clothing/glasses/sunglasses/big
	back = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues/brownpadded
	shoes = /obj/item/clothing/shoes/ms13/military/legion/tanboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/veteran
	gloves = /obj/item/clothing/gloves/ms13/legion/tanwraps
	mask = /obj/item/clothing/mask/ms13/legion/clothmask
	suit_store = /obj/item/gun/ballistic/revolver/ms13/rev44
	l_pocket = /obj/item/ammo_box/ms13/rev44

/datum/outfit/job/ms13/legion/veterandecanus/pre_equip(mob/living/carbon/human/H)
	..()

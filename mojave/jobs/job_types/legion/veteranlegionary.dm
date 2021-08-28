/datum/job/ms13/legion/veteranlegionary
	title = "Veteran Legionary"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion, Veteran Decanii."
	description = "Fight in the name of Caesar, and claim the lands for the Bull! Listen to your superiors, they will guide you to victory."

	outfit = /datum/outfit/job/ms13/legion/veteranlegionary

	display_order = JOB_DISPLAY_ORDER_MS13_VETERANLEGIONARY

/datum/outfit/job/ms13/legion/veteranlegionary
	name = "_Legion Veteran Legionary"
	jobtype = /datum/job/ms13/legion/veteranlegionary

	head = /obj/item/clothing/head/helmet/ms13/legion/veteran
	glasses = /obj/item/clothing/glasses/sunglasses/big
	back = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues/red
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/veteran
	gloves = /obj/item/clothing/gloves/ms13/legion/darkwraps
	mask = /obj/item/clothing/mask/ms13/legion/clothmask
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	l_pocket = /obj/item/ammo_box/magazine/ms13/m9mm
	r_hand = /obj/item/claymore/ms13/machete/gladius

/datum/outfit/job/ms13/legion/veteranlegionary/pre_equip(mob/living/carbon/human/H)
	..()

/datum/job/ms13/legion/primelegionary
	title = "Prime Legionary"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion, Prime and Veteran Decanii."
	description = "Fight in the name of Caesar, and claim the lands for the Bull! Listen to your superiors, they will guide you to victory."

	outfit = /datum/outfit/job/ms13/legion/primelegionary

	display_order = JOB_DISPLAY_ORDER_MS13_PRIMELEGIONARY

/datum/outfit/job/ms13/legion/primelegionary
	name = "_Legion Prime Legionary"
	jobtype = /datum/job/ms13/legion/primelegionary

	head = /obj/item/clothing/head/helmet/ms13/legion/prime
	glasses = /obj/item/clothing/glasses/sunglasses/big
	back = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues/red
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/prime
	gloves = /obj/item/clothing/gloves/ms13/legion/darkwraps
	mask = /obj/item/clothing/mask/ms13/legion/clothmask
	suit_store = /obj/item/gun/ballistic/revolver/ms13/caravan
	r_hand = /obj/item/claymore/ms13/machete/gladius

/datum/outfit/job/ms13/legion/primelegionary/pre_equip(mob/living/carbon/human/H)
	..()

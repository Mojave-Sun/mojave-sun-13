/datum/job/ms13/legion/primelegionary
	title = "Prime Legionary"
	total_positions = 4
	spawn_positions = 4
	supervisors = "The Centurion and the Prime Decanus."
	description = "Fight in the name of Caesar, and claim the lands for the Bull! Listen to your superiors, they will guide you to victory."

	outfit = /datum/outfit/job/ms13/legion/primelegionary

	display_order = JOB_DISPLAY_ORDER_MS13_PRIMELEGIONARY

/datum/outfit/job/ms13/legion/primelegionary
	name = "_Legion Prime Legionary"
	jobtype = /datum/job/ms13/legion/primelegionary

	head = /obj/item/clothing/head/helmet/ms13/legion/prime
	glasses = /obj/item/clothing/glasses/ms13/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues/red/top
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/prime
	gloves = /obj/item/clothing/gloves/ms13/legion/dark
	r_hand = /obj/item/ms13/twohanded/spear/throwing
	r_pocket = /obj/item/stack/medical/gauze/ms13/three
	belt = /obj/item/claymore/ms13/machete
	id = /obj/item/card/id/ms13/legprime

/datum/outfit/job/ms13/legion/primelegionary/pre_equip(mob/living/carbon/human/H)
	..()

	suit_store = pick(
		/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm,\
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45,\
		/obj/item/gun/ballistic/revolver/ms13/rev357,\
		/obj/item/gun/ballistic/revolver/ms13/rev357/police,\
		/obj/item/gun/ballistic/revolver/ms13/caravan/sawed)

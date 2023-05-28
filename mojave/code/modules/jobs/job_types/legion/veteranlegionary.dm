/datum/job/ms13/legion/veteranlegionary
	title = "Veteran Legionary"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Veteran Decanus."
	description = "Fight in the name of Caesar, and claim the lands for the Bull! Listen to your superiors, they will guide you to victory."

	outfit = /datum/outfit/job/ms13/legion/veteranlegionary

	display_order = JOB_DISPLAY_ORDER_MS13_VETERANLEGIONARY

/datum/outfit/job/ms13/legion/veteranlegionary
	name = "_Legion Veteran Legionary"
	jobtype = /datum/job/ms13/legion/veteranlegionary

	head = /obj/item/clothing/head/helmet/ms13/legion/veteran
	glasses = /obj/item/clothing/glasses/ms13/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues
	shoes = /obj/item/clothing/shoes/ms13/military/legion/tanboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/veteran
	gloves = /obj/item/clothing/gloves/ms13/legion/bracers
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever
	r_pocket = /obj/item/stack/medical/gauze/ms13/three
	l_pocket = /obj/item/stack/ms13/currency/aurelius/two
	belt = /obj/item/claymore/ms13/machete/gladius
	id = /obj/item/card/id/ms13/legveteran
	backpack_contents = list(
		/obj/item/ammo_box/ms13/shotgun/buckshot=1)

/datum/outfit/job/ms13/legion/veteranlegionary/pre_equip(mob/living/carbon/human/H)
	..()

	r_hand = pick(
		/obj/item/ms13/twohanded/hammer,\
		/obj/item/ms13/twohanded/fireaxe,\
		/obj/item/ms13/twohanded/spear)

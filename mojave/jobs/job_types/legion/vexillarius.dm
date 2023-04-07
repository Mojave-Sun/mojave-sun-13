/datum/job/ms13/legion/vexillarius
	title = "Legion Vexillarius"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion and the Veteran Decanus"
	description = "Assist the higher ranks in any way possible, deliver messages on their behalf. Rally the troops in battle."

	outfit = /datum/outfit/job/ms13/legion/vexillarius

	display_order = JOB_DISPLAY_ORDER_MS13_VEXILLARIUS

/datum/outfit/job/ms13/legion/vexillarius
	name = "_Legion Vexillarius"
	jobtype = /datum/job/ms13/legion/vexillarius

	head = /obj/item/clothing/head/helmet/ms13/legion/vexillarius
	glasses = /obj/item/clothing/glasses/ms13/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/vexillarius
	gloves = /obj/item/clothing/gloves/ms13/legion/bracers
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/huntingshot
	belt = /obj/item/claymore/ms13/machete/gladius
	r_pocket = /obj/item/stack/medical/gauze/ms13/three
	l_pocket = /obj/item/flashlight/flare/ms13
	id = /obj/item/card/id/ms13/legveteran/vex
	backpack_contents = list(
		/obj/item/ammo_box/ms13/shotgun/buckshot=1,\
		/obj/item/stack/ms13/currency/aurelius/two=1)

/datum/outfit/job/ms13/legion/vexillarius/pre_equip(mob/living/carbon/human/H)
	..()

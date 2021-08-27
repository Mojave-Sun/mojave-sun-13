/datum/job/ms13/legion/vexillarius
	title = "Legion Vexillarius"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion"
	description = "Assist the higher ranks in any way possible, deliver messages on their behalf."

	outfit = /datum/outfit/job/ms13/legion/vexillarius

	display_order = JOB_DISPLAY_ORDER_MS13_VEXILLARIUS

/datum/outfit/job/ms13/legion/vexillarius
	name = "_Legion Vexillarius"
	jobtype = /datum/job/ms13/legion/vexillarius

	head = /obj/item/clothing/head/helmet/ms13/legion/vexillarius
	glasses = /obj/item/clothing/glasses/sunglasses/big
	back = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues/brownpadded
	shoes = /obj/item/clothing/shoes/ms13/military/legion/tanboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/vexillarius
	gloves = /obj/item/clothing/gloves/ms13/legion/tanwraps
	suit_store = /obj/item/gun/ballistic/automatic/ms13/smg9mm
	l_pocket = /obj/item/ammo_box/magazine/ms13/smgm9mm

/datum/outfit/job/ms13/legion/vexillarius/pre_equip(mob/living/carbon/human/H)
	..()

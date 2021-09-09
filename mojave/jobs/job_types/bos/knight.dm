/datum/job/ms13/bos/knight
	title = "_BoS Knight"
	department_head = list("Head Paladin")
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Paladin and Head Paladin"
	description = "Another day of keeping the wastes in check. Ensure weaponized technology is properly contained. Follow any goals set out by your superiors."

	outfit = /datum/outfit/job/ms13/bos/knight

	display_order = JOB_DISPLAY_ORDER_MS13_KNIGHT

/datum/outfit/job/ms13/bos/knight
	name = "_BoS Knight"

	id = /obj/item/card/id/ms13/bos/knight
	head = /obj/item/clothing/head/helmet/ms13/combat/bos
	mask = /obj/item/clothing/mask/ms13/bos
	suit = /obj/item/clothing/suit/armor/ms13/combat/bos
	uniform =  /obj/item/clothing/under/ms13/bos
	belt = /obj/item/gun/ballistic/automatic/pistol/ms13/m10mm
	gloves = /obj/item/clothing/gloves/ms13/bos
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	suit_store = /obj/item/gun/energy/ms13/laser/rifle
	r_pocket = 	/obj/item/stack/medical/gauze/ms13
	back = /obj/item/storage/backpack/satchel
	backpack_contents = list(
		/obj/item/stock_parts/cell/ms13/mfc=1,\
		/obj/item/kitchen/knife/ms13/combat=1)

/datum/outfit/job/ms13/bos/knight/pre_equip(mob/living/carbon/human/H)
	..()

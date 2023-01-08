/datum/job/ms13/raiders/boss
	title = "Raider Boss"
	total_positions = 1
	spawn_positions = 1
	supervisors = "No one"
	description = "Lead your gang of pipe swingers. The grind has paid off and now you've got a small army at your hands. Decide what you'll do, whether it be highway tax points or drug production and peddling."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/raiders/boss

	display_order = JOB_DISPLAY_ORDER_MS13_BOSS

/datum/outfit/job/ms13/raiders/boss
	name = "_Raider Boss"
	jobtype = /datum/job/ms13/raiders/boss

	glasses = 	/obj/item/clothing/glasses/ms13/cool
	id = 		/obj/item/card/id/ms13/boss
	suit =		/obj/item/clothing/suit/ms13/trench/boss
	uniform =	/obj/item/clothing/under/ms13/wasteland/warboypants
	shoes = 	/obj/item/clothing/shoes/ms13/military/diesel
	suit_store = /obj/item/gun/ballistic/automatic/ms13/full/smg10mm
	r_pocket = 	/obj/item/ammo_box/magazine/ms13/smgm10mm
	l_pocket =	/obj/item/ms13/knuckles/weighted/spiked
	backpack_contents = list(
		/obj/item/stack/medical/ointment/ms13/half=1, \
		/obj/item/stack/medical/gauze/ms13/half=1, \
		/obj/item/flashlight/ms13/crafted=1, \
		/obj/item/ammo_box/magazine/ms13/smgm10mm=1, \
		/obj/item/radio/ms13/broadcast=1, \
		/obj/item/stack/ms13/currency/prewar/hunnedtwenty=1)

/datum/outfit/job/ms13/raiders/boss/pre_equip(mob/living/carbon/human/H)
	..()

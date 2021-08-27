/datum/job/ms13/raiders/boss
	title = "Raider Boss"
	total_positions = 1
	spawn_positions = 1
	supervisors = ""
	description = "Lead your gang of pipe swingers. The grind has paid off and now you've got a small army at your hands. Decide what you'll do, whether it be highway tax points or drug production and peddling."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/raiders/boss

	display_order = JOB_DISPLAY_ORDER_MS13_BOSS

/datum/outfit/job/ms13/raiders/boss
	name = "_Raider Boss"
	jobtype = /datum/job/ms13/raiders/boss

	glasses = 	/obj/item/clothing/glasses/sunglasses/big
	id = 		/obj/item/card/id/ms13/boss
	suit =		/obj/item/clothing/suit/ms13/trench/bossduster
	uniform =	/obj/item/clothing/under/ms13/wasteland/warboypants
	shoes = 	/obj/item/clothing/shoes/ms13/military

/datum/outfit/job/ms13/raiders/boss/pre_equip(mob/living/carbon/human/H)
	..()

	back = pick(
		/obj/item/storage/backpack/satchel/leather,\
		/obj/item/storage/backpack)

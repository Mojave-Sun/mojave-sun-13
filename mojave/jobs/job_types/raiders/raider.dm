/datum/job/ms13/raiders/raider
	title = "Raider"
	total_positions = 10
	spawn_positions = 10
	supervisors = "Enforcer, and the Boss"
	description = "Follow the Boss' orders and listen to the Enforcer. Do whatever he says with questionable proficiency."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/raiders/raider

	display_order = JOB_DISPLAY_ORDER_MS13_RAIDER

/datum/outfit/job/ms13/raiders/raider
	name = "_Raider"
	jobtype = /datum/job/ms13/raiders/raider

	id = 		/obj/item/card/id/ms13/raider
	shoes = 	/obj/item/clothing/shoes/ms13/military/diesel

/datum/outfit/job/ms13/raiders/raider/pre_equip(mob/living/carbon/human/H)
	..()

	head = pick(/obj/item/clothing/head/ms13/hood/banded,\
		/obj/item/clothing/head/ms13/hood/sack/metal,\
		/obj/item/clothing/head/helmet/ms13/junk,\
		/obj/item/clothing/head/ms13/hood/hunter,\
		/obj/item/clothing/head/helmet/ms13/ushanka/blue)

	uniform = pick(
		/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgrey,\
		/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgreen,\
		/obj/item/clothing/under/ms13/wasteland/peasant)

	suit = pick(
		/obj/item/clothing/suit/ms13/raider/plated,\
		/obj/item/clothing/suit/ms13/raider/kevlar)

	back = pick(
		/obj/item/storage/backpack/satchel/leather,\
		/obj/item/storage/backpack)

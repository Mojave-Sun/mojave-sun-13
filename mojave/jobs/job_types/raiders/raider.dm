/datum/job/ms13/raiders/raider
	title = "Raider"
	total_positions = 10
	spawn_positions = 10
	supervisors = "The Boss and the Enforcer"
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

	head = pick(
		/obj/item/clothing/head/ms13/hood/banded,\
		/obj/item/clothing/head/ms13/hood/sack/metal,\
		/obj/item/clothing/head/helmet/ms13/junk,\
		/obj/item/clothing/head/ms13/hood/sack/padded,\
		/obj/item/clothing/head/helmet/ms13/bladed,\
		/obj/item/clothing/head/helmet/ms13/flight,\
		/obj/item/clothing/head/helmet/ms13/flight/yellow,\
		/obj/item/clothing/head/helmet/ms13/flight/red,\
		/obj/item/clothing/head/helmet/ms13/skull,\
		/obj/item/clothing/head/ms13/hood/hunter,\
		/obj/item/clothing/head/helmet/ms13/ushanka)

	uniform = pick(
		/obj/item/clothing/under/ms13/wasteland/rag,\
		/obj/item/clothing/under/ms13/wasteland/warboypants,\
		/obj/item/clothing/under/ms13/wasteland/pants,\
		/obj/item/clothing/under/ms13/wasteland/worn,\
		/obj/item/clothing/under/ms13/wasteland/peasant,\
		/obj/item/clothing/under/ms13/wasteland/mercc,\
		/obj/item/clothing/under/ms13/wasteland/merca,\
		/obj/item/clothing/under/ms13/wasteland/swatter,\
		/obj/item/clothing/under/ms13/wasteland/wanderer)

	suit = pick(
		/obj/item/clothing/suit/ms13/raider,\
		/obj/item/clothing/suit/ms13/raider/plated,\
		/obj/item/clothing/suit/ms13/raider/kevlar)

	back = pick(
		/obj/item/storage/backpack/satchel/leather,\
		/obj/item/storage/backpack)

	belt = pick(
		/obj/item/claymore/ms13/pipe,\
		/obj/item/knife/ms13/hunting,\
		/obj/item/knife/ms13/switchblade,\
		/obj/item/knife/butcher/ms13,\
		/obj/item/hatchet/ms13/icepick)

	suit_store = pick(
		/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/military,\
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45,\
		/obj/item/gun/ballistic/revolver/ms13/rev357,\
		/obj/item/gun/ballistic/shotgun/ms13/lever/cowboy,\
		/obj/item/gun/ballistic/shotgun/ms13/lever,\
		/obj/item/gun/ballistic/rifle/ms13/hunting)

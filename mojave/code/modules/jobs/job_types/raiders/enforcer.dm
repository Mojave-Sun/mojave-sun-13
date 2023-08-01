/datum/job/ms13/raiders/enforcer
	title = "Raider Enforcer"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Boss"
	description = "Make sure your Boss' words are heard. Beat the boys until they carry his will."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/raiders/enforcer

	display_order = JOB_DISPLAY_ORDER_MS13_ENFORCER

/datum/outfit/job/ms13/raiders/enforcer
	name = "_Raider Enforcer"
	jobtype = /datum/job/ms13/raiders/enforcer

	head = 		/obj/item/clothing/head/helmet/ms13/assaultron
	id = 		/obj/item/card/id/ms13/enforcer
	suit = 		/obj/item/clothing/suit/ms13/trench/black/armored/enforcer
	uniform =	/obj/item/clothing/under/ms13/wasteland/mercc
	gloves =	/obj/item/clothing/gloves/ms13/military
	shoes = 	/obj/item/clothing/shoes/ms13/military/diesel
	suit_store = /obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/dakka
	belt = 		/obj/item/gun/ballistic/revolver/ms13/rev10mm
	r_hand = 	/obj/item/ms13/twohanded/hammer
	r_pocket = 	/obj/item/ammo_box/magazine/ms13/r20
	l_pocket =	/obj/item/knife/ms13/combat/soviet
	backpack_contents = list(
		/obj/item/ammo_box/ms13/c10mm=1, \
		/obj/item/stack/medical/ointment/ms13/half=1, \
		/obj/item/stack/medical/gauze/ms13/half=1, \
		/obj/item/flashlight/ms13/crafted=1, \
		/obj/item/radio/ms13/broadcast=1, \
		/obj/item/stack/ms13/currency/prewar/sixty=1)

/datum/outfit/job/ms13/raiders/enforcer/pre_equip(mob/living/carbon/human/H)
	..()

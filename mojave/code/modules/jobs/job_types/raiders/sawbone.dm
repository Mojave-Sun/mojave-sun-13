/datum/job/ms13/raiders/sawbone
	title = "Raider Sawbone"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Boss and the Enforcer"
	description = "Fix up your boys whenever they get themselves in trouble, or perhaps help in torturing some poor captured victim. You are by no means an expert, but who really cares about that?"
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/raiders/sawbone

	display_order = JOB_DISPLAY_ORDER_MS13_SAWBONE

	mind_traits = list(TRAIT_MEDICAL_TRAINING)

/datum/outfit/job/ms13/raiders/sawbone
	name = "_Raider Sawbone"
	jobtype = /datum/job/ms13/raiders/sawbone

	head = 		/obj/item/clothing/head/ms13/hood/sack
	id = 		/obj/item/card/id/ms13/sawbone
	suit = 		/obj/item/clothing/suit/ms13/raider
	uniform =	/obj/item/clothing/under/ms13/wasteland/whiteshirt
	shoes = 	/obj/item/clothing/shoes/ms13/military/diesel
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/pistol22
	belt = 		/obj/item/ms13/handsaw/bone
	r_pocket =  /obj/item/ammo_box/magazine/ms13/m22
	backpack_contents = list(
		/obj/item/storage/firstaid/ms13/regular=1, \
		/obj/item/stack/medical/gauze/ms13/half=1, \
		/obj/item/ms13/handdrill=1)

/datum/outfit/job/ms13/raiders/sawbone/pre_equip(mob/living/carbon/human/H)
	..()

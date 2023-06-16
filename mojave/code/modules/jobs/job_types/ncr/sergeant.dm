/datum/job/ms13/ncr/sergeant
	title = "NCR Sergeant"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Staff Sergeant and the Lieutenant"
	description = "Keep troopers in line, obey orders, and relay changes in situations to keep command up to date. You're currently at edge with the BoS, though not at war, yet."

	outfit = /datum/outfit/job/ms13/ncr/sergeant

	display_order = JOB_DISPLAY_ORDER_MS13_SERGEANT

/datum/outfit/job/ms13/ncr/sergeant
	name = "_NCR Sergeant"
	jobtype = /datum/job/ms13/ncr/sergeant
	id = 		 /obj/item/card/id/ms13/ncr/sergeant
	uniform =    /obj/item/clothing/under/ms13/ncr/fatigues
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr/goggles
	suit =       /obj/item/clothing/suit/armor/ms13/ncr/mantle
	suit_store = /obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/proto_service
	belt = 		 /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	r_pocket = 	 /obj/item/ammo_box/magazine/ms13/r20
	l_pocket = 	 /obj/item/knife/ms13/hunting
	backpack_contents = list(
		/obj/item/clothing/mask/ms13/ncr=1, \
		/obj/item/stack/medical/gauze/ms13/three=1, \
		/obj/item/flashlight/flare/ms13=1, \
		/obj/item/ammo_box/magazine/ms13/m9mm=1, \
		/obj/item/radio/ms13=1, \
		/obj/item/stack/ms13/currency/ncr_dollar/fourty=1)

/datum/outfit/job/ms13/ncr/sergeant/pre_equip(mob/living/carbon/human/H)
	..()

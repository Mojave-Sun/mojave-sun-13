/datum/job/ms13/ncr/radioman
	title = "NCR Radioman"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Sergeants and above"
	description = "Act as a relay between your squad and command. Assist your assigned Sergeant in organizing your squad as the second in command. You're currently at edge with the BoS, though not at war, yet."

	outfit = /datum/outfit/job/ms13/ncr/radioman

	display_order = JOB_DISPLAY_ORDER_MS13_RADIOMAN

/datum/outfit/job/ms13/ncr/radioman
	name = "_NCR Radioman"
	jobtype = 	 /datum/job/ms13/ncr/radioman
	id = 		 /obj/item/card/id/ms13/ncr/radioman
	uniform = 	 /obj/item/clothing/under/ms13/ncr/fatigues
	head = 		 /obj/item/clothing/head/helmet/ms13/ncr/goggles
	suit = 		 /obj/item/clothing/suit/armor/ms13/ncr/reinforced
	suit_store = /obj/item/gun/ballistic/rifle/ms13/varmint
	belt = 		 /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	back = 		 /obj/item/storage/ms13/radiopack
	r_pocket =   /obj/item/ammo_box/magazine/ms13/r10
	l_pocket =   /obj/item/knife/ms13/hunting
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=1, \
		/obj/item/stack/medical/gauze/ms13/three=1, \
		/obj/item/flashlight/flare/ms13=1, \
		/obj/item/clothing/mask/ms13/ncr=1, \
		/obj/item/stack/ms13/currency/ncr_dollar/twenty=1)

/datum/outfit/job/ms13/ncr/radioman/pre_equip(mob/living/carbon/human/H)
	..()

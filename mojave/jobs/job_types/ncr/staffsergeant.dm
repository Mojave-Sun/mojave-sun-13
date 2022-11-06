/datum/job/ms13/ncr/staffsergeant
	title = "NCR Staff Sergeant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Lieutenant"
	description = "Act as the Second in Command for NCR operations in the region. Direct your Sergeants and advise and assist the Lieutenant as needed. You're currently at edge with the BoS, though not at war, yet."

	outfit = /datum/outfit/job/ms13/ncr/staffsergeant

	display_order = JOB_DISPLAY_ORDER_MS13_STAFFSERGEANT

/datum/outfit/job/ms13/ncr/staffsergeant
	name = "_NCR Staff Sergeant"
	jobtype = 	 /datum/job/ms13/ncr/staffsergeant
	id = 		 /obj/item/card/id/ms13/ncr/staff_sergeant
	uniform =    /obj/item/clothing/under/ms13/ncr/fatigues
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr/goggles
	suit =       /obj/item/clothing/suit/armor/ms13/ncr/mantle/reinforced
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/huntingshot
	belt = 		 /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	r_pocket = 	 /obj/item/ammo_box/ms13/shotgun/buckshot
	l_pocket = 	 /obj/item/knife/ms13/hunting
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1, \
		/obj/item/ammo_box/magazine/ms13/m9mm=2, \
		/obj/item/flashlight/flare/ms13=1, \
		/obj/item/clothing/head/helmet/ms13/ncr/beret=1, \
		/obj/item/radio/ms13=1, \
		/obj/item/stack/ms13/currency/ncr_dollar/fifty=1)

/datum/outfit/job/ms13/ncr/staffsergeant/pre_equip(mob/living/carbon/human/H)
	..()

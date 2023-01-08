/datum/job/ms13/ncr/lieutenant
	title = "NCR Lieutenant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "A Captain or higher, if present."
	description = "Organize and command NCR forces in the region. Make sure the Staff Sergeant and Sergeants are doing their jobs. You're currently at edge with the BoS, though not at war, yet."

	outfit = /datum/outfit/job/ms13/ncr/lieutenant

	display_order = JOB_DISPLAY_ORDER_MS13_LIEUTENANT

/datum/outfit/job/ms13/ncr/lieutenant
	name = "_NCR Lieutenant"
	jobtype = /datum/job/ms13/ncr/lieutenant
	id = 		 /obj/item/card/id/ms13/ncr/lieutenant
	uniform =    /obj/item/clothing/under/ms13/ncr/fatigues
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr/beret/officer
	suit =       /obj/item/clothing/suit/armor/ms13/ncr/mantle/reinforced
	gloves = 	 null
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/deagle
	shoes = 	 /obj/item/clothing/shoes/ms13/military/ncr/officer
	r_pocket = 	 /obj/item/ammo_box/magazine/ms13/deagle
	l_pocket = 	 /obj/item/knife/ms13/hunting
	back =       /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/deagle=1, \
		/obj/item/stack/medical/gauze/ms13/half=1,
		/obj/item/flashlight/ms13=1, \
		/obj/item/stack/medical/ointment/ms13/half=1, \
		/obj/item/radio/ms13/broadcast=1, \
		/obj/item/stack/ms13/currency/ncr_dollar/eighty=1)

/datum/outfit/job/ms13/ncr/lieutenant/pre_equip(mob/living/carbon/human/H)
	..()

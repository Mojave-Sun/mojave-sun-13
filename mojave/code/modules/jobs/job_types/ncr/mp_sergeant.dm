/datum/job/ms13/ncr/mp_sergeant
	title = "NCR MP Sergeant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Any officer, if present. NCR law."
	description = "Keep your MPs in line and organize them to enforce law and order within Snowcrest and protect it from any threats. Work with the Mayor of Snowcrest to work towards the prosperity of the town and further integration with the NCR."

	outfit = /datum/outfit/job/ms13/ncr/mp_sergeant

	display_order = JOB_DISPLAY_ORDER_MS13_MPSERGEANT

/datum/outfit/job/ms13/ncr/mp_sergeant
	name = "_NCR MP Sergeant"
	jobtype = /datum/job/ms13/ncr/mp_sergeant
	id = 		 /obj/item/card/id/ms13/ncr/sergeant/mp
	uniform =    /obj/item/clothing/under/ms13/ncr/fatigues/nco
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr/beret/nco
	glasses =	 /obj/item/clothing/glasses/ms13/sunglasses
	suit =       /obj/item/clothing/suit/armor/ms13/ncr
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/huntingshot
	belt = 		 /obj/item/gun/ballistic/automatic/pistol/ms13/pistol45
	r_pocket = 	 /obj/item/radio/ms13/broadcast
	l_pocket = 	 /obj/item/flashlight/ms13
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/half=1, \
		/obj/item/ammo_box/ms13/shotgun/buckshot=1, \
		/obj/item/ammo_box/magazine/ms13/m45=2, \
		/obj/item/stack/ms13/currency/ncr_dollar/sixty=1, \
		/obj/item/claymore/ms13/baton=1, \
		/obj/item/knife/ms13/hunting=1, \
		/obj/item/stack/medical/ointment/ms13/half=1, \
		/obj/item/restraints/handcuffs/ms13=1)

/datum/outfit/job/ms13/ncr/mp_sergeant/pre_equip(mob/living/carbon/human/H)
	..()

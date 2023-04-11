/datum/job/ms13/legion/primedecanus
	title = "Legion Prime Decanus"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion."
	description = "Assist the Centurion in handling your soldiers, keep them in line and focused on the goals at hand."

	outfit = /datum/outfit/job/ms13/legion/primedecanus

	display_order = JOB_DISPLAY_ORDER_MS13_PRIMEDECANUS

/datum/outfit/job/ms13/legion/primedecanus
	name = "_Legion Prime Decanus"
	jobtype = /datum/job/ms13/legion/primedecanus

	head = /obj/item/clothing/head/helmet/ms13/legion/decanus/prime
	uniform = /obj/item/clothing/under/ms13/legion/fatigues
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/prime
	gloves = /obj/item/clothing/gloves/ms13/legion/bracers
	suit_store = /obj/item/gun/ballistic/automatic/ms13/full/smg9mm
	belt = /obj/item/claymore/ms13/machete/gladius
	r_pocket = /obj/item/stack/medical/gauze/ms13/three
	l_pocket = /obj/item/flashlight/flare/ms13
	id = /obj/item/card/id/ms13/legprime/decanus
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/smgm9mm=1,\
		/obj/item/stack/ms13/currency/denarius/fifteen=1)

/datum/outfit/job/ms13/legion/primedecanus/pre_equip(mob/living/carbon/human/H)
	..()

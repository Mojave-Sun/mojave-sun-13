/datum/job/ms13/legion/recruitdecanus
	title = "Legion Recruit Decanus"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion."
	description = "Assist the Centurion in handling your soldiers, keep them in line and focused on the goals at hand."

	outfit = /datum/outfit/job/ms13/legion/recruitdecanus

	display_order = JOB_DISPLAY_ORDER_MS13_RECRUITDECANUS

/datum/outfit/job/ms13/legion/recruitdecanus
	name = "_Legion Recruit Decanus"
	jobtype = /datum/job/ms13/legion/recruitdecanus

	head = /obj/item/clothing/head/helmet/ms13/legion/decanus
	uniform = /obj/item/clothing/under/ms13/legion/fatigues
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/recruit
	gloves = /obj/item/clothing/gloves/ms13/legion/bracers
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/military
	belt = /obj/item/claymore/ms13/machete
	r_pocket = /obj/item/stack/medical/gauze/ms13/three
	l_pocket = /obj/item/flashlight/flare/ms13
	id = /obj/item/card/id/ms13/legrecruitdecanus
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m10mm=2,\
		/obj/item/stack/ms13/currency/denarius/five=1)

/datum/outfit/job/ms13/legion/recruitdecanus/pre_equip(mob/living/carbon/human/H)
	..()

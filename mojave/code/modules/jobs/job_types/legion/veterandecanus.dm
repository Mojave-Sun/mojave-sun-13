/datum/job/ms13/legion/veterandecanus
	title = "Legion Veteran Decanus"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Will of Caesar."
	description = "Further the Legion's goals in the region and keep the Drylander tribe in check and on the path to assimilation."

	outfit = /datum/outfit/job/ms13/legion/veterandecanus

	display_order = JOB_DISPLAY_ORDER_MS13_VETERANDECANUS

/datum/outfit/job/ms13/legion/veterandecanus
	name = "_Legion Veteran Decanus"
	jobtype = /datum/job/ms13/legion/veterandecanus

	head = /obj/item/clothing/head/helmet/ms13/legion/decanus/veteran
	uniform = /obj/item/clothing/under/ms13/legion/fatigues
	shoes = /obj/item/clothing/shoes/ms13/military/legion/tanboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/veteran
	gloves = /obj/item/clothing/gloves/ms13/legion/bracers
	suit_store = /obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/chinese/handmade
	belt = /obj/item/claymore/ms13/machete/gladius
	r_pocket = /obj/item/stack/medical/gauze/ms13/three
	l_pocket = /obj/item/flashlight/flare/ms13
	id = /obj/item/card/id/ms13/legveteran/decanus
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/ar762=1,\
		/obj/item/stack/ms13/currency/aurelius/five=1)

/datum/outfit/job/ms13/legion/veterandecanus/pre_equip(mob/living/carbon/human/H)
	..()

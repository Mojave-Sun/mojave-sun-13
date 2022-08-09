/datum/job/ms13/legion/explorer
	title = "Legion Explorer"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Centurion and the Decanii."
	description = "Assist the Legion by scouting out the land, taking out targets strategically."

	outfit = /datum/outfit/job/ms13/legion/explorer

	display_order = JOB_DISPLAY_ORDER_MS13_EXPLORER

/datum/outfit/job/ms13/legion/explorer
	name = "_Legion Explorer"
	jobtype = /datum/job/ms13/legion/explorer

	head = /obj/item/clothing/head/helmet/ms13/legion/explorer
	uniform = /obj/item/clothing/under/ms13/legion/fatigues/dark
	shoes = /obj/item/clothing/shoes/ms13/military/legion/cleats
	suit = /obj/item/clothing/suit/armor/ms13/legion/explorer
	gloves = /obj/item/clothing/gloves/ms13/legion/dark
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/ms13/sks/scoped
	belt = /obj/item/claymore/ms13/machete
	r_pocket = /obj/item/stack/medical/gauze/ms13/three
	l_pocket = /obj/item/flashlight/flare/ms13
	id = /obj/item/card/id/ms13/legprime/explorer
	backpack_contents = list(
		/obj/item/ammo_box/ms13/stripper/r762=2)

/datum/outfit/job/ms13/legion/explorer/pre_equip(mob/living/carbon/human/H)
	..()

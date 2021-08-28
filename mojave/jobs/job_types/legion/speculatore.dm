/datum/job/ms13/legion/speculatore
	title = "Legion Speculatore"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Caesar, Praetorians, Legates."
	description = "Take out high value targets and gather information from the dark. You are the all-seeing eye and the all-reaping blade."

	outfit = /datum/outfit/job/ms13/legion/speculatore

	display_order = JOB_DISPLAY_ORDER_MS13_SPECULATORE

/datum/outfit/job/ms13/legion/speculatore
	name = "_Legion Speculatore"
	jobtype = /datum/job/ms13/legion/speculatore

	uniform = /obj/item/clothing/under/ms13/legion/fatigues/brownstealth
	mask = /obj/item/clothing/mask/ms13/legion/speculatore
	shoes = /obj/item/clothing/shoes/ms13/military/legion/cleats
	suit = /obj/item/clothing/suit/armor/ms13/legion/speculatore
	gloves = /obj/item/clothing/gloves/ms13/legion/darkwraps
	suit_store = /obj/item/gun/ballistic/rifle/ms13/hunting/scoped/amr
	l_pocket = /obj/item/ammo_box/magazine/ms13/amr
	neck = /obj/item/clothing/neck/cloak/ms13/legion/speculatore

/datum/outfit/job/ms13/legion/speculatore/pre_equip(mob/living/carbon/human/H)
	..()

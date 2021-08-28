/datum/job/ms13/combattest/red
	title = "Red ganger"
	total_positions = 100
	spawn_positions = 100
	supervisors = "Chief Blud"
	description = "Blast those blue bastards away! This is YOUR turf!"

	outfit = /datum/outfit/job/ms13/combattest/red

	display_order = JOB_DISPLAY_ORDER_MS13_RED

/datum/outfit/job/ms13/combattest/red
	name = "_Red ganger"
	jobtype = /datum/job/ms13/combattest/red

	mask = /obj/item/clothing/mask/ms13/bandana/bloods
	uniform =  /obj/item/clothing/under/ms13/bos
	gloves = /obj/item/clothing/gloves/ms13/winter
	shoes = /obj/item/clothing/shoes/ms13/winter
	back = /obj/item/storage/backpack/satchel/leather

/datum/outfit/job/ms13/combattest/red/pre_equip(mob/living/carbon/human/H)
	..()

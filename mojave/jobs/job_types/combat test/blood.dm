/datum/job/ms13/combattest/blood
	title = "Blood ganger"
	total_positions = 100
	spawn_positions = 100
	supervisors = "Chief Blud"
	description = "Blast those blue bastards away! This is YOUR turf!"

	outfit = /datum/outfit/job/ms13/combattest/blood

	display_order = JOB_DISPLAY_ORDER_MS13_BLOOD

/datum/outfit/job/ms13/combattest/blood
	name = "_Blood"
	jobtype = /datum/job/ms13/combattest/blood

	mask = /obj/item/clothing/mask/ms13/bandana/bloods
	uniform =  /obj/item/clothing/under/ms13/bos
	gloves = /obj/item/clothing/gloves/ms13/winter
	shoes = /obj/item/clothing/shoes/ms13/winter
	back = /obj/item/storage/backpack/satchel/leather

/datum/outfit/job/ms13/combattest/blood/pre_equip(mob/living/carbon/human/H)
	..()

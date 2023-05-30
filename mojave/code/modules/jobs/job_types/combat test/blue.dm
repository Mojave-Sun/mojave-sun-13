/datum/job/ms13/combattest/blue
	title = "Blue ganger"
	total_positions = 100
	spawn_positions = 100
	supervisors = "High bluepand"
	description = "Blast those red suckas away! This is YOUR turf!"

	outfit = /datum/outfit/job/ms13/combattest/blue
	departments_list = list(/datum/job_department/command)
	display_order = JOB_DISPLAY_ORDER_MS13_BLUE

/datum/outfit/job/ms13/combattest/blue
	name = "_Blue ganger"
	jobtype = /datum/job/ms13/combattest/blue

	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	id = /obj/item/card/id/ms13/blue_ganger
	mask = /obj/item/clothing/mask/ms13/bandana/crips
	neck = /obj/item/clothing/neck/stripedbluescarf
	uniform =  /obj/item/clothing/under/ms13/bos/officer
	gloves = /obj/item/clothing/gloves/ms13/winter/black
	shoes = /obj/item/clothing/shoes/ms13/winter/black
	back = /obj/item/storage/backpack/satchel/leather

/datum/outfit/job/ms13/combattest/blue/pre_equip(mob/living/carbon/human/H)
	..()

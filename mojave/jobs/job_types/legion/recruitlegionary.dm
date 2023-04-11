/datum/job/ms13/legion/recruitlegionary
	title = "Recruit Legionary"
	total_positions = 4
	spawn_positions = 4
	supervisors = "The Centurion and the Recruit Decanus"
	description = "Fight in the name of Caesar, and claim the lands for the Bull! Listen to your superiors, they will guide you to victory."

	outfit = /datum/outfit/job/ms13/legion/recruitlegionary

	display_order = JOB_DISPLAY_ORDER_MS13_RECRUITLEGIONARY

/datum/outfit/job/ms13/legion/recruitlegionary
	name = "_Legion Recruit"
	jobtype = /datum/job/ms13/legion/recruitlegionary

	head = /obj/item/clothing/head/helmet/ms13/legion/recruit
	glasses = /obj/item/clothing/glasses/ms13/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/recruit
	belt = /obj/item/claymore/ms13/machete
	r_hand = /obj/item/ms13/twohanded/spear/throwing
	gloves = /obj/item/clothing/gloves/ms13/legion/dark
	id = /obj/item/card/id/ms13/legrecruit

/datum/outfit/job/ms13/legion/recruitlegionary/pre_equip(mob/living/carbon/human/H)
	..()

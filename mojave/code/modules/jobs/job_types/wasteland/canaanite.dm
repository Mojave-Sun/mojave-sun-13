/datum/job/ms13/wasteland/canaanite
	title = "New Canaanite"
	total_positions = 2
	spawn_positions = 2
	supervisors = "God and John Moses Browning"
	description = "Spread the word of God to these heathenous lands. We can't expect God to do all the work, after all."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/wasteland/canaanite

	display_order = JOB_DISPLAY_ORDER_MS13_CANAANITE

/datum/outfit/job/ms13/wasteland/canaanite
	name = "_New Canaanite"
	jobtype = /datum/job/ms13/wasteland/canaanite

	head = /obj/item/clothing/head/helmet/ms13/cowboy/black
	uniform = /obj/item/clothing/under/ms13/wasteland/canaan
	shoes = /obj/item/clothing/shoes/ms13/fancy

/datum/outfit/job/ms13/wasteland/canaanite/pre_equip(mob/living/carbon/human/H)
	..()

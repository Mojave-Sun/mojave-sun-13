/datum/job/ms13/wasteland/hubologist
	title = "Hubologist"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Hub and the Star Father"
	description = "Recruit new members, and preforms alignments to rid people of those pesky neurodynes (for a fee of course)."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/wasteland/hubologist

	display_order = JOB_DISPLAY_ORDER_MS13_HUBOLOGIST

/datum/outfit/job/ms13/wasteland/hubologist
	name = "_Hubologist"
	jobtype = /datum/job/ms13/wasteland/hubologist

	suit = /obj/item/clothing/suit/hooded/ms13/hubologist
	uniform = /obj/item/clothing/under/ms13/wasteland/hubologist
	shoes = /obj/item/clothing/shoes/ms13/fancy

/datum/outfit/job/ms13/wasteland/hubologist/pre_equip(mob/living/carbon/human/H)
	..()

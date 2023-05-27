/datum/job/ms13/town/mayor
	title = "Town Mayor"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The best interests of the town."
	description = "At long last you are the head of the Town! Make the decisions and organize the town the way you see fit to allow it to prosper!"
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/mayor

	display_order = JOB_DISPLAY_ORDER_MS13_MAYOR

/datum/outfit/job/ms13/town/mayor
	name = "_Town Mayor"
	jobtype = /datum/job/ms13/town/mayor

	id = 		 /obj/item/card/id/ms13/mayor
	uniform =    /obj/item/clothing/under/ms13/regal
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	belt = 		 /obj/item/ammo_box/ms13/a357box
	r_pocket =   /obj/item/gun/ballistic/revolver/ms13/derringer/trimmed
	l_pocket =   /obj/item/stack/ms13/currency/prewar/mayor
	back =       null

/datum/outfit/job/ms13/town/mayor/pre_equip(mob/living/carbon/human/H)
	..()

/datum/job/ms13/town/bartender
	title = "Snowcrest Bartender"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor"
	description = "Tend to Snowcrest's bar and food services."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/bartender

	display_order = JOB_DISPLAY_ORDER_MS13_BARTENDER

/datum/outfit/job/ms13/town/bartender
	name = "_Snowcrest Bartender"
	jobtype = /datum/job/ms13/town/bartender

	id =		 /obj/item/card/id/ms13/town/bartender
	suit =       /obj/item/clothing/suit/ms13/vest/black
	uniform =	 /obj/item/clothing/under/ms13/wasteland/barmansuit
	shoes =  	 /obj/item/clothing/shoes/ms13/fancy
	suit_store = /obj/item/gun/ballistic/revolver/ms13/caravan
	r_pocket   = /obj/item/ammo_box/ms13/shotgun/buckshot
	l_pocket =   /obj/item/stack/ms13/currency/prewar/hunnedfourty
	back =       null

/datum/outfit/job/ms13/town/bartender/pre_equip(mob/living/carbon/human/H)
	..()

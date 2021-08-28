/datum/job/ms13/town/farmer
	title = "Town Farmer"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Mayor and the Sheriff."
	description = "Tend your farm and practice animal husbandry so that your Town can continue to thrive."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/farmer

	display_order = JOB_DISPLAY_ORDER_MS13_FARMER

/datum/outfit/job/ms13/town/farmer
	name = "_Town Farmer"
	jobtype = /datum/job/ms13/town/farmer

	suit =       /obj/item/clothing/suit/apron/waders/ms13
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/ms13/leather
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/

/datum/outfit/job/ms13/town/farmer/pre_equip(mob/living/carbon/human/H)
	..()

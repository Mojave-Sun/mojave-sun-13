/datum/job/ms13/town/deputy
	title = "Town Deputy"
	total_positions = 4
	spawn_positions = 4
	supervisors = "The Mayor and the Sheriff"
	description = "Assist the Sheriff in enforcing the laws of the town laid out by the Mayor."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/deputy

	display_order = JOB_DISPLAY_ORDER_MS13_DEPUTY

/datum/outfit/job/ms13/town/deputy
	name = "_Town Deputy"
	jobtype = /datum/job/ms13/town/deputy

	id = 		 /obj/item/card/id/ms13/deputy
	head =		 /obj/item/clothing/head/helmet/ms13/deputy
	suit =       /obj/item/clothing/suit/armor/ms13/vest/vault
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/ms13/vault
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever/cowboy
	belt = 		 /obj/item/gun/ballistic/automatic/pistol/ms13/m10mm
	r_pocket =	 /obj/item/ammo_box/magazine/ms13/m10mm
	l_pocket =   /obj/item/stack/ms13/currency/prewar/eighty
	back =       /obj/item/storage/ms13/vault
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1, \
		/obj/item/clothing/head/helmet/ms13/vaulthelmet=1, \
		/obj/item/claymore/ms13/baton=1, \
		/obj/item/flashlight/ms13=1, \
		/obj/item/ammo_box/ms13/a357box=1, \
		/obj/item/radio/ms13=1)

/datum/outfit/job/ms13/town/deputy/pre_equip(mob/living/carbon/human/H)
	..()

/datum/job/ms13/legion/centurion
	title = "Legion Centurion"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Legate, if present. And Caesar himself."
	description = "Command your Centuria, leading them to glorious victory at all costs."
	enforce = "The Legion expects you to lead them effectively. Do not be a coward."

	outfit = /datum/outfit/job/ms13/legion/centurion

	display_order = JOB_DISPLAY_ORDER_MS13_CENTURION

/datum/outfit/job/ms13/legion/centurion
	name = "_Legion Centurion"
	jobtype = /datum/job/ms13/legion/centurion

	head = /obj/item/clothing/head/helmet/ms13/legion/centurion
	uniform = /obj/item/clothing/under/ms13/legion/fatigues
	shoes = /obj/item/clothing/shoes/ms13/military/legion/tanboots
	gloves = /obj/item/clothing/gloves/ms13/legion/bracers
	suit = /obj/item/clothing/suit/armor/ms13/legion/centurion
	suit_store = /obj/item/gun/ballistic/rifle/ms13/hunting
	belt = /obj/item/gun/ballistic/revolver/ms13/caravan/sawed
	r_pocket = /obj/item/stack/medical/gauze/ms13/half
	l_pocket = /obj/item/flashlight/flare/ms13
	r_hand = /obj/item/claymore/ms13/machete/ripper
	id = /obj/item/card/id/ms13/legcenturion
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/r308=2,\
		/obj/item/ammo_box/ms13/shotgun/buckshot=1,\
		/obj/item/stack/ms13/currency/aurelius/five=1,\
		/obj/item/stack/ms13/currency/denarius/fifteen=1)

/datum/outfit/job/ms13/legion/centurion/pre_equip(mob/living/carbon/human/H)
	..()

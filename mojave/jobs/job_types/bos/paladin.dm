/datum/job/ms13/bos/paladin
	title = "_BoS Paladin"
	department_head = list("Head Paladin")
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Head Paladin"
	req_admin_notify = 1
	description = "Lead and coordinate your Knight and initiates. Formulate goals to further the Brotherhood. Keep an eye on the local NCR. Cooperate with the Scribe chain."

	outfit = /datum/outfit/job/ms13/bos/paladin

	display_order = JOB_DISPLAY_ORDER_MS13_PALADIN

/datum/outfit/job/ms13/bos/paladin
	name = "_BoS Paladin"
	jobtype = /datum/job/ms13/bos/paladin

	id = /obj/item/card/id/ms13/bos/paladin
	mask = /obj/item/clothing/mask/ms13/bos
	suit = /obj/item/clothing/suit/armor/ms13/combat/bos
	uniform =  /obj/item/clothing/under/ms13/bos/officer
	belt = /obj/item/gun/energy/ms13/laser/pistol/advanced
	gloves = /obj/item/clothing/gloves/ms13/bos
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	suit_store = /obj/item/gun/energy/ms13/laser/rifle/advanced
	r_pocket = 	/obj/item/stack/medical/gauze/ms13
	back = /obj/item/storage/backpack/satchel
	backpack_contents = list(
		/obj/item/stock_parts/cell/ms13/mfc=1,\
		/obj/item/kitchen/knife/ms13/combat=1,\
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=1)

/datum/outfit/job/ms13/bos/paladin/pre_equip(mob/living/carbon/human/H)
	..()

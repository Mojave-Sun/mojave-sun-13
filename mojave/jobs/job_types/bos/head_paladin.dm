/datum/job/ms13/bos/head_paladin
	title = "_BoS Head Paladin"
	department_head = list("Brotherhood High Command")
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Elder (if present) and Brotherhood High Command"
	req_admin_notify = 1
	description = "Ensure both chains obide by the Codex. Coordinate efforts to further progress. Keep an eye on the local NCR."

	outfit = /datum/outfit/job/ms13/bos/head_paladin

	display_order = JOB_DISPLAY_ORDER_MS13_HEAD_PALADIN

/datum/outfit/job/ms13/bos/head_paladin
	name = "_BoS Head Paladin"
	jobtype = /datum/job/ms13/bos/head_paladin

	id = /obj/item/card/id/ms13/bos/headpaladin
	suit = /obj/item/clothing/suit/armor/ms13/head_paladin
	uniform =  /obj/item/clothing/under/ms13/bos/officer
	belt = /obj/item/gun/energy/ms13/laser/pistol/advanced
	gloves = /obj/item/clothing/gloves/ms13/bos
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	suit_store = /obj/item/gun/energy/ms13/laser/scatter
	r_pocket = 	/obj/item/stack/medical/gauze/ms13
	back = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/stock_parts/cell/ms13/mfc=2,\
		/obj/item/kitchen/knife/ms13/combat=1,\
		/obj/item/clothing/mask/ms13/bos=1,\
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=1)

/datum/outfit/job/ms13/bos/head_paladin/pre_equip(mob/living/carbon/human/H)
	..()

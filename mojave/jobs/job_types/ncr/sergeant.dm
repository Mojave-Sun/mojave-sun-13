/datum/job/ms13/ncr/sergeant
	title = "NCR Sergeant"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Lieutenant and the Staff Sergeant, in that order."
	description = "Keep troopers in line, obey orders and relay changes in situations to keep command up to date."

	outfit = /datum/outfit/job/ms13/ncr/sergeant

	display_order = JOB_DISPLAY_ORDER_MS13_SERGEANT

/datum/outfit/job/ms13/ncr/sergeant
	name = "_NCR Sergeant"
	jobtype = /datum/job/ms13/ncr/sergeant
	id = 		 /obj/item/card/id/ms13/ncrtrooper
	uniform =    /obj/item/clothing/under/ms13/ncr/fatigues
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr/goggles
	mask = 		 /obj/item/clothing/mask/ms13/ncr
	suit =       /obj/item/clothing/suit/armor/ms13/ncr/reinforced
	suit_store = /obj/item/gun/ballistic/automatic/ms13/marksman/service
	glasses =	 null
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/r20=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/food/bread/plain=1)

/datum/outfit/job/ms13/ncr/sergeant/pre_equip(mob/living/carbon/human/H)
	..()

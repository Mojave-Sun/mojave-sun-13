/datum/job/ms13/ncr/lieutenant
	title = "NCR Lieutenant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "None, outside of exceptional circumstances."
	description = "Organize and command your forces."

	outfit = /datum/outfit/job/ms13/ncr/lieutenant

	display_order = JOB_DISPLAY_ORDER_MS13_LIEUTENANT

/datum/outfit/job/ms13/ncr/lieutenant
	name = "_NCR Lieutenant"
	jobtype = /datum/job/ms13/ncr/lieutenant
	id = 		 /obj/item/card/id/ms13/ncrlieutenant
	uniform =    /obj/item/clothing/under/ms13/ncr/fatigues
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr/beret/brown
	suit =       /obj/item/clothing/suit/armor/ms13/ncr/mantle/reinforced
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/deagle
	shoes = 	 /obj/item/clothing/shoes/ms13/military/ncr/officer
	glasses =	 /obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/deagle=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/food/bread/creamcheese=1)

/datum/outfit/job/ms13/ncr/lieutenant/pre_equip(mob/living/carbon/human/H)
	..()

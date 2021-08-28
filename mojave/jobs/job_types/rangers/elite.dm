/datum/job/ms13/ranger/elite
	title = "Elite Ranger"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Deputy-Chief"
	description = "Ensure peace in the region, Collaborate with other Rangers and lead them as need be. Follow the word of the Deputy-Chief."

	outfit = /datum/outfit/job/ms13/ranger/elite

	display_order = JOB_DISPLAY_ORDER_MS13_RANGERELITE

/datum/outfit/job/ms13/ranger/elite
	name = "_Ranger Elite"
	jobtype = 	 /datum/job/ms13/ranger/elite
	head = 		 /obj/item/clothing/head/helmet/ms13/eliteriot/ranger
	suit = 	  	 /obj/item/clothing/suit/armor/ms13/eliteriot/ranger
	belt =  	 /obj/item/gun/ballistic/revolver/ms13/rev44
	id = 		 /obj/item/card/id/ms13/ranger_elite
	r_pocket = 	 /obj/item/ammo_box/ms13/tube4570
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever/brush
	backpack_contents = list(
		/obj/item/ammo_box/ms13/tube44=2,\
		/obj/item/kitchen/knife/ms13/combat=1,\
		/obj/item/stack/medical/gauze/ms13=1,\
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=1)

/datum/outfit/job/ms13/ranger/elite/pre_equip(mob/living/carbon/human/H)
	..()

	uniform = pick(/obj/item/clothing/under/ms13/ranger,\
		/obj/item/clothing/under/ms13/ranger/casual,\
		/obj/item/clothing/under/ms13/ranger/patrol)

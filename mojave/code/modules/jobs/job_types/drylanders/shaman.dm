/datum/job/ms13/drylander/shaman
	title = "Drylander Shaman"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Chieftain"
	description = "You are an elite and hardened veteran of the Drylander tribe. Skilled in sniping, scouting, and covert operations. Carry out the will of the chieftain using your expertise."

	outfit = /datum/outfit/job/ms13/drylander/shaman

	display_order = JOB_DISPLAY_ORDER_MS13_SHAMAN

	mind_traits = list(TRAIT_DRY_SHAMAN)

/datum/outfit/job/ms13/drylander/shaman
	name = "_Drylander Shaman"
	jobtype = /datum/job/ms13/drylander/shaman

	id =         /obj/item/card/id/ms13/drylander/shaman
	suit =       /obj/item/clothing/suit/ms13/drylander/shaman
	head =       /obj/item/clothing/head/helmet/ms13/drylander/shaman
	belt =		 /obj/item/knife/ms13/tribal
	r_pocket =   /obj/item/flashlight/ms13/crafted
	l_pocket =   /obj/item/stack/ms13/currency/aurelius/two
	back =       /obj/item/storage/ms13/leather_backpack
	backpack_contents = list(
					/obj/item/stack/medical/ms13/healing_powder=2, \
					/obj/item/stack/medical/ms13/healing_powder/burn=2, \
					/obj/item/stack/medical/ms13/healing_powder/poultice=2, \
					/obj/item/stack/medical/gauze/ms13=1, \
					/obj/item/stack/medical/splint/ms13/wooden=2
	)

/datum/outfit/job/ms13/drylander/headtaker/pre_equip(mob/living/carbon/human/H)
	..()

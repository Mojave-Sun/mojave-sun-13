/datum/job/ms13/ranger/recruit
	title = "Desert Ranger Recruit"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Rangers, Elite Rangers, and the Deputy-Chief."
	description = "Learn the ropes of justice bringing. Stay in line and listen to your superiors. Ensure the region is in a relative state of peace."

	outfit = /datum/outfit/job/ms13/ranger/recruit

	display_order = JOB_DISPLAY_ORDER_MS13_RANGERRECRUIT

/datum/outfit/job/ms13/ranger/recruit
	name = "_Desert Ranger Recruit"
	jobtype = 	 /datum/job/ms13/ranger/recruit
	id = 		 /obj/item/card/id/ms13/ranger_recruit
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/ranger
	suit =       /obj/item/clothing/suit/ms13/duster/ranger
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever/cowboy
	r_pocket =   /obj/item/knife/ms13/hunting
	backpack_contents = list(
		/obj/item/ammo_box/ms13/a357box=1,\
		/obj/item/stack/medical/gauze/ms13/three=1)

/datum/outfit/job/ms13/ranger/recruit/pre_equip(mob/living/carbon/human/H)
	..()

	uniform = pick(/obj/item/clothing/under/ms13/ranger,\
		/obj/item/clothing/under/ms13/ranger/casual)

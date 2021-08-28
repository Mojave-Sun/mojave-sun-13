/datum/job/ms13/ncr/staffsergeant
	title = "NCR Staff Sergeant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Lieutenant"
	description = "Act as the Second in Command. Keep an eye on the Armory and protect it with your life, direct your Sergeants."

	outfit = /datum/outfit/job/ms13/ncr/staffsergeant

	display_order = JOB_DISPLAY_ORDER_MS13_STAFFSERGEANT

/datum/outfit/job/ms13/ncr/staffsergeant
	name = "_NCR Staff Sergeant"
	jobtype = 	 /datum/job/ms13/ncr/sergeant
	id = 		 /obj/item/card/id/ms13/ncrsergeant
	uniform =    /obj/item/clothing/under/ms13/ncr/fatigues
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr/goggles
	suit =       /obj/item/clothing/suit/armor/ms13/ncr/mantle
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/huntingshot
	backpack_contents = list(
		/obj/item/storage/box/lethalshot=1, \
		/obj/item/kitchen/knife/ms13/hunting=1, \
		/obj/item/radio/ms13, \
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=1, \
		/obj/item/stack/medical/gauze/ms13=1)

/datum/outfit/job/ms13/ncr/staffsergeant/pre_equip(mob/living/carbon/human/H)
	..()

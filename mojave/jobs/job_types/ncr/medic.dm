/datum/job/ms13/ncr/medic
	title = "NCR Medic"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Lieutenant, Staff Sergeants, and Sergeants.  In that order."
	description = "You are in charge of providing medical support to the NCR throughout the region. You are primarily a non-combat role, and should focus on self-preservation in order to keep the local group taken care of, though you are free to accompany squads as needed."

	outfit = /datum/outfit/job/ms13/ncr/medic

	display_order = JOB_DISPLAY_ORDER_MS13_MEDIC

/datum/outfit/job/ms13/ncr/medic
	name = "_NCR Medic"
	jobtype = /datum/job/ms13/ncr/medic
	id = 		 /obj/item/card/id/ms13/ncrlieutenant
	uniform =    /obj/item/clothing/under/ms13/ncr/fatigues
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr/beret
	suit =       /obj/item/clothing/suit/toggle/labcoat
	suit_store = /obj/item/healthanalyzer
	gloves = 	 null
	belt = 		 /obj/item/storage/belt/medical
	shoes = 	 /obj/item/clothing/shoes/ms13/military/ncr/officer
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm, \
		/obj/item/ammo_box/magazine/ms13/m9mm=2, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/stack/medical/suture=1, \
		/obj/item/stack/medical/mesh=1, \
		/obj/item/stack/medical/bruise_pack=1, \
		/obj/item/food/bread/creamcheese=1)

/datum/outfit/job/ms13/ncr/medic/pre_equip(mob/living/carbon/human/H)
	..()

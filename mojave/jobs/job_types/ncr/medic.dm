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
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr/medic
	suit =       /obj/item/clothing/suit/armor/ms13/ncr
	gloves = 	 null
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	r_pocket = 	 /obj/item/ammo_box/magazine/ms13/m9mm
	shoes = 	 /obj/item/clothing/shoes/ms13/military/ncr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=1, \
		/obj/item/kitchen/knife/ms13/hunting=1, \
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=2, \
		/obj/item/stack/medical/gauze/ms13=1, \
		/obj/item/stack/medical/suture/ms13=1, \
		/obj/item/stack/medical/ointment/ms13=1)

/datum/outfit/job/ms13/ncr/medic/pre_equip(mob/living/carbon/human/H)
	..()

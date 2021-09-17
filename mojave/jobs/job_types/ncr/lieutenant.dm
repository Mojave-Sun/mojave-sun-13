/datum/job/ms13/ncr/lieutenant
	title = "NCR Lieutenant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "A Captain or higher, if present."
	description = "Organize and command NCR forces in the region. Make sure the Staff Sergeant and Sergeants are doing their jobs."

	outfit = /datum/outfit/job/ms13/ncr/lieutenant

	display_order = JOB_DISPLAY_ORDER_MS13_LIEUTENANT

/datum/outfit/job/ms13/ncr/lieutenant
	name = "_NCR Lieutenant"
	jobtype = /datum/job/ms13/ncr/lieutenant
	id = 		 /obj/item/card/id/ms13/ncrlieutenant
	uniform =    /obj/item/clothing/under/ms13/ncr/fatigues
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr/beret
	suit =       /obj/item/clothing/suit/armor/ms13/ncr/mantle/reinforced
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/deagle
	shoes = 	 /obj/item/clothing/shoes/ms13/military/ncr/officer
	r_pocket = 	 /obj/item/ammo_box/magazine/ms13/deagle
	l_pocket = 	 /obj/item/kitchen/knife/ms13/hunting
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/deagle=1, \
		/obj/item/stack/medical/gauze/ms13/half=1,
		/obj/item/stack/medical/ointment/ms13/cream/half=1)

/datum/outfit/job/ms13/ncr/lieutenant/pre_equip(mob/living/carbon/human/H)
	..()

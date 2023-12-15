/datum/job/ms13/goldman/unproven
	title = "Goldman Unproven"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Proper Goldman, the Ringleader and the Kepper."
	description = "Stay in line and listen to your superiors. Prove yourself to the goldman. Make yourself useful to the group. Make a name for yourself, somewhat literally."

	outfit = /datum/outfit/job/ms13/goldman/unproven

	display_order = JOB_DISPLAY_ORDER_MS13_GLDMNUNPROVEN

/datum/outfit/job/ms13/goldman/unproven
	name = "_Goldman Unproven"
	jobtype = 	 /datum/job/ms13/goldman/unproven
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/goldman
	uniform =	 /obj/item/clothing/under/ms13/goldman/unproven
	belt =		 /obj/item/claymore/ms13/pipe/tireiron
	r_pocket = 	 /obj/item/stack/ms13/currency/cap/fifteen
	shoes =		 /obj/item/clothing/shoes/ms13/brownie
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1)

/datum/outfit/job/ms13/goldman/unproven/pre_equip(mob/living/carbon/human/H)
	..()

	suit = pick(/obj/item/clothing/suit/ms13/goldman/poncho,\
		/obj/item/clothing/suit/ms13/goldman/duster)

	suit_store = pick(/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm,\
		/obj/item/gun/ballistic/shotgun/ms13/lever/cowboy,\
		/obj/item/gun/ballistic/revolver/ms13/rev357/police)

/datum/outfit/job/ms13/goldman/unproven/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	var/obj/item/gun/ballistic/equipped_gun = H.get_item_by_slot(ITEM_SLOT_SUITSTORE)
	if(!istype(equipped_gun))
		return
	var/obj/item/ammo_casing/loaded_casing = equipped_gun.chambered || equipped_gun.magazine?.get_round(TRUE)
	//bullshit!
	if(!loaded_casing?.stack_type)
		return
	var/obj/item/ammo_casing/stacker_casing = new loaded_casing.type(H.loc)
	var/obj/item/ammo_box/magazine/ammo_stack/ammo_stack = stacker_casing.stack_with(new loaded_casing.type(H.loc))
	ammo_stack.top_off(loaded_casing.type, starting = TRUE)
	//this is fucking dumb but top_off has weird behavior
	if(length(ammo_stack.stored_ammo) > ammo_stack.max_ammo)
		stacker_casing = ammo_stack.get_round(keep = FALSE)
		qdel(stacker_casing)
	H.put_in_hands(ammo_stack)
	var/obj/item/backpack = H.get_item_by_slot(ITEM_SLOT_BACK)
	if(!backpack)
		return
	SEND_SIGNAL(backpack, COMSIG_TRY_STORAGE_INSERT, ammo_stack, null, TRUE, TRUE, FALSE)

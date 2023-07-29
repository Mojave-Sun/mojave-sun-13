/datum/job/ms13/ncr/mp
	title = "NCR Military Police"
	total_positions = 6
	spawn_positions = 6
	supervisors = "The Sergeant"
	description = "Follow and execute orders given to you by the Sergeant. Ensure the safety and law and order of the town of Snowcrest."

	outfit = /datum/outfit/job/ms13/ncr/mp

	display_order = JOB_DISPLAY_ORDER_MS13_MILPOLICE

/datum/outfit/job/ms13/ncr/mp
	name = "_NCR Military Police"
	jobtype = 	 /datum/job/ms13/ncr/mp
	id = 		 /obj/item/card/id/ms13/ncr/mp
	head = 	     /obj/item/clothing/head/helmet/ms13/ncr/mp
	suit =       /obj/item/clothing/suit/armor/ms13/ncr
	belt =		 /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	r_pocket = 	 /obj/item/flashlight/flare/ms13
	l_pocket =	 /obj/item/ammo_box/magazine/ms13/m9mm
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1, \
		/obj/item/claymore/ms13/baton=1, \
		/obj/item/stack/ms13/currency/ncr_dollar/twelve=1, \
		/obj/item/restraints/handcuffs/ms13=1)

/datum/outfit/job/ms13/ncr/mp/pre_equip(mob/living/carbon/human/H)
	..()

	if(prob(40))
		mask = /obj/item/clothing/mask/ms13/ncr
	else
		mask = null

	if(prob(30))
		glasses = pick(
			/obj/item/clothing/glasses/ms13/leather,\
			/obj/item/clothing/glasses/ms13/goggles)
	else
		glasses = null

	suit_store = pick(
			/obj/item/gun/ballistic/revolver/ms13/caravan,\
			/obj/item/gun/ballistic/rifle/ms13/varmint)


/datum/outfit/job/ms13/ncr/mp/post_equip(mob/living/carbon/human/H, visualsOnly)
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

/datum/job/ms13/drylander/hunter
	title = "Drylander Hunter"
	total_positions = 5
	spawn_positions = 5
	supervisors = "The Chieftain and the Headtakers"
	description = "You are a trained warrior and hunter of the Drylander tribe. Listen to the Chieftain and the Headtakers of the tribe and do what you must to protect your tribe and ensure they prosper."

	outfit = /datum/outfit/job/ms13/drylander/hunter

	display_order = JOB_DISPLAY_ORDER_MS13_HUNTER

/datum/outfit/job/ms13/drylander/hunter
	name = "_Drylander Hunter"
	jobtype = /datum/job/ms13/drylander/hunter

	id =         /obj/item/card/id/ms13/drylander/hunter
	suit =       /obj/item/clothing/suit/ms13/drylander/hunter
	head =       /obj/item/clothing/head/helmet/ms13/drylander/hunter
	suit_store = /obj/item/gun/ballistic/rifle/ms13/jezzail
	belt =		 /obj/item/knife/ms13/tribal
	l_pocket =   /obj/item/stack/medical/ms13/healing_powder
	r_hand =	 /obj/item/ms13/twohanded/fireaxe/drylander
	back =       /obj/item/storage/ms13/leather_backpack

/datum/outfit/job/ms13/drylander/hunter/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/ms13/drylander/hunter/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender != MALE)
		H.gender = MALE
		H.body_type = MALE

	if(prob(65))
		r_pocket = /obj/item/flashlight/ms13/crafted
	else
		r_pocket = null

/datum/outfit/job/ms13/drylander/hunter/post_equip(mob/living/carbon/human/H, visualsOnly)
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

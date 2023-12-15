/datum/job/ms13/highwaymen/standard
	title = "Highwayman"
	total_positions = 5
	spawn_positions = 5
	supervisors = "The Overseer and the Quartermaster."
	description = "Stay in line and listen to your superiors. Expand the influence and profits of the Highwaymen. Abide by established agreements and patrol the highways."

	outfit = /datum/outfit/job/ms13/highwaymen/standard

	display_order = JOB_DISPLAY_ORDER_MS13_HIGHWAYMAN

/datum/outfit/job/ms13/highwaymen/standard
	name = "_Highwayman"
	jobtype = 	 /datum/job/ms13/highwaymen/standard
	id =		 /obj/item/card/id/ms13/highwayman
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/highwaymen
	uniform =	 /obj/item/clothing/under/ms13/highwaymen
	belt =		 /obj/item/gun/ballistic/revolver/ms13/rev357
	r_pocket = 	 /obj/item/stack/ms13/currency/cap/thirtyfive
	l_pocket = 	 /obj/item/flashlight/flare/ms13
	shoes =		 /obj/item/clothing/shoes/ms13/explorer
	gloves =	 /obj/item/clothing/gloves/ms13/leather
	mask =		 /obj/item/clothing/mask/ms13/bandana/highwaymen/alt
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1,\
		/obj/item/hatchet/ms13/tomahawk=1,\
		/obj/item/ammo_box/ms13/a357box=1)

/datum/outfit/job/ms13/highwaymen/standard/pre_equip(mob/living/carbon/human/H)
	..()

	suit = pick(/obj/item/clothing/suit/ms13/highwaymen/duster_covered,\
		/obj/item/clothing/suit/ms13/highwaymen/duster_reinf)

	suit_store = pick(/obj/item/gun/ballistic/shotgun/ms13/lever/trail,\
		/obj/item/gun/ballistic/revolver/ms13/mts,\
		/obj/item/gun/ballistic/rifle/ms13/hunting)

	if(prob(35))
		glasses = /obj/item/clothing/glasses/ms13/leather/highwaymen
	else
		glasses = null

/datum/outfit/job/ms13/highwaymen/standard/post_equip(mob/living/carbon/human/H, visualsOnly)
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

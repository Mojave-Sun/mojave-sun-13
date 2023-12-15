/datum/job/ms13/highwaymen/roadrunner
	title = "Highwaymen Road Runner"
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Overseer and the Quartermaster."
	description = "Stay in line and listen to your superiors. Ensure messages are delivered as needed and the nearby region is well travelled and scouted. Abide by established agreements and patrol the highways."

	outfit = /datum/outfit/job/ms13/highwaymen/roadrunner

	display_order = JOB_DISPLAY_ORDER_MS13_HWYMNROADRUN

/datum/outfit/job/ms13/highwaymen/roadrunner
	name = "_Highwaymen Road Runner"
	jobtype = 	 /datum/job/ms13/highwaymen/roadrunner
	id =		 /obj/item/card/id/ms13/highwayman/road
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/highwaymen/veteran
	uniform =	 /obj/item/clothing/under/ms13/highwaymen
	suit =		 /obj/item/clothing/suit/ms13/highwaymen/poncho_padded
	belt =		 /obj/item/hatchet/ms13/broad
	r_pocket = 	 /obj/item/radio/ms13
	l_pocket = 	 /obj/item/flashlight/flare/ms13
	shoes =		 /obj/item/clothing/shoes/ms13/explorer
	gloves =	 /obj/item/clothing/gloves/ms13/fingerless
	glasses = 	 /obj/item/clothing/glasses/ms13/leather/highwaymen
	mask =		 /obj/item/clothing/mask/ms13/facewrap/highwaymen
	suit_store = /obj/item/gun/ballistic/revolver/ms13/derringer
	back =		 /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/half=1,\
		/obj/item/stack/medical/ms13/healing_powder=1,\
		/obj/item/stack/medical/splint/ms13/wooden=1,\
		/obj/item/gun/ballistic/automatic/ms13/full/smg10mm=1,\
		/obj/item/ammo_box/magazine/ms13/smgm10mm=1, \
		/obj/item/stack/ms13/currency/cap/sixty=1)

/datum/outfit/job/ms13/highwaymen/roadrunner/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/ms13/highwaymen/roadrunner/post_equip(mob/living/carbon/human/H, visualsOnly)
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

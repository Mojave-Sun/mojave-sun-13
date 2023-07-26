/datum/job/ms13/raiders/mon_grunt
	title = "Mon City Grunt"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Captain"
	description = "Work with the rest of your mercenary squad and follow the orders of your Captain in an effort to find work and most importantly establish yourselves in Mammoth. The fate of the company is riding on your shoulders."
	forbid = ""
	enforce = "The Mon City Mercs expect: No disobedience, following the orders of superiors to the letter, getting the job done no matter what. Failure is not an option."

	outfit = /datum/outfit/job/ms13/raiders/mon_grunt

	display_order = JOB_DISPLAY_ORDER_MS13_MONGRUNT

/datum/outfit/job/ms13/raiders/mon_grunt
	name = "_Mon City Grunt"
	jobtype = /datum/job/ms13/raiders/mon_grunt

	belt =		 /obj/item/gun/ballistic/revolver/ms13/rev10mm
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/ms13/sks
	r_pocket =	 /obj/item/knife/ms13/combat
	l_pocket =	 /obj/item/flashlight/flare/ms13
	backpack_contents = list(
			/obj/item/stack/ms13/currency/prewar/twenty=1,\
			/obj/item/stack/medical/gauze/ms13/three=1,\
			/obj/item/ammo_box/ms13/c10mm/junk=1)

/datum/outfit/job/ms13/raiders/mon_grunt/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/ms13/raiders/mon_grunt/post_equip(mob/living/carbon/human/H, visualsOnly)
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

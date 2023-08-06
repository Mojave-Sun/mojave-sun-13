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

	uniform =	 /obj/item/clothing/under/ms13/mon_city
	suit =		 /obj/item/clothing/suit/ms13/veteran_coat/reinf/mon_city
	shoes =		 /obj/item/clothing/shoes/ms13/military
	gloves =	 /obj/item/clothing/gloves/ms13/winter/black
	mask =		 /obj/item/clothing/mask/gas/ms13/mon_city
	head =		 /obj/item/clothing/head/helmet/ms13/cowboy/mon_city
	belt =		 /obj/item/gun/ballistic/revolver/ms13/rev10mm
	r_pocket =	 /obj/item/knife/ms13/combat
	l_pocket =	 /obj/item/flashlight/flare/ms13
	backpack_contents = list(
			/obj/item/stack/ms13/currency/prewar/twenty=1,\
			/obj/item/stack/medical/gauze/ms13/three=1,\
			/obj/item/ammo_box/ms13/c10mm/junk=1)

/datum/outfit/job/ms13/raiders/mon_grunt/pre_equip(mob/living/carbon/human/H)
	..()

	head = pick(
		/obj/item/clothing/head/helmet/ms13/cowboy/mon_city,\
		/obj/item/clothing/head/helmet/ms13/ushanka/mon_city/basic)

	if(prob(35))
		mask = /obj/item/clothing/mask/gas/ms13/mon_city/full
	else
		mask = /obj/item/clothing/mask/gas/ms13/mon_city

	suit_store = pick(
			/obj/item/gun/ballistic/shotgun/ms13/lever,\
			/obj/item/gun/ballistic/shotgun/ms13/lever/cowboy)

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

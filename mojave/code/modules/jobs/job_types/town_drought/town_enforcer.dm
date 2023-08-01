/datum/job/ms13/town_drought/enforcer
	title = "Town Enforcer"
	total_positions = 5
	spawn_positions = 5
	supervisors = "The Great Baron"
	description = "You are a loyal and humble servant of the Baron! Ensure his will is carried out to the fullest extent and above all ensure his safety."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town_drought/enforcer

	display_order = JOB_DISPLAY_ORDER_MS13_TOWNENFORCER

/datum/outfit/job/ms13/town_drought/enforcer
	name = "_Town Enforcer"
	jobtype = /datum/job/ms13/town_drought/enforcer

	id = 		 /obj/item/card/id/ms13/drought_enforcer
	head =		 /obj/item/clothing/head/helmet/ms13/enforcer
	glasses =	 /obj/item/clothing/glasses/ms13/sunglasses
	suit =       /obj/item/clothing/suit/armor/ms13/combat/enforcer
	gloves = 	 /obj/item/clothing/gloves/ms13/leather
	shoes =  	 /obj/item/clothing/shoes/ms13/explorer
	belt = 		 /obj/item/gun/ballistic/revolver/ms13/rev44
	r_pocket =	 /obj/item/flashlight/ms13
	l_pocket =   /obj/item/radio/ms13
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1, \
		/obj/item/ammo_box/ms13/m44box=1, \
		/obj/item/stack/ms13/currency/cap/eighty=1, \
		/obj/item/restraints/handcuffs/ms13=1)

/datum/outfit/job/ms13/town_drought/enforcer/pre_equip(mob/living/carbon/human/H)
	..()

	uniform = pick(
			/obj/item/clothing/under/ms13/wasteland/combat/desert,\
			/obj/item/clothing/under/ms13/wasteland/army,\
			/obj/item/clothing/under/ms13/wasteland/guard,\
			/obj/item/clothing/under/ms13/wasteland/merca)

	suit_store = pick(
			/obj/item/gun/ballistic/rifle/ms13/varmint,\
			/obj/item/gun/ballistic/rifle/ms13/hunting/surplus,\
			/obj/item/gun/ballistic/revolver/ms13/caravan)

	r_hand = pick(
			/obj/item/knife/ms13/combat,\
			/obj/item/hatchet/ms13/broad,\
			/obj/item/ms13/twohanded/spear)


/datum/outfit/job/ms13/town_drought/enforcer/post_equip(mob/living/carbon/human/H, visualsOnly)
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

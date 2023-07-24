/datum/job/ms13/raiders/slicker
	title = "Slickback"
	total_positions = 4
	spawn_positions = 4
	supervisors = "The Underboss"
	description = "Follow the Underboss' orders and work to expand the Slickbacks' operations in the region. Peddle, push, and profit!"
	forbid = ""
	enforce = "The Slickbacks' expect: Profitable operations, professional conduct and behavior, doing what is needed and best for the gang, but still within reason."

	outfit = /datum/outfit/job/ms13/raiders/slicker

	display_order = JOB_DISPLAY_ORDER_MS13_RAIDER

/datum/outfit/job/ms13/raiders/slicker
	name = "_Slickback"
	jobtype = /datum/job/ms13/raiders/slicker

	r_pocket = 	 /obj/item/stack/medical/gauze/ms13/three
	l_pocket =	 /obj/item/stack/ms13/currency/prewar/fourty


/datum/outfit/job/ms13/raiders/slicker/pre_equip(mob/living/carbon/human/H)
	..()

	belt = pick(
		/obj/item/knife/ms13/switchblade,\
		/obj/item/claymore/ms13/pipe/tireiron,\
		/obj/item/ms13/knuckles/weighted)

	suit_store = pick(
		/obj/item/gun/ballistic/revolver/ms13/rev357,\
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45,\
		/obj/item/gun/ballistic/revolver/ms13/caravan/sawed)

	if(prob(70))
		l_pocket = pick(
			/obj/item/flashlight/ms13/crafted)
	else
		l_pocket = null

/datum/outfit/job/ms13/raiders/slicker/post_equip(mob/living/carbon/human/H, visualsOnly)
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

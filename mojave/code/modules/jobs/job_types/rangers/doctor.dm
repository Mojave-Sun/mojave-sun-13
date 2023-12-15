/datum/job/ms13/ranger/rdoctor
	title = "Desert Ranger Doctor"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Rangers"
	description = "A doctor working alongside the Rangers in order to aid the public when needed. Maintain health of the Rangers and any bystanders."

	outfit = /datum/outfit/job/ms13/ranger/doctor

	display_order = JOB_DISPLAY_ORDER_MS13_RANGERDOCTOR

	mind_traits = list(TRAIT_MEDICAL_TRAINING, TRAIT_DRUGGIE)

/datum/outfit/job/ms13/ranger/doctor
	name = "_Desert Ranger Doctor"
	jobtype = 	 /datum/job/ms13/ranger/rdoctor
	id = 		 /obj/item/card/id/ms13/ranger_doctor
	belt = 	     /obj/item/storage/firstaid/ms13/regular
	r_hand =     /obj/item/storage/firstaid/ms13/bag/filled
	r_pocket =   /obj/item/knife/ms13/switchblade/razor
	l_pocket =   /obj/item/stack/ms13/currency/prewar/sixty
	back =       /obj/item/storage/ms13/satchel
	uniform = 	 /obj/item/clothing/under/ms13/wasteland/doctor
	suit =		 /obj/item/clothing/suit/armor/ms13/vest/civilian
	suit_store = /obj/item/gun/ballistic/revolver/ms13/rev357/police
	backpack_contents = list(/obj/item/stack/medical/ointment/ms13/half=1,\
		/obj/item/stack/medical/suture/ms13/eight=1,\
		/obj/item/stack/medical/gauze/ms13/half=1,\
		/obj/item/radio/ms13=1)

/datum/outfit/job/ms13/ranger/doctor/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/ms13/ranger/doctor/post_equip(mob/living/carbon/human/H, visualsOnly)
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

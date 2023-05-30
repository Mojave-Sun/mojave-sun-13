/datum/job/ms13/wasteland/nomad // Drought wastelander
	title = "Nomad"
	total_positions = 200
	spawn_positions = 200
	supervisors = "No one"
	description = "Survive. Attempt to outlive the harsh sun above you. Collaborate with your fellow man or remain distant. Ensure your own survival."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/wasteland/nomad

	display_order = JOB_DISPLAY_ORDER_MS13_NOMAD

/datum/outfit/job/ms13/wasteland/nomad
	name = "_Nomad"
	jobtype = /datum/job/ms13/wasteland/nomad

/datum/outfit/job/ms13/wasteland/nomad/pre_equip(mob/living/carbon/human/H)
	. = ..()
	if(prob(75))
		head = pick(
		/obj/item/clothing/head/helmet/ms13/cowboy/black,\
		/obj/item/clothing/head/helmet/ms13/cowboy, \
		/obj/item/clothing/head/helmet/ms13/baseball,\
		/obj/item/clothing/head/ms13/hood/cowl,\
		/obj/item/clothing/head/ms13/hood/sack,\
		/obj/item/clothing/head/helmet/ms13/fedora/brown,\
		/obj/item/clothing/head/helmet/ms13/bowler,\
		/obj/item/clothing/head/helmet/ms13/newsboy,\
		/obj/item/clothing/head/helmet/ms13/trilby,\
		/obj/item/clothing/head/helmet/ms13/bandanacap, \
		/obj/item/clothing/head/helmet/ms13/beret)
	else
		head = null

	if(prob(25))
		glasses = pick(/obj/item/clothing/glasses/ms13/black,\
		/obj/item/clothing/glasses/ms13/cap,\
		/obj/item/clothing/glasses/ms13/old,\
		/obj/item/clothing/glasses/ms13/leather,\
		/obj/item/clothing/glasses/ms13/goggles, \
		/obj/item/clothing/glasses/ms13/sunglasses, \
		/obj/item/clothing/glasses/ms13/cool, \
		/obj/item/clothing/glasses/ms13/metal)
	else
		glasses = null

	if(prob(25))
		mask = pick(
		/obj/item/clothing/mask/ms13/bandana,\
		/obj/item/clothing/mask/ms13/bandana/blue,\
		/obj/item/clothing/mask/ms13/bandana/red,\
		/obj/item/clothing/mask/ms13/bandana/white, \
		/obj/item/clothing/mask/ms13/bandana/green)
	else
		mask = null

	uniform = pick(
		/obj/item/clothing/under/ms13/wasteland/caravanpants,\
		/obj/item/clothing/under/ms13/wasteland/pants,\
		/obj/item/clothing/under/ms13/wasteland/ghoulpants,\
		/obj/item/clothing/under/ms13/wasteland/rag,\
		/obj/item/clothing/under/ms13/wasteland/worn,\
		/obj/item/clothing/under/ms13/wasteland/doctor,\
		/obj/item/clothing/under/ms13/wasteland/cowboy,\
		/obj/item/clothing/under/ms13/wasteland/cowboy/grey,\
		/obj/item/clothing/under/ms13/wasteland/cowboy/tan,\
		/obj/item/clothing/under/ms13/wasteland/wanderer,\
		/obj/item/clothing/under/ms13/wasteland/rancher,\
		/obj/item/clothing/under/ms13/wasteland/vestslacks,\
		/obj/item/clothing/under/ms13/wasteland/merchant,\
		/obj/item/clothing/under/ms13/wasteland/merca,\
		/obj/item/clothing/under/ms13/wasteland/caravaneer,\
		/obj/item/clothing/under/ms13/wasteland/machinist,\
		/obj/item/clothing/under/ms13/wasteland/lumberjack,\
		/obj/item/clothing/under/ms13/wasteland/mercc,\
		/obj/item/clothing/under/ms13/wasteland/roving,\
		/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgrey,\
		/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgreen)

	suit = pick(
		/obj/item/clothing/suit/ms13/vest/brown,\
		/obj/item/clothing/suit/ms13/vest/black,\
		/obj/item/clothing/suit/ms13/vest,\
		/obj/item/clothing/suit/ms13/ljacket/moleskin,\
		/obj/item/clothing/suit/ms13/ljacket/wanderer,\
		/obj/item/clothing/suit/ms13/ljacket/military,\
		/obj/item/clothing/suit/ms13/ljacket/musty,\
		/obj/item/clothing/suit/ms13/ljacket/biker,\
		/obj/item/clothing/suit/ms13/ljacket/bomber, \
		/obj/item/clothing/suit/ms13/ljacket, \
		/obj/item/clothing/suit/ms13/trench/leather, \
		/obj/item/clothing/suit/ms13/trench/brown, \
		/obj/item/clothing/suit/ms13/trench)

	suit_store = pick(
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm, \
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol22, \
		/obj/item/gun/ballistic/rifle/ms13/varmint, \
		/obj/item/gun/ballistic/revolver/ms13/caravan, \
		/obj/item/gun/ballistic/revolver/ms13/rev10mm)


	belt = pick(
		/obj/item/knife/ms13, \
		/obj/item/knife/ms13/switchblade/razor, \
		/obj/item/ms13/hammer, \
		/obj/item/ms13/knuckles, \
		/obj/item/ms13/brick, \
		/obj/item/knife/ms13/throwingknife)

	shoes = pick(
        /obj/item/clothing/shoes/ms13/tan, \
		/obj/item/clothing/shoes/ms13/winter, \
		/obj/item/clothing/shoes/ms13/winter/black, \
		/obj/item/clothing/shoes/ms13/rag, \
		/obj/item/clothing/shoes/ms13/brownie, \
		/obj/item/clothing/shoes/ms13/crude)

	if(prob(50))
		r_pocket = /obj/item/flashlight/flare/ms13
	else
		r_pocket = null

	if(prob(80))
		l_pocket = pick(
			/obj/item/stack/medical/gauze/ms13/three)
	else
		l_pocket = null

/datum/outfit/job/ms13/wasteland/nomad/post_equip(mob/living/carbon/human/H, visualsOnly)
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

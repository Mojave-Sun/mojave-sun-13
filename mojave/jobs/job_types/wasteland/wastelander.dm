/datum/job/ms13/wasteland/wastelander
	title = "Wastelander"
	total_positions = 200
	spawn_positions = 200
	supervisors = "No one"
	description = "Survive. Work with your fellow man to accomplish this if you can, and stop them if they try and impede your survival."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/wasteland/wastelander

	display_order = JOB_DISPLAY_ORDER_MS13_WASTELANDER

/datum/outfit/job/ms13/wasteland/wastelander
	name = "_Wastelander"
	jobtype = /datum/job/ms13/wasteland/wastelander

/datum/outfit/job/ms13/wasteland/wastelander/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(70))
		head = pick(
		/obj/item/clothing/head/helmet/ms13/cowboy/black,\
		/obj/item/clothing/head/helmet/ms13/baseball,\
		/obj/item/clothing/head/ms13/hood/cowl,\
		/obj/item/clothing/head/ms13/hood/sack,\
		/obj/item/clothing/head/helmet/ms13/fedora,\
		/obj/item/clothing/head/helmet/ms13/fedora/brown,\
		/obj/item/clothing/head/helmet/ms13/fedora/yellow, \
		/obj/item/clothing/head/helmet/ms13/fedora/blue, \
		/obj/item/clothing/head/helmet/ms13/bowler,\
		/obj/item/clothing/head/helmet/ms13/cowboy,\
		/obj/item/clothing/head/helmet/ms13/newsboy,\
		/obj/item/clothing/head/helmet/ms13/beanie,\
		/obj/item/clothing/head/helmet/ms13/trilby,\
		/obj/item/clothing/head/helmet/ms13/sailor, \
		/obj/item/clothing/head/helmet/ms13/fisher, \
		/obj/item/clothing/head/helmet/ms13/bandanacap, \
		/obj/item/clothing/head/helmet/ms13/beret, \
		/obj/item/clothing/head/helmet/ms13/tricorn, \
		/obj/item/clothing/head/helmet/ms13/chef)
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
		/obj/item/clothing/mask/ms13/facewrap,\
		/obj/item/clothing/mask/ms13/facewrap/red,\
		/obj/item/clothing/mask/ms13/facewrap/black,\
		/obj/item/clothing/mask/ms13/facewrap/blue,\
		/obj/item/clothing/mask/ms13/bandana,\
		/obj/item/clothing/mask/ms13/bandana/blue,\
		/obj/item/clothing/mask/ms13/bandana/red,\
		/obj/item/clothing/mask/ms13/bandana/white, \
		/obj/item/clothing/mask/ms13/bandana/green, \
		/obj/item/clothing/mask/ms13/facewrap/halfwrap)
	else
		mask = null

	if(prob(25))
		gloves = pick(
		/obj/item/clothing/gloves/ms13/leather, \
		/obj/item/clothing/gloves/ms13/fingerless, \
		/obj/item/clothing/gloves/ms13/winter, \
		/obj/item/clothing/gloves/ms13/winter/black)
	else
		gloves = null

	back = pick(
		/obj/item/storage/backpack/satchel/leather,\
		/obj/item/storage/backpack)


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
		/obj/item/clothing/suit/ms13/shawl,\
		/obj/item/clothing/suit/ms13/ljacket/moleskin,\
		/obj/item/clothing/suit/ms13/ljacket/wanderer,\
		/obj/item/clothing/suit/ms13/ljacket/military,\
		/obj/item/clothing/suit/ms13/ljacket/musty,\
		/obj/item/clothing/suit/ms13/ljacket/biker,\
		/obj/item/clothing/suit/ms13/ljacket/bomber, \
		/obj/item/clothing/suit/ms13/ljacket, \
		/obj/item/clothing/suit/toggle/ms13/wjacket/orange, \
		/obj/item/clothing/suit/toggle/ms13/wjacket/brown, \
		/obj/item/clothing/suit/toggle/ms13/wjacket/blue, \
		/obj/item/clothing/suit/toggle/ms13/wjacket/black, \
		/obj/item/clothing/suit/ms13/vest/letterman)


	suit_store = pick(
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm, \
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol22, \
		/obj/item/gun/ballistic/rifle/ms13/varmint, \
		/obj/item/gun/ballistic/revolver/ms13/caravan, \
		/obj/item/gun/ballistic/revolver/ms13/single, \
		/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/chinese)


	belt = pick(
		/obj/item/claymore/ms13/pipe/tireiron, \
		/obj/item/kitchen/knife/ms13, \
		/obj/item/kitchen/knife/ms13/switchblade/razor, \
		/obj/item/ms13/hammer, \
		/obj/item/ms13/knuckles, \
		/obj/item/ms13/brick)


	shoes = pick(
        /obj/item/clothing/shoes/ms13/tan, \
		/obj/item/clothing/shoes/ms13/winter, \
		/obj/item/clothing/shoes/ms13/winter/black, \
		/obj/item/clothing/shoes/ms13/rag, \
		/obj/item/clothing/shoes/ms13/brownie, \
		/obj/item/clothing/shoes/ms13/crude)

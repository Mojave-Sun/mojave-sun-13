/datum/job/ms13/wasteland/wastelander
	title = "Wastelander"
	total_positions = 200
	spawn_positions = 200
	supervisors = "God, if He remembers you exist"
	description = "Survive. Work with your fellow man to accomplish this if you can, and stop them if they try and jeporadize your survival."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/wasteland/wastelander

	display_order = JOB_DISPLAY_ORDER_MS13_WASTELANDER

/datum/outfit/job/ms13/wasteland/wastelander
	name = "_Wastelander"
	jobtype = /datum/job/ms13/wasteland/wastelander

/datum/outfit/job/ms13/wasteland/wastelander/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(50))
		head = pick(
		/obj/item/clothing/head/helmet/ms13/cowboy/black,\
		/obj/item/clothing/head/soft/ms13/baseball,\
		/obj/item/clothing/head/ms13/hood/cowl,\
		/obj/item/clothing/head/ms13/hood/sack,\
		/obj/item/clothing/head/ms13/hood/green,\
		/obj/item/clothing/head/helmet/ms13/fedora,\
		/obj/item/clothing/head/helmet/ms13/hardhat,\
		/obj/item/clothing/head/helmet/ms13/skull/muffalo,\
		/obj/item/clothing/head/helmet/ms13/skull,\
		/obj/item/clothing/head/helmet/ms13/fedora,\
		/obj/item/clothing/head/helmet/ms13/fedora/brown,\
		/obj/item/clothing/head/helmet/ms13/fedora/,\
		/obj/item/clothing/head/helmet/ms13/bowler,\
		/obj/item/clothing/head/helmet/ms13/cowboy,\
		/obj/item/clothing/head/helmet/ms13/prospector,\
		/obj/item/clothing/head/helmet/ms13/millitia,\
		/obj/item/clothing/head/helmet/ms13/newsboy,\
		/obj/item/clothing/head/helmet/ms13/beanie,\
		/obj/item/clothing/head/helmet/ms13/trilby,\
		/obj/item/clothing/head/helmet/ms13/chef,\
		/obj/item/clothing/head/helmet/ms13/ushanka,\
		/obj/item/clothing/head/helmet/ms13/ushanka/blue,\
		/obj/item/clothing/head/helmet/ms13/ushanka/green)
	else
		head = null

	if(prob(10))
		glasses = pick(/obj/item/clothing/glasses/ms13/black,\
		/obj/item/clothing/glasses/ms13/cap,\
		/obj/item/clothing/glasses/ms13/old,\
		/obj/item/clothing/glasses/ms13/leather,\
		/obj/item/clothing/glasses/ms13/metal,\
		/obj/item/clothing/glasses/ms13/cool,\
		/obj/item/clothing/glasses/ms13/goggles,\
		/obj/item/clothing/glasses/ms13/sunglasses)
	else
		glasses = null

	if(prob(25))
		mask = pick(
		/obj/item/clothing/mask/ms13/facewrap,\
		/obj/item/clothing/mask/ms13/facewrap/red,\
		/obj/item/clothing/mask/ms13/facewrap/black,\
		/obj/item/clothing/mask/ms13/facewrap/blue,\
        /obj/item/clothing/mask/gas,\
        /obj/item/clothing/mask/bandana/black,\
        /obj/item/clothing/mask/balaclava,\
		/obj/item/clothing/mask/ms13/bandana,\
		/obj/item/clothing/mask/ms13/bandana/blue,\
		/obj/item/clothing/mask/ms13/bandana/red,\
		/obj/item/clothing/mask/ms13/bandana/white,\
		/obj/item/clothing/mask/ms13/bandana/patriot,\
		/obj/item/clothing/mask/ms13/bandana/leapord,\
		/obj/item/clothing/mask/ms13/bandana/camo,\
		/obj/item/clothing/mask/gas/ms13)
	else
		mask = null

	back = pick(
		/obj/item/storage/backpack/satchel/leather,\
		/obj/item/storage/backpack)


	uniform = pick(
		/obj/item/clothing/under/ms13/wasteland/caravanpants,\
		/obj/item/clothing/under/ms13/wasteland/pants,\
		/obj/item/clothing/under/ms13/wasteland/ghoulpants,\
		/obj/item/clothing/under/ms13/wasteland/warboypants,\
		/obj/item/clothing/under/ms13/wasteland/rag,\
		/obj/item/clothing/under/ms13/wasteland/worn,\
		/obj/item/clothing/under/ms13/wasteland/doctor,\
		/obj/item/clothing/under/ms13/wasteland/cowboy,\
		/obj/item/clothing/under/ms13/wasteland/cowboy/grey,\
		/obj/item/clothing/under/ms13/wasteland/cowboy/tan,\
		/obj/item/clothing/under/ms13/wasteland/manager,\
		/obj/item/clothing/under/ms13/wasteland/followers,\
		/obj/item/clothing/under/ms13/wasteland/guard,\
		/obj/item/clothing/under/ms13/wasteland/mammoth,\
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
		/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgreen,\
		/obj/item/clothing/under/ms13/wasteland/prewar/relaxedwear,\
		/obj/item/clothing/under/ms13/wasteland/prewar/spring)
	if(prob(50))
		suit = pick(
			/obj/item/clothing/suit/ms13/vest/brown,\
			/obj/item/clothing/suit/ms13/vest/black,\
			/obj/item/clothing/suit/ms13/vest,\
			/obj/item/clothing/suit/ms13/shawl,\
			/obj/item/clothing/suit/toggle/ms13/wjacket/orange,\
			/obj/item/clothing/suit/toggle/ms13/wjacket/brown,\
			/obj/item/clothing/suit/armor/ms13/kit,\
			/obj/item/clothing/suit/toggle/ms13/wjacket/blue,\
			/obj/item/clothing/suit/toggle/ms13/wjacket/black,\
			/obj/item/clothing/suit/ms13/ljacket/moleskin,\
			/obj/item/clothing/suit/ms13/ljacket/wanderer,\
			/obj/item/clothing/suit/ms13/ljacket/military,\
			/obj/item/clothing/suit/ms13/ljacket/musty,\
			/obj/item/clothing/suit/ms13/ljacket/biker,\
			/obj/item/clothing/suit/ms13/ljacket/bomber,\
			/obj/item/clothing/suit/ms13/trench/brown,\
			/obj/item/clothing/suit/ms13/trench,\
			/obj/item/clothing/suit/ms13/trench/detective,\
			/obj/item/clothing/suit/ms13/trench/black,\
			/obj/item/clothing/suit/armor/ms13/leatherarmor)
	r_hand = pick(
		/obj/item/claymore/ms13/pipe/tireiron,\
		/obj/item/claymore/ms13/pipe)
	shoes = pick(
        /obj/item/clothing/shoes/ms13/tan,\
		/obj/item/clothing/shoes/winterboots,\
        /obj/item/clothing/shoes/ms13/explorer,\
		/obj/item/clothing/shoes/ms13/military,\
        /obj/item/clothing/shoes/ms13/military/diesel,\
        /obj/item/clothing/shoes/ms13/military/female/diesel)

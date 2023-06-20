/obj/effect/mob_spawn/corpse/human/ms13
	name = "BASE TYPE MS13 CADAVER SPAWNER DO NOT USE"
	icon_state = "corpsegreytider"

/obj/effect/mob_spawn/corpse/human/ms13/wastelander
	name = "Wastelander"
	outfit = /datum/outfit/job/ms13/wasteland/corpse
	icon_state = "corpsegreytider"

/datum/outfit/job/ms13/wasteland/corpse
	name = "_Wastelander Corpse"
	jobtype = null

/datum/outfit/job/ms13/wasteland/corpse/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(65))
		head = pick(
		/obj/item/clothing/head/helmet/ms13/cowboy/black,\
		/obj/item/clothing/head/helmet/ms13/baseball,\
		/obj/item/clothing/head/ms13/hood/cowl,\
		/obj/item/clothing/head/ms13/hood/sack,\
		/obj/item/clothing/head/helmet/ms13/fedora,\
		/obj/item/clothing/head/helmet/ms13/fedora/brown,\
		/obj/item/clothing/head/helmet/ms13/cowboy,\
		/obj/item/clothing/head/helmet/ms13/beanie,\
		/obj/item/clothing/head/helmet/ms13/bandanacap, \
		/obj/item/clothing/head/helmet/ms13/flight, \
		/obj/item/clothing/head/helmet/ms13/flight/yellow, \
		/obj/item/clothing/head/helmet/ms13/flight/red, \
		/obj/item/clothing/head/helmet/ms13/eyebot, \
		/obj/item/clothing/head/helmet/ms13/medical, \
		/obj/item/clothing/head/helmet/ms13/batter/red, \
		/obj/item/clothing/head/helmet/ms13/batter/blue, \
		/obj/item/clothing/head/ms13/hood/sack/padded, \
		/obj/item/clothing/head/ms13/hood/sack/metal, \
		/obj/item/clothing/head/ms13/hood/hunter, \
		/obj/item/clothing/head/helmet/ms13/prospector, \
		/obj/item/clothing/head/helmet/ms13/prospector/brown)
	else
		head = null

	if(prob(30))
		glasses = pick(/obj/item/clothing/glasses/ms13/black,\
		/obj/item/clothing/glasses/ms13/cap,\
		/obj/item/clothing/glasses/ms13/old,\
		/obj/item/clothing/glasses/ms13/leather,\
		/obj/item/clothing/glasses/ms13/goggles, \
		/obj/item/clothing/glasses/ms13/sunglasses, \
		/obj/item/clothing/glasses/ms13/cool, \
		/obj/item/clothing/glasses/ms13/metal, \
		/obj/item/clothing/glasses/ms13/welding)
	else
		glasses = null

	if(prob(20))
		mask = pick(
		/obj/item/clothing/mask/ms13/bandana,\
		/obj/item/clothing/mask/ms13/bandana/blue,\
		/obj/item/clothing/mask/ms13/bandana/red,\
		/obj/item/clothing/mask/ms13/bandana/white, \
		/obj/item/clothing/mask/ms13/bandana/green)
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

	if(prob(75))
		suit = pick(
		/obj/item/clothing/suit/ms13/ljacket/military,\
		/obj/item/clothing/suit/ms13/ljacket/biker,\
		/obj/item/clothing/suit/ms13/ljacket/bomber, \
		/obj/item/clothing/suit/ms13/ljacket, \
		/obj/item/clothing/suit/toggle/ms13/wjacket/orange, \
		/obj/item/clothing/suit/toggle/ms13/wjacket/brown, \
		/obj/item/clothing/suit/toggle/ms13/wjacket/blue, \
		/obj/item/clothing/suit/toggle/ms13/wjacket/black, \
		/obj/item/clothing/suit/toggle/ms13/wjacket/brown/reinforced, \
		/obj/item/clothing/suit/toggle/ms13/wjacket/orange/reinforced, \
		/obj/item/clothing/suit/toggle/ms13/wjacket/black/reinforced, \
		/obj/item/clothing/suit/toggle/ms13/wjacket/blue/reinforced, \
		/obj/item/clothing/suit/armor/ms13/leatherarmor, \
		/obj/item/clothing/suit/ms13/ljacket/reinforced, \
		/obj/item/clothing/suit/armor/ms13/vest/civilian, \
		/obj/item/clothing/suit/armor/ms13/kit)
	else
		suit = null

	if(prob(80))
		suit_store = pick(
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm, \
		/obj/item/gun/ballistic/rifle/ms13/varmint, \
		/obj/item/gun/ballistic/revolver/ms13/caravan, \
		/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/chinese, \
		/obj/item/gun/ballistic/revolver/ms13/rev10mm, \
		/obj/item/gun/energy/ms13/laser/pistol/wattz, \
		/obj/item/gun/ballistic/rifle/ms13/hunting/surplus, \
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45, \
		/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm, \
		/obj/item/gun/ballistic/revolver/ms13/rev357)
	else
		suit_store = null


	if(prob(85))
		belt = pick(
		/obj/item/knife/ms13, \
		/obj/item/knife/ms13/throwingknife, \
		/obj/item/claymore/ms13/pipe, \
		/obj/item/claymore/ms13/pipe/tireiron, \
		/obj/item/ms13/knuckles/weighted, \
		/obj/item/knife/ms13/hunting, \
		/obj/item/knife/ms13/switchblade, \
		/obj/item/knife/butcher/ms13, \
		/obj/item/crowbar/ms13, \
		/obj/item/weldingtool/ms13, \
		/obj/item/shovel/ms13/spade)
	else
		belt = null

	if(prob(35))
		r_pocket = pick(
		/obj/item/flashlight/flare/ms13, \
		/obj/item/flashlight/ms13/crafted)
	else
		r_pocket = null

	if(prob(50))
		l_pocket = pick(
		/obj/item/stack/medical/gauze/ms13/half, \
		/obj/item/stack/medical/ointment/ms13/half, \
		/obj/item/stack/medical/ms13/healing_powder, \
		/obj/item/stack/medical/ms13/healing_powder/burn)
	else
		l_pocket = null

	shoes = pick(
        /obj/item/clothing/shoes/ms13/tan, \
		/obj/item/clothing/shoes/ms13/winter, \
		/obj/item/clothing/shoes/ms13/winter/black, \
		/obj/item/clothing/shoes/ms13/rag, \
		/obj/item/clothing/shoes/ms13/brownie, \
		/obj/item/clothing/shoes/ms13/crude)

	if(prob(60))
		back = pick(
		/obj/item/storage/ms13/satchel, \
		/obj/item/storage/ms13/nuka_bag, \
		/obj/item/storage/ms13/corvega_bag, \
		/obj/item/storage/ms13/leather_backpack)
	else
		back = null


/obj/effect/mob_spawn/corpse/human/ms13/nomad
	name = "Nomad"
	outfit = /datum/outfit/job/ms13/wasteland/corpse/drought
	icon_state = "corpsegreytider"

/datum/outfit/job/ms13/wasteland/corpse/drought
	name = "Nomad Corpse"
	jobtype = null

/datum/outfit/job/ms13/wasteland/corpse/drought/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(65))
		head = pick(
		/obj/item/clothing/head/helmet/ms13/cowboy/black,\
		/obj/item/clothing/head/helmet/ms13/baseball,\
		/obj/item/clothing/head/ms13/hood/cowl,\
		/obj/item/clothing/head/ms13/hood/sack,\
		/obj/item/clothing/head/helmet/ms13/fedora,\
		/obj/item/clothing/head/helmet/ms13/fedora/brown,\
		/obj/item/clothing/head/helmet/ms13/cowboy,\
		/obj/item/clothing/head/helmet/ms13/bandanacap, \
		/obj/item/clothing/head/helmet/ms13/flight, \
		/obj/item/clothing/head/helmet/ms13/flight/yellow, \
		/obj/item/clothing/head/helmet/ms13/flight/red, \
		/obj/item/clothing/head/helmet/ms13/eyebot, \
		/obj/item/clothing/head/helmet/ms13/medical, \
		/obj/item/clothing/head/helmet/ms13/batter/red, \
		/obj/item/clothing/head/helmet/ms13/batter/blue, \
		/obj/item/clothing/head/ms13/hood/sack/padded, \
		/obj/item/clothing/head/ms13/hood/sack/metal, \
		/obj/item/clothing/head/ms13/hood/hunter, \
		/obj/item/clothing/head/helmet/ms13/prospector, \
		/obj/item/clothing/head/helmet/ms13/prospector/brown)
	else
		head = null

	if(prob(30))
		glasses = pick(/obj/item/clothing/glasses/ms13/black,\
		/obj/item/clothing/glasses/ms13/cap,\
		/obj/item/clothing/glasses/ms13/old,\
		/obj/item/clothing/glasses/ms13/leather,\
		/obj/item/clothing/glasses/ms13/goggles, \
		/obj/item/clothing/glasses/ms13/sunglasses, \
		/obj/item/clothing/glasses/ms13/cool, \
		/obj/item/clothing/glasses/ms13/metal, \
		/obj/item/clothing/glasses/ms13/welding)
	else
		glasses = null

	if(prob(20))
		mask = pick(
		/obj/item/clothing/mask/ms13/bandana,\
		/obj/item/clothing/mask/ms13/bandana/blue,\
		/obj/item/clothing/mask/ms13/bandana/red,\
		/obj/item/clothing/mask/ms13/bandana/white, \
		/obj/item/clothing/mask/ms13/bandana/green)
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
		/obj/item/clothing/under/ms13/wasteland/roving)

	if(prob(75))
		suit = pick(
		/obj/item/clothing/suit/ms13/ljacket/military,\
		/obj/item/clothing/suit/ms13/ljacket/biker,\
		/obj/item/clothing/suit/ms13/ljacket/bomber, \
		/obj/item/clothing/suit/ms13/ljacket, \
		/obj/item/clothing/suit/armor/ms13/leatherarmor, \
		/obj/item/clothing/suit/ms13/ljacket/reinforced, \
		/obj/item/clothing/suit/armor/ms13/vest/civilian, \
		/obj/item/clothing/suit/ms13/trench/black/reinf, \
		/obj/item/clothing/suit/ms13/trench/brown, \
		/obj/item/clothing/suit/ms13/trench/black, \
		/obj/item/clothing/suit/ms13/trench/, \
		/obj/item/clothing/suit/ms13/duster/reinforced, \
		/obj/item/clothing/suit/ms13/duster, \
		/obj/item/clothing/suit/armor/ms13/kit)
	else
		suit = null

	if(prob(80))
		suit_store = pick(
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm, \
		/obj/item/gun/ballistic/rifle/ms13/varmint, \
		/obj/item/gun/ballistic/revolver/ms13/caravan, \
		/obj/item/gun/ballistic/revolver/ms13/rev10mm, \
		/obj/item/gun/energy/ms13/laser/pistol/wattz, \
		/obj/item/gun/ballistic/rifle/ms13/hunting/surplus, \
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45, \
		/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm, \
		/obj/item/gun/ballistic/revolver/ms13/rev357)
	else
		suit_store = null


	if(prob(85))
		belt = pick(
		/obj/item/knife/ms13, \
		/obj/item/knife/ms13/throwingknife, \
		/obj/item/claymore/ms13/pipe, \
		/obj/item/claymore/ms13/pipe/tireiron, \
		/obj/item/ms13/knuckles/weighted, \
		/obj/item/knife/ms13/hunting, \
		/obj/item/knife/ms13/switchblade, \
		/obj/item/knife/butcher/ms13, \
		/obj/item/crowbar/ms13, \
		/obj/item/weldingtool/ms13, \
		/obj/item/shovel/ms13/spade)
	else
		belt = null

	if(prob(35))
		r_pocket = pick(
		/obj/item/flashlight/flare/ms13, \
		/obj/item/flashlight/ms13/crafted)
	else
		r_pocket = null

	if(prob(50))
		l_pocket = pick(
		/obj/item/stack/medical/gauze/ms13/half, \
		/obj/item/stack/medical/ointment/ms13/half, \
		/obj/item/stack/medical/ms13/healing_powder, \
		/obj/item/stack/medical/ms13/healing_powder/burn)
	else
		l_pocket = null

	shoes = pick(
        /obj/item/clothing/shoes/ms13/tan, \
		/obj/item/clothing/shoes/ms13/winter, \
		/obj/item/clothing/shoes/ms13/winter/black, \
		/obj/item/clothing/shoes/ms13/rag, \
		/obj/item/clothing/shoes/ms13/brownie, \
		/obj/item/clothing/shoes/ms13/crude)

	if(prob(60))
		back = pick(
		/obj/item/storage/ms13/satchel, \
		/obj/item/storage/ms13/nuka_bag, \
		/obj/item/storage/ms13/corvega_bag, \
		/obj/item/storage/ms13/leather_backpack)
	else
		back = null

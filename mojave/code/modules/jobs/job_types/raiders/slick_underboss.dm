/datum/job/ms13/raiders/slick_underboss
	title = "Slickback Underboss"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Boss, if present"
	description = "Expand the Slickbacks' operations in the region and coordinate your underlings to do so. Ensure your Cook is kept in line and working. Peddle, push, and profit!"
	forbid = ""
	enforce = "The Slickbacks expect: Profitable operations, professional conduct and behavior, doing what is needed and best for the gang, but still within reason."

	outfit = /datum/outfit/job/ms13/raiders/slick_underboss

	display_order = JOB_DISPLAY_ORDER_MS13_SLICKUNDERBOSS

/datum/outfit/job/ms13/raiders/slick_underboss
	name = "_Slickback Underboss"
	jobtype = /datum/job/ms13/raiders/slick_underboss

	l_pocket =	 /obj/item/stack/ms13/currency/prewar/underboss
	r_pocket =	 /obj/item/radio/ms13/broadcast
	id =		 /obj/item/card/id/ms13/slick_underboss
	head =		 /obj/item/clothing/head/helmet/ms13/tall/tophat/slick
	shoes =		 /obj/item/clothing/shoes/ms13/fancy
	glasses =	 /obj/item/clothing/glasses/ms13/cool
	uniform =	 /obj/item/clothing/under/ms13/slickback/underboss
	suit =		 /obj/item/clothing/suit/ms13/slickback/underboss
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/deagle
	belt =		 /obj/item/knife/ms13/combat/soviet
	back =		 /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/half=1,\
		/obj/item/stack/medical/ointment/ms13/half=1,\
		/obj/item/ammo_box/magazine/ms13/deagle=2,\
		/obj/item/flashlight/ms13=1,\
		/obj/item/reagent_containers/ms13/inhaler/jet=1,\
		/obj/item/storage/pill_bottle/ms13/daytripper=1,\
		/obj/item/ms13/knuckles=1)

/datum/outfit/job/ms13/raiders/slick_underboss/pre_equip(mob/living/carbon/human/H)
	..()

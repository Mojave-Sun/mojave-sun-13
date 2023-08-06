/datum/job/ms13/raiders/slick_cook
	title = "Slickback Cook"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Slickbacks"
	description = "You are a drug cook for the Slickbacks. Not quite an actual, respected member of the gang but instead more of a lackey with the knowledge to make their chems so the gang can turn a profit, and some medical experience to tend their wounds."
	forbid = ""
	enforce = "The Slickbacks expect: Profitable operations, professional conduct and behavior, doing what is needed and best for the gang, but still within reason."

	outfit = /datum/outfit/job/ms13/raiders/slick_cook

	display_order = JOB_DISPLAY_ORDER_MS13_SLICKBACKCOOK

	mind_traits = list(TRAIT_DRUGGIE)

/datum/outfit/job/ms13/raiders/slick_cook
	name = "_Slickback Cook"
	jobtype = /datum/job/ms13/raiders/slick_cook

	l_pocket =	 /obj/item/stack/ms13/currency/prewar/twenty
	r_pocket =	 /obj/item/flashlight/flare/ms13
	r_hand =	 /obj/item/clothing/mask/gas/ms13
	id =		 /obj/item/card/id/ms13/slick_cook
	uniform =	 /obj/item/clothing/under/ms13/wasteland/peasant
	gloves =	 /obj/item/clothing/gloves/ms13/military
	shoes =		 /obj/item/clothing/shoes/ms13/military/diesel
	belt =		 /obj/item/claymore/ms13/pipe
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/chinese
	suit =		 /obj/item/clothing/suit/hooded/ms13/hazmat
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/half=1,\
		/obj/item/stack/medical/ointment/ms13/half=1,\
		/obj/item/reagent_containers/hypospray/medipen/ms13/medx=1,\
		/obj/item/reagent_containers/ms13/inhaler/hydra=1,\
		/obj/item/stack/medical/suture/ms13/eight=1,\
		/obj/item/stack/medical/splint/ms13/wooden=1)


/datum/outfit/job/ms13/raiders/slick_cook/pre_equip(mob/living/carbon/human/H)
	..()

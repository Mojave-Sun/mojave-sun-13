/datum/job/ms13/town_drought/denizen
	title = "Town Denizen"
	total_positions = 8
	spawn_positions = 8
	supervisors = "The Baron and his Enforcers"
	description = "You're a resident of the Town and a humble servant of the Baron! You live a better life here than out in the wastes, under the protection and supervision of the Baron and his Enforcers. Try to make yourself useful in some way, there's work to be done everywhere."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town_drought/denizen

	display_order = JOB_DISPLAY_ORDER_MS13_DENIZEN

/datum/outfit/job/ms13/town_drought/denizen
	name = "_Town Denizen"
	jobtype = /datum/job/ms13/town_drought/denizen

	id =		 /obj/item/card/id/ms13/drought_denizen
	r_pocket =   /obj/item/stack/ms13/currency/cap/twentyfive
	back =       null

/datum/outfit/job/ms13/town_drought/denizen/pre_equip(mob/living/carbon/human/H)
	..()

	uniform = pick(
			/obj/item/clothing/under/ms13/wasteland/pants,\
			/obj/item/clothing/under/ms13/wasteland/rag,\
			/obj/item/clothing/under/ms13/wasteland/worn,\
			/obj/item/clothing/under/ms13/wasteland/peasant,\
			/obj/item/clothing/under/ms13/wasteland/wanderer,\
			/obj/item/clothing/under/ms13/wasteland/rancher,\
			/obj/item/clothing/under/ms13/wasteland/vestslacks,\
			/obj/item/clothing/under/ms13/wasteland/merchant)

	shoes = pick(
			/obj/item/clothing/shoes/ms13/crude,\
			/obj/item/clothing/shoes/ms13/rag,\
			/obj/item/clothing/shoes/ms13/tan,\
			/obj/item/clothing/shoes/ms13/brownie)

	if(prob(25))
		suit = pick(
			/obj/item/clothing/suit/ms13/ljacket/moleskin,\
			/obj/item/clothing/suit/ms13/ljacket/wanderer,\
			/obj/item/clothing/suit/ms13/ljacket/military,\
			/obj/item/clothing/suit/ms13/ljacket/musty,\
			/obj/item/clothing/suit/ms13/vest,\
			/obj/item/clothing/suit/ms13/vest/brown)

	if(prob(25))
		head = pick(
			/obj/item/clothing/head/ms13/hood/cowl,\
			/obj/item/clothing/head/helmet/ms13/newsboy,\
			/obj/item/clothing/head/helmet/ms13/baseball,\
			/obj/item/clothing/head/helmet/ms13/cowboy,\
			/obj/item/clothing/head/helmet/ms13/bandanacap,\
			/obj/item/clothing/head/helmet/ms13/trilby)

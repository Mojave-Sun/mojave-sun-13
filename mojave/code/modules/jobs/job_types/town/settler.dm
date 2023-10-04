/datum/job/ms13/town/settler
	title = "Snowcrest Citizen"
	total_positions = 8
	spawn_positions = 8
	supervisors = "NCR law enforcement, the Mayor and his bodyguards"
	description = "You're a lucky resident of Snowcrest! You've made a nice life for yourself and enjoy the luxuries of civilization in the post-apocalypse. Try to make yourself useful in some way, there's work to be done everywhere."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/settler

	display_order = JOB_DISPLAY_ORDER_MS13_SETTLER

/datum/outfit/job/ms13/town/settler
	name = "_Snowcrest Citizen"
	jobtype = /datum/job/ms13/town/settler

	id =		 /obj/item/card/id/ms13/town
	r_pocket =   /obj/item/stack/ms13/currency/prewar/eighty
	back =       null

/datum/outfit/job/ms13/town/settler/pre_equip(mob/living/carbon/human/H)
	..()

	if(prob(35))
		uniform = pick(
			/obj/item/clothing/under/ms13/wasteland/vestslacks, \
			/obj/item/clothing/under/ms13/wasteland/merchant, \
			/obj/item/clothing/under/ms13/wasteland/whiteshirt, \
			/obj/item/clothing/under/ms13/wasteland/prewar/relaxedwear)
	else
		uniform = /obj/item/clothing/under/ms13/wasteland/snowcrest

	shoes = pick(
			/obj/item/clothing/shoes/ms13/winter, \
			/obj/item/clothing/shoes/ms13/winter/black, \
			/obj/item/clothing/shoes/ms13/tan,\
			/obj/item/clothing/shoes/ms13/brownie)

	if(prob(40))
		belt = pick(
			/obj/item/knife/ms13, \
			/obj/item/knife/ms13/switchblade/razor, \
			/obj/item/ms13/hammer, \
			/obj/item/ms13/knuckles, \
			/obj/item/crowbar/ms13)
	else
		belt = null

	if(prob(20))
		glasses = pick(/obj/item/clothing/glasses/ms13/black,\
		/obj/item/clothing/glasses/ms13/old,\
		/obj/item/clothing/glasses/ms13/sunglasses, \
		/obj/item/clothing/glasses/ms13/cool)
	else
		glasses = null

	if(prob(65))
		suit = pick(
			/obj/item/clothing/suit/ms13/ljacket/wanderer,\
			/obj/item/clothing/suit/ms13/ljacket/military,\
			/obj/item/clothing/suit/ms13/ljacket/bomber, \
			/obj/item/clothing/suit/toggle/ms13/wjacket/orange, \
			/obj/item/clothing/suit/toggle/ms13/wjacket/brown, \
			/obj/item/clothing/suit/toggle/ms13/wjacket/blue, \
			/obj/item/clothing/suit/toggle/ms13/wjacket/black, \
			/obj/item/clothing/suit/ms13/ljacket/biker, \
			/obj/item/clothing/suit/ms13/vest/letterman, \
			/obj/item/clothing/suit/ms13/vest/black)
	else
		suit = null

	if(prob(35))
		head = pick(
		/obj/item/clothing/head/helmet/ms13/cowboy/black,\
		/obj/item/clothing/head/helmet/ms13/baseball,\
		/obj/item/clothing/head/helmet/ms13/fedora,\
		/obj/item/clothing/head/helmet/ms13/fedora/brown,\
		/obj/item/clothing/head/helmet/ms13/fedora/yellow, \
		/obj/item/clothing/head/helmet/ms13/fedora/blue, \
		/obj/item/clothing/head/helmet/ms13/bowler,\
		/obj/item/clothing/head/helmet/ms13/cowboy,\
		/obj/item/clothing/head/helmet/ms13/newsboy,\
		/obj/item/clothing/head/helmet/ms13/beanie,\
		/obj/item/clothing/head/helmet/ms13/trilby)
	else
		head = null

/datum/job/ms13/town/squatter
	title = "Snowcrest Squatter"
	total_positions = -1
	spawn_positions = -1
	supervisors = "NCR law enforcement, the Mayor and his bodyguards"
	description = "You're a not so lucky resident of Snowcrest! Whether you are residing in Snowcrest legally or not isn't important. You don't have much to your name and most of Snowcrest and the NCR garrison views you with contempt and disdain. Just try and survive, maybe even make a living."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/squatter

	display_order = JOB_DISPLAY_ORDER_MS13_SQUATTER

	guestbook_flags = GUESTBOOK_FORGETMENOT //anonymity from the rest of town

/datum/outfit/job/ms13/town/squatter
	name = "_Snowcrest Squatter"
	jobtype = /datum/job/ms13/town/squatter

	back =       null

/datum/outfit/job/ms13/town/squatter/pre_equip(mob/living/carbon/human/H)
	..()

	if(prob(10))
		uniform = /obj/item/clothing/under/ms13/wasteland/snowcrest
	else
		uniform = pick(
			/obj/item/clothing/under/ms13/wasteland/peasant, \
			/obj/item/clothing/under/ms13/wasteland/worn, \
			/obj/item/clothing/under/ms13/wasteland/rag, \
			/obj/item/clothing/under/ms13/wasteland/ghoulpants, \
			/obj/item/clothing/under/ms13/wasteland/pants, \
			/obj/item/clothing/under/ms13/wasteland/wanderer)

	if(prob(90))
		shoes = pick(
			/obj/item/clothing/shoes/ms13/crude, \
			/obj/item/clothing/shoes/ms13/tan,\
			/obj/item/clothing/shoes/ms13/rag)
	else
		shoes = null

	if(prob(20))
		r_pocket = pick(
			/obj/item/stack/ms13/currency/prewar/ten, \
			/obj/item/stack/ms13/currency/ncr_dollar/five, \
			/obj/item/stack/ms13/currency/ncr_coin/two)

	if(prob(10))
		belt = pick(
			/obj/item/knife/ms13/switchblade/razor, \
			/obj/item/ms13/knuckles, \
			/obj/item/ms13/brick, \
			/obj/item/screwdriver/ms13)
	else
		belt = null

	if(prob(80))
		id = /obj/item/card/id/ms13/visa
	else
		id = null

	if(prob(30))
		suit = pick(
			/obj/item/clothing/suit/ms13/ljacket/wanderer,\
			/obj/item/clothing/suit/ms13/ljacket/moleskin, \
			/obj/item/clothing/suit/ms13/vest, \
			/obj/item/clothing/suit/ms13/ljacket/musty, \
			/obj/item/clothing/suit/ms13/trench/leather)
	else
		suit = null

	if(prob(20))
		head = pick(
		/obj/item/clothing/head/helmet/ms13/baseball,\
		/obj/item/clothing/head/helmet/ms13/cowboy,\
		/obj/item/clothing/head/helmet/ms13/newsboy,\
		/obj/item/clothing/head/helmet/ms13/beanie,\
		/obj/item/clothing/head/ms13/hood/cowl,\
		/obj/item/clothing/head/helmet/ms13/bandanacap,\
		/obj/item/clothing/head/helmet/ms13/chef,\
		/obj/item/clothing/head/helmet/ms13/fisher)
	else
		head = null

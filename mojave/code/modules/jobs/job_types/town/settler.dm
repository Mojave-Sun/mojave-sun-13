/datum/job/ms13/town/settler
	title = "Town Settler"
	total_positions = 10
	spawn_positions = 10
	supervisors = "Law enforcement, The Mayor."
	description = "You're a lucky resident of the Town! This abandoned vault was reclaimed long ago, and you have moved in at some point along with the rest of the waster scum. Try to make yourself useful in some way, there's work to be done everywhere."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/ms13/town/settler

	display_order = JOB_DISPLAY_ORDER_MS13_SETTLER

/datum/outfit/job/ms13/town/settler
	name = "_Town Settler"
	jobtype = /datum/job/ms13/town/settler

	id =		 /obj/item/card/id/ms13/town
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	r_pocket =   /obj/item/stack/ms13/currency/prewar/sixty
	back =       null

/datum/outfit/job/ms13/town/settler/pre_equip(mob/living/carbon/human/H)
	..()

	if(prob(40))
		suit = pick(
			/obj/item/clothing/suit/ms13/ljacket/moleskin,\
			/obj/item/clothing/suit/ms13/ljacket/wanderer,\
			/obj/item/clothing/suit/ms13/ljacket/military,\
			/obj/item/clothing/suit/ms13/ljacket/musty,\
			/obj/item/clothing/suit/ms13/ljacket/bomber, \
			/obj/item/clothing/suit/toggle/ms13/wjacket/orange, \
			/obj/item/clothing/suit/toggle/ms13/wjacket/brown, \
			/obj/item/clothing/suit/toggle/ms13/wjacket/blue, \
			/obj/item/clothing/suit/toggle/ms13/wjacket/black)

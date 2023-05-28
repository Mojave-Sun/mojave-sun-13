/datum/job/ms13/legion/legion_smith
	title = "Legion Blacksmith"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Veteran Decanus"
	description = "Ensure your fellow Legionaries are properly supplied and armed for the fights to come. Listen to orders from the Decanus."

	outfit = /datum/outfit/job/ms13/legion/legion_smith

	display_order = JOB_DISPLAY_ORDER_MS13_LEGIONSMITH

	mind_traits = list(TRAIT_LEGION_SMITHING)

/datum/outfit/job/ms13/legion/legion_smith
	name = "_Legion Blacksmith"
	jobtype = /datum/job/ms13/legion/legion_smith

	uniform = /obj/item/clothing/under/ms13/legion/fatigues
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/prime
	gloves = /obj/item/clothing/gloves/ms13/legion/dark
	suit_store = /obj/item/gun/ballistic/revolver/ms13/caravan
	belt = /obj/item/claymore/ms13/machete/gladius
	r_pocket = /obj/item/ms13/hammer
	l_pocket = /obj/item/flashlight/flare/ms13
	id = /obj/item/card/id/ms13/blacksmith
	backpack_contents = list(
		/obj/item/ammo_box/ms13/shotgun/junkshot=1,\
		/obj/item/ms13/handsaw=1,\
		/obj/item/stack/ms13/currency/denarius/five=1)

/datum/outfit/job/ms13/legion/legion_smith/pre_equip(mob/living/carbon/human/H)
	..()

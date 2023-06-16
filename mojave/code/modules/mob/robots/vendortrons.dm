/mob/living/simple_animal/hostile/retaliate/trader/ms13
	name = "vendortron"
	desc = "You shouldn't be seeing this...."
	icon = 'mojave/icons/mob/ms13vendotrons.dmi'
	icon_state = "vendotron_blue"
	maxHealth = 350
	health = 350
	melee_damage_lower = 15
	melee_damage_upper = 15
	wound_bonus = 0
	bare_wound_bonus = 0
	sharpness = NONE
	attack_verb_continuous = "smacks"
	attack_verb_simple = "smack"
	attack_sound = 'mojave/sound/ms13weapons/meleesounds/general_grip.ogg'
	loot = list(/obj/item/stack/sheet/ms13/scrap/two, /obj/effect/decal/cleanable/robot_debris, /obj/item/stack/sheet/ms13/glass, /obj/item/stack/sheet/ms13/scrap_electronics, /obj/item/stack/sheet/ms13/scrap_parts)
	stat_attack = SOFT_CRIT
	ranged = TRUE
	ranged_cooldown = 2.5 SECONDS
	casingtype = /obj/item/ammo_casing/energy/ms13/laser/protectron
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_3.ogg'
	loot = null
	wander = FALSE
	ranged = TRUE
	combat_mode = TRUE
	move_resist = MOVE_FORCE_STRONG
	mob_biotypes = MOB_ROBOTIC
	move_to_delay = 6
	speed = 3
	stat_attack = SOFT_CRIT
	robust_searching = TRUE
	check_friendly_fire = TRUE
	speech_span = SPAN_ROBOT
	speak_emote = list("states", "says", "responds")
	currency_name = "dollars"
	accepted_currency = /obj/item/stack/ms13/currency/prewar

/mob/living/simple_animal/hostile/retaliate/trader/ms13/initial_wanteds()
	return list() //Traders only sell for now, they don't buy

/mob/living/simple_animal/hostile/retaliate/trader/ms13/gunrunner
	name = "\improper Gun Runners vendortron"
	desc = "A vendortron used by the Gun Runners for sale of firearms far and wide."
	icon_state = "vendotron_green"

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"Sir or madam, that product exchange will not be accepted."
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"Sir or madam, please reconsider your choice and do your business with Gun Runners!"
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Sir or madam, thank you for your exchange."
		),
		INTERESTED_PHRASE = list(
			"Sir or madam, you have an item that is of interest to Gun Runners. Please consider an exchange."
		),
		BUY_PHRASE = list(
			"I hope you are satisfied with your purchase. Come back and see us again soon."
		),
		NO_CASH_PHRASE = list(
			"Sir or madam, you do not have sufficient funds for this purchase."
		),
		NO_STOCK_PHRASE = list(
			"That product is not currently in stock. Please come back later."
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Unavailable." //unused?
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"This item has no value."
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"Enough of this item has been exchanged. Please peruse our other Gun Runners merchandise."
		),
		TRADER_LORE_PHRASE = list(
			"All Gun Runner merchandise is constructed at Gun Runner facilities.",
			"Gun Runners. Supplying only the finest armaments since 2155.",
			"Acquire a Gun Runners arsenal today!"
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"This unit is only programmed to sell products." //unused
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Product sale is currently unavailable due to unexpected circumstances. Please come back later."
		),
	)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/gunrunner/initial_products()
	return list(
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm = list(80, rand(2,4)),
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol22 = list(55, rand(2,4)),
		/obj/item/gun/ballistic/revolver/ms13/rev10mm = list(80, rand(2,4)),
		/obj/item/gun/ballistic/rifle/ms13/varmint = list(80, rand(2,4)),
		/obj/item/gun/ballistic/revolver/ms13/single = list(45, rand(2,4)),
		/obj/item/gun/ballistic/revolver/ms13/caravan = list(90, rand(2,3)),
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45 = list(150, rand(1,3)),
		/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm = list(150, rand(1,3)),
		/obj/item/gun/ballistic/revolver/ms13/rev556 = list(150, rand(0,3)),
		/obj/item/gun/ballistic/revolver/ms13/rev357/police = list(160, rand(0,3)),
		/obj/item/gun/ballistic/revolver/ms13/rev357 = list(160, rand(0,3)),
		/obj/item/gun/ballistic/automatic/ms13/semi/service = list(320, rand(0,3)),
		/obj/item/gun/ballistic/automatic/ms13/full/smg9mm = list(330, rand(0,2)),
		/obj/item/gun/ballistic/shotgun/ms13/lever = list(320, rand(0,2)),
		/obj/item/gun/ballistic/shotgun/ms13/lever/cowboy = list(260, rand(0,3)),
		/obj/item/gun/ballistic/shotgun/ms13/lever/trail = list(420, rand(0,1)),
		/obj/item/gun/ballistic/revolver/ms13/rev44 = list(280, rand(0,2)),
		/obj/item/gun/ballistic/rifle/ms13/hunting = list(440, rand(0,1)),
		/obj/item/gun/ballistic/automatic/ms13/full/smg10mm = list(480, rand(0,1)),
		/obj/item/gun/ballistic/automatic/ms13/full/smg22 = list(600, rand(0,1)),
		/obj/item/ammo_box/ms13/c22box = list(240, rand(0,3)),
		/obj/item/ammo_box/ms13/c9mm = list(240, rand(0,3)),
		/obj/item/ammo_box/ms13/c10mm = list(220, rand(0,2)),
		/obj/item/ammo_box/ms13/c45 = list(200, rand(0,2)),
		/obj/item/ammo_box/ms13/a556 = list(365, rand(0,2)),
		/obj/item/ammo_box/ms13/m44box = list(300, rand(0,2)),
		/obj/item/ammo_box/ms13/a357box = list(240, rand(0,2)),
		/obj/item/ammo_box/ms13/a308 = list(300, rand(0,2)),
		/obj/item/ammo_box/ms13/a762 = list(300, rand(0,2)),
		/obj/item/ammo_box/ms13/c4570box = list(280, rand(0,2)),
		/obj/item/ammo_box/ms13/m12mmbox = list(340, rand(0,1)),
		/obj/item/ammo_box/ms13/a50MG = list(420, rand(0,1)),
		/obj/item/ammo_box/ms13/shotgun/buckshot = list(210, rand(0,4))
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/gunrunner/initial_wanteds()
	return list(
		/obj/item/ms13/component/gunpowder/lq = list(35, rand(0,6), ""),
		/obj/item/ms13/component/gunpowder = list(85, rand(0,6), ""),
		/obj/item/stack/sheet/ms13/scrap_lead = list(4, rand(5,30), ", per piece of lead"),
		/obj/item/stack/sheet/ms13/scrap_brass = list(4, rand(5,30), ", per piece of brass"),
		/obj/item/stack/sheet/ms13/refined_lead = list(30, rand(0,10), ", per ingot of lead"),
		/obj/item/stack/sheet/ms13/refined_brass = list(30, rand(0,10), ", per ingot of brass")
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/medtek
	name = "\improper Med-Tek vendortron"
	desc = "A pre-war vendortron that provides medical supplies. Probably outlived everyone it was supposed to help treat."
	icon_state = "vendotron_white"

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"This unit is not authorized for such a purchase. If you think this is an error please contact the nearest customer service representative."
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"Think of what you're losing by not doing business with Med-Tek!"
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Med-Tek thanks you for helping the world be a healthier place!"
		),
		INTERESTED_PHRASE = list(
			"You have an item of scientific and/or chemical and/or financial interest to Med-Tek. Consider a transaction."
		),
		BUY_PHRASE = list(
			"Thank you for choosing Med-Tek. Stay healthy and stay safe!"
		),
		NO_CASH_PHRASE = list(
			"Insufficient funds. Please contact your insurance provider to pursue alternative payment options."
		),
		NO_STOCK_PHRASE = list(
			"Product out of stock. Return later."
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Unavailable." //unused?
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"This item has no value."
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"Desired stock has been reached. Med-Tek can no longer offer compensation for that item."
		),
		TRADER_LORE_PHRASE = list(
			"Need help studying? Can't focus? Just want a little edge? Try Mentats today!",
			"When you think healthy, think Med-Tek.",
			"Join the cutting edge Med-Tek team today at our nearest office in.... Error, locational data not found."
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"This unit is only programmed to sell products." //unused
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Product sale is currently unavailable due to unexpected circumstances. Please come back later."
		),
	)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/medtek/initial_products()
	return list(
		/obj/item/stack/medical/gauze/ms13/half = list(35, rand(4,6)),
		/obj/item/stack/medical/splint/ms13/wooden = list(20, rand(3,6)),
		/obj/item/stack/medical/splint/ms13 = list(30, rand(2,5)),
		/obj/item/stack/medical/suture/ms13/four = list(35, rand(3,6)),
		/obj/item/stack/medical/ointment/ms13/half = list(35, rand(3,6)),
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak = list(110, rand(0,2)),
		/obj/item/reagent_containers/blood/ms13/o_minus = list(40, rand(0,3)),
		/obj/item/reagent_containers/blood/ms13/radaway = list(40, rand(0,3)),
		/obj/item/storage/firstaid/ms13/bag/filled = list(140, rand(0,1)),
		/obj/item/reagent_containers/hypospray/medipen/ms13/calmex = list(60, rand(1,4)),
		/obj/item/storage/pill_bottle/ms13/daytripper = list(180, rand(0,2)),
		/obj/item/reagent_containers/hypospray/medipen/ms13/medx = list(180, rand(0,3)),
		/obj/item/storage/pill_bottle/ms13/radx = list(200, rand(0,2)),
		/obj/item/storage/pill_bottle/ms13/cateye = list(190, rand(0,2)),
		/obj/item/storage/pill_bottle/ms13/buffout = list(260, rand(0,1)),
		/obj/item/storage/pill_bottle/ms13/mentat = list(200, rand(0,2)),
		/obj/item/reagent_containers/hypospray/medipen/ms13/addictol = list(360, rand(0,1))
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/medtek/initial_wanteds()
	return list(
		/obj/item/stack/sheet/ms13/glass = list(3, rand(5,30), ", per piece of glass"),
		/obj/item/stack/sheet/ms13/ceramic = list(4, rand(5,30), ", per piece of ceramic"),
		/obj/item/stack/sheet/ms13/plastic = list(4, rand(5,30), ", per piece of plastic"),
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/armor
	name = "\improper Arcata Armorers vendortron"
	desc = "A vendortron used by a small armoring company for distribution and sale of their products."
	icon_state = "vendotron_red"

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"No interest in offered item."
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"Reconsider. Exchange would be mutually beneficial."
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Transaction processed. Thank you for conducting business."
		),
		INTERESTED_PHRASE = list(
			"Item of interest detected. Monetary compensation can be offered for an exchange."
		),
		BUY_PHRASE = list(
			"Sale processed. Thank you for your patronage."
		),
		NO_CASH_PHRASE = list(
			"Error, please provide additional payment or return at a later time."
		),
		NO_STOCK_PHRASE = list(
			"Product out of stock. Return later."
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Unavailable." //unused?
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"This item has no value."
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"No longer interested in that item. Reconsider."
		),
		TRADER_LORE_PHRASE = list(
			"Providing quality, life saving armor since 2245!",
			"Choose Arcata Armorers today! You never know when we might save your life!"
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"This unit is only programmed to sell products." //unused
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Product sale is currently unavailable due to unexpected circumstances. Please come back later."
		),
	)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/armor/initial_products()
	return list(
		/obj/item/clothing/suit/ms13/ljacket = list(40, rand(1,4)),
		/obj/item/clothing/suit/ms13/veteran_coat = list(40, rand(1,4)),
		/obj/item/clothing/suit/ms13/ljacket/wanderer = list(40, rand(1,4)),
		/obj/item/clothing/suit/ms13/ljacket/military = list(40, rand(1,4)),
		/obj/item/clothing/suit/ms13/duster = list(40, rand(1,4)),
		/obj/item/clothing/suit/ms13/trench/black = list(40, rand(1,4)),
		/obj/item/clothing/suit/ms13/trench/black/bruiser = list(40, rand(1,4)),
		/obj/item/clothing/suit/toggle/ms13/wjacket/orange = list(40, rand(1,4)),
		/obj/item/clothing/suit/toggle/ms13/wjacket/brown = list(40, rand(1,4)),
		/obj/item/clothing/suit/toggle/ms13/wjacket/blue = list(40, rand(1,4)),
		/obj/item/clothing/suit/toggle/ms13/wjacket/black = list(40, rand(1,4)),
		/obj/item/clothing/suit/armor/ms13/vest/civilian = list(60, rand(0,3)),
		/obj/item/clothing/suit/ms13/ljacket/reinforced = list(140, rand(0,3)),
		/obj/item/clothing/suit/ms13/veteran_coat/reinf = list(140, rand(0,3)),
		/obj/item/clothing/suit/toggle/ms13/wjacket/orange/reinforced = list(140, rand(0,3)),
		/obj/item/clothing/suit/toggle/ms13/wjacket/brown/reinforced = list(140, rand(0,3)),
		/obj/item/clothing/suit/toggle/ms13/wjacket/blue/reinforced = list(140, rand(0,3)),
		/obj/item/clothing/suit/toggle/ms13/wjacket/black/reinforced = list(140, rand(0,3)),
		/obj/item/clothing/suit/ms13/duster/reinforced = list(140, rand(0,3)),
		/obj/item/clothing/suit/armor/ms13/leatherarmor = list(140, rand(0,3)),
		/obj/item/clothing/suit/armor/ms13/metal = list(160, rand(0,2)),
		/obj/item/clothing/suit/armor/ms13/vest = list(160, rand(0,2)),
		/obj/item/clothing/suit/armor/ms13/metal/reinforced = list(360, rand(0,1)),
		/obj/item/clothing/suit/armor/ms13/combat = list(400, rand(0,1)),
		/obj/item/clothing/suit/armor/ms13/leatherarmor/reinforced = list(360, rand(0,1)),
		/obj/item/clothing/head/helmet/ms13/flight = list(60, rand(1,3)),
		/obj/item/clothing/head/helmet/ms13/flight/yellow = list(60, rand(1,3)),
		/obj/item/clothing/head/helmet/ms13/flight/red = list(60, rand(1,3)),
		/obj/item/clothing/head/helmet/ms13/eyebot = list(60, rand(1,3)),
		/obj/item/clothing/head/ms13/hood/plated = list(60, rand(1,3)),
		/obj/item/clothing/head/helmet/ms13/army/civildefence = list(80, rand(0,2)),
		/obj/item/clothing/head/helmet/ms13/assaultron = list(130, rand(0,1)),
		/obj/item/clothing/head/helmet/ms13/combat = list(150, rand(0,1)),
		/obj/item/stack/sheet/ms13/cloth/five = list(25, rand(4,6)),
		/obj/item/stack/sheet/ms13/leather/five = list(25, rand(4,6)),
		/obj/item/stack/sheet/ms13/thread/six = list(35, rand(2,5))
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/armor/initial_wanteds()
	return list(
		/obj/item/stack/sheet/ms13/cloth = list(4, rand(5,30), ", per piece of cloth"),
		/obj/item/stack/sheet/ms13/leather = list(4, rand(5,30), ", per piece of leather"),
		/obj/item/stack/sheet/ms13/thread = list(5, rand(4,20), ", per piece of thread"),
		/obj/item/stack/sheet/ms13/mil_fiber = list(35, rand(0,10), ", per piece of fiber"),
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/tools
	name = "\improper H&H Tools vendortron"
	desc = "A pre-war vendortron that provides tools and construction supplies."
	icon_state = "vendotron_yellow"

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"We are not interested in that product at this time."
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"You're missing out by not doing business with H&H!"
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"H&H thanks you for doing business!"
		),
		INTERESTED_PHRASE = list(
			"We are willing to buy an item you own, consider doing business with H&H today!"
		),
		BUY_PHRASE = list(
			"Thank you for trusting H&H!"
		),
		NO_CASH_PHRASE = list(
			"You seem to lack the funds for this purchase. Payment plans are available by contacting our nearest sales associate!"
		),
		NO_STOCK_PHRASE = list(
			"That product is out of stock. We apologize for the inconvenience."
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Unavailable." //unused?
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"That item has no value."
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"Quota has been met. No more purchases of that item will be made."
		),
		TRADER_LORE_PHRASE = list(
			"Choose H&H Tools for your next home improvement project!",
			"Notice: This unit is still processing a change in security protocols. Customers are advised to exercise caution.",
			"H&H Tools. Your one stop shop for all things handy!"
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"This unit is only programmed to sell products." //unused
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Product sale is currently unavailable due to unexpected circumstances. Please come back later."
		),
	)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/tools/initial_products()
	return list(
		/obj/item/ms13/hammer = list(40, rand(2,4)),
		/obj/item/wrench/ms13 = list(30, rand(2,4)),
		/obj/item/wirecutters/ms13 = list(30, rand(2,4)),
		/obj/item/screwdriver/ms13 = list(30, rand(2,4)),
		/obj/item/shovel/ms13/spade = list(60, rand(1,3)),
		/obj/item/crowbar/ms13 = list(60, rand(1,3)),
		/obj/item/ms13/handsaw = list(60, rand(1,3)),
		/obj/item/ms13/handdrill = list(50, rand(1,3)),
		/obj/item/claymore/ms13/pipe = list(60, rand(1,3)),
		/obj/item/claymore/ms13/pipe/tireiron = list(60, rand(1,3)),
		/obj/item/weldingtool/ms13 = list(80, rand(1,2)),
		/obj/item/clothing/glasses/ms13/welding = list(50, rand(1,2)),
		/obj/item/flashlight/ms13 = list(80, rand(1,2)),
		/obj/item/flashlight/flare/ms13 = list(20, rand(2,4)),
		/obj/item/flashlight/ms13/mag = list(160, rand(0,2)),
		/obj/item/clothing/head/helmet/ms13/hardhat = list(50, rand(1,4)),
		/obj/item/clothing/head/hardhat/ms13/mining = list(100, rand(0,2)),
		/obj/item/ms13/tools/fishing_rod/telescopic = list(200, rand(0,1)),
		/obj/item/ms13/twohanded/hammer = list(350, rand(0,1)),
		/obj/item/stack/sheet/ms13/scrap_parts/five = list(25, rand(4,6)),
		/obj/item/stack/sheet/ms13/scrap/five = list(25, rand(4,6)),
		/obj/item/stack/sheet/ms13/scrap_steel/five = list(25, rand(4,6)),
		/obj/item/stack/sheet/ms13/scrap_lead/five = list(25, rand(4,6)),
		/obj/item/stack/sheet/ms13/scrap_brass/five = list(25, rand(4,6)),
		/obj/item/stack/sheet/ms13/scrap_alu/five = list(25, rand(4,6)),
		/obj/item/stack/sheet/ms13/wood/plank/four = list(25, rand(3,5))
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/tools/initial_wanteds()
	return list(
		/obj/item/stack/sheet/ms13/scrap_parts = list(4, rand(5,30), ", per piece of parts"),
		/obj/item/stack/sheet/ms13/scrap = list(4, rand(5,30), ", per piece of scrap"),
		/obj/item/stack/sheet/ms13/scrap_steel = list(4, rand(5,30), ", per piece of steel"),
		/obj/item/stack/sheet/ms13/scrap_alu = list(4, rand(5,30), ", per piece of aluminum"),
		/obj/item/stack/sheet/ms13/wood/plank = list(5, rand(4,20), ", per plank"),
		/obj/item/stack/sheet/ms13/scrap_copper = list(4, rand(5,30), ", per piece of copper wire"),
		/obj/item/stack/sheet/ms13/scrap_gold = list(7, rand(5,25), ", per piece of gold"),
		/obj/item/stack/sheet/ms13/scrap_silver = list(7, rand(5,25), ", per piece of silver"),
		/obj/item/stack/sheet/ms13/refined_gold = list(45, rand(1,6), ", per ingot of gold"),
		/obj/item/stack/sheet/ms13/refined_silver = list(45, rand(1,6), ", per ingot of silver")
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/robco
	name = "\improper RobCo vendortron"
	desc = "A pre-war vendortron that provides electronics and electronics related supplies."
	icon_state = "vendotron_blue"

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"RobCo is not interested in that item at this time."
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"We hope you change your mind and return to complete your exchange!"
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"We hope you will choose to do business with RobCo again!"
		),
		INTERESTED_PHRASE = list(
			"You have an item of interest to RobCo and we are willing to take it off your hands!"
		),
		BUY_PHRASE = list(
			"We hope you come back to choose RobCo again!"
		),
		NO_CASH_PHRASE = list(
			"You are lacking proper funds for this purchase. Please return at a later date with sufficient funds."
		),
		NO_STOCK_PHRASE = list(
			"That product is out of stock. We apologize for the inconvenience."
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Unavailable." //unused?
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"That item has no value."
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"We have acquired enough of that item for now. Please return later for another exchange opportunity!"
		),
		TRADER_LORE_PHRASE = list(
			"Always choose RobCo for your electronics needs!",
			"Trust RobCo not just with your personal computers, but your company computers as well!",
			"When you need electronics, you come to RobCo!"
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"This unit is only programmed to sell products." //unused
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Product sale is currently unavailable due to unexpected circumstances. Please come back later."
		),
	)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/robco/initial_products()
	return list(
		/obj/item/ms13/component/cell = list(40, rand(2,4)),
		/obj/item/stack/sheet/ms13/scrap_electronics/five = list(25, rand(4,6)),
		/obj/item/stack/sheet/ms13/scrap_copper/five = list(25, rand(4,6)),
		/obj/item/stack/sheet/ms13/circuits/two = list(60, rand(0,4)),
		/obj/item/ms13/component/vacuum_tube = list(60, rand(0,2)),
		/obj/item/stock_parts/cell/ms13/ec = list(50, rand(1,3)),
		/obj/item/stock_parts/cell/ms13/mfc = list(80, rand(1,2)),
		/obj/item/stock_parts/cell/ms13/ecp = list(100, rand(0,2)),
		/obj/item/gun/energy/ms13/laser/pistol/wattz = list(100, rand(0,2)),
		/obj/item/gun/energy/ms13/laser/rifle/wattz = list(130, rand(0,2)),
		/obj/item/radio/ms13 = list(90, rand(1,3)),
		/obj/item/radio/ms13/broadcast = list(150, rand(0,2)),
		/obj/item/clothing/ms13/stealthboy = list(650, rand(0,1))
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/robco/initial_wanteds()
	return list(
		/obj/item/stack/sheet/ms13/scrap_electronics = list(4, rand(5,30), ", per piece of electronics"),
		/obj/item/stack/sheet/ms13/circuits = list(25, rand(0,10), ", per piece of circuits"),
		/obj/item/ms13/component/cell = list(30, rand(0,6), ""),
		/obj/item/ms13/component/vacuum_tube = list(50, rand(0,6), ""),
		/obj/item/radio/ms13 = list(75, rand(0,4), ""),
		/obj/item/radio/ms13/broadcast = list(135, rand(0,3), ""),
		/obj/item/radio/ms13/broadcast/advanced = list(225, rand(0,3), ""),
		/obj/item/stack/sheet/ms13/scrap_gold = list(7, rand(5,25), ", per piece of gold"),
		/obj/item/stack/sheet/ms13/scrap_silver = list(7, rand(5,25), ", per piece of silver"),
		/obj/item/stack/sheet/ms13/refined_gold = list(45, rand(1,6), ", per ingot of gold"),
		/obj/item/stack/sheet/ms13/refined_silver = list(45, rand(1,6), ", per ingot of silver")
				)


/// DROUGHT TRADERS BELOW ///

/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought
	currency_name = "caps"
	accepted_currency = /obj/item/stack/ms13/currency/cap

/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought/fargo
	name = "\improper Far Go Arms and Armor vendortron"
	desc = "A vendortron operating with Far Go Traders. This one specializes in guns and armor, for a safer wasteland!"
	icon_state = "vendotron_green"

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"Far Go Traders is not interested in that item at this time, deepest apologies!"
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"Far Go Traders urges you to reconsider and purchase some of our fine arms and armor!"
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Far Go Traders thanks you for your exchange and we hope to see you again soon! Stay safe!"
		),
		INTERESTED_PHRASE = list(
			"Far Go Traders is interested in an item that you possess. Would you consider an exchange?"
		),
		BUY_PHRASE = list(
			"Far Go Traders thanks you for your business and we hope to see you again soon! Stay safe!"
		),
		NO_CASH_PHRASE = list(
			"Far Go Traders cannot complete that purchase without sufficient funds. Lines of credit are also not yet available in this region. Please come back with sufficient funds."
		),
		NO_STOCK_PHRASE = list(
			"That product is not currently in stock. Please come back later."
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Unavailable." //unused?
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"This item has no value."
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"Far Go Traders is no longer interested in that item, but please feel free to browse our other merchandise!"
		),
		TRADER_LORE_PHRASE = list(
			"Far Go Traders. Reliable, trustworthy, and serving the wasteland for over 100 years!",
			"Buy your arms and armor from Far Go Traders today! You never know when it might save your life!",
			"You'll never regret doing business with Far Go Traders!"
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"This unit is only programmed to sell products." //unused
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Product sale is currently unavailable due to unexpected circumstances. Please come back later."
		),
	)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought/fargo/initial_products()
	return list(
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm = list(60, rand(2,4)),
		/obj/item/gun/ballistic/revolver/ms13/rev10mm = list(60, rand(3,5)),
		/obj/item/gun/ballistic/rifle/ms13/varmint = list(60, rand(3,5)),
		/obj/item/gun/ballistic/rifle/ms13/hunting/surplus = list(60, rand(3,5)),
		/obj/item/gun/ballistic/revolver/ms13/single = list(30, rand(3,5)),
		/obj/item/gun/ballistic/revolver/ms13/caravan = list(65, rand(3,5)),
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45 = list(110, rand(1,3)),
		/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm = list(110, rand(0,3)),
		/obj/item/gun/ballistic/revolver/ms13/rev357/police = list(120, rand(0,4)),
		/obj/item/gun/ballistic/revolver/ms13/rev357 = list(120, rand(0,4)),
		/obj/item/gun/ballistic/automatic/ms13/full/smg9mm = list(250, rand(0,1)),
		/obj/item/gun/ballistic/shotgun/ms13/lever = list(235, rand(0,2)),
		/obj/item/gun/ballistic/shotgun/ms13/lever/cowboy = list(195, rand(0,3)),
		/obj/item/gun/ballistic/shotgun/ms13/lever/trail = list(310, rand(0,2)),
		/obj/item/gun/ballistic/revolver/ms13/rev44 = list(210, rand(0,3)),
		/obj/item/gun/ballistic/rifle/ms13/hunting = list(300, rand(0,1)),
		/obj/item/clothing/suit/armor/ms13/vest/civilian = list(50, rand(0,3)),
		/obj/item/clothing/suit/ms13/ljacket/reinforced = list(110, rand(0,3)),
		/obj/item/clothing/suit/ms13/veteran_coat/reinf = list(110, rand(0,3)),
		/obj/item/clothing/suit/ms13/duster/reinforced = list(110, rand(0,3)),
		/obj/item/clothing/suit/armor/ms13/leatherarmor = list(110, rand(0,3)),
		/obj/item/clothing/suit/armor/ms13/metal = list(125, rand(0,2)),
		/obj/item/clothing/suit/armor/ms13/vest = list(125, rand(0,1)),
		/obj/item/clothing/suit/armor/ms13/metal/reinforced = list(280, rand(0,1)),
		/obj/item/clothing/suit/armor/ms13/leatherarmor/reinforced = list(280, rand(0,1)),
		/obj/item/clothing/head/helmet/ms13/flight = list(45, rand(1,2)),
		/obj/item/clothing/head/helmet/ms13/flight/yellow = list(45, rand(1,2)),
		/obj/item/clothing/head/helmet/ms13/flight/red = list(45, rand(1,2)),
		/obj/item/clothing/head/helmet/ms13/eyebot = list(45, rand(0,3)),
		/obj/item/clothing/head/ms13/hood/plated = list(45, rand(0,3)),
		/obj/item/clothing/head/helmet/ms13/army/civildefence = list(65, rand(0,1)),
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought/fargo/initial_wanteds()
	return list(
		/obj/item/stack/sheet/ms13/cloth = list(3, rand(4,25), ", per piece of cloth"),
		/obj/item/stack/sheet/ms13/leather = list(3, rand(4,25), ", per piece of leather"),
		/obj/item/stack/sheet/ms13/thread = list(4, rand(2,15), ", per piece of thread"),
		/obj/item/stack/sheet/ms13/mil_fiber = list(30, rand(0,5), ", per piece of fiber"),
		/obj/item/stack/ms13/currency/prewar = list(2, rand(25,120), ", per dollar"),
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought/crimson
	name = "\improper Crimson Caravan Hardware vendortron"
	desc = "A vendortron operated by the Crimson Caravan Company. This one specializes in fulfilling tool, hardware, and industrial needs in the wastes."
	icon_state = "vendotron_red"

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"We are not interested in that product at this time."
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"Your business will be missed, please reconsider!"
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Thanks for doing business with the Crimson Caravan Company!"
		),
		INTERESTED_PHRASE = list(
			"You seem to have a particular item of interest, would you be interested in a transaction?"
		),
		BUY_PHRASE = list(
			"Thank you for choosing Crimson Caravan!"
		),
		NO_CASH_PHRASE = list(
			"Uh oh! Looks like you don't have enough caps for that! Alternative payment options are available by contacting your nearest Crimson Caravan regional representative."
		),
		NO_STOCK_PHRASE = list(
			"That product is out of stock. We apologize for the inconvenience."
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Unavailable." //unused?
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"That item has no value."
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"Quota has been met. No more purchases of that item will be made."
		),
		TRADER_LORE_PHRASE = list(
			"Choose Crimson Caravan for all your wasteland needs!",
			"Crimson Caravan Company. A name you can trust with prices you just can't beat.",
			"This unit is equipped to provide for any of your hardware needs, take a look!"
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"This unit is only programmed to sell products." //unused
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Product sale is currently unavailable due to unexpected circumstances. Please come back later."
		),
	)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought/crimson/initial_products()
	return list(
		/obj/item/ms13/hammer = list(30, rand(2,4)),
		/obj/item/wrench/ms13 = list(25, rand(2,4)),
		/obj/item/wirecutters/ms13 = list(25, rand(2,4)),
		/obj/item/screwdriver/ms13 = list(25, rand(2,4)),
		/obj/item/shovel/ms13/spade = list(45, rand(1,2)),
		/obj/item/crowbar/ms13 = list(45, rand(1,3)),
		/obj/item/ms13/handsaw = list(45, rand(1,2)),
		/obj/item/ms13/handdrill = list(40, rand(1,2)),
		/obj/item/claymore/ms13/pipe = list(45, rand(1,2)),
		/obj/item/claymore/ms13/pipe/tireiron = list(45, rand(1,2)),
		/obj/item/weldingtool/ms13 = list(65, rand(1,2)),
		/obj/item/clothing/glasses/ms13/welding = list(40, rand(1,2)),
		/obj/item/flashlight/ms13 = list(65, rand(1,3)),
		/obj/item/flashlight/flare/ms13 = list(15, rand(2,4)),
		/obj/item/radio/ms13 = list(75, rand(1,3)),
		/obj/item/ms13/component/cell = list(30, rand(1,4)),
		/obj/item/stock_parts/cell/ms13/ec = list(40, rand(0,3)),
		/obj/item/stack/sheet/ms13/scrap_electronics/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/scrap_copper/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/scrap_parts/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/scrap/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/scrap_steel/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/scrap_lead/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/scrap_brass/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/scrap_alu/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/wood/plank/four = list(20, rand(3,6))
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought/crimson/initial_wanteds()
	return list(
		/obj/item/stack/sheet/ms13/scrap_parts = list(3, rand(4,20), ", per piece of parts"),
		/obj/item/stack/sheet/ms13/scrap = list(3, rand(4,20), ", per piece of scrap"),
		/obj/item/stack/sheet/ms13/scrap_steel = list(3, rand(4,20), ", per piece of steel"),
		/obj/item/stack/sheet/ms13/scrap_alu = list(3, rand(4,20), ", per piece of aluminum"),
		/obj/item/stack/sheet/ms13/wood/plank = list(4, rand(2,15), ", per plank"),
		/obj/item/stack/sheet/ms13/scrap_copper = list(3, rand(4,20), ", per piece of copper wire"),
		/obj/item/stack/sheet/ms13/scrap_gold = list(8, rand(3,15), ", per piece of gold"),
		/obj/item/stack/sheet/ms13/scrap_silver = list(6, rand(3,15), ", per piece of silver"),
		/obj/item/stack/sheet/ms13/refined_gold = list(50, rand(1,5), ", per ingot of gold"),
		/obj/item/stack/sheet/ms13/refined_silver = list(40, rand(1,5), ", per ingot of silver"),
		/obj/item/stack/sheet/ms13/scrap_electronics = list(3, rand(3,15), ", per piece of electronics"),
		/obj/item/stack/sheet/ms13/circuits = list(20, rand(0,6), ", per piece of circuits"),
		/obj/item/stack/ms13/currency/prewar = list(2, rand(25,120), ", per dollar"),
		/obj/item/ms13/component/cell = list(20, rand(0,5), ""),
		/obj/item/ms13/component/vacuum_tube = list(40, rand(0,4), ""),
		/obj/item/radio/ms13 = list(55, rand(0,3), ""),
		/obj/item/radio/ms13/broadcast = list(105, rand(0,2), ""),
		/obj/item/radio/ms13/broadcast/advanced = list(170, rand(0,2), ""),
				)


/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought/happy_trails
	name = "\improper Happy Trails vendotron"
	desc = "A vendotron owned and operated by the Happy Trails Caravan Company. This one makes sure the wasteland stays happy, with medical supplies, alcohol, and drugs!"
	icon_state = "vendotron_yellow"

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"We aren't quite interested in that at this time!"
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"Don't be a downer! Let's do some business!"
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Happy Trails!"
		),
		INTERESTED_PHRASE = list(
			"We're interested in taking an item off of your hands, partner. What do you say?"
		),
		BUY_PHRASE = list(
			"Happy Trails!"
		),
		NO_CASH_PHRASE = list(
			"It appears you cannot afford that at this time."
		),
		NO_STOCK_PHRASE = list(
			"Product out of stock. Return later."
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Unavailable." //unused?
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"This item has no value."
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"We are not looking to purchase any more of that item."
		),
		TRADER_LORE_PHRASE = list(
			"Happy Trails is here to keep you happy and well enough to stay on whatever trail you're on!",
			"Happy Trails is hiring and looking to expand! Interested? Please contact our main office in Sac-Town at your earliest convenience!",
			"Remember to report any raider sightings to your nearest local law enforcement officials, keep those trails happy!"
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"This unit is only programmed to sell products." //unused
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Product sale is currently unavailable due to unexpected circumstances. Please come back later."
		),
	)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought/happy_trails/initial_products()
	return list(
		/obj/item/stack/medical/gauze/ms13/half = list(30, rand(4,6)),
		/obj/item/stack/medical/splint/ms13/wooden = list(15, rand(3,6)),
		/obj/item/stack/medical/splint/ms13 = list(25, rand(2,5)),
		/obj/item/stack/medical/suture/ms13/four = list(30, rand(3,6)),
		/obj/item/stack/medical/ointment/ms13/half = list(30, rand(3,6)),
		/obj/item/stack/medical/ms13/healing_powder = list(35, rand(1,4)),
		/obj/item/stack/medical/ms13/healing_powder/burn = list(30, rand(1,4)),
		/obj/item/stack/medical/ms13/healing_powder/poultice = list(60, rand(0,3)),
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak = list(90, rand(0,2)),
		/obj/item/reagent_containers/blood/ms13/o_minus = list(30, rand(0,4)),
		/obj/item/reagent_containers/blood/ms13/radaway = list(30, rand(0,4)),
		/obj/item/reagent_containers/hypospray/medipen/ms13/calmex = list(45, rand(1,4)),
		/obj/item/reagent_containers/ms13/inhaler/hydra = list(125, rand(0,3)),
		/obj/item/storage/pill_bottle/ms13/daytripper = list(140, rand(0,2)),
		/obj/item/reagent_containers/hypospray/medipen/ms13/medx = list(140, rand(0,2)),
		/obj/item/storage/pill_bottle/ms13/radx = list(160, rand(0,2)),
		/obj/item/storage/pill_bottle/ms13/cateye = list(150, rand(0,2)),
		/obj/item/reagent_containers/hypospray/medipen/ms13/addictol = list(285, rand(0,1)),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/whiskey = list(80, rand(0,2)),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/tequila = list(75, rand(0,2)),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/rum = list(80, rand(0,2)),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/absinthe = list(80, rand(0,2)),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/vodka = list(75, rand(0,2)),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/gin = list(80, rand(0,2)),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/wine = list(90, rand(0,2)),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/moonshine = list(125, rand(0,2))
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought/happy_trails/initial_wanteds()
	return list(
		/obj/item/stack/sheet/ms13/glass = list(3, rand(3,15), ", per piece of glass"),
		/obj/item/stack/sheet/ms13/ceramic = list(3, rand(3,15), ", per piece of ceramic"),
		/obj/item/stack/sheet/ms13/refined_gold = list(50, rand(1,4), ", per ingot of gold"),
		/obj/item/stack/sheet/ms13/refined_silver = list(40, rand(1,4), ", per ingot of silver"),
		/obj/item/stack/ms13/currency/prewar = list(2, rand(25,120), ", per dollar"),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/sake = list(80, rand(0,1)),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/vermouth = list(80, rand(0,1)),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/champagne = list(80, rand(0,1)),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/cognac = list(80, rand(0,1)),
		/obj/item/reagent_containers/food/drinks/bottle/ms13/nukashine = list(125, rand(0,1))
				)


/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought/general_goods
	name = "\improper Grant's General Goods vendotron"
	desc = "A vendotron owned and operated by a regional merchant, presumably named Grant. Selling general goods, it's your one stop shop for the wasteland!"
	icon_state = "vendotron_blue"

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"We aren't quite interested in that at this time!"
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"It is a shame we could not conduct a transaction."
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Thank you for your business."
		),
		INTERESTED_PHRASE = list(
			"This unit would like to purchase an item you own, are you interested?"
		),
		BUY_PHRASE = list(
			"Thank you for choosing Grant's, please remember us."
		),
		NO_CASH_PHRASE = list(
			"It appears you cannot afford that at this time."
		),
		NO_STOCK_PHRASE = list(
			"Product out of stock. Return later."
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Unavailable." //unused?
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"This item has no value."
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"This unit is no longer interested in that item."
		),
		TRADER_LORE_PHRASE = list(
			"Next time you need just about anything, choose Grant's!",
			"Grant's General Goods is looking for more suppliers and interested in forging long term relationships! For details, reach out to our local representative.",
			"Notice: This unit claims no official affiliation with any organization or group besides Grant's General Goods."
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"This unit is only programmed to sell products." //unused
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Product sale is currently unavailable due to unexpected circumstances. Please come back later."
		),
	)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought/general_goods/initial_products()
	return list(
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/sarsaparilla = list(20, rand(2,6)),
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_cola = list(20, rand(2,6)),
		/obj/item/food/ms13/prewar/canned/porknbeans = list(25, rand(1,4)),
		/obj/item/food/ms13/prewar/canned/cajunrice = list(20, rand(1,3)),
		/obj/item/food/ms13/prewar/canned/dogfood = list(15, rand(0,2)),
		/obj/item/food/ms13/prewar/boxed/snackcake = list(25, rand(1,3)),
		/obj/item/stack/medical/ms13/healing_powder = list(35, rand(1,3)),
		/obj/item/stack/sheet/ms13/scrap/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/wood/scrap_wood/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/scrap_parts/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/cloth/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/leather/five = list(20, rand(3,6)),
		/obj/item/stack/sheet/ms13/thread/six = list(30, rand(2,4)),
		/obj/item/flashlight/flare/ms13 = list(15, rand(1,3)),
		/obj/item/radio/ms13 = list(75, rand(0,2)),
		/obj/item/knife/ms13/hunting = list(60, rand(0,2)),
		/obj/item/knife/ms13 = list(30, rand(1,3)),
		/obj/item/knife/butcher/ms13 = list(60, rand(0,2)),
		/obj/item/hatchet/ms13 = list(70, rand(0,2)),
		/obj/item/ms13/knuckles = list(30, rand(1,3)),
		/obj/item/ammo_box/ms13/c22box = list(185, rand(0,2)),
		/obj/item/ammo_box/ms13/c9mm = list(185, rand(0,2)),
		/obj/item/ammo_box/ms13/c10mm = list(175, rand(0,2)),
		/obj/item/ammo_box/ms13/c45 = list(165, rand(0,2)),
		/obj/item/ammo_box/ms13/a556 = list(275, rand(0,2)),
		/obj/item/ammo_box/ms13/m44box = list(240, rand(0,2)),
		/obj/item/ammo_box/ms13/a357box = list(190, rand(0,2)),
		/obj/item/ammo_box/ms13/a308 = list(240, rand(0,1)),
		/obj/item/ammo_box/ms13/a762 = list(240, rand(0,2)),
		/obj/item/ammo_box/ms13/shotgun/buckshot = list(175, rand(0,3)),
		/obj/item/ms13/component/gunpowder = list(70, rand(0,3)),
		/obj/item/ms13/component/gunpowder/lq = list(30, rand(1,4))
				)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/drought/general_goods/initial_wanteds()
	return list(
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_quartz = list(50, rand(0,1), ""),
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_quantum = list(50, rand(0,1), ""),
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_dark = list(50, rand(0,1), ""),
		/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_victory = list(40, rand(0,2), ""),
		/obj/item/stack/sheet/ms13/scrap_gold = list(8, rand(3,15), ", per piece of gold"),
		/obj/item/stack/sheet/ms13/scrap_silver = list(6, rand(3,15), ", per piece of silver"),
		/obj/item/stack/sheet/ms13/refined_gold = list(50, rand(1,5), ", per ingot of gold"),
		/obj/item/stack/sheet/ms13/refined_silver = list(40, rand(1,5), ", per ingot of silver"),
		/obj/item/stack/sheet/ms13/scrap_lead = list(3, rand(3,15), ", per piece of lead"),
		/obj/item/stack/sheet/ms13/scrap_brass = list(3, rand(3,15), ", per piece of brass"),
		/obj/item/food/meat/slab/ms13/animal/gecko/golden = list(6, rand(1,6)),
		/obj/item/food/meat/slab/ms13/animal/bark_scorp = list(10, rand(0,5))
				)

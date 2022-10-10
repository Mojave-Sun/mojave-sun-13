/mob/living/simple_animal/hostile/retaliate/trader/ms13
	name = "vendortron"
	desc = "You shouldn't be seeing this...."
	icon = 'mojave/icons/mob/ms13robots.dmi'
	icon_state = "vendotron_blue"
	maxHealth = 300
	health = 300
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
	ranged_cooldown = 3 SECONDS
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
	speak_emote = list("states", "says")
	currency_name = "dollars"

/mob/living/simple_animal/hostile/retaliate/trader/ms13/initial_wanteds()
	return list()

/mob/living/simple_animal/hostile/retaliate/trader/ms13/gunrunner
	name = "\improper Gun Runners vendortron"
	desc = "A vendortron used by the Gun Runners for sale of firearms far and wide."
	icon_state = "vendotron_green"

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"This unit is only programmed to sell products."
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"This unit is only programmed to sell products."
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
		    "Pleasure doing business with you." //unused for now
		),
		INTERESTED_PHRASE = list(
			"Hey, you've got an item that interests me, I'd like to buy it, I'll give you some cash for it, deal?" //unused for now
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
			"This unit is only programmed to sell products."
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"This unit is only programmed to sell products."
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"This unit is only programmed to sell products."
		),
		TRADER_LORE_PHRASE = list(
			"All Gun Runner merchandise is constructed at Gun Runner facilities.",
			"Gun Runners. Supplying only the finest armaments since 2155."
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"This unit is only programmed to sell products."
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Product sale is currently unavailable due to unexpected circumstances. Please come back later."
		),
	)

/mob/living/simple_animal/hostile/retaliate/trader/ms13/gunrunner/initial_products()
	return list(
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm = list(80, rand(2,4)),
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol22 = list(50, rand(2,4)),
		/obj/item/gun/ballistic/rifle/ms13/varmint = list(80, rand(2,4)),
		/obj/item/gun/ballistic/revolver/ms13/single = list(50, rand(2,4)),
		/obj/item/gun/ballistic/revolver/ms13/caravan = list(90, rand(2,3)),
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45 = list(150, rand(1,3)),
		/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm = list(150, rand(1,3)),
		/obj/item/gun/ballistic/revolver/ms13/rev556 = list(150, rand(0,3)),
		/obj/item/gun/ballistic/revolver/ms13/rev357/police = list(160, rand(0,3)),
		/obj/item/gun/ballistic/revolver/ms13/rev357 = list(160, rand(0,3)),
		/obj/item/gun/ballistic/automatic/ms13/semi/service = list(300, rand(0,3)),
		/obj/item/gun/ballistic/automatic/ms13/full/smg9mm = list(320, rand(0,2)),
		/obj/item/gun/ballistic/shotgun/ms13/lever = list(320, rand(0,2)),
		/obj/item/gun/ballistic/shotgun/ms13/lever/cowboy = list(260, rand(0,3)),
		/obj/item/gun/ballistic/shotgun/ms13/lever/trail = list(420, rand(0,1)),
		/obj/item/gun/ballistic/revolver/ms13/rev44 = list(280, rand(0,2)),
		/obj/item/gun/ballistic/rifle/ms13/hunting = list(440, rand(0,1)),
		/obj/item/gun/ballistic/automatic/ms13/full/smg10mm = list(480, rand(0,1)),
		/obj/item/gun/ballistic/automatic/ms13/full/smg22 = list(600, rand(0,1)),
				)

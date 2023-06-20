//Guns
/obj/item/gun/ballistic/automatic/ms13/semi/service
	name = "service rifle"
	desc = "A 5.56 semi-automatic rifle manufactured by and for the NCR."
	icon_state = "service"
	inhand_icon_state = "service"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/service/service_3.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/service.ogg'
	fire_delay = 0.45 SECONDS
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	spread = 5
	recoil = 0.75
	slowdown = 0.75
//	zoomable = FALSE
	mag_type = /obj/item/ammo_box/magazine/ms13/r20
	grid_width = 192
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/semi/service/maquis
	name = "\improper Maquis"
	desc = "A unique, heavy duty service rifle. Fires much more accurately and with less of a kick. Has a flag supporting a different kind of patriotism than most are used to."
	icon_state = "maquis"
	inhand_icon_state = "maquis"
	spread = 2
	recoil = 0.6

/obj/item/gun/ballistic/automatic/ms13/semi/sniper
	name = "sniper rifle"
	desc = "A semi-automatic and high powered but bulky .308 sniper rifle. Perfect weapon for a determined assassin."
	icon_state = "sniper"
	inhand_icon_state = "sniper"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/sniper/sniper2.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/sniper.ogg'
	fire_delay = 0.65 SECONDS
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	spread = 2
	recoil = 1.5
	slowdown = 1
	mag_type = /obj/item/ammo_box/magazine/ms13/r308
	has_scope = TRUE
	scope_range = 3.5
	grid_width = 224
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/semi/sniper/silencer
	name = "\improper Silencer"
	desc = "A modified sniper rifle with an integrated suppressor and an improved rate of fire and recoil compensation. Whether it's called the Silencer because of it's modification or it's intended purpose is yet to be known."
	icon_state = "silentsniper"
	inhand_icon_state = "silentsniper"
	fire_delay = 0.6 SECONDS
	recoil = 1.15
	fire_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	far_fire_sound = null

/obj/item/gun/ballistic/automatic/ms13/semi/marksman
	name = "marksman carbine"
	desc = "A 5.56 marksman carbine with a scope attached to help in long range combat."
	icon_state = "marksman"
	inhand_icon_state = "marksman"
	mag_type = /obj/item/ammo_box/magazine/ms13/r20
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/marksman/marksman2.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/marksman.ogg'
	can_suppress = FALSE
	fire_delay = 0.5 SECONDS
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	spread = 2
	recoil = 0.6
	slowdown = 0.75
	has_scope = TRUE
	scope_range = 3
	grid_width = 192
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/semi/marksman/american
	name = "\improper All-American"
	desc = "A unique and customized marksman carbine. Improved rate of fire for improved dispensing of patriotic lead."
	icon_state = "allamerican"
	inhand_icon_state = "allamerican"
	fire_delay = 0.45 SECONDS

/obj/item/gun/ballistic/automatic/ms13/semi/battle
	name = "battle rifle"
	desc = "A very old but also very reliable semi-automatic rifle chambered for .308. From long before the war, but still packs a very heavy punch."
	icon_state = "battler"
	inhand_icon_state = "battler"
	fire_sound = 'mojave/sound/ms13weapons/battlerifle.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/battlerifle.ogg'
	fire_delay = 0.6 SECONDS
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	spread = 4
	recoil = 1.75
	slowdown = 0.75
	mag_type = /obj/item/ammo_box/magazine/ms13/r308_10
	grid_width = 192
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/semi/battle/update_icon_state()
	worn_icon_state = "[initial(icon_state)]"
	if(!chambered && magazine) //this makes the sks empty, the state with a magazine, not necassarily empty just not chambered
		icon_state = "[initial(icon_state)]_mag_empty"

	if(!chambered && !magazine) //this makes the sks empty, the state with nothing
		icon_state = "[initial(icon_state)]_empty"

	if(chambered && !magazine) //this makes the sks chambered, the state with no magazine
		icon_state = "[initial(icon_state)]_cham_empty"

	if(chambered && magazine) //this makes the sks full state when chambered and they have a magazine
		icon_state = "[initial(icon_state)]"
	return ..()

/obj/item/gun/ballistic/automatic/ms13/semi/battle/rangemaster
	name = "\improper Rangemaster"
	desc = "A heavy duty semi-automatic .308 rifle with a scope and heavier rifling to reduce spread and recoil, though the added weight will slow down the user."
	icon_state = "rangemaster"
	inhand_icon_state = "rangemaster"
	has_scope = TRUE
	scope_range = 2.5
	spread = 2
	recoil = 1.5
	slowdown = 1

// And now I will be switching the firearm to fully semi-automatic mode. //

/obj/item/gun/ballistic/automatic/ms13/full/smg45
	name = ".45 submachine gun"
	desc = "A classic .45 submachine gun that takes an expansive 50 round drum magazine."
	icon_state = "smg45"
	inhand_icon_state = "smg45"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/ms13/smgm45
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/45/45auto3.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/45_pistol.ogg'
	can_suppress = FALSE
	fire_delay = 0.25 SECONDS
	spread = 12
	recoil = 0.75
	slowdown = 0.75
	grid_width = 128
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/smg22
	name = ".22 submachine gun"
	desc = "A suppressed .22 submachine gun that feeds from a large pan magazine placed on top of the gun. An interesting weapon for interesting people."
	icon_state = "smg22"
	inhand_icon_state = "smg22"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/ms13/smgm22
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/22_smg.ogg'
	fire_delay = 0.2 SECONDS
	spread = 12
	recoil = 0.2
	slowdown = 0.75
	grid_width = 128
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/smg10mm
	name = "10mm submachine gun"
	desc = "A light, one handed 10mm submachine gun. Decent power in a small package."
	icon_state = "smg10mm"
	inhand_icon_state = "smg10mm"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/ms13/smgm10mm
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/10mmsmg1.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/10mm_smg.ogg'
	fire_delay = 0.2 SECONDS
	spread = 15
	recoil = 0.75
	force = 10
	slowdown = 0.5
	grid_width = 96
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/smg9mm
	name = "9mm submachine gun"
	desc = "A fast firing, old school 9mm submachine gun. Doesn't pack a lot of punch per bullet, but that doesn't matter when you're spitting them out so fast."
	icon_state = "smg9mm"
	inhand_icon_state = "smg9mm"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/ms13/smgm9mm
	fire_sound = 'mojave/sound/ms13weapons/greasegun.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/greasegun.ogg'
	can_suppress = FALSE
	fire_delay = 0.2 SECONDS
	spread = 15
	recoil = 0.35
	force = 10
	slowdown = 0.5
	grid_width = 96
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/smg12mm
	name = "12.7mm submachine gun"
	desc = "A heavy duty submachine gun chambered in 12.7mm, fires at a slower rate of fire, but it sure does pack a punch."
	icon_state = "smg12mm"
	inhand_icon_state = "smg12mm"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/ms13/smg12mm
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/12mm/m12mm2.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/12mm_smg.ogg'
	can_suppress = FALSE
	fire_delay = 0.35 SECONDS
	force = 10
	spread = 10
	recoil = 1.25
	slowdown = 0.5
	grid_width = 96
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle
	name = "assault rifle"
	desc = "A general purpose, standard automatic assault rifle chambered in 5.56. Commonly used by pre-war US military forces."
	icon_state = "assaultrifle"
	inhand_icon_state = "assaultrifle"
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/ms13/r20
	fire_sound = 'mojave/sound/ms13weapons/arfire.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/arfire.ogg'
	fire_delay = 0.25 SECONDS
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	spread = 8
	recoil = 0.6
	slowdown = 0.75
	grid_width = 192
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/proto_service
	name = "prototype service rifle"
	desc = "A relatively new and improved modern service rifle sporting full auto capabilities and a generally improved rate of fire at the cost of some accuracy."
	icon_state = "protoservice"
	inhand_icon_state = "protoservice"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/service/service_2.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/service.ogg'
	fire_delay = 0.3 SECONDS
	recoil = 0.75

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/infiltrator
	name = "\improper Infiltrator"
	desc = "A heavily modified and customized assault rifle with a scope and suppressor as it's most notable additions to improve accuracy and recoil. The added weight from the scope will slow down the user, but the modifications reduce it's bulk."
	icon_state = "infiltrator"
	inhand_icon_state = "infiltrator"
	has_scope = TRUE
	scope_range = 2.5
	fire_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	far_fire_sound = null
	w_class = WEIGHT_CLASS_BULKY
	spread = 4
	recoil = 0.35
	slowdown = 1
	grid_width = 160
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/dakka
	desc = "A stripped and heavily modified assault rifle. Faster rate of fire, but with substantially less accuracy and much more recoil. An unstable and dangerous weapon made for an unstable and dangerous individual."
	icon_state = "m16stripped"
	inhand_icon_state = "m16stripped"
	fire_delay = 0.2 SECONDS
	w_class = WEIGHT_CLASS_BULKY
	spread = 15
	recoil = 1.15
	grid_width = 160
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/dakka/Initialize()
	. = ..()
	name = pick(
		"\improper Dakka",\
		"\improper Scrapper",\
		"\improper Killjoy")

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/chinese
	name = "\improper Chinese assault rifle"
	desc = "A Chinese made assault rifle chambered in the heavier 7.62 round, packs a bigger punch in exchange for higher recoil and a slower rate of fire."
	icon_state = "chinesear"
	inhand_icon_state = "chinesear"
	mag_type = /obj/item/ammo_box/magazine/ms13/ar762
	fire_sound = 'mojave/sound/ms13weapons/chinesearfire.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/chinesearfire.ogg'
	fire_delay = 0.35 SECONDS
	spread = 8
	recoil = 1
	slowdown = 0.75
	grid_width = 192
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/chinese/handmade
	name = "handmade assault rifle"
	desc = "A decent quality handmade assault rifle chambered in 7.62, the makeshift qualities of it reduces it's accuracy and increases it's recoil by a lot."
	icon_state = "handmadear"
	inhand_icon_state = "handmadear"
	spread = 12
	recoil = 1.5

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/chinese/xuanlong
	name = "\improper Xuanlong assault rifle"
	desc = "A modified Chinese assault rifle sporting a more stable stock and a scope for improved accuracy and recoil. The added weight from the scope will slow down the user."
	icon_state = "xuanlong"
	inhand_icon_state = "xuanlong"
	has_scope = TRUE
	scope_range = 2
	spread = 6
	recoil = 0.75
	slowdown = 1

//Magazines
/obj/item/ammo_box/magazine/ms13/r20
	name = "20 round magazine (5.56mm)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "556r20"
	ammo_type = /obj/item/ammo_casing/ms13/a556
	caliber = "a556"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 20
	grid_width = 32
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/smgm10mm
	name = "24 round magazine (10mm)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "smg10mm"
	ammo_type = /obj/item/ammo_casing/ms13/c10mm
	caliber = "10mm"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 24
	grid_width = 32
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/smgm9mm
	name = "30 round magazine (9mm)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "smg9mm"
	ammo_type = /obj/item/ammo_casing/ms13/c9mm
	caliber = "9mm"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 30
	grid_width = 32
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/smgm45
	name = "50 round drum magazine (.45)"
	icon_state = "smg45"
	ammo_type = /obj/item/ammo_casing/ms13/c45
	caliber = ".45"
	w_class = WEIGHT_CLASS_NORMAL
	max_ammo = 50
	grid_width = 64
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/ar762
	name = "24 round magazine (7.62mm)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "ar762"
	ammo_type = /obj/item/ammo_casing/ms13/a762
	caliber = "a762"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 24
	grid_width = 32
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/smgm22
	name = "60 round magazine (.22)"
	icon_state = "smg22"
	ammo_type = /obj/item/ammo_casing/ms13/c22
	caliber = ".22"
	w_class = WEIGHT_CLASS_NORMAL
	max_ammo = 60
	grid_width = 64
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/smg12mm
	name = "21 round magazine (12.7mm)"
	icon_state = "smg12mm"
	ammo_type = /obj/item/ammo_casing/ms13/m12mm
	caliber = "12.7mm"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 21
	grid_width = 32
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/r308_10
	name = "10 round magazine (.308)"
	icon_state = "rangemaster"
	ammo_type = /obj/item/ammo_casing/ms13/a308
	caliber = "a308"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 10
	grid_width = 32
	grid_height = 64

//Guns
/obj/item/gun/ballistic/revolver/ms13/caravan
	name = "caravan shotgun"
	desc = "A well worn but reliable double barrel shotgun."
	icon_state = "caravan"
	inhand_icon_state = "caravan"
	force = 20
	fire_delay = 0.4 SECONDS
	slot_flags = ITEM_SLOT_BACK
	recoil = 1.5
	slowdown = 0.75
	mag_type = /obj/item/ammo_box/magazine/internal/shot/ms13/caravan
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/caravan/caravan.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/revolver/ms13/caravan/sawed
	name = "sawed-off shotgun"
	desc = "A double barrel sawed-off shotgun. Can be used and fired with only one hand, making it a deadly weapon in a pinch."
	icon_state = "sawedoff"
	inhand_icon_state = "sawedoff"
	force = 15
	fire_delay = 0.5 SECONDS
	slot_flags = ITEM_SLOT_BELT
	slowdown = 0.5
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM

/obj/item/gun/ballistic/revolver/ms13/single
	name = "single shotgun"
	desc = "A very cheap and very common lightweight shotgun with only a single round, better make it count."
	icon_state = "singleshot"
	inhand_icon_state = "singleshot"
	force = 20
	fire_delay = 0.4 SECONDS
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_BELT
	recoil = 1.5
	slowdown = 0.75
	mag_type = /obj/item/ammo_box/magazine/internal/shot/ms13/single
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/caravan/caravan2.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

////////////////////////// revolvers////////////////
/obj/item/gun/ballistic/revolver/ms13/derringer
	name = "derringer"
	desc = "A small and sneaky 2 shot pistol thats often concealed. This one's a bit fancy with some gold trim."
	icon_state = "derringer"
	inhand_icon_state = "derringer"
	force = 5
	mag_type = /obj/item/ammo_box/magazine/internal/shot/ms13/derringer
	fire_sound = 'mojave/sound/ms13weapons/22pistol.ogg'
	w_class = WEIGHT_CLASS_SMALL
	extra_damage = 25
	extra_penetration = 5

/obj/item/gun/ballistic/revolver/ms13/rev44
	name = ".44 magnum revolver"
	desc = "A double action revolver chambered for .44 Magnum rounds. Decently fast and damaging at the same time."
	icon_state = "44magnum"
	inhand_icon_state = "44magnum"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/ms13/rev44
	fire_sound = 'mojave/sound/ms13weapons/44mag.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.5 SECONDS
	extra_damage = 35
	extra_penetration = 10
	spread = 6
	recoil = 1.25
	slowdown = 0.5

/obj/item/gun/ballistic/revolver/ms13/rev44/mysterious
	name = "\improper Mysterious Magnum"
	desc = "A unique .44 Magnum with a silver finish for style, and even better stopping power. Something sure is mysterious about this gun though."
	icon_state = "mysterious"
	inhand_icon_state = "mysterious"
	extra_damage = 40

/obj/item/gun/ballistic/revolver/ms13/rev44/rifle
	name = ".44 revolver rifle"
	desc = "A slow firing revolver rifle chambered for .44 Magnum rounds."
	icon_state = "revrifle"
	inhand_icon_state = "revrifle"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	fire_delay = 0.65 SECONDS
	extra_damage = 45
	spread = 5
	recoil = 1.5
	slowdown = 0.75

/obj/item/gun/ballistic/revolver/ms13/rev357
	name = ".357 magnum revolver"
	desc = "A classic .357 Magnum revolver, packs a decent punch but fires a bit slower due to it's old mechanisms."
	icon_state = "rev357"
	inhand_icon_state = "rev357"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/357/357fire3.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/ms13/rev357
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.55 SECONDS
	extra_damage = 35
	extra_penetration = 0
	spread = 6
	recoil = 1
	slowdown = 0.5

/obj/item/gun/ballistic/revolver/ms13/rev357/lucky
	name = "\improper Lucky"
	desc = "A unique .357 Magnum with fancy engravings and a nice finish, hits harder than it's lamer brother too."
	icon_state = "lucky"
	inhand_icon_state = "lucky"
	extra_damage = 35

/obj/item/gun/ballistic/revolver/ms13/rev357/police
	name = "police revolver"
	desc = "A lightweight, short .357 revolver that can be easily stored and hidden, commonly used by pre-war police forces. The shorter barrel reduces it's accuracy."
	icon_state = "policerev"
	inhand_icon_state = "policerev"
	fire_sound = 'mojave/sound/ms13weapons/policepistol.ogg'
	w_class = WEIGHT_CLASS_SMALL
	fire_delay = 0.5 SECONDS
	extra_damage = 30
	spread = 8
	recoil = 0.75
	slowdown = 0.5

/obj/item/gun/ballistic/revolver/ms13/rev10mm
	name = "10mm revolver"
	desc = "A bulky revolver chambered for 10mm rounds with a five round capacity."
	icon_state = "rev10mm"
	inhand_icon_state = "rev10mm"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/ms13/rev10mm
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/10mm/10mmfire2.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.45 SECONDS
	extra_damage = 25
	extra_penetration = 10
	spread = 6
	recoil = 0.75
	slowdown = 0.5

/obj/item/gun/ballistic/revolver/ms13/huntingrev
	name = "hunting revolver"
	desc = "A slow firing revolver chambered for heavy .45-70 rounds and only carrying five at a time. Make every shot count."
	icon_state = "huntingrev"
	inhand_icon_state = "huntingrev"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/ms13/rev4570
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/huntingrev/huntingrev5.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.6 SECONDS
	extra_damage = 45
	spread = 6
	recoil = 1.5
	slowdown = 0.5

/obj/item/gun/ballistic/revolver/ms13/huntingrev/sequoia
	name = "\improper Sequoia"
	desc = "A unique and modified .45-70 revolver that hits quite a bit harder."
	icon_state = "sequoia"
	inhand_icon_state = "sequoia"
	extra_damage = 50

/obj/item/gun/ballistic/revolver/ms13/rev556
	name = "5.56 revolver"
	desc = "A modern and fast firing revolver firing 5.56 rifle rounds."
	icon_state = "556rev"
	inhand_icon_state = "556rev"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/ms13/rev556
	fire_sound = 'mojave/sound/ms13weapons/that_gun.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.45 SECONDS
	extra_damage = 30
	extra_penetration = 10
	spread = 6
	recoil = 0.75
	slowdown = 0.5

//Magazines
/obj/item/ammo_box/magazine/internal/shot/ms13/caravan
	name = "caravan shotgun internal tube"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13/buckshot
	max_ammo = 2

/obj/item/ammo_box/magazine/internal/shot/ms13/single
	name = "single shotgun internal tube"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13/buckshot
	max_ammo = 1

/obj/item/ammo_box/magazine/internal/shot/ms13/derringer
	name = ".22 derringer internal tube"
	ammo_type = /obj/item/ammo_casing/ms13/c22
	caliber = ".22"
	max_ammo = 2

/obj/item/ammo_box/magazine/internal/cylinder/ms13/rev44
	name = ".44 magnum cylinder"
	ammo_type = /obj/item/ammo_casing/ms13/m44
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	caliber = "44"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/ms13/rev357
	name = ".357 magnum cylinder"
	ammo_type = /obj/item/ammo_casing/ms13/a357
	caliber = "357"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/ms13/rev10mm
	name = "10mm revolver cylinder"
	ammo_type = /obj/item/ammo_casing/ms13/c10mm
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	caliber = "10mm"
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/cylinder/ms13/rev4570
	name = ".45-70 cylinder"
	ammo_type = /obj/item/ammo_casing/ms13/c4570
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	caliber = "4570"
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/cylinder/ms13/rev556
	name = "5.56 revolver cylinder"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	ammo_type = /obj/item/ammo_casing/ms13/a556
	caliber = "a556"
	max_ammo = 5

//Loaders
/obj/item/ammo_box/ms13/derringer22
	name = ".22 Derringer speed loader"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "derringer"
	ammo_type = /obj/item/ammo_casing/ms13/c22
	caliber = ".22"
	max_ammo = 4

/obj/item/ammo_box/ms13/rev4570
	name = ".45-70 speed loader"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "rev4570"
	ammo_type = /obj/item/ammo_casing/ms13/c4570
	caliber = "4570"
	max_ammo = 5

/obj/item/ammo_box/ms13/rev44
	name = ".44 Magnum speed loader"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "rev44"
	ammo_type = /obj/item/ammo_casing/ms13/m44
	caliber = "44"
	max_ammo = 6

/obj/item/ammo_box/ms13/rev357
	name = ".357 Magnum speed loader"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "rev357"
	ammo_type = /obj/item/ammo_casing/ms13/a357
	caliber = "357"
	max_ammo = 6

/obj/item/ammo_box/ms13/rev556
	name = "5.56 speed loader"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "rev556"
	ammo_type = /obj/item/ammo_casing/ms13/a556
	caliber = "a556"
	max_ammo = 5

/obj/item/ammo_box/ms13/rev10mm
	name = "10mm speed loader"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "rev10mm"
	ammo_type = /obj/item/ammo_casing/ms13/c10mm
	caliber = "10mm"
	max_ammo = 5

//Guns
/obj/item/gun/ballistic/revolver/ms13/caravan
	name = "caravan shotgun"
	desc = "A well worn but reliable double barrel shotgun."
	icon_state = "caravan"
	inhand_icon_state = "caravan"
	force = 20
	subtractible_armour_penetration = 5
	fire_delay = 0.45 SECONDS
	slot_flags = ITEM_SLOT_BACK
	recoil = 1.5
	slowdown = 0.75
	mag_type = /obj/item/ammo_box/magazine/internal/shot/ms13/caravan
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/caravan/caravan.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/shotgun.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	grid_width = 160
	grid_height = 64
	wield_info = /datum/wield_info/default/inhands

/obj/item/gun/ballistic/revolver/ms13/caravan/sawed
	name = "sawed-off shotgun"
	desc = "A double barrel sawed-off shotgun. Can be used and fired with only one hand, making it a deadly weapon in a pinch."
	icon_state = "sawedoff"
	inhand_icon_state = "sawedoff"
	force = 15
	subtractible_armour_penetration = 0
	fire_delay = 0.5 SECONDS
	slot_flags = ITEM_SLOT_SUITSTORE | ITEM_SLOT_BELT
	slowdown = 0.5
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	grid_width = 96
	grid_height = 64

/obj/item/gun/ballistic/revolver/ms13/single
	name = "single shotgun"
	desc = "A very cheap and very common lightweight shotgun with only a single round, better make it count."
	icon_state = "singleshot"
	inhand_icon_state = "singleshot"
	force = 20
	subtractible_armour_penetration = 5
	fire_delay = 0.45 SECONDS
	slot_flags = ITEM_SLOT_BACK
	recoil = 1.5
	slowdown = 0.75
	mag_type = /obj/item/ammo_box/magazine/internal/shot/ms13/single
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/caravan/caravan2.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/shotgun.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	grid_width = 192
	grid_height = 32

/obj/item/gun/ballistic/revolver/ms13/mts
	name = "revolver shotgun"
	desc = "A strange shotgun resembling a revolver. Fires semi-automatic and faster than most shotguns."
	icon_state = "revrifle"
	inhand_icon_state = "revrifle"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/ms13/mts
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/levershot/levershot1.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/shotgun_lever.ogg'
	force = 25
	subtractible_armour_penetration = 5
	fire_delay = 0.55 SECONDS
	recoil = 1.5
	slowdown = 0.75
	grid_width = 160
	grid_height = 64
	wield_info = /datum/wield_info/default/inhands

////////////////////////// revolvers////////////////
/obj/item/gun/ballistic/revolver/ms13/derringer
	name = "derringer"
	desc = "A small and sneaky 2 shot pistol that is often concealed. Chambered for .357."
	icon_state = "derringer"
	inhand_icon_state = "derringer"
	force = 5
	mag_type = /obj/item/ammo_box/magazine/internal/shot/ms13/derringer
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/357/357fire1.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/357_revolver.ogg'
	w_class = WEIGHT_CLASS_SMALL
	slowdown = 0.5
	fire_delay = 0.4 SECONDS
	recoil = 0.5
	spread = 6
	grid_width = 64
	grid_height = 32

/obj/item/gun/ballistic/revolver/ms13/derringer/trimmed
	name = "gold trimmed derringer"
	desc = "A small and sneaky 2 shot pistol that is often concealed. This one has some gold trim."
	icon_state = "derringer_t"
	inhand_icon_state = "derringer_t"

/obj/item/gun/ballistic/revolver/ms13/rev44
	name = ".44 magnum revolver"
	desc = "A double action revolver chambered for .44 Magnum rounds. Decently fast and damaging at the same time."
	icon_state = "44magnum"
	inhand_icon_state = "44magnum"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/ms13/rev44
	fire_sound = 'mojave/sound/ms13weapons/44mag.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/44_revolver.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.6 SECONDS
	spread = 6
	recoil = 1.25
	slowdown = 0.5
	grid_width = 64
	grid_height = 64

/obj/item/gun/ballistic/revolver/ms13/rev44/mysterious
	name = "\improper Mysterious Magnum"
	desc = "A unique .44 Magnum with a silver finish for style and an improved hammer for faster firing. Something sure is mysterious about this gun though."
	icon_state = "mysterious"
	inhand_icon_state = "mysterious"
	fire_delay = 0.5 SECONDS

/obj/item/gun/ballistic/revolver/ms13/rev357
	name = ".357 magnum revolver"
	desc = "A classic .357 Magnum revolver, packs a decent punch but fires a bit slower due to it's old mechanisms."
	icon_state = "rev357"
	inhand_icon_state = "rev357"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/357/357fire3.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/357_revolver.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/ms13/rev357
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.6 SECONDS
	spread = 6
	recoil = 1
	slowdown = 0.5
	grid_width = 64
	grid_height = 64

/obj/item/gun/ballistic/revolver/ms13/rev357/lucky
	name = "\improper Lucky"
	desc = "A unique .357 Magnum with fancy engravings and a nice finish. The lucky nature of the gun seems to make it almost dead accurate."
	icon_state = "lucky"
	inhand_icon_state = "lucky"
	spread = 2

/obj/item/gun/ballistic/revolver/ms13/rev357/police
	name = "police revolver"
	desc = "A lightweight, short .357 revolver that can be easily stored and hidden, commonly used by pre-war police forces. The shorter barrel of the gun reduces accuracy and increases recoil."
	icon_state = "policerev"
	inhand_icon_state = "policerev"
	fire_sound = 'mojave/sound/ms13weapons/policepistol.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/policepistol.ogg'
	w_class = WEIGHT_CLASS_SMALL
	fire_delay = 0.6 SECONDS
	spread = 10
	recoil = 1.25
	slowdown = 0.5
	grid_width = 64
	grid_height = 32

/obj/item/gun/ballistic/revolver/ms13/rev10mm
	name = "10mm revolver"
	desc = "A bulky revolver chambered for 10mm rounds with a five round capacity."
	icon_state = "rev10mm"
	inhand_icon_state = "rev10mm"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/ms13/rev10mm
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/10mm/10mmfire2.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/10mm_pistol.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.45 SECONDS
	spread = 6
	recoil = 0.75
	slowdown = 0.5
	grid_width = 64
	grid_height = 64

/obj/item/gun/ballistic/revolver/ms13/huntingrev
	name = "hunting revolver"
	desc = "A slow firing revolver chambered for heavy .45-70 rounds and only carrying five at a time. Make every shot count."
	icon_state = "huntingrev"
	inhand_icon_state = "huntingrev"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/ms13/rev4570
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/huntingrev/huntingrev5.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/huntingrev.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.65 SECONDS
	spread = 6
	recoil = 1.75
	slowdown = 0.5
	grid_width = 64
	grid_height = 64

/obj/item/gun/ballistic/revolver/ms13/huntingrev/sequoia
	name = "\improper Sequoia"
	desc = "A unique and modified .45-70 revolver that is more controllable with a better rate of fire."
	icon_state = "sequoia"
	inhand_icon_state = "sequoia"
	recoil = 1.5
	fire_delay = 0.6 SECONDS

/obj/item/gun/ballistic/revolver/ms13/rev556
	name = "5.56 revolver"
	desc = "A modern and fast firing revolver firing 5.56 rifle rounds."
	icon_state = "556rev"
	inhand_icon_state = "556rev"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/ms13/rev556
	fire_sound = 'mojave/sound/ms13weapons/that_gun.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/that_gun.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.45 SECONDS
	spread = 6
	recoil = 0.75
	slowdown = 0.5
	grid_width = 64
	grid_height = 64

//Magazines
/obj/item/ammo_box/magazine/internal/shot/ms13/caravan
	name = "caravan shotgun internal tube"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13/buckshot
	max_ammo = 2

/obj/item/ammo_box/magazine/internal/shot/ms13/single
	name = "single shotgun internal tube"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13/buckshot
	max_ammo = 1

/obj/item/ammo_box/magazine/internal/cylinder/ms13/mts
	name = "revolver shotgun internal tube"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13/buckshot
	caliber = CALIBER_SHOTGUN
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/shot/ms13/derringer
	name = ".357 derringer internal tube"
	ammo_type = /obj/item/ammo_casing/ms13/a357
	caliber = "357"
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
	max_ammo = 6

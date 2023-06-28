// Guns //

/obj/item/gun/energy/ms13/gauss
	name = "base class gauss weapon"
	desc = "Good god. HELP! A BASE CLASS!"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/gauss/gauss_fire_heavy.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/gauss_heavy_2.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/gauss/gauss_reload.ogg'
	unload_sound = 'mojave/sound/ms13weapons/gunsounds/gauss/gauss_unload.ogg'
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_SUITSTORE
	force = 15
	cell_type = /obj/item/stock_parts/cell/ms13/gauss
	wield_info = /datum/wield_info/default/inhands

/obj/item/gun/energy/ms13/gauss/rifle
	name = "gauss rifle"
	desc = "A bulky, slow firing, but devastating gauss rifle."
	base_icon_state = "usgauss"
	icon_state = "usgauss"
	inhand_icon_state = "usgauss"
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/gauss/rifle)
	fire_delay = 0.9 SECONDS
	recoil = 1.5
	spread = 3
	slowdown = 1
	grid_height = 256
	grid_width = 64

/obj/item/gun/energy/ms13/gauss/sniper
	name = "gauss sniper"
	desc = "A gauss rifle with a scope attached, intended for the best of the best marksmen."
	base_icon_state = "m72"
	icon_state = "m72"
	inhand_icon_state = "m72"
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/gauss/sniper)
	fire_delay = 0.8 SECONDS
	recoil = 1
	spread = 2
	slowdown = 1
	has_scope = TRUE
	scope_range = 3
	grid_height = 256
	grid_width = 64

/obj/item/gun/energy/ms13/gauss/pistol
	name = "gauss pistol"
	desc = "A lightweight, one handed gauss weapon. Don't let it's size fool you."
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/gauss/gauss_fire_light.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/gauss_light.ogg'
	base_icon_state = "ppk12"
	icon_state = "ppk12"
	inhand_icon_state = "ppk12"
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/gauss/pistol)
	slot_flags = ITEM_SLOT_SUITSTORE | ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	force = 10
	recoil = 1.25
	spread = 6
	slowdown = 0.5
	fire_delay = 0.6 SECONDS
	grid_width = 96
	grid_height = 64
	wield_info = /datum/wield_info/default

/* Someone else has to figure out this thing's gimmick. Won't be me.
/obj/item/gun/ballistic/automatic/ms13/semi/gauss/chinese
	name = "\improper Chinese gauss rifle"
	desc = "A Chinese gauss rifle. Unknown how it got here, the only thing that's relevant is that it's here now. Used microfusion cells to propel its limited internal magazine."
	icon_state = "chinagauss"
	inhand_icon_state = "chinagauss"
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/ms13/gauss/internal
	extra_damage = 30
	extra_penetration = 35
	fire_delay = 10 // Capacitor moment
*/

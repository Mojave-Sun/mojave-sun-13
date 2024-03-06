/obj/item/gun/ballistic/rifle/ms13/m79
	name = "m79 grenade launcher"
	desc = "An m79 grenade launcher, capable of lobbing ordinance or otherwise a considerable distance."
	icon_state = "m79"
	inhand_icon_state = "m79"
	internal_magazine = TRUE
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/ms13/m79
	bolt_wording = "chamber"
	rack_sound = 'mojave/sound/ms13weapons/breakaction_open2.ogg'
	lock_back_sound = 'mojave/sound/ms13weapons/breakaction_open2.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/breakaction_close2.ogg'
	fire_sound = 'mojave/sound/ms13weapons/hunting_rifle.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/hunting_rifle.ogg' //placeholder sounds for now
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/antique_sniper/antique_load.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/antique_sniper/antique_load.ogg'
	fire_delay = 1 SECONDS
	rack_delay = 1 SECONDS
	spread = 0
	recoil = 2.65
	grid_height = 32
	grid_width = 224

/obj/item/ammo_box/magazine/internal/ms13/m79
	name = "m79 internal magazine (40mm)"
	icon_state = "40mm_rubber"
	ammo_type = /obj/item/ammo_casing/ms13/a40mm
	caliber = "40mm"
	max_ammo = 5

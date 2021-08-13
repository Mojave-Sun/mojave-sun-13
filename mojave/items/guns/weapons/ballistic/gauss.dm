// Guns //

/obj/item/gun/ballistic/automatic/ms13/semi/gauss
	name = "base class gauss weapon"
	desc = "Good god. HELP! A BASE CLASS!"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/gauss/gauss_fire_heavy.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/gauss/gauss_reload.ogg'
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/gauss/gauss_unload.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	internal_magazine = FALSE
	mag_type = /obj/item/ammo_box/magazine/ms13/a2mmEC
	extra_damage = 30
	extra_penetration = 35
	fire_delay = 10 // Capacitor moment
	select = 0
	burst_size = 1
	actions_types = null

/obj/item/gun/ballistic/automatic/ms13/semi/gauss/m72
	name = "M72 gauss rifle"
	desc = "The M72 is a weapon that electromagnetically fires its projectiles- at least so you've heard. All you really know is that it can punch through metal like it was never there."
	icon_state = "m72"
	inhand_icon_state = "m72"
	extra_damage = 30
	extra_penetration = 35
	fire_delay = 10 // Capacitor moment
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13

/obj/item/gun/ballistic/automatic/ms13/semi/gauss/ppk12
	name = "ppk12 gauss carbine"
	desc = "More akin to a handgun, this light weight gauss weapon is able to be fired in one hand while retaining a decent amount of power from other gauss weaponry."
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/gauss/gauss_fire_light.ogg'
	icon_state = "ppk12"
	inhand_icon_state = "ppk12"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	extra_damage = 20
	extra_penetration = 25
	spread = 5
	fire_delay = 8

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

// Magazines //

/obj/item/ammo_box/magazine/ms13/a2mmEC
	name = "20 round magazine (2mmEC)"
	icon = 'mojave/icons/objects/ammo/ammo.dmi'
	icon_state = "2mmec"
	ammo_type = /obj/item/ammo_casing/caseless/ms13/a2mmEC
	caliber = "2mmEC"
	max_ammo = 20
	multiple_sprites = AMMO_BOX_FULL_EMPTY

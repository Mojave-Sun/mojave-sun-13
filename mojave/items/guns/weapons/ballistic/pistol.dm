//Guns
/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm
	name = "police 10mm pistol"
	desc = "A pre-war 10mm pistol normally seen in the hands of law enforcement."
	icon_state = "police10mm"
	inhand_icon_state = "police10mm"
	mag_type = /obj/item/ammo_box/magazine/ms13/m10mm
	fire_sound = 'mojave/sound/ms13weapons/10mm_fire_02.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.4 SECONDS
	extra_damage = 20
	extra_penetration = 10
	spread = 8
	recoil = 0.5
	slowdown = 0.5

/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/military
	name = "military 10mm pistol"
	desc = "A bulkier, more advanced 10mm pistol typically used as a pre-war side arm by the US military."
	icon_state = "mil10mm"
	inhand_icon_state = "mil10mm"
	extra_damage = 25
	recoil = 0.75

/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/chinese
	name = "\improper Chinese pistol"
	desc = "A mass produced pre-war Chinese pistol chambered for 10mm rounds."
	icon_state = "cpistol"
	inhand_icon_state = "cpistol"
	mag_type = /obj/item/ammo_box/magazine/internal/ms13/cpistol
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/chinese/chinese1.ogg'
	extra_damage = 25
	extra_penetration = 0
	internal_magazine = TRUE

/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/chinese/update_icon_state()
	. = ..()
	if(!chambered && internal_magazine == TRUE && magazine.stored_ammo == 0) //this makes the pistol have the chinese pistol update when empty, code can be copied to similar pistols
		icon_state = "[initial(icon_state)]_empty"

	if(chambered && internal_magazine == TRUE) //this makes the chinese pistol or subtypes appear loaded as long as it's chambered
		icon_state = "[initial(icon_state)]"
	return ..()

/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/chinese/v420
	name = "v420 Chinese pistol"
	desc = "A prototype Chinese pistol with a slower fire rate but much higher damage, also sporting some much better looks."
	icon_state = "420pistol"
	inhand_icon_state = "420pistol"
	extra_damage = 30
	extra_penetration = 5
	fire_delay = 0.5 SECONDS

/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	name = "9mm pistol"
	desc = "A very common and easy to handle 9mm pistol."
	icon_state = "9mm"
	inhand_icon_state = "9mm"
	mag_type = /obj/item/ammo_box/magazine/ms13/m9mm
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/9mm/9mm2.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.4 SECONDS
	extra_damage = 20
	extra_penetration = 5
	spread = 8
	recoil = 0.25
	slowdown = 0.5

/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm/nambu
	name = "Nambu type 14"
	desc = "An unreliable ancient pre-war pistol chambered in 9mm nambu."
	icon_state = "nambu"
	inhand_icon_state = "nambu"
	mag_type = /obj/item/ammo_box/magazine/ms13/m9mm
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/9mm/9mm1.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 3
	extra_damage = 25
	extra_penetration = 5

/obj/item/gun/ballistic/automatic/pistol/ms13/m12mm
	name = "12.7mm pistol"
	desc = "A pre-war, heavy duty European pistol chambered in 12.7mm. Might not look like it, but it can do some real damage."
	icon_state = "m12mm"
	inhand_icon_state = "m12mm"
	mag_type = /obj/item/ammo_box/magazine/ms13/m12mm
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/12mm/m12mm1.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 0.4 SECONDS
	extra_damage = 35
	extra_penetration = 15
	spread = 6
	recoil = 1.25
	slowdown = 0.5

/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45
	name = ".45 pistol"
	desc = "A classic handgun chambered in .45 caliber. What's not to love?"
	icon_state = "45pistol"
	inhand_icon_state = "45pistol"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/ms13/m45
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/45/45auto1.ogg'
	can_suppress = FALSE
	fire_delay = 0.4 SECONDS
	extra_damage = 30
	extra_penetration = 5
	spread = 8
	recoil = 0.75
	slowdown = 0.5

/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45/stallion
	name = "\improper Stallion"
	desc = "A fancy, well kept, and improved .45 pistol. An even better version of the classic. Sports improved penetration and accuracy."
	icon_state = "stallion"
	inhand_icon_state = "stallion"
	extra_penetration = 10
	spread = 6

/obj/item/gun/ballistic/automatic/pistol/ms13/deagle
	name = "desert eagle"
	desc = "A hard hitting, heavy handgun uniquely chambered for .44 magnum rounds."
	icon_state = "deagle"
	inhand_icon_state = "deagle"
	mag_type = /obj/item/ammo_box/magazine/ms13/deagle
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/44/44mag1.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	extra_damage = 45
	extra_penetration = 5
	fire_delay = 0.5 SECONDS
	spread = 6
	recoil = 1.25
	slowdown = 0.5

/obj/item/gun/ballistic/automatic/pistol/ms13/pistol22
	name = ".22 pistol"
	desc = "An extremely weak but also extremely easy to conceal .22 pistol. This one has an integrated suppressor."
	icon_state = "22pistol"
	inhand_icon_state = "22pistol"
	mag_type = /obj/item/ammo_box/magazine/ms13/m22
	w_class = WEIGHT_CLASS_SMALL
	fire_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	extra_damage = 15
	fire_delay = 0.4 SECONDS
	spread = 8
	recoil = 0.25
	slowdown = 0.5

//Magazines
/obj/item/ammo_box/magazine/ms13/m45
	name = "7 round magazine (.45)"
	icon_state = "45"
	ammo_type = /obj/item/ammo_casing/ms13/c45
	caliber = ".45"
	max_ammo = 7

/obj/item/ammo_box/magazine/ms13/deagle
	name = "8 round magazine (.44)"
	icon_state = "deagle"
	ammo_type = /obj/item/ammo_casing/ms13/m44
	caliber = "44"
	max_ammo = 8
	multiple_sprites = 2

/obj/item/ammo_box/magazine/ms13/m10mm
	name = "12 round magazine (10mm)"
	icon = 'mojave/icons/objects/ammo/ammo.dmi'
	icon_state = "10mm"
	ammo_type = /obj/item/ammo_casing/ms13/c10mm
	caliber = "10mm"
	max_ammo = 12
	multiple_sprites = 2

/obj/item/ammo_box/magazine/ms13/m9mm
	name = "13 round magazine (9mm)"
	icon = 'mojave/icons/objects/ammo/ammo.dmi'
	icon_state = "9mm"
	ammo_type = /obj/item/ammo_casing/ms13/c9mm
	caliber = "9mm"
	max_ammo = 13

/obj/item/ammo_box/magazine/ms13/m22
	name = "16 round magazine (.22)"
	icon = 'mojave/icons/objects/ammo/ammo.dmi'
	icon_state = "22"
	ammo_type = /obj/item/ammo_casing/ms13/c22
	caliber = ".22"
	max_ammo = 16

/obj/item/ammo_box/magazine/ms13/m12mm
	name = "7 round magazine (12.7mm)"
	icon = 'mojave/icons/objects/ammo/ammo.dmi'
	icon_state = "m12mm"
	ammo_type = /obj/item/ammo_casing/ms13/m12mm
	caliber = "12.7mm"
	max_ammo = 7

/obj/item/ammo_box/magazine/internal/ms13/cpistol
	name = "Chinese pistol internal magazine"
	ammo_type = /obj/item/ammo_casing/ms13/c10mm
	caliber = "10mm"
	max_ammo = 10

//Loaders
/obj/item/ammo_box/ms13/cpistol
	name = "\improper Chinese pistol stripper clip (10mm)"
	icon = 'mojave/icons/objects/ammo/ammo.dmi'
	icon_state = "cpistol"
	ammo_type = /obj/item/ammo_casing/ms13/c10mm
	caliber = "10mm"
	max_ammo = 5

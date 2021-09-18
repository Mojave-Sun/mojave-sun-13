// Guns
/obj/item/gun/ballistic/shotgun/ms13/lever
	name = "lever action shotgun"
	desc = "A trusty lever action shotgun with a tube supporting a maximum of five shells and a reinforced grip for bashing in heads."
	icon_state = "levershot"
	inhand_icon_state = "levershot"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/ms13/lever
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/levershot/levershot2.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	force = 25
	fire_delay = 0.55 SECONDS
	slowdown = 0.75
	recoil = 1.5

/obj/item/gun/ballistic/shotgun/ms13/lever/update_icon_state()
	. = ..()
	worn_icon_state = "[initial(icon_state)]"
	if(!chambered && magazine.stored_ammo == 0) //if its not chambered and the magazine ammo_count is 0, its empty
		icon_state = "[initial(icon_state)]_empty"
	if(!chambered) //if its not chambered lever sprite open, cuz it may have bullets in but it's somehow not racked
		icon_state = "[initial(icon_state)]_empty"
	if(chambered) //round in the chamber and ready to fire, normal state
		icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/shotgun/ms13/huntingshot
	name = "hunting shotgun"
	desc = "A pre-war pump action shotgun with an extended tube capable of holding eight shells and a bulky stock that excels in melee combat."
	icon_state = "huntingshot"
	inhand_icon_state = "huntingshot"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/ms13/huntingshot
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/huntingshot/huntingshot2.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	force = 30
	fire_delay = 0.5 SECONDS
	slowdown = 0.75
	recoil = 1.5

/obj/item/gun/ballistic/shotgun/ms13/huntingshot/update_icon_state()
	. = ..()
	worn_icon_state = "[initial(icon_state)]"
	if(!chambered && magazine.stored_ammo == 0) //if its not chambered and the magazine ammo_count is 0, its empty
		icon_state = "[initial(icon_state)]_empty"
	if(!chambered) //if its not chambered lever sprite open, cuz it may have bullets in but it's somehow not racked
		icon_state = "[initial(icon_state)]_empty"
	if(chambered) //round in the chamber and ready to fire, normal state
		icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/shotgun/ms13/lever/trail
	name = "trail carbine"
	desc = "A lever action repeater chambered for .44 Magnum with a solid capacity in exchange for a slightly slower fire rate."
	icon_state = "trail"
	inhand_icon_state = "trail"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/ms13/tube44
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'mojave/sound/ms13weapons/trailfire.ogg'
	fire_delay = 0.55 SECONDS
	extra_damage = 40
	extra_penetration = 10
	spread = 5
	recoil = 1.5
	force = 15
	empty_indicator = TRUE

/obj/item/gun/ballistic/shotgun/ms13/lever/cowboy
	name = "cowboy repeater"
	desc = "A classic lever action repeater chambered for .357."
	icon_state = "cowboy"
	inhand_icon_state = "cowboy"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/ms13/tube357
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/repeater/repeater1.ogg'
	fire_delay = 0.5 SECONDS
	extra_damage = 35
	extra_penetration = 10
	spread = 5
	recoil = 1.25
	force = 15
	empty_indicator = TRUE

/obj/item/gun/ballistic/shotgun/ms13/lever/brush
	name = "brush gun"
	desc = "A lever action repeater chambered for the deadly .45-70 cartridge. Can't carry a lot of rounds and has quite a bit of recoil, but with so much damage does that really matter?"
	icon_state = "brush"
	inhand_icon_state = "brush"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/ms13/tube4570
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'mojave/sound/ms13weapons/brushfire.ogg'
	fire_delay = 0.5 SECONDS
	extra_damage = 55
	extra_penetration = 5
	spread = 5
	recoil = 2
	force = 15
	empty_indicator = TRUE

/obj/item/gun/ballistic/shotgun/automatic/ms13/sks
	name = "\improper European battle rifle"
	desc = "An old European semi-automatic rifle chambered for 7.62 rounds and normally fed from 10 round stripper clips."
	icon_state = "sks"
	inhand_icon_state = "sks"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/ms13/sks
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/sks/sks1.ogg'
	fire_delay = 0.5 SECONDS
	extra_damage = 30
	extra_penetration = 10
	spread = 5
	recoil = 1.25
	slowdown = 0.75
	empty_indicator = TRUE

/obj/item/gun/ballistic/shotgun/automatic/ms13/sks/update_icon_state()
	. = ..()
	worn_icon_state = "[initial(icon_state)]"
	if(!chambered && magazine.stored_ammo == 0) //if its not chambered and the magazine ammo_count is 0, its empty
		icon_state = "[initial(icon_state)]_empty"
	if(!chambered) //if its not chambered bolt sprite open, cuz it may have bullets in but it's somehow not racked
		icon_state = "[initial(icon_state)]_empty"
	if(chambered) //round in the chamber and ready to fire, normal state
		icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/shotgun/automatic/ms13/sks/scoped
	name = "scoped European battle rifle"
	desc = "A European battle rifle with a scope attached and some improved rifling for better penetration and accuracy. The added weight of the scope will slow the user down."
	icon_state = "scoped_sks"
	inhand_icon_state = "scoped_sks"
	extra_penetration = 15
	spread = 2
	slowdown = 1
	zoomable = TRUE
	zoom_amt = 9
	zoom_out_amt = 3
	empty_indicator = TRUE

//Magazines
/obj/item/ammo_box/magazine/internal/shot/ms13/tube4570
	name = "4570 internal tube magazine"
	ammo_type = /obj/item/ammo_casing/ms13/c4570
	caliber = "4570"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/shot/ms13/tube44
	name = ".44 magnum internal tube magazine"
	ammo_type = /obj/item/ammo_casing/ms13/m44
	caliber = "44"
	max_ammo = 8

/obj/item/ammo_box/magazine/internal/shot/ms13/tube357
	name = ".357 magnum internal tube magazine"
	ammo_type = /obj/item/ammo_casing/ms13/a357
	caliber = "357"
	max_ammo = 7

/obj/item/ammo_box/magazine/internal/shot/ms13/sks
	name = "SKS internal magazine (7.62)"
	ammo_type = /obj/item/ammo_casing/ms13/a762
	caliber = "a762"
	max_ammo = 10

/obj/item/ammo_box/magazine/internal/shot/ms13/lever
	name = "lever action shotgun internal tube magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13/buckshot
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/shot/ms13/huntingshot
	name = "hunting shotgun internal tube magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13/buckshot
	max_ammo = 8

//Loaders
/obj/item/ammo_box/ms13/tube4570
	name = ".45-70 speed loader tube"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "4570tube"
	ammo_type = /obj/item/ammo_casing/ms13/c4570
	caliber = "4570"
	max_ammo = 6

/obj/item/ammo_box/ms13/tube44
	name = ".44 speed loader tube"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "44tube"
	ammo_type = /obj/item/ammo_casing/ms13/m44
	caliber = "44"
	max_ammo = 8

/obj/item/ammo_box/ms13/tube357
	name = ".357 speed loader tube"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "357tube"
	ammo_type = /obj/item/ammo_casing/ms13/a357
	caliber = "357"
	max_ammo = 7

//Shotgun ammo boxes

/obj/item/ammo_box/ms13/shotgun
	name = "generic ms13 shotgun ammo box"
	desc = "You shouldn't be seeing this."
	icon_state = "junkbox"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13
	caliber = "shotgun"
	max_ammo = 8
	w_class = WEIGHT_CLASS_SMALL
	multiload = 0

/obj/item/ammo_box/ms13/shotgun/junkshot
	name = "12 gauge junkshot shotgun ammo box"
	desc = "A worn shotgun ammo box containing makeshift junkshot shells."
	icon_state = "junkbox"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13/buckshot/junk

/obj/item/ammo_box/ms13/shotgun/buckshot
	name = "12 gauge buckshot shotgun ammo box"
	desc = "A plain shotgun ammo box containing standard buckshot shells."
	icon_state = "buckbox"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13/buckshot

/obj/item/ammo_box/ms13/shotgun/triplebuck
	name = "12 gauge 000 buckshot shotgun ammo box"
	desc = "A quality shotgun ammo box containing 000 buckshot shells."
	icon_state = "triplebuckbox"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13/buckshot/triple

/obj/item/ammo_box/ms13/shotgun/flechette
	name = "12 gauge flechette shotgun ammo box"
	desc = "A quality shotgun ammo box containing flechette shells."
	icon_state = "flechbox"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13/buckshot/flechette

/obj/item/ammo_box/ms13/shotgun/slug
	name = "12 gauge slug shotgun ammo box"
	desc = "A quality shotgun ammo box containing 12 gauge slugs."
	icon_state = "slugbox"
	ammo_type = /obj/item/ammo_casing/shotgun/ms13/slug

//Guns
/obj/item/gun/ballistic/rifle/ms13/hunting
	name = "hunting rifle"
	desc = "A sturdy bolt action hunting rifle, chambered in 308. and in use before the war."
	icon_state = "hunting"
	inhand_icon_state = "hunting"
	mag_type = /obj/item/ammo_box/magazine/ms13/r308
	fire_sound = 'mojave/sound/ms13weapons/hunting_rifle.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	extra_damage = 40
	extra_penetration = 15
	fire_delay = 0.6 SECONDS
	spread = 2
	recoil = 1.75
	slowdown = 0.75

/obj/item/gun/ballistic/rifle/ms13/hunting/scoped
	name = "scoped hunting rifle"
	desc = "A bolt action hunting rifle with a scope attached and a slightly improved barrel for better penetration and reduced recoil, though the added weight of everything will slow the user down."
	icon_state = "scoped_hunting"
	inhand_icon_state = "scoped_hunting"
	extra_penetration = 20
	recoil = 1.5
	slowdown = 1
	zoomable = TRUE
	zoom_amt = 9
	zoom_out_amt = 3

/obj/item/gun/ballistic/rifle/ms13/varmint
	name = "varmint rifle"
	desc = "A light hunting rifle chambered for 5.56 rounds."
	icon_state = "varmint"
	inhand_icon_state = "varmint"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	fire_sound = 'mojave/sound/ms13weapons/varmint_rifle.ogg'
	fire_delay = 0.6 SECONDS
	extra_damage = 30
	extra_penetration = 5
	spread = 2
	recoil = 0.75
	slowdown = 0.75
	mag_type = /obj/item/ammo_box/magazine/ms13/r10

/obj/item/gun/ballistic/rifle/ms13/varmint/update_icon_state()
	. = ..()
	worn_icon_state = "[initial(icon_state)]"
	if(!chambered && magazine) //this makes all our rifles empty, the state with a magazine, rifle not necassarily empty just not chambered
		icon_state = "[initial(icon_state)]_mag_empty"

	if(!chambered && magazine && bolt_locked == TRUE) //this makes all our rifles empty, the state with a magazine, rifle not necassarily empty just not chambered
		icon_state = "[initial(icon_state)]_mag_empty"

	if(!chambered && !magazine && bolt_locked == TRUE) //this makes all our rifles empty, the state with nothing
		icon_state = "[initial(icon_state)]_empty"

	if(!chambered && !magazine && bolt_locked == FALSE)
		icon_state = "[initial(icon_state)]_cham_empty"

	if(!chambered && !magazine && bolt_locked == FALSE)
		icon_state = "[initial(icon_state)]_cham_empty"

	if(chambered && !magazine && bolt_locked == FALSE) //this makes all our rifles chamberedy, the state with no magazine
		icon_state = "[initial(icon_state)]_cham_empty"

	if(chambered && !magazine && bolt_locked == TRUE) //this makes all our rifles chamberedy, the state with no magazine
		icon_state = "[initial(icon_state)]_empty"

	if(chambered && magazine && bolt_locked == FALSE) //this makes all our rifles full state when chambered and they have a magazine
		icon_state = "[initial(icon_state)]"

	if(chambered && magazine && bolt_locked == TRUE) //this makes all our rifles full state when chambered and they have a magazine
		icon_state = "[initial(icon_state)]_mag_empty"

/obj/item/gun/ballistic/rifle/ms13/varmint/ratslayer
	name = "\improper Ratslayer"
	desc = "A uniquely modified varmint rifle with improved rifling, a scope, and supressor attached. The added weight of all the attachments will slow the user down some more."
	icon_state = "ratslayer"
	inhand_icon_state = "ratslayer"
	extra_penetration = 10
	recoil = 0.5
	slowdown = 1
	fire_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	zoomable = TRUE
	zoom_amt = 9
	zoom_out_amt = 3

/obj/item/gun/ballistic/rifle/ms13/hunting/scoped/amr
	name = "anti-material rifle"
	desc = "An extremely heavy duty .50 caliber sniper rifle. Have you seen what this can do to a Deathclaw?"
	icon_state = "amr"
	inhand_icon_state = "amr"
	mag_type = /obj/item/ammo_box/magazine/ms13/amr
	fire_sound = 'mojave/sound/ms13weapons/amrfire.ogg'
	fire_delay = 0.8 SECONDS
	extra_damage = 60
	extra_penetration = 20
	spread = 2
	recoil = 4
	slowdown = 1.5

/obj/item/gun/ballistic/rifle/ms13/hunting/scoped/amr/update_icon_state()
	. = ..()
	worn_icon_state = "[initial(icon_state)]"
	if(!chambered && magazine) //this makes all our rifles empty, the state with a magazine, rifle not necassarily empty just not chambered
		icon_state = "[initial(icon_state)]_mag_empty"

	if(!chambered && magazine && bolt_locked == TRUE) //this makes all our rifles empty, the state with a magazine, rifle bolt open
		icon_state = "[initial(icon_state)]_mag_empty"

	if(!chambered && !magazine && bolt_locked == TRUE) //this makes all our rifles empty, the state with nothing, bolt open
		icon_state = "[initial(icon_state)]_empty"

	if(!chambered && !magazine && bolt_locked == FALSE) //no mag bolt closed
		icon_state = "[initial(icon_state)]_cham_empty"

	if(chambered && !magazine && bolt_locked == FALSE) //this makes all our rifles chambered, the state with no magazine, bolt closed
		icon_state = "[initial(icon_state)]_cham_empty"

	if(chambered && !magazine && bolt_locked == TRUE) //this makes all our rifles chambered, the state with no magazine, bolt open
		icon_state = "[initial(icon_state)]_empty"

	if(chambered && magazine && bolt_locked == FALSE) //this makes all our rifles full state when chambered and they have a magazine, bolt closed
		icon_state = "[initial(icon_state)]"

	if(chambered && magazine && bolt_locked == TRUE) //this makes all our rifles full state when chambered and they have a magazine, bolt open
		icon_state = "[initial(icon_state)]_mag_empty"
		////yes this has extensive ammounts, some might be unecassary but are in place as a failsafe

/obj/item/gun/ballistic/rifle/ms13/hunting/chinese
	name = "\improper Chinese hunting rifle"
	desc = "A Chinese bolt action hunting rifle, chambered in 7.62 with an internal magazine."
	icon_state = "chinesehunting"
	inhand_icon_state = "chinesehunting"
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/ms13/chinese_rifle
	fire_sound = 'mojave/sound/ms13weapons/hunting_rifle.ogg'
	extra_damage = 35
	extra_penetration = 5
	spread = 2
	recoil = 1.25

/* Weeb shit and an unbalanced M1 Garand for now
/obj/item/gun/ballistic/rifle/ms13/hunting/japanese
	name = "\improper Japanese war rifle"
	desc = "An ancient pre-war rifle, chambered in .308 with an internal 5 round magazine. Hardly functions in days like these, but it works... Sometimes."
	icon_state = "arisaka"
	inhand_icon_state = "arisaka"
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/ms13/arisaka
	fire_sound = 'mojave/sound/ms13weapons/hunting_rifle.ogg'
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/arisaka/ArisakaOpen.ogg' //Didn't ask.
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/arisaka/ArisakaClose.ogg'
	can_jam = TRUE
	jamming_chance = 55
	jamming_increment = 10
	unjam_chance = 5
	extra_damage = 35

/obj/item/gun/ballistic/rifle/ms13/hunting/japanese/scoped //not likely to ever be seen in game, more of an admin thing, dont map it in, it'd be slightly OP (Didn't ask, also i won't :mrbruh:)
	name = "scoped Japanese war rifle"
	desc = "A really old pre-war rifle, chambered in .308 with an internal 5 round magazine. This one has a scoped mounted to it. Hardly functions in days like these, but it works... Sometimes."
	icon_state = "scoped_arisaka"
	inhand_icon_state = "scoped_arisaka"
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 14

/obj/item/gun/ballistic/rifle/ms13/hunting/battlerifle
	name = "This Machine"
	desc = "An ancient pre-war rifle design thats still reliable, using an 8 round enbloc magazine chambered in .308."
	icon_state = "battlerifle"
	inhand_icon_state = "battlerifle"
	bolt_type = BOLT_TYPE_NO_BOLT
	empty_alarm = TRUE
	semi_auto = TRUE
	internal_magazine = FALSE
	mag_type = /obj/item/ammo_box/magazine/ms13/r308/battlerifle
	fire_sound = 'mojave/sound/ms13weapons/battlerifle.ogg'
	empty_alarm_sound = 'mojave/sound/ms13weapons/battlerifleunload.ogg'
	extra_damage = 45
	extra_penetration = 15
*/ 

//Magazines
/obj/item/ammo_box/magazine/ms13/r10
	name = "10 round magazine (5.56mm)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "556r10"
	ammo_type = /obj/item/ammo_casing/ms13/a556
	caliber = "a556"
	max_ammo = 10

/obj/item/ammo_box/magazine/ms13/r308
	name = "5 round magazine (.308)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "r308"
	ammo_type = /obj/item/ammo_casing/ms13/a308
	caliber = "a308"
	max_ammo = 5

/obj/item/ammo_box/magazine/ms13/amr
	name = "6 round magazine (.50)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "50cal"
	ammo_type = /obj/item/ammo_casing/ms13/a50MG
	caliber = "a50MG"
	max_ammo = 6

/obj/item/ammo_box/magazine/ms13/r308/battlerifle
	name = "8 round enbloc magazine (.308)"
	icon_state = "battler"
	ammo_type = /obj/item/ammo_casing/ms13/a308
	caliber = "a308"
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET

/obj/item/ammo_box/magazine/internal/ms13/chinese_rifle
	name = "Chinese rifle internal magazine (7.62)"
	icon_state = "r308"
	ammo_type = /obj/item/ammo_casing/ms13/a762
	caliber = "a762"
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/ms13/arisaka
	name = "Arisaka rifle internal magazine (.308)"
	icon_state = "r308"
	ammo_type = /obj/item/ammo_casing/ms13/a308
	caliber = "a308"
	max_ammo = 5

//Loaders

/obj/item/ammo_box/ms13/r762
	name = "rifle stripper clip (7.62)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "762clip"
	ammo_type = /obj/item/ammo_casing/ms13/a762
	caliber = "a762"
	max_ammo = 5
	multiple_sprites = AMMO_BOX_PER_BULLET

//Guns
/obj/item/gun/ballistic/rifle/ms13/hunting
	name = "hunting rifle"
	desc = "A sturdy bolt action hunting rifle, chambered in .308 and in use before the war."
	icon_state = "hunting"
	inhand_icon_state = "hunting"
	mag_type = /obj/item/ammo_box/magazine/ms13/r308
	fire_sound = 'mojave/sound/ms13weapons/hunting_rifle.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/hunting_rifle.ogg'
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	fire_delay = 0.75 SECONDS
	rack_delay = 0.75 SECONDS
	spread = 2
	recoil = 1.75
	slowdown = 0.75
	grid_height = 32
	grid_width = 224

/obj/item/gun/ballistic/rifle/ms13/hunting/scoped
	name = "scoped hunting rifle"
	desc = "A bolt action hunting rifle with a scope attached and a slightly improved barrel for reduced recoil, though the added weight of everything will slow the user down."
	icon_state = "scoped_hunting"
	inhand_icon_state = "scoped_hunting"
	recoil = 1.5
	slowdown = 1
	has_scope = TRUE
	scope_range = 4

/obj/item/gun/ballistic/rifle/ms13/varmint
	name = "varmint rifle"
	desc = "A light hunting rifle chambered for 5.56 rounds."
	icon_state = "varmint"
	inhand_icon_state = "varmint"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	fire_sound = 'mojave/sound/ms13weapons/varmint_rifle.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/varmint_rifle.ogg'
	fire_delay = 0.65 SECONDS
	rack_delay = 0.65 SECONDS
	spread = 2
	recoil = 0.75
	slowdown = 0.75
	mag_type = /obj/item/ammo_box/magazine/ms13/r10
	grid_height = 32
	grid_width = 192

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
	recoil = 0.25
	slowdown = 1
	fire_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	far_fire_sound = null
	w_class = WEIGHT_CLASS_HUGE
	has_scope = TRUE
	scope_range = 2
	grid_height = 32
	grid_width = 224

/obj/item/gun/ballistic/rifle/ms13/hunting/scoped/amr
	name = "anti-material rifle"
	desc = "An extremely heavy duty .50 caliber sniper rifle. Have you seen what this can do to a Deathclaw?"
	icon_state = "amr"
	inhand_icon_state = "amr"
	mag_type = /obj/item/ammo_box/magazine/ms13/amr
	fire_sound = 'mojave/sound/ms13weapons/amrfire.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/amr.ogg'
	fire_delay = 1 SECONDS
	rack_delay = 1 SECONDS
	spread = 2
	recoil = 4
	slowdown = 1.5
	scope_range = 4
	grid_height = 256
	grid_width = 64

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

/obj/item/gun/ballistic/rifle/ms13/hunting/surplus
	name = "surplus hunting rifle"
	desc = "A cheap bolt action hunting rifle, chambered in 7.62 with an internal magazine."
	icon_state = "surplushunting"
	inhand_icon_state = "surplushunting"
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/ms13/chinese_rifle
	fire_sound = 'mojave/sound/ms13weapons/hunting_rifle.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/hunting_rifle.ogg'
	spread = 2
	recoil = 1.25

/obj/item/gun/ballistic/rifle/ms13/jezzail
	name = "handmade jezzail"
	desc = "A crude but effective and accurate handmade single shot rifle. It seems to be chambered in 7.62"
	icon_state = "jezzail"
	inhand_icon_state = "jezzail"
	internal_magazine = TRUE
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/ms13/jezzail
	bolt_wording = "chamber"
	rack_sound = 'mojave/sound/ms13weapons/breakaction_open.ogg'
	lock_back_sound = 'mojave/sound/ms13weapons/breakaction_open.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/breakaction_close.ogg'
	fire_sound = 'mojave/sound/ms13weapons/hunting_rifle.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/hunting_rifle.ogg' //placeholder sounds for now
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/antique_sniper/antique_load.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/antique_sniper/antique_load.ogg'
	fire_delay = 1 SECONDS
	rack_delay = 1 SECONDS
	spread = 0
	recoil = 1.65
	grid_height = 32
	grid_width = 224

/obj/item/gun/ballistic/rifle/ms13/antique_sniper
	name = "antique sniper"
	desc = "A very old single shot sniper rifle from long before the war. A prized possession, even now. It is chambered in the ever so hefty 45-70."
	icon_state = "antique"
	inhand_icon_state = "antique"
	internal_magazine = TRUE
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/ms13/antique
	bolt_wording = "trap"
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/antique_sniper/antique_open.ogg'
	lock_back_sound = 'mojave/sound/ms13weapons/gunsounds/antique_sniper/antique_open.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/antique_sniper/antique_close.ogg'
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/antique_sniper/antique_fire.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/antique.ogg'
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/antique_sniper/antique_load.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/antique_sniper/antique_load.ogg'
	fire_delay = 1 SECONDS
	rack_delay = 1 SECONDS
	spread = 0
	recoil = 2
	has_scope = TRUE
	scope_range = 4
	grid_height = 64
	grid_width = 224

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
	w_class = WEIGHT_CLASS_TINY
	max_ammo = 10
	grid_height = 32
	grid_width = 32

/obj/item/ammo_box/magazine/ms13/r308
	name = "5 round magazine (.308)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "r308"
	ammo_type = /obj/item/ammo_casing/ms13/a308
	caliber = "a308"
	w_class = WEIGHT_CLASS_TINY
	max_ammo = 5
	grid_height = 32
	grid_width = 32

/obj/item/ammo_box/magazine/ms13/amr
	name = "6 round magazine (.50)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "50cal"
	ammo_type = /obj/item/ammo_casing/ms13/a50MG
	caliber = "a50MG"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 6
	grid_height = 64
	grid_width = 32

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

/obj/item/ammo_box/magazine/internal/ms13/jezzail
	name = "jezzail internal magazine (7.62)"
	icon_state = "r308"
	ammo_type = /obj/item/ammo_casing/ms13/a762
	caliber = "a762"
	max_ammo = 1

/obj/item/ammo_box/magazine/internal/ms13/antique
	name = "antique sniper internal magazine (.45-70)"
	icon_state = "r308"
	ammo_type = /obj/item/ammo_casing/ms13/c4570
	caliber = "4570"
	max_ammo = 1

//Loaders

/obj/item/ammo_box/ms13/stripper
	name = "BASE TYPE MS13 STRIPPER CLIP"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	w_class = WEIGHT_CLASS_SMALL
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiload = TRUE
	grid_height = 32
	grid_width = 32

/obj/item/ammo_box/ms13/stripper/r762
	name = "rifle stripper clip (7.62)"
	icon_state = "762clip"
	ammo_type = /obj/item/ammo_casing/ms13/a762
	caliber = "a762"
	max_ammo = 5


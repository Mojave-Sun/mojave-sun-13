//Mojave Sun related guns and variables to inherent

/obj/item/gun/ballistic/ms13
	name = "generic ms13 gun"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_guns.dmi'
	tac_reloads = FALSE
	wound_bonus = 0
	bare_wound_bonus = 0
	log_pickup_and_drop = TRUE
	var/has_scope = FALSE
	var/scope_range = 0

/obj/item/gun/ballistic/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/guns/guns_inventory.dmi')

	if(has_scope)
		AddComponent(/datum/component/scope, range_modifier = (scope_range))

//Mojave Sun version for shotguns
/obj/item/gun/ballistic/shotgun/ms13
	name = "generic ms13 gun"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_guns.dmi'
	slot_flags = ITEM_SLOT_SUITSTORE
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	force = 20
	wound_bonus = 0
	bare_wound_bonus = 0
	log_pickup_and_drop = TRUE
	wield_info = /datum/wield_info/default/inhands
	var/has_scope = FALSE
	var/scope_range = 0

/obj/item/gun/ballistic/shotgun/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/guns/guns_inventory.dmi')

	if(has_scope)
		AddComponent(/datum/component/scope, range_modifier = (scope_range))
//Automatic shotguns
/obj/item/gun/ballistic/shotgun/automatic/ms13
	name = "generic ms13 gun"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_guns.dmi'
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	force = 15
	wound_bonus = 0
	bare_wound_bonus = 0
	log_pickup_and_drop = TRUE
	slowdown = 0.75 //A fall back in case someone forgets to define slowdown at the gun level
	wield_info = /datum/wield_info/default/inhands
	var/has_scope = FALSE
	var/scope_range = 0

/obj/item/gun/ballistic/shotgun/automatic/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/guns/guns_inventory.dmi')

	if(has_scope)
		AddComponent(/datum/component/scope, range_modifier = (scope_range))

//Revolvers
/obj/item/gun/ballistic/revolver/ms13
	name = "generic ms13 gun"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_guns.dmi'
	force = 10
	wound_bonus = 0
	bare_wound_bonus = 0
	log_pickup_and_drop = TRUE
	slowdown = 0.5 //A fall back in case someone forgets to define slowdown at the gun level
	var/has_scope = FALSE
	var/scope_range = 0

/obj/item/gun/ballistic/revolver/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/guns/guns_inventory.dmi')

	if(has_scope)
		AddComponent(/datum/component/scope, range_modifier = (scope_range))

/obj/item/gun/ballistic/revolver/ms13/update_icon_state()
	worn_icon_state = "[initial(icon_state)]"
	if(!chambered && magazine.stored_ammo == 0) //this makes all our revolvers empty, as long as it has no ammo in it
		icon_state = "[initial(icon_state)]_empty"
	else
		icon_state = "[initial(icon_state)]"
	if(!chambered) //this makes all our revolvers empty, as long as it has no ammo in it, this is a failsafe in case stored_ammo decided not to work
		icon_state = "[initial(icon_state)]_empty"
	else
		icon_state = "[initial(icon_state)]"
	return ..()

//Automatics
/obj/item/gun/ballistic/automatic/ms13
	name = "generic ms13 gun"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_guns.dmi'
	can_suppress = FALSE
	tac_reloads = FALSE
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_SUITSTORE
	force = 15
	wound_bonus = 0
	bare_wound_bonus = 0
	fire_delay = 0
	extra_damage = 0
	extra_penetration = 0
	log_pickup_and_drop = TRUE
	slowdown = 0.75 //A fall back in case someone forgets to define slowdown at the gun level
	wield_info = /datum/wield_info/default/inhands
	var/has_scope = FALSE
	var/scope_range = 0

/obj/item/gun/ballistic/automatic/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/guns/guns_inventory.dmi')

	if(has_scope)
		AddComponent(/datum/component/scope, range_modifier = (scope_range))

/obj/item/gun/ballistic/automatic/ms13/update_icon_state()
	. = ..()
	worn_icon_state = "[initial(icon_state)]"
	if(current_skin)
		icon_state = "[unique_reskin[current_skin]][sawn_off ? "_sawn" : ""]"
	else
		icon_state = "[initial(icon_state)][sawn_off ? "_sawn" : ""]"
	if(!chambered && magazine) //this makes all our rifles empty, the state with a magazine, rifle not necassarily empty just not chambered
		icon_state = "[initial(icon_state)]_mag_empty"

	if(!chambered && !magazine) //this makes all our rifles empty, the state with nothing
		icon_state = "[initial(icon_state)]_empty"

	if(chambered && !magazine) //this makes all our rifles chamberedy, the state with no magazine
		icon_state = "[initial(icon_state)]_cham_empty"

	if(chambered && magazine) //this makes all our rifles full state when chambered and they have a magazine
		icon_state = "[initial(icon_state)]"
		//note this also applies to the SMG's

/obj/item/gun/ballistic/automatic/ms13/semi // For weapons that are intended to only fire in semi-auto.
	name = "semi automatic generic ms13 gun"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_guns.dmi'
	force = 15
	wound_bonus = 0
	bare_wound_bonus = 0
	actions_types = null
	burst_size = 1
	select = 1
	log_pickup_and_drop = TRUE
	slowdown = 0.75 //A fall back in case someone forgets to define slowdown at the gun level

/obj/item/gun/ballistic/automatic/ms13/full // For weapons that are intended to have fully automatic capability
	name = "fully automatic generic ms13 gun"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_guns.dmi'
	force = 15
	wound_bonus = 0
	bare_wound_bonus = 0
	actions_types = null
	select = 1
	burst_size = 1
	log_pickup_and_drop = TRUE
	slowdown = 0.75 //A fall back in case someone forgets to define slowdown at the gun level

/obj/item/gun/ballistic/automatic/ms13/full/Initialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/gun/ballistic/automatic/pistol/ms13
	name = "generic ms13 gun"
	desc = "complain when seeing this"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_guns.dmi'
	can_suppress = FALSE
	tac_reloads = FALSE
	wound_bonus = 0
	bare_wound_bonus = 0
	log_pickup_and_drop = TRUE
	force = 10
	slowdown = 0.5 //A fall back in case someone forgets to define slowdown at the gun level
	slot_flags = ITEM_SLOT_SUITSTORE | ITEM_SLOT_BELT
	var/has_scope = FALSE
	var/scope_range = 0

/obj/item/gun/ballistic/automatic/pistol/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/guns/guns_inventory.dmi')

	if(has_scope)
		AddComponent(/datum/component/scope, range_modifier = (scope_range))

/obj/item/gun/ballistic/automatic/pistol/ms13/update_icon_state()
	. = ..()
	worn_icon_state = "[initial(icon_state)]"
	if(!chambered && magazine) //this makes all our pistols empty, the state with a magazine, not necassarily empty just not chambered
		icon_state = "[initial(icon_state)]_mag_empty"

	if(!chambered && !magazine) //this makes all our pistols empty, the state with nothing, no mag no bullets
		icon_state = "[initial(icon_state)]_empty"

	if(chambered && !magazine) //this makes all our pistols chambered, the state with no magazine, but still a round in the chamber
		icon_state = "[initial(icon_state)]_cham_empty"

	if(chambered && magazine) //this makes all our pistols full state when chambered and they have a magazine
		icon_state = "[initial(icon_state)]"

	if(!chambered && magazine && magazine.stored_ammo == 0) //this makes the pistol have the bolt/slide back if it shot all it's rounds, semi-auto go brrrr
		icon_state = "[initial(icon_state)]_mag_empty"

	if(!chambered && !magazine && bolt_locked == FALSE) //this makes the pistol bolt be back when you unchamber a round, the state with no magazine
		icon_state = "[initial(icon_state)]_cham_empty"

//Bolt-actions
/obj/item/gun/ballistic/rifle/ms13
	name = "generic ms13 gun"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	worn_icon = 'mojave/icons/mob/worn_guns.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	internal_magazine = FALSE
	tac_reloads = FALSE
	slot_flags = ITEM_SLOT_SUITSTORE
	force = 15
	wound_bonus = 0
	bare_wound_bonus = 0
	log_pickup_and_drop = TRUE
	slowdown = 0.75 //A fall back in case someone forgets to define slowdown at the gun level
	wield_info = /datum/wield_info/default/inhands
	var/jamming_chance = 20
	var/unjam_chance = 10
	var/jamming_increment = 5
	var/jammed = FALSE
	var/can_jam = FALSE
	var/has_scope = FALSE
	var/scope_range = 0

/obj/item/gun/ballistic/rifle/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/guns/guns_inventory.dmi')

	if(has_scope)
		AddComponent(/datum/component/scope, range_modifier = (scope_range))

/obj/item/gun/ballistic/rifle/ms13/update_icon_state()
	. = ..()
	worn_icon_state = "[initial(icon_state)]"
	if(!chambered && bolt_locked == TRUE) //this makes all our rifles empty, rifle bolt open
		icon_state = "[initial(icon_state)]_empty"

	if(!chambered && bolt_locked == FALSE) //bolt closed
		icon_state = "[initial(icon_state)]"

	if(chambered && bolt_locked == FALSE) //this makes all our rifles chambered, bolt closed
		icon_state = "[initial(icon_state)]"

	if(chambered && bolt_locked == TRUE) //this makes all our rifles chambered, bolt open
		icon_state = "[initial(icon_state)]_empty"

/obj/item/gun/ballistic/rifle/ms13/attack_self(mob/user)
	if(can_jam)
		if(jammed)
			if(prob(unjam_chance))
				jammed = FALSE
				unjam_chance = 10
			else
				unjam_chance += 10
				to_chat(user, span_warning("[src] is jammed!"))
				playsound(user,'sound/weapons/jammed.ogg', 75, TRUE)
				return FALSE
	..()

/obj/item/gun/ballistic/rifle/ms13/process_fire(mob/user)
	if(can_jam)
		if(chambered.loaded_projectile)
			if(prob(jamming_chance))
				jammed = TRUE
			jamming_chance  += jamming_increment
			jamming_chance = clamp (jamming_chance, 0, 100)
	return ..()

/* Have fun, until we get our own or show interest in using this widespread.
obj/item/gun/ballistic/rifle/ms13/attackby(obj/item/item, mob/user, params)
	. = ..()
	if(can_jam)
		if(bolt_locked)
			if(istype(item, /obj/item/gun_maintenance_supplies))
				if(do_after(user, 10 SECONDS, target = src))
					user.visible_message(span_notice("[user] finishes maintenance of [src]."))
					jamming_chance = 10
					qdel(item) */

//Loaders/Ammo boxes
/obj/item/ammo_box/ms13
	name = "generic ms13 ammo box"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	worn_icon = 'mojave/icons/mob/worn_misc.dmi'
	worn_icon_state = "empty_placeholder"

/obj/item/ammo_box/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/ammo/ammo_inventory.dmi')

//Magazines
/obj/item/ammo_box/magazine/ms13
	name = "generic ms13 magazine"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	worn_icon = 'mojave/icons/mob/worn_misc.dmi'
	worn_icon_state = "empty_placeholder"

/obj/item/ammo_box/magazine/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/ammo/ammo_inventory.dmi')

/*
/obj/item/gun/ballistic/automatic/ms13/minigun
	name = "M134 Minigun"
	desc = "The M134 is a 7.62×51mm, six-barrel rotary machine gun with a rate of fire between 2,000 and 6,000 rounds per minute."
	icon_state = "arg"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/tommygunm45
	fire_sound = 'mojave/sound/ms13weapons/10mm_fire_03.ogg'
	fire_delay = 0.2
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/ms13/shotgun/pancor
	name = "Pancor Jackhammer"
	desc = "A select fire automatic shotgun, the pinnacle of turning things into swiss cheese."
	icon_state = "pancor"
	item_state = "cshotgun1"
	fire_sound = 'mojave/sound/ms13weapons/repeater_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/d12g
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/ms13/shotgun/caws
	name = "HK CAWS"
	desc = "A select fire automatic shotgun, a modern variant of the Pancor Jackhammer."
	icon_state = "caws"
	item_state = "cshotgun1"
	fire_sound = 'mojave/sound/ms13weapons/repeater_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/d12g
	fire_delay = 4
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY


/obj/item/gun/ballistic/automatic/ms13/bozar
	name = "Bozar"
	desc = "The ultimate refinement of the sniper's art, the Bozar is a scoped, accurate, light machine gun that will make nice big holes in your enemy. Uses 5.56."
	icon_state = "bozar"
	item_state = "sniper"
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/r20
	fire_delay = 2
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'mojave/sound/ms13weapons/bozar_fire.ogg'
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13

 /obj/item/gun/ballistic/automatic/ms13/m72
	name = "M72 Gauss Rifle"
	desc = "The M72 rifle is of German design. It uses an electromagnetic field to propel rounds at tremendous speed... and pierce almost any obstacle. Its range, accuracy and stopping power is almost unparalleled."
	icon = 'mojave/icons/objects/guns/projectile.dmi'
	item_state = "shotgun"
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/m2mm
	fire_sound = 'mojave/sound/ms13weapons/gauss_rifle.ogg'
	can_suppress = FALSE
	fire_delay = 3
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/ms13/lsw
	name = "L86A1 LSW"
	desc = "A british variant of the L86 platform. This one was designed as a light support weapon, featuring a bipod and fluted barrel."
	icon_state = "lsw"
	item_state = "l6closedmag"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'mojave/sound/ms13weapons/assaultrifle_fire.ogg'
	can_suppress = FALSE
	fire_delay = 0.3
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY */


//Mojave Sun
//Magazines
/*
/obj/item/ammo_box/magazine/d12g
	name = "shotgun magazine (12g slugs)"
	desc = "A 12g drum magazine."
	icon = 'mojave/icons/objects/ammo.dmi'
	icon_state = "riotmag"
	ammo_type = /obj/item/ammo_casing/shotgun
	caliber = "shotgun"
	max_ammo = 12
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m2mm
	name = "2mm electromagnetic magazine"
	icon = 'mojave/icons/objects/ammo.dmi'
	icon_state = "2mm"
	ammo_type = /obj/item/ammo_casing/ms13/bullet/c2mm
	caliber = "2mm"
	max_ammo = 20
	multiple_sprites = 2 */

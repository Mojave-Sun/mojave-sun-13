////guns
/obj/item/gun/energy/ms13
	name = "generic ms13 gun"
	desc = "complain when seeing this"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	base_icon_state = ""
	w_class = WEIGHT_CLASS_HUGE
	automatic_charge_overlays = FALSE
	extra_damage = 10
	fire_delay = 6
	var/tac_reloads = FALSE
	var/load_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/energy_reload.ogg'
	var/unload_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/energy_unload.ogg'
	var/load_sound_volume = 40
	var/load_sound_vary = TRUE

/obj/item/gun/energy/ms13/update_icon()
	if(!cell)
		icon_state = "[base_icon_state]_empty"
	else
		icon_state = "[base_icon_state]"
	return ..()

/obj/item/gun/energy/ms13/proc/insert_magazine(mob/user, var/obj/item/stock_parts/cell/ms13/AM, display_message = TRUE)
	if(!istype(AM, cell_type))
		to_chat(user, "<span class='warning'>\The [AM] doesn't seem to fit into \the [src]...</span>")
		return FALSE
	if(user.transferItemToLoc(AM, src))
		cell = AM
		if (display_message)
			to_chat(user, "<span class='notice'>You load a new [AM] into \the [src].</span>")
			playsound(src, load_sound, load_sound_volume, load_sound_vary)
		update_icon()
		return TRUE
	else
		to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")
		return FALSE

///Handles all the logic of magazine ejection, if tac_load is set that magazine will be tacloaded in the place of the old eject
/obj/item/gun/energy/ms13/proc/eject_magazine(mob/user, display_message = TRUE, var/obj/item/stock_parts/cell/ms13/tac_load = null)
	cell.forceMove(drop_location())
	var/obj/item/stock_parts/cell/ms13/old_mag = cell
	playsound(src, unload_sound, load_sound_volume, load_sound_vary)
	if (tac_load)
		if (insert_magazine(user, tac_load, FALSE))
			to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src].</span>")
		else
			to_chat(user, "<span class='warning'>You dropped the old [old_mag.name], but the new one doesn't fit. How embarassing.</span>")
			cell = null
	else
		cell = null
	user.put_in_hands(old_mag)
	old_mag.update_icon()
	if (display_message)
		to_chat(user, "<span class='notice'>You pull the [old_mag.name] out of \the [src].</span>")
	update_icon()

/obj/item/gun/energy/ms13/attackby(obj/item/A, mob/user, params)
	. = ..()
	if (.)
		return
	if (istype(A, /obj/item/stock_parts/cell/ms13))
		var/obj/item/stock_parts/cell/ms13/AM = A
		if (!cell)
			insert_magazine(user, AM)
		else
			if (tac_reloads)
				eject_magazine(user, FALSE, AM)
			else
				to_chat(user, "<span class='notice'>There's already a [cell.name] in \the [src].</span>")
		return

/obj/item/gun/energy/ms13/attack_self(mob/user)
	eject_magazine(user)
	return ..()

/obj/item/gun/energy/ms13/attack_hand(mob/user)
	if(loc == user && user.is_holding(src) && cell)
		eject_magazine(user)
		return
	return ..()

/obj/item/gun/energy/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/guns/guns_inventory.dmi')

/obj/item/gun/energy/ms13/laser
	name = "Base class laser gub"
	desc = "Life is heck. Report a bug today"
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser)
	cell_type = /obj/item/stock_parts/cell/ms13/mfc
	extra_damage = 0
	extra_penetration = 0
	fire_delay = 5

/obj/item/gun/energy/ms13/plasma
	name = "Base class plasma gun"
	desc = "Life is heck. Report a bug today"
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/plasma)
	cell_type = /obj/item/stock_parts/cell/ms13/pc
	extra_damage = 0
	extra_penetration = 0
	fire_delay = 5

// Laser Pistols //

/obj/item/gun/energy/ms13/laser/pistol
	name = "AEP7 laser pistol"
	desc = "A basic energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal."
	icon_state = "stanlas_pistol"
	base_icon_state = "stanlas_pistol"
	inhand_icon_state = "stanlas_pistol"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_1.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/pistol)
	cell_type = /obj/item/stock_parts/cell/ms13/ec
	extra_damage = 20
	extra_penetration = 0
	fire_delay = 4

/obj/item/gun/energy/ms13/laser/pistol/advanced
	name = "AER9 laser pistol"
	desc = "A later model of the laser pistol. Better and stronger, more reliable overall."
	icon_state = "advlas_pistol"
	base_icon_state = "advlas_pistol"
	inhand_icon_state = "advlas_pistol"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_2.ogg'
	extra_damage = 25
	extra_penetration = 5

/obj/item/gun/energy/ms13/laser/pistol/defender
	name = "laser defender"
	desc = "A low quantity produced experimental alternative to the Laser Defender. Proved to be worthy, but not of note. Better than the average laser pistol."
	icon_state = "laserdefender"
	base_icon_state = "laserdefender"
	inhand_icon_state = "laserdefender"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_3.ogg'
	extra_damage = 25
	extra_penetration = 10
	fire_delay = 3.5

/obj/item/gun/energy/ms13/laser/pistol/wattz
	name = "Wattz laser pistol"
	desc = "The Wattz 1000 is a variant of the laser pistol developed for civilian use. It's lower powered than the military counterparts."
	icon_state = "wattzpistol"
	base_icon_state = "wattzpistol"
	inhand_icon_state = "wattzpistol"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_4.ogg'
	extra_damage = 15
	fire_delay = 6

/obj/item/gun/energy/ms13/laser/pistol/wattz/magneto
	name = "Wattz magneto-laser pistol"
	desc = "A modified Wattz 1000, utilizing systems to concentrate the laser emitted in order to gain better penetration power."
	icon_state = "wattz1000mag"
	base_icon_state = "wattz1000mag"
	inhand_icon_state = "wattz1000mag"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_5.ogg'
	extra_damage = 15
	extra_penetration = 5

/* Hekzder is an incredibly rude individual. I refuse to remove this beautiful creation. add back when he's not looking.
/obj/item/gun/energy/ms13/laser/pistol/wattz/cutdown
	name = "Wattz cutdown"
	desc = "An unofficially produced post-war version of the Wattz 2000. Given the nickname 'Cutdown'- go figure. it's wildly inaccurate, and has lower range, but still packs a punch and is concealable."
	icon_state = "wattz2000car"
	base_icon_state = "wattz2000car"
	inhand_icon_state = "wattz2000car"
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/unfocused)
	extra_damage = 30
	extra_penetration = 5
	fire_delay = 7
	spread = 10
*/

// Laser rifles //

/obj/item/gun/energy/ms13/laser/aer9
	name = "AER9 laser rifle"
	desc = "A relic of the past, this is an early wood furnished version of the laser rifle that the U.S Military actively adopted."
	base_icon_state = "stanlas_rifle"
	icon_state = "stanlas_rifle"
	inhand_icon_state = "stanlas_rifle"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/las_rifle_1.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser)
	cell_type = /obj/item/stock_parts/cell/ms13/mfc
	w_class = WEIGHT_CLASS_HUGE
	extra_damage = 30
	extra_penetration = 0
	fire_delay = 5

/obj/item/gun/energy/ms13/laser/aer12
	name = "AER12 laser rifle"
	desc = "A further developed version of the militarized laser rifle cherished by scavengers of the wasteland. Supposedly not as reliable as some of the older variants."
	base_icon_state = "advlas_rifle"
	icon_state = "advlas_rifle"
	inhand_icon_state = "advlas_rifle"
	extra_damage = 35
	extra_penetration = 5

/obj/item/gun/energy/ms13/laser/wattz
	name = "Wattz laser rifle"
	desc = "A medium range laser rifle. Features comfortable to shoot, but the scope is quite unreliable"
	base_icon_state = "wattzrifle"
	icon_state = "wattzrifle"
	inhand_icon_state = "wattzrifle"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/las_rifle_3.ogg'
	extra_damage = 25
	zoomable = TRUE
	zoom_amt = 6
	zoom_out_amt = 9

/obj/item/gun/energy/ms13/laser/wattz/sniper
	name = "Wattz sniper rifle"
	desc = "A long range high powered laser sniper. The scope is study in place and has a good view in it. A reliable piece of technology, to say the least."
	base_icon_state = "wattzsniper"
	icon_state = "wattzsniper"
	inhand_icon_state = "wattzsniper"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/las_rifle_2.ogg'
	extra_damage = 25
	zoomable = TRUE
	zoom_amt = 15
	zoom_out_amt = 5

/obj/item/gun/energy/ms13/laser/rcw
	name = "laser RCW"
	desc = "An iconic design with a twist. This laser rifle has an extremely high firerate and functions more like a minigun than it does a rifle."
	base_icon_state = "rcw"
	icon_state = "rcw"
	inhand_icon_state = "rcw"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/lasrcw/rcw_5.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser)
	cell_type = /obj/item/stock_parts/cell/ms13/ecp
	extra_damage = 15
	fire_delay = 0
	spread = 2.5

/obj/item/gun/energy/ms13/laser/rcw/Initialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.2 SECONDS)

/obj/item/gun/energy/ms13/laser/scatter
	name = "Laser Scatter Rifle"
	desc = "A modified AER9 equipped with a refraction kit that spreads its bolts."
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	icon_state = "lasershotgun"
	base_icon_state = "lasershotgun"
	inhand_icon_state = "lasershotgun"
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/scatter)
	cell_type = /obj/item/stock_parts/cell/ms13/mfc
	fire_delay = 6


// Plasma Pistols //

// Plasma Guns //

/obj/item/gun/energy/ms13/laser/plasma
	name ="A3-20 Plasma Rifle"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	inhand_icon_state = "plasmacarabine"
	icon_state = "plasmacarabine"
	base_icon_state = "plasmacarabine"
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	desc = "A top of line miniaturized plasma caster built by REPCONN in the wake of the Z43-521P failure. It is supperior to all previous rifles to enter service in the USCC."
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/plasma)
	cell_type = /obj/item/stock_parts/cell/ms13/pc
	w_class = WEIGHT_CLASS_HUGE
	fire_delay = 6

/obj/item/gun/energy/ms13/laser/plasma/scatter
	name = "A3e-20b Multiplas Rifle"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	inhand_icon_state = "multiplas"
	icon_state = "multiplas"
	base_icon_state = "multiplas"
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	desc = "A modified A3-20 plasma caster built by REPCONN equipped with a multicasting kit that creates multiple weaker clots."
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/plasma/scatter)
	cell_type = /obj/item/stock_parts/cell/ms13/pc
	fire_delay = 7

/obj/item/gun/energy/ms13/laser/plasma/pistol
	name ="MPL-A Plasma Pistol"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	inhand_icon_state = "plasmapistol"
	icon_state = "plasmapistol"
	base_icon_state = "plasmapistol"
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	desc = "A pistol-sized miniaturized plasma caster built by REPCONN. It fires heavy low penetration plasma clots."
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/plasma/pistol)
	w_class = WEIGHT_CLASS_NORMAL
	cell_type = /obj/item/stock_parts/cell/ms13/pc
	fire_delay = 6

//effects

/obj/effect/projectile/impact/ms13/laser
	name = "laser impact"
	icon_state = "laser_impact"
	icon = 'mojave/icons/objects/projectiles/projectiles_impact.dmi'

/obj/effect/projectile/muzzle/ms13/laser
	name = "muzzle flash"
	icon_state = "laser_muzzle"
	icon = 'mojave/icons/objects/projectiles/projectiles_muzzle.dmi'

/obj/effect/projectile/tracer/ms13/laser
	name = "laser beam"
	icon_state = "laser"
	icon = 'mojave/icons/objects/projectiles/projectiles_tracer.dmi'

/obj/effect/projectile/impact/ms13/laser/blue
	icon_state = "institute_impact"

/obj/effect/projectile/muzzle/ms13/laser/blue
	icon_state = "institute_muzzle"

/obj/effect/projectile/tracer/ms13/laser/blue
	icon_state = "institute"

/obj/effect/projectile/impact/ms13/laser/yellow
	icon_state = "recharger_impact"

/obj/effect/projectile/muzzle/ms13/laser/yellow
	icon_state = "recharger_muzzle"

/obj/effect/projectile/tracer/ms13/laser/yellow
	icon_state = "recharger"

//projectiles

// Laser Projectiles //

/obj/projectile/beam/ms13
	speed = 0.2 //Vanilla tg is 0.8
	var/damage_constant = 1

/obj/projectile/beam/ms13/laser
	name = "laser beam"
	damage = 0
	armour_penetration = 0
	range = 21
	wound_bonus = 5
	hitscan = TRUE
	hitscan_light_color_override = COLOR_SOFT_RED
	muzzle_flash_color_override = COLOR_SOFT_RED
	impact_light_color_override = COLOR_SOFT_RED
	tracer_type = /obj/effect/projectile/tracer/ms13/laser
	muzzle_type = /obj/effect/projectile/muzzle/ms13/laser
	impact_type = /obj/effect/projectile/impact/ms13/laser
	hitscan_light_intensity = 2
	hitscan_light_range = 0.50
	muzzle_flash_intensity = 4
	muzzle_flash_range = 1
	impact_light_intensity = 5
	impact_light_range = 1.25

/obj/projectile/beam/ms13/laser/yellow
	hitscan_light_color_override = COLOR_YELLOW
	muzzle_flash_color_override = COLOR_YELLOW
	impact_light_color_override = COLOR_YELLOW
	tracer_type = /obj/effect/projectile/tracer/ms13/laser/yellow
	muzzle_type = /obj/effect/projectile/muzzle/ms13/laser/yellow
	impact_type = /obj/effect/projectile/impact/ms13/laser/yellow

/obj/projectile/beam/ms13/laser/sniper
	name = "laser beam"
	damage = 0
	armour_penetration = 0
	range = 28
	wound_bonus = 10

/obj/projectile/beam/ms13/laser/pistol
	name = "laser beam"
	damage = 0
	range = 18

/obj/projectile/beam/ms13/laser/scatter
	name = "scatter laser"
	damage = 0
	range = 16

/obj/projectile/beam/ms13/laser/unfocused
	range = 14

// Plasma Projectiles //

/obj/projectile/bullet/ms13/plasma
	name = "plasma clot"
	icon = 'mojave/icons/objects/projectiles/projectiles.dmi'
	icon_state = "plasma"
	damage = 0
	armour_penetration = 0
	wound_bonus = 15

/obj/projectile/bullet/ms13/plasma/pistol
	damage = 0
	armour_penetration = 0

/obj/projectile/bullet/ms13/plasma/scatter
	damage = 0

//Casings

/obj/item/ammo_casing/energy/ms13
	firing_effect_type = null
	click_cooldown_override = 1 //0.1 second fire delay; better balance your fire rates now
	fire_sound = null

// Plasma //

/obj/item/ammo_casing/energy/ms13/plasma
	projectile_type = /obj/projectile/bullet/ms13/plasma
	select_name = "plasma burst"
	delay = 5
	e_cost = 10

/obj/item/ammo_casing/energy/ms13/plasma/scatter
	projectile_type = /obj/projectile/bullet/ms13/plasma/scatter
	pellets = 3
	variance = 14
	select_name = "scatter"

/obj/item/ammo_casing/energy/ms13/plasma/pistol
	projectile_type = /obj/projectile/bullet/ms13/plasma/pistol
	e_cost = 50

// Laser //

/obj/item/ammo_casing/energy/ms13/laser/
	projectile_type = /obj/projectile/beam/ms13/laser
	e_cost = 50

/obj/item/ammo_casing/energy/ms13/laser/scatter
	projectile_type = /obj/projectile/beam/ms13/laser/scatter
	pellets = 3
	variance = 14
	select_name = "scatter"
	e_cost = 50

/obj/item/ammo_casing/energy/ms13/laser/pistol
	projectile_type = /obj/projectile/beam/ms13/laser/pistol
	e_cost = 10

/obj/item/ammo_casing/energy/ms13/laser/sniper
	projectile_type = /obj/projectile/beam/ms13/laser/sniper
	e_cost = 80

/obj/item/ammo_casing/energy/ms13/laser/unfocused
	projectile_type = /obj/projectile/beam/ms13/laser/unfocused
	e_cost = 80

//energy weapon ammotypes

/obj/item/stock_parts/cell/ms13
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	name = "ammo cell"
	desc = "You shouldn't be holding this."
	w_class = WEIGHT_CLASS_TINY
	var/base_icon = ""
	var/multiple_states = FALSE

/obj/item/stock_parts/cell/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/ammo/ammo.dmi')

/obj/item/stock_parts/cell/ms13/New()
	..()
	return

/obj/item/stock_parts/cell/ms13/update_icon()
	if (multiple_states == FALSE)
		return
	else
		if (src.charge == 0)
			icon_state = "[base_icon]_empty"
		else
			icon_state = "[base_icon]"
	return ..()

/obj/item/stock_parts/cell/ms13/mfc
	name = "microfusion cell"
	desc = "A microfusion cell, typically used as ammunition for large energy weapons. YOU CAN RECHARGE THIS STUPID SON OF A BITCH FOR THE LOW RATE OF 0.99 NO SHIPPING AND HANDLING MOTHERFUCKER"
	icon_state = "mfc"
	maxcharge = 1200
	chargerate = 300
	base_icon = "mfc"

/obj/item/stock_parts/cell/ms13/ecp
	name = "electron charge pack"
	desc = "An electron charge pack, typically used as ammunition for rapidly-firing energy weapons."
	icon_state = "2mmec"
	maxcharge = 2400
	chargerate = 400
	base_icon = "2mmec"
	multiple_states = TRUE

/obj/item/stock_parts/cell/ms13/ec
	name = "energy cell"
	desc = "An energy cell, typically used as ammunition for small-arms energy weapons."
	icon_state = "sec"
	maxcharge = 300
	chargerate = 300
	base_icon = "sec"

/obj/item/stock_parts/cell/ms13/pc
	name = "plasma cell"
	desc = "A plasma cell, typically used as ammunition for plasma based energy weapons."
	icon_state = "plasma"
	maxcharge = 1200
	chargerate = 300
	base_icon = "plasma"
	multiple_states = TRUE

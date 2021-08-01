	//Mojave Sun
	///effects
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

////guns
/obj/item/gun/energy/ms13
	name = "generic ms13 gun"
	desc = "complain when seeing this"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	base_icon_state = ""
	var/tac_reloads = FALSE
	automatic_charge_overlays = FALSE
	extra_damage = 10
	fire_delay = 6
/obj/item/gun/energy/ms13/update_icon()
	if(!cell)
		icon_state = "[base_icon_state]_empty"
	else
		icon_state = "[base_icon_state]"

/obj/item/gun/energy/ms13/proc/insert_magazine(mob/user, var/obj/item/stock_parts/cell/ammo/AM, display_message = TRUE)
	if(!istype(AM, cell_type))
		to_chat(user, "<span class='warning'>\The [AM] doesn't seem to fit into \the [src]...</span>")
		return FALSE
	if(user.transferItemToLoc(AM, src))
		cell = AM
		if (display_message)
			to_chat(user, "<span class='notice'>You load a new [AM] into \the [src].</span>")
		update_icon()
		return TRUE
	else
		to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")
		return FALSE

///Handles all the logic of magazine ejection, if tac_load is set that magazine will be tacloaded in the place of the old eject
/obj/item/gun/energy/ms13/proc/eject_magazine(mob/user, display_message = TRUE, var/obj/item/stock_parts/cell/ammo/tac_load = null)
	cell.forceMove(drop_location())
	var/obj/item/stock_parts/cell/ammo/old_mag = cell
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
	if (istype(A, /obj/item/stock_parts/cell/ammo))
		var/obj/item/stock_parts/cell/ammo/AM = A
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

/obj/item/gun/energy/ms13/laser/aer9
	name = "AER9 Laser Rifle"
	desc = "A sturdy and advanced military grade pre-war service laser rifle"
	base_icon_state = "stanlas_rifle"
	icon_state = "stanlas_rifle"
	inhand_icon_state = "stanlast_rifle"
	fire_delay = 6
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/lasgun)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	w_class = WEIGHT_CLASS_HUGE
	extra_damage = 9

/obj/item/gun/energy/ms13/laser/pistol
	name = "AEP7 laser pistol"
	desc = "A basic energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal."
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	icon_state = "stanlas_pistol"
	base_icon_state = "stanlas_pistol"
	inhand_icon_state = "stanlas_pistol"
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 5
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/pistol)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	extra_damage = 5

/obj/item/gun/energy/ms13/laser/scatter
	name = "Tri-beam Laser Rifle"
	desc = "A modified AER9 equipped with a refraction kit that spreads its bolts."
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	icon_state = "lasershotgun"
	base_icon_state = "lasershotgun"
	inhand_icon_state = "lasershotgun"
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/scatter)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	w_class = WEIGHT_CLASS_HUGE
	fire_delay = 6

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
	cell_type = /obj/item/stock_parts/cell/ammo/pc
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
	cell_type = /obj/item/stock_parts/cell/ammo/pc
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
	cell_type = /obj/item/stock_parts/cell/ammo/pc
	fire_delay = 6

//projectiles

/obj/projectile/beam/ms13
	speed = 0.2 //Vanilla tg is 0.8
	var/damage_constant = 1

/obj/projectile/beam/ms13/laser
	name = "laser beam"
	damage = 0
	armour_penetration = 0
	hitscan = TRUE
	hitscan_light_color_override = COLOR_DARK_RED
	muzzle_flash_color_override = COLOR_DARK_RED
	impact_light_color_override = COLOR_DARK_RED
	range = 21
	tracer_type = /obj/effect/projectile/tracer/ms13/laser
	muzzle_type = /obj/effect/projectile/muzzle/ms13/laser
	impact_type = /obj/effect/projectile/impact/ms13/laser
	hitscan_light_intensity = 2
	hitscan_light_range = 0.50
	hitscan_light_color_override = COLOR_SOFT_RED
	muzzle_flash_intensity = 4
	muzzle_flash_range = 1
	muzzle_flash_color_override = COLOR_SOFT_RED
	impact_light_intensity = 5
	impact_light_range = 1.25
	impact_light_color_override = COLOR_SOFT_RED
/obj/projectile/beam/ms13/laser/lasgun
	name = "laser beam"
	damage = 0
	armour_penetration = 0

/obj/projectile/beam/ms13/laser/lassniper
	name = "laser beam"
	damage = 0
	armour_penetration = 0
	range = 28

/obj/projectile/beam/ms13/laser/pistol
	name = "laser beam"
	damage = 0

/obj/projectile/beam/ms13/laser/tribeam
	name = "tribeam laser"
	damage = 0

/obj/projectile/bullet/ms13/plasma
	name = "plasma clot"
	icon = 'mojave/icons/objects/projectiles/projectiles.dmi'
	icon_state = "plasma"
	damage = 0

/obj/projectile/bullet/ms13/plasma/pistol
	damage = 0
	armour_penetration = 0

/obj/projectile/bullet/ms13/plasma/scatter
	damage = 0

//Casings
//plasma

/obj/item/ammo_casing/energy/ms13
	firing_effect_type = null
	click_cooldown_override = 1 //0.1 second fire delay; better balance your fire rates now

/obj/item/ammo_casing/energy/ms13/plasma
	projectile_type = /obj/projectile/bullet/ms13/plasma
	select_name = "plasma burst"
	fire_sound = 'sound/weapons/plasma_cutter.ogg'
	delay = 5
	e_cost = 100

/obj/item/ammo_casing/energy/ms13/plasma/scatter
	projectile_type = /obj/projectile/bullet/ms13/plasma/scatter
	pellets = 3
	variance = 14
	select_name = "scatter"

/obj/item/ammo_casing/energy/ms13/plasma/pistol
	projectile_type = /obj/projectile/bullet/ms13/plasma/pistol
	e_cost = 50

//laser
/obj/item/ammo_casing/energy/ms13/laser/scatter
	projectile_type = /obj/projectile/beam/ms13/laser/tribeam
	pellets = 3
	variance = 14
	select_name = "scatter"
	e_cost = 50

/obj/item/ammo_casing/energy/ms13/laser/pistol
	projectile_type = /obj/projectile/beam/ms13/laser/pistol
	e_cost = 10

/obj/item/ammo_casing/energy/ms13/laser/lasgun
	projectile_type = /obj/projectile/beam/ms13/laser/lasgun
	e_cost = 50

// energy weapon ammotypes

/obj/item/stock_parts/cell/ammo
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	name = "ammo cell"
	desc = "You shouldn't be holding this."
	w_class = WEIGHT_CLASS_TINY
	var/base_icon = ""
	var/multiple_states = FALSE

/obj/item/stock_parts/cell/ammo/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/ammo/ammo.dmi')

/obj/item/stock_parts/cell/ammo/New()
	..()
	return

/obj/item/stock_parts/cell/ammo/update_icon()
	if (multiple_states == FALSE)
		return
	else
		if (src.charge == 0)
			icon_state = "[base_icon]_empty"
		else
			icon_state = "[base_icon]"

/obj/item/stock_parts/cell/ammo/mfc
	name = "microfusion cell"
	desc = "A microfusion cell, typically used as ammunition for large energy weapons. YOU CAN RECHARGE THIS STUPID SON OF A BITCH FOR THE LOW RATE OF 0.99 NO SHIPPING AND HANDLING MOTHERFUCKER"
	icon_state = "mfc"
	maxcharge = 1200
	chargerate = 300
	base_icon = "mfc"

/obj/item/stock_parts/cell/ammo/ecp
	name = "electron charge pack"
	desc = "An electron charge pack, typically used as ammunition for rapidly-firing energy weapons."
	icon_state = "2mmec"
	maxcharge = 2400
	chargerate = 400
	base_icon = "2mmec"
	multiple_states = TRUE

/obj/item/stock_parts/cell/ammo/ec
	name = "energy cell"
	desc = "An energy cell, typically used as ammunition for small-arms energy weapons."
	icon_state = "sec"
	maxcharge = 300
	chargerate = 300
	base_icon = "sec"

/obj/item/stock_parts/cell/ammo/pc
	name = "plasma cell"
	desc = "A plasma cell, typically used as ammunition for plasma based energy weapons."
	icon_state = "plasma"
	maxcharge = 1200
	chargerate = 300
	base_icon = "plasma"
	multiple_states = TRUE

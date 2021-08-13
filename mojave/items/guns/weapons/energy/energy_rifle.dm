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
	force = 15
	extra_damage = 30
	extra_penetration = 0
	fire_delay = 5

/obj/item/gun/energy/ms13/laser/aer12
	name = "AER12 laser rifle"
	desc = "A further developed version of the militarized laser rifle cherished by scavengers of the wasteland. Supposedly not as reliable as some of the older variants."
	base_icon_state = "advlas_rifle"
	icon_state = "advlas_rifle"
	inhand_icon_state = "advlas_rifle"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/las_rifle_1.ogg'
	extra_damage = 35
	extra_penetration = 5

/obj/item/gun/energy/ms13/laser/wattz
	name = "Wattz laser rifle"
	desc = "A medium range laser rifle. Features comfortable to shoot, but the scope is quite unreliable"
	base_icon_state = "wattzrifle"
	icon_state = "wattzrifle"
	inhand_icon_state = "wattzrifle"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/las_rifle_2.ogg'
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
	AddComponent(/datum/component/automatic_fire, 0.25 SECONDS)

/obj/item/gun/energy/ms13/laser/scatter
	name = "laser scatter rifle"
	desc = "A modified AER9 equipped with a refraction kit that spreads its bolts, often called a 'tri-beam'. You wouldn't believe why."
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/tribeam/tribeam_1.ogg'
	icon_state = "lasershotgun"
	base_icon_state = "lasershotgun"
	inhand_icon_state = "lasershotgun"
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/scatter)
	cell_type = /obj/item/stock_parts/cell/ms13/mfc
	extra_damage = 15
	fire_delay = 6

// Plasma Rifles //

/obj/item/gun/energy/ms13/plasma/rifle
	name = "plasma rifle"
	desc = "A rifle sized plasma caster. Essentially lobs plasma slugs at low speed. Extremely efficient at its job."
	icon_state = "plasmacarabine"
	base_icon_state = "plasmacarabine"
	inhand_icon_state = "plasmacarabine"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/plasrifle/plasma_3.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/plasma)
	cell_type = /obj/item/stock_parts/cell/ms13/pc
	w_class = WEIGHT_CLASS_HUGE
	force = 15
	extra_damage = 40
	extra_penetration = 10
	fire_delay = 7

/obj/item/gun/energy/ms13/plasma/rifle/military
	name = "military plasma rifle"
	desc = "A slimmed down militarized version of the plasma rifle. Features higher quality hardware, is able to form plasma at higher temperatures."
	icon_state = "enclaveplasma"
	base_icon_state = "enclaveplasma"
	inhand_icon_state = "enclaveplasma"
	extra_damage = 50
	extra_penetration = 15
	fire_delay = 7

/obj/item/gun/energy/ms13/plasma/scatter
	name = "multiplas rifle"
	desc = "A plasma rifle variant that was modified to fire multiple projectiles in a single shot, Projectiles tend to dissipate past a certain distance. Try not to get stuck on the business side."
	icon_state = "multiplas"
	base_icon_state = "multiplas"
	inhand_icon_state = "multiplas"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/plasrifle/plasma_1.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/plasma/scatter)
	extra_damage = 20
	extra_penetration = 10
	fire_delay = 8

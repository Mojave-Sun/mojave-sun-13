// Laser rifles //

/obj/item/gun/energy/ms13/laser/rifle
	name = "standard laser rifle"
	desc = "A standard laser rifle with wood furniture. Not incredibly well kept, but most certainly still deadly."
	base_icon_state = "stanlas_rifle"
	icon_state = "stanlas_rifle"
	inhand_icon_state = "stanlas_rifle"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/las_rifle_1.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser)
	cell_type = /obj/item/stock_parts/cell/ms13/mfc
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	force = 15
	extra_damage = 30
	extra_penetration = 0
	fire_delay = 0.5 SECONDS
	slowdown = 0.75

/obj/item/gun/energy/ms13/laser/rifle/advanced
	name = "advanced laser rifle"
	desc = "A more advanced and near pristine condition laser rifle, optimizations allow it to pack much more of a punch."
	base_icon_state = "advlas_rifle"
	icon_state = "advlas_rifle"
	inhand_icon_state = "advlas_rifle"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/las_rifle_1.ogg'
	extra_damage = 35
	extra_penetration = 5

/obj/item/gun/energy/ms13/laser/rifle/wattz
	name = "\improper Wattz laser rifle"
	desc = "A relatively cheap, civilian grade laser rifle with an integrated sight."
	base_icon_state = "wattzrifle"
	icon_state = "wattzrifle"
	inhand_icon_state = "wattzrifle"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/las_rifle_2.ogg'
	extra_damage = 25
	extra_penetration = 0
	fire_delay = 0.5 SECONDS

/obj/item/gun/energy/ms13/laser/rifle/wattz/sniper
	name = "\improper Wattz laser sniper"
	desc = "A Wattz laser rifle that has been heavily customized and modified. The sight has been replaced with a scope and the capacitor has been overcharged for substantially more damage."
	base_icon_state = "wattzsniper"
	icon_state = "wattzsniper"
	inhand_icon_state = "wattzsniper"
	extra_damage = 30
	extra_penetration = 10
	fire_delay = 0.55 SECONDS
	slowdown = 1
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13

/obj/item/gun/energy/ms13/laser/rcw
	name = "laser RCW"
	desc = "An iconic weapon that has been converted into a fast firing laser weapon. Stay clear of this weapon's line of fire, or you'll regret it."
	base_icon_state = "rcw"
	icon_state = "rcw"
	inhand_icon_state = "rcw"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/lasrcw/rcw_5.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser)
	cell_type = /obj/item/stock_parts/cell/ms13/ecp
	extra_damage = 15
	extra_penetration = 0
	fire_delay = 0.25 SECONDS
	spread = 5
	slowdown = 0.75

/obj/item/gun/energy/ms13/laser/rcw/Initialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.25 SECONDS)

/obj/item/gun/energy/ms13/laser/scatter
	name = "laser scatter rifle"
	desc = "A modified laser rifle equipped with a special lens that spreads its bolts, often called a 'tri-beam'. You wouldn't believe why."
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/tribeam/tribeam_1.ogg'
	icon_state = "lasershotgun"
	base_icon_state = "lasershotgun"
	inhand_icon_state = "lasershotgun"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/scatter)
	cell_type = /obj/item/stock_parts/cell/ms13/mfc
	fire_delay = 0.6 SECONDS
	slowdown = 0.75

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

// Laser Pistols //

/obj/item/gun/energy/ms13/laser/pistol
	name = "standard laser pistol"
	desc = "A basic and relatively unremarkable laser pistol, aside from the fact that it fires concentrated beams of energy."
	icon_state = "stanlas_pistol"
	base_icon_state = "stanlas_pistol"
	inhand_icon_state = "stanlas_pistol"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_1.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/pistol)
	cell_type = /obj/item/stock_parts/cell/ms13/ec
	force = 10
	extra_damage = 20
	extra_penetration = 0
	fire_delay = 0.4 SECONDS
	slowdown = 0.5

/obj/item/gun/energy/ms13/laser/pistol/advanced
	name = "advanced laser pistol"
	desc = "A more advanced model of laser pistol, hits quite a bit harder but fires slightly slower to properly concentrate the beams."
	icon_state = "advlas_pistol"
	base_icon_state = "advlas_pistol"
	inhand_icon_state = "advlas_pistol"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_2.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/pistol/mfc)
	cell_type = /obj/item/stock_parts/cell/ms13/mfc
	extra_damage = 25
	extra_penetration = 5
	fire_delay = 0.45 SECONDS

/obj/item/gun/energy/ms13/laser/pistol/advanced/defender
	name = "laser defender"
	desc = "A highly advanced, experimental laser pistol. Sports best in class stopping power and fire rate, truly a menace in the right hands."
	icon_state = "laserdefender"
	base_icon_state = "laserdefender"
	inhand_icon_state = "laserdefender"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_3.ogg'
	extra_damage = 25
	extra_penetration = 10
	fire_delay = 0.4 SECONDS

/obj/item/gun/energy/ms13/laser/pistol/wattz
	name = "\improper Wattz laser pistol"
	desc = "A civilian grade laser pistol. It's lasers are not very concentrated as a result."
	icon_state = "wattzpistol"
	base_icon_state = "wattzpistol"
	inhand_icon_state = "wattzpistol"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_4.ogg'
	extra_damage = 15
	fire_delay = 0.4 SECONDS

// Plasma Pistols //

/obj/item/gun/energy/ms13/plasma/pistol
	name = "plasma pistol"
	desc = "A pistol-sized miniaturized plasma caster. It fires heavy low penetration plasma clots designed to melt flesh away in a horrifying fashion, all within the power of your hand."
	icon_state = "plasmapistol"
	base_icon_state = "plasmapistol"
	inhand_icon_state = "plasmapistol"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/plaspistol/plasma_3.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/plasma/pistol)
	cell_type = /obj/item/stock_parts/cell/ms13/pc
	force = 10
	extra_damage = 25
	extra_penetration = 5
	fire_delay = 6

/obj/item/gun/energy/ms13/plasma/pistol/military
	name = "military plasma Pistol"
	desc = "A more compact variant of the plasma pistol. Even though it's smaller, it's a later variant and vastly improved in more ways than one."
	icon_state = "enclaveplasmapistol"
	base_icon_state = "enclaveplasmapistol"
	inhand_icon_state = "enclaveplasmapistol"
	extra_damage = 30
	extra_penetration = 10

/obj/item/gun/energy/ms13/plasma/pistol/defender
	name = "plasma defender"
	desc = "The plasma defender is a variant of the plasma pistol, rojectiles formed by this gun are intended to splatter on contact and do mass damage, but has a harder time getting through some armours."
	icon_state = "plasmadefender"
	base_icon_state = "plasmadefender"
	inhand_icon_state = "plasmadefender"
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/plasma/pistol/splatter)
	extra_damage = 35
	extra_penetration = -5

// Laser Pistols //

/obj/item/gun/energy/ms13/laser/pistol
	name = "AEP7 laser pistol"
	desc = "A basic energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal."
	icon_state = "stanlas_pistol"
	base_icon_state = "stanlas_pistol"
	inhand_icon_state = "stanlas_pistol"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_1.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/pistol)
	cell_type = /obj/item/stock_parts/cell/ms13/ec
	force = 10
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

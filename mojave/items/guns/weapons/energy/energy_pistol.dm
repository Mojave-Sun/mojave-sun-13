// Laser Pistols //

/obj/item/gun/energy/ms13/laser/pistol
	name = "standard laser pistol"
	desc = "A basic and relatively unremarkable laser pistol, aside from the fact that it fires concentrated beams of energy."
	icon_state = "stanlas_pistol"
	base_icon_state = "stanlas_pistol"
	inhand_icon_state = "stanlas_pistol"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_1.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/laser_pistol.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_SUITSTORE | ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/stan_pistol)
	cell_type = /obj/item/stock_parts/cell/ms13/ec
	force = 10
	fire_delay = 0.55 SECONDS
	slowdown = 0.5
	grid_width = 64
	grid_height = 64

/obj/item/gun/energy/ms13/laser/pistol/advanced
	name = "advanced laser pistol"
	desc = "A more advanced model of laser pistol, hits quite a bit harder but fires slightly slower to properly concentrate the beams."
	icon_state = "advlas_pistol"
	base_icon_state = "advlas_pistol"
	inhand_icon_state = "advlas_pistol"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_2.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/adv_pistol)
	cell_type = /obj/item/stock_parts/cell/ms13/mfc

/obj/item/gun/energy/ms13/laser/pistol/advanced/brotherhood
	name = "\improper Codex Enforcer"
	desc = "A specially modified and customized advanced laser pistol primarily used by high ranking members of the Brotherhood of Steel. Sometimes used to enforce the Codex if other means fail, as one may expect."
	icon_state = "boslas_pistol"
	base_icon_state = "boslas_pistol"
	inhand_icon_state = "boslas_pistol"
	fire_delay = 0.5 SECONDS

/obj/item/gun/energy/ms13/laser/pistol/advanced/defender
	name = "laser defender"
	desc = "A highly advanced, experimental laser pistol. Sports best in class stopping power and fire rate, truly a menace in the right hands."
	icon_state = "laserdefender"
	base_icon_state = "laserdefender"
	inhand_icon_state = "laserdefender"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_3.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/las_defender)
	fire_delay = 0.5 SECONDS

/obj/item/gun/energy/ms13/laser/pistol/wattz
	name = "\improper Wattz laser pistol"
	desc = "A civilian grade laser pistol. It's lasers are not very concentrated as a result."
	icon_state = "wattzpistol"
	base_icon_state = "wattzpistol"
	inhand_icon_state = "wattzpistol"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_4.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/wattz_pistol)

/obj/item/gun/energy/ms13/laser/pistol/wattz_heavy
	name = "\improper Wattz heavy laser pistol"
	desc = "An experimental laser pistol developed by Wattz electronics, intended to try and push into the military laser weapon market. Fires slower than other laser pistols but packs a decent punch."
	icon_state = "wattz2000car"
	base_icon_state = "wattz2000car"
	inhand_icon_state = "wattz2000car"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_2.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser/wattz_heavypistol)
	cell_type = /obj/item/stock_parts/cell/ms13/mfc
	fire_delay = 0.65 SECONDS

// Plasma Pistols //

/obj/item/gun/energy/ms13/plasma/pistol
	name = "standard plasma pistol"
	desc = "A standard, experimental plasma pistol that fires very hot concentrated bolts of green plasma. They travel slowly, but burn like hell."
	icon_state = "plasmapistol"
	base_icon_state = "plasmapistol"
	inhand_icon_state = "plasmapistol"
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/plaspistol/plasma_3.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/plasma_pistol.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_SUITSTORE | ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/plasma/stan_pistol)
	force = 10
	fire_delay = 0.6 SECONDS
	spread = 6
	recoil = 0.5
	slowdown = 0.5
	grid_width = 64
	grid_height = 64

/obj/item/gun/energy/ms13/plasma/pistol/advanced
	name = "advanced plasma pistol"
	desc = "A more advanced and even more experimental version of the plasma pistol. Concentrates it's bolts in an even more deadly manner."
	icon_state = "enclaveplasmapistol"
	base_icon_state = "enclaveplasmapistol"
	inhand_icon_state = "enclaveplasmapistol"
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/plasma/adv_pistol)

/obj/item/gun/energy/ms13/plasma/pistol/defender
	name = "plasma defender"
	desc = "The peak of compact plasma weaponry. Faster firing and more accurate than other plasma pistols. Something you do not want to be on the receiving end of."
	icon_state = "plasmadefender"
	base_icon_state = "plasmadefender"
	inhand_icon_state = "plasmadefender"
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/plasma/plas_defender)
	fire_delay = 0.5 SECONDS
	spread = 4
	recoil = 0.25

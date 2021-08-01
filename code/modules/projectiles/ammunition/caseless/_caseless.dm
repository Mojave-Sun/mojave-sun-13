/obj/item/ammo_casing/caseless
	desc = "A caseless bullet casing."
	firing_effect_type = null
	heavy_metal = FALSE

//MOJAVE EDIT CHANGE BEGIN - FIRE_CASING
//obj/item/ammo_casing/caseless/fire_casing(atom/target, mob/living/user, params, distro, quiet, zone_override, spread, atom/fired_from)) - Mojave EDIT - ORIGINAL
/obj/item/ammo_casing/caseless/fire_casing(atom/target, mob/living/user, params, distro, quiet, zone_override, spread, atom/fired_from, damage_mod, penetration_mod)
	//MOJAVE EDIT CHANGE END
	if (..()) //successfully firing
		moveToNullspace()
		QDEL_NULL(src)
		return TRUE
	else
		return FALSE

/obj/item/ammo_casing/caseless/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)]"

/atom
	/// Subtractible armor datum - See [mojave/code/datums/subarmor.dm] for more information
	var/datum/subarmor/subarmor

///returns the damage value of the attack after processing the atom's various armor protections
/atom/proc/run_atom_subarmor(damage_amount, damage_type, damage_flag = 0, attack_dir, armour_penetration = 0)
	if(!uses_integrity)
		CRASH("/atom/proc/run_atom_armor was called on [src] without being implemented as a type that uses integrity!")
	if(damage_flag == MELEE && damage_amount < damage_deflection)
		return 0
	var/armor_protection = 0
	if(damage_flag)
		armor_protection = subarmor.getRating(damage_flag)
	if(armor_protection) //Only apply weak-against-armor/hollowpoint effects if there actually IS armor.
		armor_protection = clamp(armor_protection - armour_penetration, min(armor_protection, 0), 100)
	return round(damage_amount * (100 - armor_protection)*0.01, DAMAGE_PRECISION)

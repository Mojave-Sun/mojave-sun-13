// Sub stands for "subtractible", not "under"
#define SUBARMORID "subarmor-\
					[subarmor_flags]-\
					[edge_protection]-\
					[crushing]-\
					[cutting]-\
					[piercing]-\
					[impaling]-\
					[laser]-\
					[energy]-\
					[bomb]-\
					[fire]-\
					[acid]"

/**
 * Subtractible armor
 * Essentially, this type of armor uses a DT system rather than a DR system.
 * What this means is that the armor value here is subtracted from incoming damage directly,
 * while in the normal armor datum, the armor value multiples damage and then this value is subtracted.
 * However, there is an exception - Wound armor is already in fact subtractible due to how wounds are calculated,
 * so sadly wound armor should be reserved for other datums.
 */
/datum/subarmor
	datum_flags = DF_USE_TAG
	/// This is used for miscellaneous attributes that modify how armor behaves,
	var/subarmor_flags
	/**
	 * Essentially, this is the cut-off point at which sharp (edged or piercing) damage
	 * is no longer turned into blunt damage.
	 */
	var/edge_protection
	/// Protection against blunt damage
	var/crushing
	/// Protection against cutting damage
	var/cutting
	/// Protection against small piercing damage - see [code/zmojave_defines/damage.dm]
	var/piercing
	/// Protection against large piercing damage - see [code/zmojave_defines/damage.dm]
	var/impaling
	/// Protection against laser damage
	var/laser
	/// Protection against energy damage (tasers, essentially)
	var/energy
	/// Protection against explosive damage
	var/bomb
	/// Protection against general burn damage
	var/fire
	/// Protection against acid damage
	var/acid

/datum/subarmor/New(subarmor_flags = NONE, \
			edge_protection = 0,
			crushing = 0, \
			cutting = 0, \
			piercing = 0, \
			impaling = 0, \
			laser = 0, \
			energy = 0, \
			bomb = 0, \
			fire = 0, \
			acid = 0)
	src.subarmor_flags = subarmor_flags
	src.edge_protection = edge_protection
	src.crushing = crushing
	src.cutting = cutting
	src.piercing = piercing
	src.impaling = impaling
	src.laser = laser
	src.energy = energy
	src.bomb = bomb
	src.fire = fire
	src.acid = acid
	tag = SUBARMORID

/datum/subarmor/proc/modifyRating(subarmor_flags = NONE,
							edge_protection = 0, \
							cutting = 0, \
							piercing = 0, \
							impaling = 0,
							laser = 0, \
							energy = 0, \
							bomb = 0, \
							fire = 0, \
							acid = 0)
	return getSubarmor(src.subarmor_flags | subarmor_flags, \
					src.edge_protection+edge_protection, \
					src.crushing+crushing, \
					src.cutting+cutting, \
					src.piercing+piercing, \
					src.impaling+impaling, \
					src.laser+laser, \
					src.energy+energy, \
					src.bomb+bomb, \
					src.fire+fire, \
					src.acid+acid)

/datum/subarmor/proc/modifyAllRatings(modifier = 0)
	return getSubarmor(src.subarmor_flags,
				edge_protection+modifier,
				crushing+modifier, \
				cutting+modifier, \
				piercing+modifier, \
				impaling+modifier, \
				laser+modifier, \
				energy+modifier, \
				bomb+modifier, \
				fire+modifier, \
				acid+modifier)

/datum/subarmor/proc/setRating(subarmor_flags, \
						edge_protection, \
						crushing, \
						cutting, \
						piercing, \
						impaling, \
						laser, \
						energy, \
						bomb, \
						fire, \
						acid)
	return getSubarmor((isnull(subarmor_flags) ? src.subarmor_flags : subarmor_flags), \
					(isnull(edge_protection) ? src.edge_protection : edge_protection), \
					(isnull(crushing) ? src.crushing : crushing), \
					(isnull(cutting) ? src.cutting : cutting), \
					(isnull(piercing) ? src.piercing : piercing), \
					(isnull(impaling) ? src.impaling : impaling), \
					(isnull(laser) ? src.laser : laser), \
					(isnull(energy) ? src.energy : energy), \
					(isnull(bomb) ? src.bomb : bomb), \
					(isnull(fire) ? src.fire : fire), \
					(isnull(acid) ? src.acid : acid))

/datum/subarmor/proc/getRating(rating)
	return vars[rating]

/datum/subarmor/proc/getList()
	return list(SUBARMOR_FLAGS = subarmor_flags, \
				EDGE_PROTECTION = edge_protection, \
				CRUSHING = crushing, \
				CUTTING = cutting, \
				PIERCING = piercing, \
				IMPALING = impaling, \
				LASER = laser, \
				ENERGY = energy, \
				BOMB = bomb, \
				FIRE = fire, \
				ACID = acid)

/datum/subarmor/proc/attachSubarmor(datum/subarmor/attached_armor)
	return getSubarmor(subarmor_flags | attached_armor.subarmor_flags, \
					edge_protection+attached_armor.edge_protection, \
					crushing+attached_armor.crushing, \
					cutting+attached_armor.cutting, \
					piercing+attached_armor.piercing, \
					impaling+attached_armor.impaling, \
					laser+attached_armor.laser, \
					energy+attached_armor.energy, \
					bomb+attached_armor.bomb, \
					fire+attached_armor.fire, \
					acid+attached_armor.acid)

/datum/subarmor/proc/detachSubarmor(datum/subarmor/detached_armor)
	return getSubarmor(subarmor_flags & ~detached_armor.subarmor_flags, \
					edge_protection-detached_armor.edge_protection, \
					crushing-detached_armor.crushing, \
					piercing-detached_armor.piercing, \
					impaling-detached_armor.impaling, \
					laser-detached_armor.laser, \
					energy-detached_armor.energy, \
					bomb-detached_armor.bomb, \
					fire-detached_armor.fire, \
					acid-detached_armor.acid)

/datum/subarmor/vv_edit_var(var_name, var_value)
	. = ..()
	tag = SUBARMORID // update tag in case armor values were edited

/proc/getSubarmor(subarmor_flags = NONE, \
			edge_protection = 0, \
			crushing = 0, \
			cutting = 0, \
			piercing = 0, \
			impaling = 0, \
			laser = 0, \
			energy = 0, \
			bomb = 0, \
			fire = 0, \
			acid = 0)
	. = locate(SUBARMORID)
	if(!.)
		. = new /datum/subarmor(subarmor_flags, \
							edge_protection, \
							crushing, \
							cutting, \
							piercing, \
							impaling, \
							laser, \
							energy, \
							bomb, \
							fire, \
							acid)

#undef SUBARMORID

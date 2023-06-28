/obj/item
	/// How much to remove from edge_protection
	var/edge_protection_penetration = 0
	/// Armour penetration that only applies to subtractible armor
	var/subtractible_armour_penetration = 0
	/// Whether or not our object is easily hindered by the presence of subtractible armor
	var/weak_against_subtractible_armour = FALSE
	/// This is NOT related to armor penetration, and simply works as a bonus for armor damage
	var/armor_damage_modifier = 0
	/**
	 * A datum that gives us simple information on how we should behave on wielding.
	 * Wield info datums are singletons, and should not be created or deleted in the middle of a round.
	 */
	var/wield_info = /datum/wield_info/default

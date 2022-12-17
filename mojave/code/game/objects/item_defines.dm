/obj/item
	/// How much to remove from edge_protection
	var/edge_protection_penetration = 0
	/// Armour penetration that only applies to subtractible armor
	var/subtractible_armour_penetration = 0
	/// Whether or not our object is easily hindered by the presence of subtractible armor
	var/weak_against_subtractible_armour = FALSE
	/// This is NOT related to armor penetration, and simply works as a bonus for armor damage
	var/armor_damage_modifier = 0

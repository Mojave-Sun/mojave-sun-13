//This file contains all spears

/obj/item/spear/ms13
	name = "spear"
	desc = "A well made, dangerous, and versatile spear."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "spear"
	inhand_icon_state = "spear"
	icon_prefix = "spear"
	force = 20
	throwforce = 30
	armour_penetration = 10
	wound_bonus = 5
	embedding = null
	w_class = WEIGHT_CLASS_BULKY
	sharpness = SHARP_POINTY
	log_pickup_and_drop = TRUE
	var/wielded = FALSE

/obj/item/spear/ms13/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/on_wield)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/on_unwield)
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/spear/update_icon_state()
	. = ..()
	return

/obj/item/spear/ms13/ComponentInitialize()
	AddComponent(/datum/component/two_handed, require_twohands=FALSE, force_unwielded = 20, force_wielded = 35)

// triggered on wielding of a two handed item.
/obj/item/spear/ms13/proc/on_wield(obj/item/source, mob/user)
	SIGNAL_HANDLER
	inhand_icon_state = "[initial(inhand_icon_state)]_wielded" // subtype compatability ftw
	playsound(src.loc, 'mojave/sound/ms13effects/weapon_wield.ogg', 25, TRUE)
	wielded = TRUE

// triggered on unwielding of two handed item.
/obj/item/spear/ms13/proc/on_unwield(obj/item/source, mob/user)
	SIGNAL_HANDLER
	inhand_icon_state = "[initial(inhand_icon_state)]"
	playsound(src.loc, 'mojave/sound/ms13effects/weapon_wield.ogg', 10, TRUE)
	wielded = FALSE

/obj/item/spear/ms13/knife
	name = "knife spear"
	desc = "A very crude spear made from a simple knife and a pole."
	icon_state = "spear_knife"
	inhand_icon_state = "spear_knife"
	icon_prefix = "spear_knife"
	force = 15
	armour_penetration = 5
	wound_bonus = 2
	throwforce = 25

/obj/item/spear/ms13/knife/ComponentInitialize()
	AddComponent(/datum/component/two_handed, require_twohands=FALSE, force_unwielded = 15, force_wielded = 25)

/obj/item/spear/ms13/throwing
	name = "throwing spear"
	desc = "A decently well made barbed spear intended to be thrown but can serve fine as a melee weapon in a pinch."
	icon_state = "spear_throwing"
	inhand_icon_state = "spear_throwing"
	icon_prefix = "spear_throwing"
	force = 15
	armour_penetration = 10
	wound_bonus = 5
	throwforce = 35
	embedding = list("embedded_pain_multiplier" = 3, "embed_chance" = 65, "embedded_fall_chance" = 35)
	throw_range = 6
	throw_speed = 3

/obj/item/spear/ms13/throwing/ComponentInitialize()
	AddComponent(/datum/component/two_handed, require_twohands=FALSE, force_unwielded = 15, force_wielded = 25)

/obj/item/spear/explosive/ms13
	name = "thunder stick"
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	attack_verb_continuous = list("whacks", "jabs", "smacks", "pokes")
	attack_verb_simple = list("whack", "jab", "smack", "poke")
	icon_state = "spear_thunder"
	icon_prefix = "spear_thunder"
	sharpness = NONE // the end is a god damn explosive charge

/obj/item/spear/explosive/ms13/Initialize(mapload)
	. = ..()
	set_explosive(new /obj/item/grenade/frag/ms13/charge)
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')
	desc = "A long stick, with an explosive charge stuck on the end. Point towards enemy!" // Overwrites the TG one that would otherwise be here due to initialization.

/obj/item/spear/explosive/ms13/update_icon_state()
	. = ..()
	icon_state = "spear_thunder"
	inhand_icon_state = "spear_thunder"

/obj/item/spear/explosive/ms13/attack_self(mob/user)
	. = ..()
	if(wielded)
		icon_state = "spear_thunder"
		inhand_icon_state = "spear_thunder_wielded"
		wielded = TRUE

	else
		icon_state = "spear_thunder"
		inhand_icon_state = "spear_thunder"
		wielded = FALSE

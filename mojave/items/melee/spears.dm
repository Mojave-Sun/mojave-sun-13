//This file contains all throwing weapons

/obj/item/spear/ms13/
	name = "spear"
	desc = "A swift and ancient weapon used to this day, due to its ease of lodging itself into its victim's body parts."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "spear"
	inhand_icon_state = "spear"
	icon_prefix = "spear"
	force = 30
	throwforce = 35
	throw_speed = 1.5
	armour_penetration = 5
	wound_bonus = 0
	embedding = list("embedded_pain_multiplier" = 3, "embed_chance" = 40, "embedded_fall_chance" = 20)
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = SHARP_POINTY
	log_pickup_and_drop = TRUE
	var/wielded = FALSE

/obj/item/spear/ms13/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/on_wield)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/on_unwield)
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/spear/update_icon_state()
	return

/obj/item/spear/ms13/ComponentInitialize()
	AddComponent(/datum/component/two_handed, require_twohands=FALSE, force_multiplier=2)

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
	desc = "A rough spear, made from a knife and a pole. Don't look past it, it can still kill, whether it be by jab or throw."
	icon_state = "spear_knife"
	inhand_icon_state = "spear_knife"
	icon_prefix = "spear_knife"
	force = 25
	throwforce = 20

/obj/item/spear/ms13/legion
	name = "throwing spear"
	desc = "A throwing spear, one of many signature weapons of Caesar's Legion. Swift, agile, deadly."
	icon_state = "spear_legion"
	inhand_icon_state = "spear_legion"
	icon_prefix = "spear_legion"
	force = 35
	throwforce = 35
	throw_range = 6
	throw_speed = 3

/obj/item/spear/explosive/ms13
	name = "thunder stick"
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	attack_verb_continuous = list("whacks", "jabs", "smacks", "pokes")
	attack_verb_simple = list("whack", "jab", "smack", "poke")
	icon_state = "spear_thunder"
	icon_prefix = "spear_thunder"
	sharpness = SHARP_NONE // the end is a god damn explosive charge

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

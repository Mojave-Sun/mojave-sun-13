//This file contains the twohanded weapons and the base for them.

/obj/item/ms13/twohanded
	name = "wieldable weapon"
	desc = "don't use the damn thing, you animal."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "tire_iron"
	inhand_icon_state = "tire_iron"
	hitsound = 'sound/effects/hit_punch.ogg'
	attack_verb_continuous = list("attacks", "stabs", "pokes")
	attack_verb_simple = list("attack", "stab", "poke")
	sharpness = SHARP_EDGED
	w_class = WEIGHT_CLASS_BULKY
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_BACK
	log_pickup_and_drop = TRUE
	var/wielded = FALSE

/obj/item/ms13/twohanded/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/on_wield)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/on_unwield)
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')
/obj/item/ms13/twohanded/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands=FALSE, force_multiplier=2)

// triggered on wielding of a two handed item.
/obj/item/ms13/twohanded/proc/on_wield(obj/item/source, mob/user)
	SIGNAL_HANDLER
	inhand_icon_state = "[initial(inhand_icon_state)]_wielded" // subtype compatability ftw
	playsound(src.loc, 'mojave/sound/ms13effects/weapon_wield.ogg', 25, TRUE)
	wielded = TRUE

// triggered on unwielding of two handed item.
/obj/item/ms13/twohanded/proc/on_unwield(obj/item/source, mob/user)
	SIGNAL_HANDLER
	inhand_icon_state = "[initial(inhand_icon_state)]"
	playsound(src.loc, 'mojave/sound/ms13effects/weapon_wield.ogg', 10, TRUE)
	wielded = FALSE

/obj/item/ms13/twohanded/fireaxe
	name = "fire axe"
	desc = "A pre-war fire axe, once used by firemen, now used by maniacs."
	icon_state = "fire_axe"
	inhand_icon_state = "fire_axe"
	attack_verb_continuous = list("cleaves", "whacks", "chops", "cuts")
	attack_verb_simple = list("cleave", "whack", "chop", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	force = 25
	armour_penetration = 10
	wound_bonus = 5
	throwforce = 5
	throw_range = 3
	bare_wound_bonus = 10
	sharpness = IS_SHARP_AXE

/obj/item/ms13/twohanded/sword
	name = "bumper sword"
	desc = "A sword, made from the bumper of a car. It's got a rough edge, but it will work just fine."
	icon_state = "bumper_sword"
	inhand_icon_state = "bumper_sword"
	attack_verb_continuous = list("cleaves", "whacks", "chops", "lacerates", "stabs")
	attack_verb_simple = list("cleave", "whack", "chop", "lacerate", "stab")
	hitsound = 'sound/weapons/bladeslice.ogg'
	force = 25
	armour_penetration = 5
	wound_bonus = 10
	throwforce = 10
	throw_range = 5
	bare_wound_bonus = 20
	sharpness = SHARP_EDGED

/obj/item/ms13/twohanded/hammer
	name = "sledge hammer"
	desc = "A heavy sledge hammer. Hard to swing with one hand, It'd take your full power to be able to weild it."
	icon_state = "hammer_sledge"
	inhand_icon_state = "hammer_sledge"
	attack_verb_continuous = list("slams", "beats", "hammers", "pummels", "impacts")
	attack_verb_simple = list("slam", "beat", "hammer", "pummel", "impact")
	force = 25
	armour_penetration = 20
	wound_bonus = 10
	throwforce = 5
	throw_range = 2
	sharpness = NONE

/obj/item/ms13/twohanded/hammer/rebar
	name = "rebar club"
	desc = "A piece of rebar with concrete still stuck to it. Might as well use it for something."
	icon_state = "rebar_club"
	inhand_icon_state = "rebar_club"
	force = 20
	armour_penetration = 15
	wound_bonus = 15

/obj/item/ms13/twohanded/hammer/super
	name = "super sledge"
	desc = "Using the power of science and engineering, They packed 66% more sledge in this hammer. It's a pain to use in general."
	icon_state = "hammer_power"
	inhand_icon_state = "hammer_power"
	force = 35
	armour_penetration = 35
	wound_bonus = 35

/obj/item/ms13/twohanded/hammer/super/attack(mob/living/target, mob/living/user)
	. = ..()

	if(wielded)
		var/atom/throw_target = get_edge_target_turf(target, user.dir)
		target.throw_at(throw_target, rand(2,5), 3, user)
		SSexplosions.medturf += throw_target
		playsound(loc, 'sound/weapons/resonator_blast.ogg', 50, TRUE)
		playsound(loc, 'sound/weapons/genhit2.ogg', 50, TRUE)

	else
		return

// TWO HANDS REQUIRED //

/obj/item/ms13/twohanded/heavy
	name = "heavy weapon"
	desc = "Generic heavy weapon go haha BRRR"



/obj/item/ms13/twohanded/heavy/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands=TRUE)

/obj/item/ms13/twohanded/heavy/on_wield(obj/item/source, mob/user)
	playsound(src.loc, 'mojave/sound/ms13effects/weapon_wield.ogg', 25, TRUE)
	wielded = TRUE

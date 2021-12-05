//punchy punchy melee

/obj/item/ms13/knuckles
	name = "brass knuckle"
	desc = "The very small brass knuckle meant to be held in your hand to assist in making your punches quite a bit more dangerous."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	attack_verb_continuous = list("punches", "jabs", "clocks", "nails", "bludgeons", "whacks", "bonks")
	attack_verb_simple = list("punch", "jab", "clock", "nail", "bludgeon", "whack", "bonk")
	icon_state = "knuckles"
	inhand_icon_state = "knuckles"
	hitsound = "sound/weapons/cqchit1.ogg"
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_BELT
	throwforce = 5
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
	force = 10 //Consistent 10 damage instead of the 1-10 from a regular punch
	armour_penetration = 10
	wound_bonus = 5
	bare_wound_bonus = 0
	log_pickup_and_drop = TRUE

/obj/item/ms13/knuckles/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/ms13/knuckles/weighted
	name = "steel knuckle"
	desc = "A heavy knuckle made of steel, quite a bit stronger and more dangerous than a plain brass knuckle."
	icon_state = "knuckles_weighted"
	inhand_icon_state = "knuckles_weighted"
	force = 15
	armour_penetration = 15
	wound_bonus = 8

/obj/item/ms13/knuckles/weighted/spiked
	name = "spiked knuckles"
	desc = "A steel knuckle with the addition of some pointed spikes. With this, you aren't looking to knock someone out anymore."
	icon_state = "knuckles_spike"
	inhand_icon_state = "knuckles_spike"
	force = 20
	bare_wound_bonus = 6
	sharpness = SHARP_POINTY

/obj/item/ms13/knuckles/powerfist
	name = "power fist"
	desc = "A heavy, advanced glove that packs a hefty extra punch thanks to pneumatic mechanisms in the glove. Can break bones like a stick."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "powerfist"
	inhand_icon_state = "powerfist"
	force = 30
	armour_penetration = 25
	throwforce = 10
	wound_bonus = 10
	w_class = WEIGHT_CLASS_NORMAL


/* Not sure about this, commenting it out for now
/obj/item/ms13/knuckles/powerfist/attack(mob/living/target, mob/living/user)
	. = ..()
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	target.throw_at(throw_target, rand(1,3), 2, user)
	SSexplosions.medturf += throw_target
	playsound(loc, 'mojave/sound/ms13effects/airhiss.ogg', 50, TRUE)
	playsound(loc, 'sound/weapons/genhit2.ogg', 50, TRUE)
*/

/obj/item/spear/explosive/ms13
	name = "thunder stick"
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
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

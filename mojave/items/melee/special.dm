//punchy punchy melee

/obj/item/ms13/knuckles
	name = "brass knuckle"
	desc = "A very small brass knuckle meant to be held in your hand to assist in making your punches quite a bit more dangerous."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	attack_verb_continuous = list("punches", "jabs", "clocks", "nails", "bludgeons", "whacks", "bonks")
	attack_verb_simple = list("punch", "jab", "clock", "nail", "bludgeon", "whack", "bonk")
	icon_state = "knuckles"
	inhand_icon_state = "knuckles"
	hitsound = 'mojave/sound/ms13weapons/meleesounds/genericblunt_hit.ogg'
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/general_grip.ogg'
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_BELT
	throwforce = 5
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
	force = 15
	subtractible_armour_penetration = 10
	wound_bonus = 5
	bare_wound_bonus = 5
	log_pickup_and_drop = TRUE
	grid_width = 32
	grid_height = 32

/obj/item/ms13/knuckles/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/ms13/knuckles/weighted
	name = "steel knuckle"
	desc = "A heavy knuckle made of steel, quite a bit stronger and more dangerous than a plain brass knuckle."
	icon_state = "knuckles_weighted"
	inhand_icon_state = "knuckles_weighted"
	force = 20
	subtractible_armour_penetration = 20

/obj/item/ms13/knuckles/weighted/spiked
	name = "spiked knuckles"
	desc = "A steel knuckle with the addition of some pointed spikes. With this, you aren't looking to knock someone out anymore."
	icon_state = "knuckles_spike"
	inhand_icon_state = "knuckles_spike"
	hitsound = 'mojave/sound/ms13weapons/meleesounds/stab_hit.ogg'
	force = 25
	throwforce = 10 //Imagine finshing off someone running away by throwing your spiked knuckle at them
	subtractible_armour_penetration = 25
	edge_protection_penetration = 5
	wound_bonus = 10
	bare_wound_bonus = 10
	sharpness = SHARP_IMPALING

/obj/item/ms13/knuckles/powerfist
	name = "power fist"
	desc = "A heavy, advanced glove that packs a hefty extra punch thanks to pneumatic mechanisms in the glove. Can break bones like a stick."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "powerfist"
	inhand_icon_state = "powerfist"
	hitsound = list('mojave/sound/ms13weapons/meleesounds/powerfist_hit1.ogg', 'mojave/sound/ms13weapons/meleesounds/powerfist_hit2.ogg', 'mojave/sound/ms13weapons/meleesounds/powerfist_hit3.ogg')
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/powerfist_pickup.ogg'
	force = 40
	throwforce = 10
	subtractible_armour_penetration = 35
	wound_bonus = 10
	bare_wound_bonus = 5
	w_class = WEIGHT_CLASS_NORMAL
	grid_width = 96
	grid_height = 64
	mining_mult = 0.5


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
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/melee/melee_inventory.dmi')
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

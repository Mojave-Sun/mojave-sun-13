// heavy weaponry //
/obj/item/chainsaw/ms13
	name = "auto axe"
	desc = "A modified steel saw, converted into a tool of destruction."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "auto_axe"
	inhand_icon_state = "auto_axe"
	on = FALSE
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK
	armour_penetration = 15
	wound_bonus = 10
	bare_wound_bonus = 10
	throw_speed = 2
	throw_range = 4

/obj/item/chainsaw/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/chainsaw/ms13/attack_self(mob/user)
	. = ..()
	if(on)
		icon_state = "auto_axe_on"
		inhand_icon_state = "auto_axe_on"
		force = 60
		sharpness = IS_SHARP_AXE
	else
		icon_state = "auto_axe"
		inhand_icon_state = "auto_axe"
		force = 15
		sharpness = SHARP_EDGED

	if(src == user.get_active_held_item()) //update inhands
		user.update_inv_hands()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/ms13/twohanded/heavy/lance
	name = "thermic lance"
	desc = "A heavy duty thermic lance, used primarily for melting steel beams before the war. But now is used for melting faces and through armor."
	icon_state = "thermiclance_off"
	inhand_icon_state = "thermiclance_off"
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK
	armour_penetration = 20
	wound_bonus = 12
	bare_wound_bonus = 13
	throw_speed = 1
	throw_range = 2
	hitsound = "swing_hit"
	var/on = FALSE

/obj/item/ms13/twohanded/heavy/lance/attack_self(mob/user)
	on = !on
	icon_state = "thermiclance_[on ? "on" : "off"]"
	inhand_icon_state = "thermiclance_[on ? "on" : "off"]"

	if(on)
		attack_verb_continuous = list("burned", "welded", "cauterized", "melted", "charred")
		attack_verb_simple = list("burn", "weld", "cauterize", "melt", "char")
		to_chat(user, "<span class='notice'>As you flip the lever and hit the ignition on [src], it begins to sputter flames out.")
		hitsound = 'sound/items/welder2.ogg'
		damtype = "burn"
		force = 55

	else
		attack_verb_continuous = list("pokes", "jabs", "smacks", "whacks",)
		attack_verb_simple = list("poke", "jab", "smack", "whack",)
		to_chat(user, "<span class='notice'>You flip the lever up on [src], the flame goes out.")
		hitsound = "swing_hit"
		damtype = "brute"
		force = 10

	if(src == user.get_active_held_item()) //update inhands
		user.update_inv_hands()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

//punchy punchy melee

/obj/item/ms13/knuckles
	name = "brass knuckle"
	desc = "The very small brass knuckle meant to be held in your hand to assist in making your punches quite a bit more dangerous."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	attack_verb_continuous = list("punches", "jabs", "clocks", "nails", "bludgeons", "whacks", "bonks")
	attack_verb_simple = list("punch", "jab", "clock", "nail", "bludgeon", "whack", "bonk")
	icon_state = "knuckles"
	inhand_icon_state = "knuckles"
	hitsound = "sound/weapons/cqchit1.ogg"
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_BELT
	throwforce = 5
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 50)
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
	throw_force = 10
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

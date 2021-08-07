// heavy weaponry //
/obj/item/chainsaw/ms13
	name = "auto axe"
	desc = "A modified steel saw, converted into a tool of destruction. You could use it for trees, But why stop there?"
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "auto_axe"
	inhand_icon_state = "auto_axe"
	on = FALSE
	w_class = WEIGHT_CLASS_HUGE
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
		force = 55
		armour_penetration = 10
		wound_bonus = 5
		bare_wound_bonus = 10
		sharpness = IS_SHARP_AXE
	else
		icon_state = "auto_axe"
		inhand_icon_state = "auto_axe"
		force = 10
		armour_penetration = 0
		wound_bonus = 0
		bare_wound_bonus = 5
		sharpness = SHARP_EDGED

	if(src == user.get_active_held_item()) //update inhands
		user.update_inv_hands()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/ms13/twohanded/heavy/lance
	name = "thermic lance"
	desc = "A heavy duty thermic lance, used primarily for cutting steel beams with superheated gas. Scarily efficient."
	icon_state = "thermiclance_off"
	inhand_icon_state = "thermiclance_off"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = NONE
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
		force = 60

	else
		attack_verb_continuous = list("pokes", "jabs", "smacks", "whacks",)
		attack_verb_simple = list("poke", "jab", "smack", "whack",)
		to_chat(user, "<span class='notice'>You flip the lever up on [src], the flame goes out.")
		hitsound = "swing_hit"
		damtype = "brute"
		force = 15

	if(src == user.get_active_held_item()) //update inhands
		user.update_inv_hands()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

//punchy punchy melee

/obj/item/ms13/knuckles
	name = "brass knuckles"
	desc = "The peak of concealed street weaponry. Slot these things over your fingers and beat a man's teeth out. No big deal."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	attack_verb_continuous = list("punches", "jabs", "clocks", "nails", "bludgeons", "whacks", "bonks")
	attack_verb_simple = list("punch", "jab", "clock", "nail", "bludgeon", "whack", "bonk")
	icon_state = "knuckles"
	inhand_icon_state = "knuckles"
	hitsound = "sound/weapons/cqchit1.ogg"
	w_class = WEIGHT_CLASS_TINY
	force = 10 // Way better than just punching, a consistent 10 vs 1-10

/obj/item/ms13/knuckles/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/ms13/knuckles/weighted
	name = "lead knuckles"
	desc = "Heavy knuckles, for when you really just want more from a punch. Would certainly break a rib."
	icon_state = "knuckles_weighted"
	inhand_icon_state = "knuckles_weighted"
	force = 15
	armour_penetration = 5

/obj/item/ms13/knuckles/weighted/spiked
	name = "spiked knuckles"
	desc = "Brass knuckles, but better. It has five spikes going along it, used to concentrate kinetic energy to a smaller area. In thug terms- Pack more heat. Cut a fool."
	icon_state = "knuckles_spike"
	inhand_icon_state = "knuckles_spike"
	sharpness = SHARP_POINTY

/obj/item/ms13/knuckles/powerfist
	name = "power fist"
	desc = "A pneumatic glove that acts as a powered ram in order to hit harder with a punch. Can send your foe flying!"
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "powerfist"
	inhand_icon_state = "powerfist"
	force = 25
	armour_penetration = 5
	wound_bonus = 10

/obj/item/ms13/knuckles/powerfist/attack(mob/living/target, mob/living/user)
	. = ..()
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	target.throw_at(throw_target, rand(1,3), 2, user)
	SSexplosions.medturf += throw_target
	playsound(loc, 'mojave/sound/ms13effects/airhiss.ogg', 50, TRUE)
	playsound(loc, 'sound/weapons/genhit2.ogg', 50, TRUE)

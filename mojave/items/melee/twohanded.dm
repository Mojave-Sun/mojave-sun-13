//This file contains the twohanded weapons and the base for them.

/obj/item/ms13/twohanded
	name = "wieldable weapon"
	desc = "don't use the damn thing, you animal."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	hitsound = 'sound/effects/hit_punch.ogg'
	attack_verb_continuous = list("attacks", "stabs", "pokes")
	attack_verb_simple = list("attack", "stab", "poke")
	sharpness = SHARP_EDGED
	w_class = WEIGHT_CLASS_HUGE
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_SUITSTORE | ITEM_SLOT_BACK
	log_pickup_and_drop = TRUE
	wield_info = /datum/wield_info/twohanded //silly default that probably won't be used much honestly
	var/wielded = FALSE
	var/stowable = TRUE //determines if the item can go on the suit slot or not

/obj/item/ms13/twohanded/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/on_wield)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/on_unwield)
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/melee/melee_inventory.dmi')

// triggered on wielding of a two handed item.
/obj/item/ms13/twohanded/proc/on_wield(obj/item/source, mob/user)
	SIGNAL_HANDLER
	playsound(src.loc, 'mojave/sound/ms13weapons/meleesounds/general_grip.ogg', 50, TRUE)
	wielded = TRUE

// triggered on unwielding of two handed item.
/obj/item/ms13/twohanded/proc/on_unwield(obj/item/source, mob/user)
	SIGNAL_HANDLER
	playsound(src.loc, 'mojave/sound/ms13weapons/meleesounds/general_grip.ogg', 35, TRUE)
	wielded = FALSE

/obj/item/ms13/twohanded/fireaxe
	name = "fire axe"
	desc = "A pre-war fire axe, once used by firemen, now used by maniacs."
	icon_state = "fire_axe"
	inhand_icon_state = "fire_axe"
	worn_icon_state = "fire_axe"
	attack_verb_continuous = list("cleaves", "whacks", "chops", "cuts")
	attack_verb_simple = list("cleave", "whack", "chop", "cut")
	hitsound = list('mojave/sound/ms13weapons/meleesounds/heavyaxe_hit1.ogg', 'mojave/sound/ms13weapons/meleesounds/heavyaxe_hit2.ogg')
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/heavy_pickup.ogg'
	force = 15
	throwforce = 10
	subtractible_armour_penetration = 25
	edge_protection_penetration = 15
	wound_bonus = 12
	bare_wound_bonus = 8
	throw_range = 3
	sharpness = SHARP_EDGED | SHARP_AXE
	toolspeed = 0.75
	grid_height = 192
	grid_width = 64
	wield_info = /datum/wield_info/twohanded/fireaxe
	mining_mult = -0.5

/obj/item/ms13/twohanded/fireaxe/drylander
	name = "\improper Drylander axe"
	desc = "A well made heavy axe. A favored weapon of the Drylander tribe."
	icon_state = "dry_axe"
	inhand_icon_state = "dry_axe"
	worn_icon_state = "dry_axe"
	force = 15
	subtractible_armour_penetration = 15
	edge_protection_penetration = 10
	wound_bonus = 12
	bare_wound_bonus = 10
	throw_range = 3
	wield_info = /datum/wield_info/twohanded/fireaxe

/obj/item/ms13/twohanded/bump_sword
	name = "bumper sword"
	desc = "A large, intimidating sword made fashioned from the bumper of a car. The peak of post-war blades."
	icon_state = "bumper_sword"
	inhand_icon_state = "bumper_sword"
	worn_icon_state = "bumper_sword"
	attack_verb_continuous = list("cleaves", "whacks", "chops", "lacerates", "stabs")
	attack_verb_simple = list("cleave", "whack", "chop", "lacerate", "stab")
	hitsound = 'mojave/sound/ms13weapons/meleesounds/heavyblade_hit.ogg'
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/heavy_pickup.ogg'
	force = 15
	throwforce = 10
	subtractible_armour_penetration = 25
	edge_protection_penetration = 15
	wound_bonus = 15
	bare_wound_bonus = 10
	throw_range = 3
	sharpness = SHARP_EDGED
	grid_height = 192
	grid_width = 64
	wield_info = /datum/wield_info/twohanded/bump_sword
	mining_mult = -0.5

/obj/item/ms13/twohanded/hammer
	name = "sledge hammer"
	desc = "A heavy sledge hammer. Used mostly for demolition of walls pre-war, has now been repurposed for demolition of bones."
	icon_state = "hammer_sledge"
	inhand_icon_state = "hammer_sledge"
	worn_icon_state = "hammer_sledge"
	attack_verb_continuous = list("slams", "beats", "hammers", "pummels", "impacts")
	attack_verb_simple = list("slam", "beat", "hammer", "pummel", "impact")
	hitsound = list('mojave/sound/ms13weapons/meleesounds/heavyblunt_hit1.ogg', 'mojave/sound/ms13weapons/meleesounds/heavyblunt_hit2.ogg', 'mojave/sound/ms13weapons/meleesounds/heavyblunt_hit3.ogg')
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/heavyblunt_pickup.ogg'
	force = 10
	throwforce = 10
	subtractible_armour_penetration = 30
	wound_bonus = 5
	bare_wound_bonus = 0
	throw_range = 3
	sharpness = NONE
	grid_height = 192
	grid_width = 64
	wield_info = /datum/wield_info/twohanded/sledge
	mining_mult = 1

/obj/item/ms13/twohanded/hammer/rebar
	name = "rebar club"
	desc = "A piece of rebar with concrete still stuck to it. Makes for a great, if heavy, makeshift bludgeon."
	icon_state = "rebar_club"
	inhand_icon_state = "rebar_club"
	worn_icon_state = "rebar_club"
	subtractible_armour_penetration = 20
	wound_bonus = 0
	bare_wound_bonus = 0
	wield_info = /datum/wield_info/twohanded/rebar
	mining_mult = 0.5

/obj/item/ms13/twohanded/hammer/super
	name = "super sledge"
	desc = "Using the power of science and engineering, they packed 66% more sledge in this hammer. It's a pain to use in general."
	icon_state = "hammer_power"
	inhand_icon_state = "hammer_power"
	worn_icon_state = "hammer_power"
	subtractible_armour_penetration = 35
	wound_bonus = 10
	bare_wound_bonus = 0
	grid_height = 256
	grid_width = 96
	wield_info = /datum/wield_info/twohanded/super_sledge
	mining_mult = 2

/obj/item/ms13/twohanded/hammer/super/attack(mob/living/target, mob/living/user)
	. = ..()

	if(wielded)
		var/atom/throw_target = get_edge_target_turf(target, user.dir)
		target.throw_at(throw_target, rand(2,4), 3, user)
		SSexplosions.medturf += throw_target
		playsound(loc, 'sound/weapons/resonator_blast.ogg', 50, TRUE)

	else
		return

/obj/item/ms13/twohanded/spear
	name = "metal spear"
	desc = "A well made, dangerous, and versatile spear."
	icon_state = "spear"
	inhand_icon_state = "spear"
	worn_icon_state = "spear"
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/general_pickup.ogg'
	hitsound = 'mojave/sound/ms13weapons/meleesounds/stab_hit.ogg'
	force = 20
	throwforce = 30
	subtractible_armour_penetration = 30
	edge_protection_penetration = 10
	wound_bonus = 10
	bare_wound_bonus = 5
	w_class = WEIGHT_CLASS_HUGE
	sharpness = SHARP_IMPALING
	grid_height = 32
	grid_width = 224
	wield_info = /datum/wield_info/twohanded/metal_spear
	mining_mult = -0.65

/obj/item/ms13/twohanded/spear/knife
	name = "knife spear"
	desc = "A very crude spear made from a simple knife and a scrap metal pole."
	icon_state = "spear_knife"
	inhand_icon_state = "spear_knife"
	worn_icon_state = "spear_knife"
	force = 15
	throwforce = 20
	subtractible_armour_penetration = 10
	edge_protection_penetration = 5
	wound_bonus = 0
	bare_wound_bonus = 5
	wield_info = /datum/wield_info/twohanded/knife_spear

/obj/item/ms13/twohanded/spear/throwing
	name = "throwing spear"
	desc = "A decently well made barbed spear intended to be thrown but can serve fine as a melee weapon too."
	icon_state = "spear_throwing"
	inhand_icon_state = "spear_throwing"
	worn_icon_state = "spear_throwing"
	force = 15
	throwforce = 35
	subtractible_armour_penetration = 15
	edge_protection_penetration = 5
	wound_bonus = 5
	bare_wound_bonus = 10
	embedding = list("embedded_pain_multiplier" = 1.5, "embed_chance" = 65, "embedded_fall_chance" = 35)
	throw_speed = 3
	wield_info = /datum/wield_info/twohanded/throw_spear

// TWO HANDS REQUIRED //

/obj/item/ms13/twohanded/heavy
	name = "heavy weapon"
	desc = "Generic heavy weapon go haha BRRR"
	slot_flags = null
	stowable = FALSE

/obj/item/ms13/twohanded/heavy/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands=TRUE)

/obj/item/ms13/twohanded/heavy/on_wield(obj/item/source, mob/user)
	playsound(src.loc, 'mojave/sound/ms13weapons/meleesounds/general_grip.ogg', 35, TRUE)
	wielded = TRUE

/datum/looping_sound/saw
	start_sound = 'mojave/sound/ms13weapons/meleesounds/saw_start.ogg'
	start_length = 1.8
	mid_sounds = 'mojave/sound/ms13weapons/meleesounds/saw_loop.ogg'
	mid_length = 1.8
	vary = FALSE
	volume = 67

/obj/item/ms13/twohanded/heavy/autoaxe
	name = "auto axe"
	desc = "A modified steel saw, converted into a tool of destruction."
	icon_state = "auto_axe_off"
	inhand_icon_state = "auto_axe_off"
	worn_icon_state = "auto_axe"
	w_class = WEIGHT_CLASS_HUGE
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/heavy_pickup.ogg'
	subtractible_armour_penetration = 20
	edge_protection_penetration = 20
	wound_bonus = 15
	bare_wound_bonus = 20
	throw_speed = 2
	throw_range = 4
	toolspeed = 0.35
	grid_height = 256
	grid_width = 256
	mining_mult = 0.5
	var/on = FALSE
	var/datum/looping_sound/saw/soundloop

/obj/item/ms13/twohanded/heavy/autoaxe/Initialize()
	. = ..()
	soundloop = new(src, FALSE)

/obj/item/ms13/twohanded/heavy/autoaxe/Destroy()
	. = ..()
	QDEL_NULL(soundloop)

/obj/item/ms13/twohanded/heavy/autoaxe/attack_self(mob/user)
	on = !on
	icon_state = "auto_axe_[on ? "on" : "off"]"
	inhand_icon_state = "auto_axe_[on ? "on" : "off"]"

	if(on)
		force = 60
		sharpness = SHARP_EDGED | SHARP_AXE
		attack_verb_continuous = list("slices", "slashes", "cuts", "rends", "saws", "tears")
		attack_verb_simple = list("slice", "slash", "cut", "rend", "saw", "tear")
		hitsound = list('mojave/sound/ms13weapons/meleesounds/ripper_hit1.ogg', 'mojave/sound/ms13weapons/meleesounds/ripper_hit2.ogg', 'mojave/sound/ms13weapons/meleesounds/ripper_hit3.ogg')
		soundloop.start()

	else
		force = 15
		sharpness = NONE
		attack_verb_continuous = list("smacks", "beats", "slashes", "cuts", "clubs")
		attack_verb_simple = list("smack", "beat", "slash", "cut", "club")
		hitsound = 'mojave/sound/ms13weapons/meleesounds/hatchet_hit.ogg'
		soundloop.stop()

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
	worn_icon_state = "thermic_lance"
	w_class = WEIGHT_CLASS_HUGE
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/general_pickup.ogg'
	subtractible_armour_penetration = 40
	edge_protection_penetration = 20
	wound_bonus = 8
	bare_wound_bonus = 12
	throw_speed = 2
	throw_range = 4
	grid_height = 256
	grid_width = 256
	hitsound = "swing_hit"
	mining_mult = 0.65
	var/on = FALSE

/obj/item/ms13/twohanded/heavy/lance/attack_self(mob/user)
	on = !on
	icon_state = "thermiclance_[on ? "on" : "off"]"
	inhand_icon_state = "thermiclance_[on ? "on" : "off"]"

	if(on)
		attack_verb_continuous = list("burned", "welded", "cauterized", "melted", "charred")
		attack_verb_simple = list("burn", "weld", "cauterize", "melt", "char")
		to_chat(user, "<span class='notice'>As you flip the lever and hit the ignition on [src], it begins to sputter flames out.")
		hitsound = 'mojave/sound/ms13weapons/meleesounds/shishkebab_hit2.ogg'
		damtype = "burn"
		force = 45

	else
		attack_verb_continuous = list("pokes", "jabs", "smacks", "whacks",)
		attack_verb_simple = list("poke", "jab", "smack", "whack",)
		to_chat(user, "<span class='notice'>You flip the lever up on [src], the flame goes out.")
		hitsound = 'mojave/sound/ms13weapons/meleesounds/genericblunt_hit.ogg'
		damtype = "brute"
		force = 10

	if(src == user.get_active_held_item()) //update inhands
		user.update_inv_hands()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

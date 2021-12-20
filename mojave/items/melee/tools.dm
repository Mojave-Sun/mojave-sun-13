/obj/item/ms13/hammer
	name = "claw hammer"
	desc = "A standard, small claw hammer."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "hammer"
	inhand_icon_state = "hammer"
	hitsound = 'sound/weapons/genhit3.ogg'
	force = 20
	armour_penetration = 0
	wound_bonus = -2
	bare_wound_bonus = 0
	attack_verb_continuous = list("smacks", "deconstructs", "pounds", "beats", "bonks", "hammers", "nails")
	attack_verb_simple = list("smack", "deconstruct", "pound", "beat", "bonk", "hammer", "nail")
	sharpness = NONE
	slot_flags = ITEM_SLOT_BELT
	throwforce = 10
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
	w_class = WEIGHT_CLASS_SMALL
	log_pickup_and_drop = TRUE

/obj/item/ms13/hammer/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/ms13/handsaw
	name = "hand saw"
	desc = "An old handsaw. Useful for cutting wood to length. Also useful for compacting corpses down to a bag sized package."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "handsaw"
	inhand_icon_state = "handsaw"
	force = 20
	wound_bonus = 5
	bare_wound_bonus = 5
	attack_verb_continuous = list("saws", "slashes", "tears", "rips")
	attack_verb_simple = list("saw", "slash", "tear", "rip")
	sharpness = IS_SHARP_AXE // Cut down da TREE. Cut down da WOOD.
	slot_flags = ITEM_SLOT_BELT
	resistance_flags = FIRE_PROOF	
	w_class = WEIGHT_CLASS_NORMAL
	toolspeed = 0.5 // axe tomfoolery
	log_pickup_and_drop = TRUE

/obj/item/ms13/handsaw/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')


/obj/item/ms13/handdrill
	name = "hand drill"
	desc = "A manual operated drill. Put the spinny bit on what you want to drill, and then just crank it!"
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "handdrill"
	inhand_icon_state = "handdrill"
	force = 25
	armour_penetration = 10 // da DRILL
	wound_bonus = 6
	bare_wound_bonus = 4
	attack_verb_continuous = list("drills", "pierces", "stabs", "impales", "jabs")
	attack_verb_simple = list("drill", "pierce", "stab", "impale", "jab")
	sharpness = SHARP_POINTY // Cut down da TREE. Cut down da WOOD.
	slot_flags = ITEM_SLOT_BELT
	resistance_flags = FIRE_PROOF
	w_class = WEIGHT_CLASS_NORMAL
	log_pickup_and_drop = TRUE

/obj/item/ms13/handdrill/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/crowbar/ms13
	name = "crowbar"
	desc = "A formidible weapon, and a useful tool. The ultimate slayer of boarded structures."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "crowbar"
	inhand_icon_state = "crowbar"
	force = 20
	throwforce = 10
	wound_bonus = 6
	sharpness = NONE
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_NORMAL
	log_pickup_and_drop = TRUE

/obj/item/crowbar/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/weldingtool/ms13
	name = "welding tool"
	desc = "An old welding torch. Useful for cutting metal and welding things together alike. Don't touch the flame!"
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "torch"
	inhand_icon_state = "torch"
	force = 25
	throwforce = 10
	throwforce = 10
	wound_bonus = 0
	bare_wound_bonus = 5
	light_color = "#7c84a7"
	w_class = WEIGHT_CLASS_NORMAL
	log_pickup_and_drop = TRUE

/obj/item/weldingtool/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/weldingtool/ms13/update_icon_state()
	. = ..()
	if(welding)
		inhand_icon_state = "[initial(inhand_icon_state)]-on"
		icon_state = "[initial(icon_state)]-on"
	else
		inhand_icon_state = "[initial(inhand_icon_state)]"
		icon_state = "[initial(icon_state)]"

/obj/item/wrench/ms13
	name = "wrench"
	desc = "An old and slightly rusted wrench. Still filled with uses even today."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "wrench"
	inhand_icon_state = "wrench"
	force = 10
	throwforce = 15
	sharpness = NONE
	wound_bonus = 0
	bare_wound_bonus = 0
	w_class = WEIGHT_CLASS_NORMAL
	log_pickup_and_drop = TRUE

/obj/item/wrench/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/wirecutters/ms13
	name = "pliers"
	desc = "A portable set of multi-use pliers. Has a section that can be used to cut cable."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "wirecutter"
	inhand_icon_state = "wirecutter"
	force = 5
	sharpness = SHARP_POINTY
	wound_bonus = CANT_WOUND
	random_color = FALSE
	log_pickup_and_drop = TRUE

/obj/item/wirecutters/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/screwdriver/ms13
	name = "screwdriver"
	desc = "A thin screwdriver. Keep it close, you'll never know when you need to remove someone's eye- or a screw."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "screwdriver"
	inhand_icon_state = "screwdriver"
	flags_1 = CONDUCT_1
	force = 10
	sharpness = SHARP_POINTY
	wound_bonus = 5
	bare_wound_bonus = 5
	throwforce = 10
	random_color = FALSE
	log_pickup_and_drop = TRUE

/obj/item/screwdriver/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/shovel/ms13
	name = "shovel"
	desc = "A shovel for digging up the ground, commonly used for farming or gravedigging."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "shovel"
	inhand_icon_state = "shovel"
	hitsound = 'sound/weapons/genhit.ogg'
	force = 25
	armour_penetration = 10
	wound_bonus = 5
	bare_wound_bonus = 0
	throwforce = 15
	attack_verb_continuous = list("smacks", "slashes", "jabs", "slaps", "pounds", "beats", "bonks", "digs")
	attack_verb_simple = list("smack", "slash", "jab", "slap", "pound", "beat", "bonk", "dig")
	sharpness = NONE
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	log_pickup_and_drop = TRUE

/obj/item/shovel/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/shovel/ms13/spade
	name = "spade"
	desc = "A small, compact spade for digging up the ground. It's smaller size makes it not as efficent as using a full sized shovel."
	icon_state = "spade"
	inhand_icon_state = "spade"
	force = 20
	armour_penetration = 0
	wound_bonus = -2
	throwforce = 10
	toolspeed = 0.5
	sharpness = NONE
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT

/obj/item/shovel/ms13/snow
	name = "snow shovel"
	desc = "A shovel primarily meant for clearing snow, but could be used to dig somewhat inefficiently."
	icon_state = "shovel_snow"
	inhand_icon_state = "shovel_snow"
	force = 20
	armour_penetration = 10
	wound_bonus = 5
	throwforce = 10
	toolspeed = 0.5

/obj/item/shovel/ms13/rake
	name = "rake"
	desc = "A rake used for raking. You could try to dig with it, but it won't do you much good."
	icon_state = "rake"
	inhand_icon_state = "rake"
	force = 20
	wound_bonus = 5
	bare_wound_bonus = 5
	throwforce = 10
	armour_penetration = 5
	toolspeed = 0.25
	attack_verb_continuous = list("smacks", "slashes", "jabs", "slaps", "pounds", "beats", "bonks", "rakes", "assaults")
	attack_verb_simple = list("smack", "slash", "jabb", "slap", "pound", "beat", "bonk", "rake", "assault")
	hitsound = 'sound/weapons/genhit.ogg'
	sharpness = SHARP_POINTY

/obj/item/ms13/brick
	name = "brick"
	desc = "A literal brick. Nothing more."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	icon_state = "brick"
	inhand_icon_state = "brick"
	attack_verb_continuous = list("clonks", "smacks", "clocks", "nails", "bludgeons", "whacks", "bonks", "bricks")
	attack_verb_simple = list("clonk", "smack", "clock", "nail", "bludgeon", "whack", "bonk", "brick")
	force = 15
	throwforce = 20 //brick
	armour_penetration = 0
	wound_bonus = 5
	bare_wound_bonus = 0
	sharpness = NONE
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_BELT
	log_pickup_and_drop = TRUE

/obj/item/ms13/brick/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

// Handheld light sources  //

/obj/item/flashlight/ms13
	name = "flashlight"
	desc = "A common pre-war flashlight. It's held up surprisingly well over the years. An essential tool for any tomfoolery in the unknown."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "flashlight_old"
	inhand_icon_state = "flashlight_old"
	light_range = 3.5
	light_power = 0.75
	light_color = "#dbb070"

/obj/item/flashlight/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/flashlight/ms13/mag
	name = "stick flashlight"
	desc = "A lengthy dark flashlight. Has a fair light range, and feels relatively high quality."
	icon_state = "flashlight_mag"
	inhand_icon_state = "flashlight_mag"
	light_range = 4
	light_power = 0.85
	light_color = "#dac97c"

/obj/item/flashlight/ms13/crafted
	name = "homemade flashlight"
	desc = "To call it a flashlight is even a stretch. This device is simply a lightbulb connected to a low output fusion cell."
	icon_state = "flashlight_crafted"
	inhand_icon_state = "flashlight_crafted"
	light_range = 3 // doo-doo. But much better than nothing.
	light_power = 0.55
	light_color = "#ddd2b9"

/obj/item/flashlight/flare/ms13
	name = "flare"
	desc = "A red flare, quite simple."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "flare"
	inhand_icon_state = "flare"
	light_range = 3.75 // lower because radial

/obj/item/flashlight/flare/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/flashlight/flare/torch/ms13
	name = "torch"
	desc = "A torch fashioned from some leaves and a log."
	w_class = WEIGHT_CLASS_BULKY
	light_range = 4
	light_color = LIGHT_COLOR_FIRE

/obj/item/flashlight/flare/torch/ms13/attack_self(mob/user)
	if(!src.on)
		to_chat(user, "<span class='notice'>You start pushing [src] into the ground...</span>")
		if (do_after(user, 5 SECONDS, target=src))
			qdel(src)
			new /obj/structure/ms13/torch(get_turf(user))
			user.visible_message("<span class='notice'>[user] plants \the [src] firmly in the ground.</span>", "<span class='notice'>You plant \the [src] firmly in the ground.</span>")
			return
	else if(on)
		user.visible_message(
			"<span class='notice'>[user] snuffs [src] out.</span>")
		on = FALSE
		set_light(0)

/obj/item/flashlight/flare/torch/ms13/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(W.ignition_effect())
		update_brightness()
		update_icon()
		user.visible_message("<span class='notice'>[user] lights [src] with [W].</span>", "<span class='notice'>You light [src] with [W].</span>")
		return

/obj/item/ms13/hammer
	name = "claw hammer"
	desc = "A standard, small claw hammer."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "hammer"
	inhand_icon_state = "hammer"
	hitsound = 'mojave/sound/ms13items/axe_1.ogg'
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
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
	w_class = WEIGHT_CLASS_SMALL
	log_pickup_and_drop = TRUE

/obj/item/ms13/hammer/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/shovel/ms13
	name = "shovel"
	desc = "A shovel for digging up the ground, commonly used for farming or gravedigging."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
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

/obj/item/shovel/ms13/snow
	name = "snow shovel"
	desc = "A shovel primarily meant for clearing snow, but could be used to dig somewhat inefficiently."
	icon_state = "shovel_snow"
	inhand_icon_state = "shovel_snow"
	force = 20
	armour_penetration = 10
	wound_bonus = 10
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
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
	slot_flags = null
	log_pickup_and_drop = TRUE

/obj/item/ms13/brick/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/flashlight/flare/ms13
	name = "flare"
	desc = "A red flare, quite simple."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "flare"
	inhand_icon_state = "flare"
	light_range = 5 // Somewhat bright.

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

//This folder contains all knives and children of knives, like cleavers

/obj/item/kitchen/knife/ms13
	name = "kitchen knife"
	desc = "A standard kitchen knife. A decent improvised weapon."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "knife_kitchen"
	inhand_icon_state = "knife_kitchen"
	force = 15
	throwforce = 15
	wound_bonus = 8
	bare_wound_bonus = 6
	sharpness = SHARP_EDGED
	w_class = WEIGHT_CLASS_SMALL
	log_pickup_and_drop = TRUE

/obj/item/kitchen/knife/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/kitchen/knife/ms13/combat
	name = "combat knife"
	desc = "A well made, serrated combat knife. Very effective at wounding thanks to it's serrated blade."
	icon_state = "knife_bayonet"
	inhand_icon_state = "knife_bayonet"
	force = 25
	armour_penetration = 10
	wound_bonus = 10
	bare_wound_bonus = 10
	throwforce = 25

/obj/item/kitchen/knife/ms13/combat/soviet
	name = "\improper European combat knife"
	desc = "A slick, straight back combat knife of European make. Seems quite old, and has a faint engraving reading NKVD. The plain, straight blade reduces it's effectiveness at wounding a target."
	icon_state = "knife_soviet"
	inhand_icon_state = "knife_soviet"
	force = 30
	armour_penetration = 5
	wound_bonus = 2
	bare_wound_bonus = 3

/obj/item/kitchen/knife/ms13/combat/bowie
	name = "bowie knife"
	desc = "A heavy duty bowie knife. Incredibly dangerous in skilled hands."
	icon_state = "knife_bowie"
	inhand_icon_state = "knife_bowie"
	force = 35
	armour_penetration = 10
	wound_bonus = 4
	bare_wound_bonus = 4
	throwforce = 35

/obj/item/kitchen/knife/ms13/hunting
	name = "hunting knife"
	desc = "A standard hunting knife, a useful tool for anyone in the post apocalypse."
	icon_state = "knife_hunting"
	inhand_icon_state = "knife_hunting"
	force = 20
	armour_penetration = 5
	throwforce = 20

/obj/item/kitchen/knife/ms13/hunting/unique
	name = "\improper Hunter's Pride"
	desc = "A gold rimmed hunting knife with an added finger loop to assist in grip. It is in a pristine overall condition, someone took great care of this."
	icon_state = "knife_hunting_u"
	inhand_icon_state = "knife_hunting_u"
	force = 25
	armour_penetration = 10

/obj/item/throwing_star/ms13/throwingknife
	name = "throwing knife"
	desc = "A sharp, pointed knife designed to be thrown."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "knife_throwing"
	inhand_icon_state = "knife_throwing"
	force = 15
	throwforce = 25
	armour_penetration = 10
	embedding = list("embedded_pain_multiplier" = 3, "embed_chance" = 40, "embedded_fall_chance" = 20)
	w_class = WEIGHT_CLASS_SMALL
	sharpness = SHARP_POINTY
	wound_bonus = 5
	bare_wound_bonus = 5
	log_pickup_and_drop = TRUE

/obj/item/throwing_star/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/switchblade/ms13
	name = "switchblade"
	desc = "A slick and concealable switchblade."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "knife_switch"
	inhand_icon_state = "knife_switch"
	wound_bonus = 2
	bare_wound_bonus = 3
	extended = 0
	log_pickup_and_drop = TRUE

/obj/item/switchblade/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/switchblade/ms13/attack_self(mob/user)
	extended = !extended
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, TRUE)
	if(extended)
		attack_verb_continuous = list("slashes", "slices", "tears", "lacerates", "rips", "dices", "cuts")
		attack_verb_simple = list("slash", "slice", "tear", "lacerate", "rip", "dice", "cut")
		icon_state = "[initial(icon_state)]_open"
		inhand_icon_state = "[initial(icon_state)]_open"
		hitsound = 'sound/weapons/bladeslice.ogg'
		force = 20
		throwforce = 15
		sharpness = SHARP_EDGED
		w_class = WEIGHT_CLASS_SMALL

	else
		attack_verb_continuous = list("stubs", "pokes")
		attack_verb_simple = list("stub", "poke")
		icon_state = "[initial(icon_state)]"
		hitsound = 'sound/weapons/genhit.ogg'
		force = 5
		throwforce = 5
		sharpness = NONE
		w_class = WEIGHT_CLASS_TINY

/obj/item/switchblade/ms13/razor
	name = "straight razor"
	desc = "A men's shaving tool, now more commonly used to cut throats instead of beards."
	icon_state = "knife_razor"
	inhand_icon_state = "knife_razor"
	wound_bonus = 0
	bare_wound_bonus = 0

/obj/item/switchblade/ms13/razor/attack_self(mob/user)
	extended = !extended
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, TRUE)
	if(extended)
		attack_verb_continuous = list("slashes", "slices", "tears", "lacerates", "rips", "dices", "cuts")
		attack_verb_simple = list("slash", "slice", "tear", "lacerate", "rip", "dice", "cut")
		icon_state = "[initial(icon_state)]_open"
		inhand_icon_state = "[initial(inhand_icon_state)]_open"
		hitsound = 'sound/weapons/bladeslice.ogg'
		force = 15
		throwforce = 5
		sharpness = SHARP_EDGED
		w_class = WEIGHT_CLASS_SMALL

	else
		attack_verb_continuous = list("stubs", "pokes")
		attack_verb_simple = list("stub", "poke")
		icon_state = "[initial(icon_state)]"
		inhand_icon_state = "[initial(inhand_icon_state)]"
		hitsound = 'sound/weapons/genhit.ogg'
		force = 5
		throwforce = 5
		sharpness = NONE
		w_class = WEIGHT_CLASS_TINY

/obj/item/kitchen/knife/butcher/ms13
	name = "cleaver"
	desc = "A hefty butcher's cleaver normally used for chopping limbs and meat off of animals. But it was later discovered this works just as well on other humans."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "knife_cleaver"
	inhand_icon_state = "knife_cleaver"
	force = 25
	throwforce = 15
	wound_bonus = 12
	bare_wound_bonus = 13
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = SHARP_EDGED
	log_pickup_and_drop = TRUE

/obj/item/kitchen/knife/butcher/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/kitchen/knife/butcher/ms13/unique
	name = "\improper Chopper"
	desc = "A cleaver that has definitely seen a lot of use and is heavily rusted. Though it still looks like it could chop off a limb, or give a case of tetanus while trying."
	icon_state = "knife_cleaver_rust"
	inhand_icon_state = "knife_cleaver_rust"
	force = 30
	wound_bonus = 15
	bare_wound_bonus = 15

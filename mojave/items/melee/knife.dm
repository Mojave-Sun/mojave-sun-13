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
	wound_bonus = 0
	sharpness = SHARP_EDGED
	log_pickup_and_drop = TRUE

/obj/item/kitchen/knife/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/kitchen/knife/ms13/combat
	name = "combat knife"
	desc = "A well made, serrated combat knife. Very effective at wounding. It's got a light frame, with a rifle lug to potentially attach to a matching rifle."
	icon_state = "knife_bayonet"
	inhand_icon_state = "knife_bayonet"
	force = 25
	armour_penetration = 10
	wound_bonus = 4
	throwforce = 30

/obj/item/kitchen/knife/ms13/combat/soviet
	desc = "A slick, straight back combat knife, with a pleasant wrapped leather handle, and faint engraving labeled NKVD."
	icon_state = "knife_soviet"
	inhand_icon_state = "knife_soviet"
	force = 30
	armour_penetration = 15
	wound_bonus = 5
	throwforce = 35

/obj/item/kitchen/knife/ms13/combat/bowie
	name = "bowie knife"
	desc = "A heavy duty bowie knife. Not as good at wounding as it's serrated counterparts, but can kill just as well."
	icon_state = "knife_bowie"
	inhand_icon_state = "knife_bowie"
	force = 35
	armour_penetration = 5
	wound_bonus = -4
	throwforce = 35

/obj/item/kitchen/knife/ms13/hunting
	name = "hunting knife"
	desc = "A standard hunting knife, often used to skin animals but can be used for virtually anything. A useful tool, may even save your life."
	icon_state = "knife_hunting"
	inhand_icon_state = "knife_hunting"
	force = 25
	armour_penetration = 0
	wound_bonus = -4
	throwforce = 25

/obj/item/kitchen/knife/ms13/hunting/unique
	desc = "A gold rimmed hunting knife. It's got a single finger loop to assist in grip. The blade seems to be extra sharp."
	icon_state = "knife_hunting_u"
	inhand_icon_state = "knife_hunting_u"
	force = 30
	wound_bonus = -2
	throwforce = 30

/obj/item/throwing_star/ms13/throwingknife
	name = "throwing knife"
	desc = "A knife, weighted and designed to be thrown. Looks pretty sharp."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "knife_throwing"
	inhand_icon_state = "knife_throwing"
	force = 15
	throwforce = 25
	embedding = list("embedded_pain_multiplier" = 3, "embed_chance" = 25, "embedded_fall_chance" = 10)
	w_class = WEIGHT_CLASS_SMALL
	sharpness = SHARP_POINTY
	wound_bonus = 0
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
	wound_bonus = -2
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
		hitsound = 'sound/weapons/bladeslice.ogg'
		force = 25
		throwforce = 15
		sharpness = SHARP_EDGED

	else
		attack_verb_continuous = list("stubs", "pokes")
		attack_verb_simple = list("stub", "poke")
		icon_state = "[initial(icon_state)]"
		hitsound = 'sound/weapons/genhit.ogg'
		force = 5
		throwforce = 2
		sharpness = SHARP_NONE

/obj/item/switchblade/ms13/razor
	name = "razor knife"
	desc = "A slick and concealable switchblade."
	icon_state = "knife_razor"

/obj/item/kitchen/knife/butcher/ms13
	name = "cleaver"
	desc = "A large butcher's cleaver normally used for chopping limbs and meat off of animals. But it was later discovered this works just as well on other humans."
	icon = 'mojave/icons/objects/melee/melee_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/melee_inhand_right.dmi'
	icon_state = "knife_cleaver"
	inhand_icon_state = "knife_cleaver"
	force = 25
	armour_penetration = 5
	wound_bonus = 3
	bare_wound_bonus = 10
	sharpness = SHARP_EDGED
	log_pickup_and_drop = TRUE

/obj/item/kitchen/knife/butcher/ms13/unique
	name = "\improper Chopper"
	desc = "A cleaver that has definitely seen a lot of use and is heavily rusted. Though it still looks like it could chop off a limb, or give a case of tetanus while trying."
	icon_state = "knife_cleaver_rust"
	inhand_icon_state = "knife_cleaver_rust"
	force = 30
	wound_bonus = 6

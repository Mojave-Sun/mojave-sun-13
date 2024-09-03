/obj/item/ms13/snowball
	name = "snowball"
	desc = "Throwing these is always fun way to start a fight."
	icon = 'icons/obj/toy.dmi'
	icon_state = "snowball"
	hitsound = 'sound/weapons/genhit.ogg'
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/general_grip.ogg'
	attack_verb_continuous = list("powders", "snows", "ices", "nails", "whacks")
	attack_verb_simple = list("powder", "snow", "ice", "nail", "whack")
	force = 0
	throwforce = 0 //snowball
	subtractible_armour_penetration = 0
	wound_bonus = 0
	bare_wound_bonus = 0
	sharpness = NONE
	w_class = WEIGHT_CLASS_SMALL
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
	log_pickup_and_drop = TRUE
	grid_width = 64
	grid_height = 32

/obj/item/ms13/snowball/afterattack(atom/target, mob/user, proximity, params)
	if(target.is_refillable())
		if(target.reagents.maximum_volume == target.reagents.total_volume)
			to_chat(user, span_info("The [target] is already full!"))
			return
		else
			target.reagents.add_reagent(/datum/reagent/consumable/ms13/snow, 25)
			qdel(src)

/obj/item/ms13/snowball/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!.) //if we're not being caught
		splat(hit_atom)

/obj/item/ms13/snowball/proc/splat(atom/movable/hit_atom)
	if(isliving(loc)) //someone caught us!
		return
	if(ismob(hit_atom))
		qdel(src)

/obj/item/ms13/snowball/dropped()
	addtimer(CALLBACK(src, .proc/melt), 300, TIMER_STOPPABLE | TIMER_UNIQUE) // 300 = 30 secs

/obj/item/ms13/snowball/proc/melt()
	src.visible_message(span_notice("The [src.name] melts!"))
	qdel(src)

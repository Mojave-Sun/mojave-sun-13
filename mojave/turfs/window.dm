/obj/structure/window/fulltile/ms13
	name = "base class window"
	desc = "Scream at the coders"
	smoothing_flags = SMOOTH_BITMASK
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE
	max_integrity = 25
	glass_type = /obj/item/stack/sheet/ms13/glass
	glass_amount = 1
	break_sound = 'mojave/sound/ms13effects/glass_break.ogg'
	hitted_sound = 'mojave/sound/ms13effects/glass_hit.ogg'
	knock_sound = 'mojave/sound/ms13effects/glass_knock.ogg'
	var/shatter_immune = FALSE // immune to passthrough bullshittery

/obj/structure/window/fulltile/ms13/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(shatter_immune)
		return
	if(istype(mover, /obj/projectile/beam/ms13))
		return TRUE
	if(istype(mover, /obj/projectile/bullet/ms13/plasma))
		return FALSE
	else if(istype(mover, /obj/projectile))
		var/obj/projectile/proj = mover
		if(proj.damage > 10)
			deconstruct(disassembled = FALSE)
			return TRUE
	else if(istype(mover, /obj/item))
		var/obj/item/thrown_item = mover
		if(thrown_item.throwing && thrown_item.throwforce >= 10 || thrown_item.w_class >= WEIGHT_CLASS_NORMAL)
			deconstruct(disassembled = FALSE)
			return TRUE
	else if(istype(mover, /mob/living))
		var/mob/living/mob_yote = mover
		if(mob_yote.throwing && mob_yote.mob_size >= 2)
			if(istype(mover, /mob/living/carbon/human))
				var/mob/living/carbon/human/human_yeetus = mover
				for(var/_limb in human_yeetus.bodyparts)
					var/obj/item/bodypart/limb = _limb
					var/type_wound = pick(list(/datum/wound/slash/moderate, /datum/wound/slash/moderate))
					limb.force_wound_upwards(type_wound)
				human_yeetus.adjustBruteLoss(rand(10,20))
				human_yeetus.Knockdown(5)
			deconstruct(disassembled = FALSE)
			return TRUE

/obj/structure/window/fulltile/ms13/spawnDebris(location)
	. = list()
	. += new /obj/item/stack/sheet/ms13/glass(location)
	. += new /obj/effect/decal/cleanable/glass(location)

/obj/structure/window/fulltile/ms13/glass
	name = "glass window"
	desc = ""
	icon = 'mojave/icons/turf/walls/glass.dmi'
	max_integrity = 40
	icon_state = "glass-0"
	base_icon_state = "glass"
	smoothing_groups = list(SMOOTH_GROUP_MS13_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_MS13_WINDOW,SMOOTH_GROUP_MS13_WALL)

/obj/structure/window/reinforced/fulltile/ms13
	name = "base class reinforced window"
	desc = "Scream at the coders"
	smoothing_flags = SMOOTH_BITMASK
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE
	damage_deflection = 20
	max_integrity = 300
	damage_deflection = 16 //This basically means it blocks 15 damage weapons and weaker
	glass_type = /obj/item/stack/sheet/ms13/glass
	glass_amount = 1

/obj/structure/window/reinforced/attackby_secondary(obj/item/tool, mob/user, params)
	return

/obj/structure/window/reinforced/examine(mob/user)
	return

/obj/structure/window/reinforced/fulltile/ms13/spawnDebris(location)
	. = list()
	. += new /obj/item/stack/sheet/ms13/glass(location)
	. += new /obj/item/stack/sheet/ms13/scrap(location)
	. += new /obj/effect/decal/cleanable/glass(location)

/obj/structure/window/reinforced/fulltile/ms13/glass
	name = "reinforced glass window"
	desc = ""
	icon = 'mojave/icons/turf/walls/glass.dmi' //Waiting for a proper sprite, the old one looks dumb as a placeholder.
	icon_state = "glass-0"
	base_icon_state = "glass"
	smoothing_groups = list(SMOOTH_GROUP_MS13_WINDOW)
	canSmoothWith= list(SMOOTH_GROUP_MS13_WINDOW,SMOOTH_GROUP_MS13_WALL)

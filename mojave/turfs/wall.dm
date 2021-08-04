/turf/closed/wall/ms13
	name = "base class wall"
	desc = "God has abandoned us"
	icon_state = "wall-0"
	base_icon_state = "wall"
	layer = EDGED_TURF_LAYER
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_WALL)
	canSmoothWith= list(SMOOTH_GROUP_MS13_WALL)
	var/weldable = FALSE

/turf/closed/wall/ms13/try_decon(obj/item/I, mob/user, turf/T)
	if(!weldable)
		return
	else
		. = ..()

/turf/closed/wall/ms13/metal
	name = "metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/metal.dmi'

/turf/closed/wall/ms13/metal/rust
	name = "rusted metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/rustmetal.dmi'

/turf/closed/wall/ms13/wood
	name = "wood wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/wood.dmi'

/turf/closed/wall/ms13/wood/log
	name = "log wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/woodlog.dmi'

/turf/closed/wall/ms13/scrap
	name = "scrap wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/scrap.dmi'

/turf/closed/wall/ms13/scrap/white
	icon = 'mojave/icons/turf/walls/scrapwhite.dmi'

/turf/closed/wall/ms13/scrap/red
	icon = 'mojave/icons/turf/walls/scrapred.dmi'

/turf/closed/wall/ms13/scrap/blue
	icon = 'mojave/icons/turf/walls/scrapblue.dmi'

/turf/closed/wall/ms13/adobe //need
	name = "adobe wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/adobe.dmi'

/turf/closed/wall/ms13/brick
	name = "brick wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/brick.dmi'

/turf/closed/wall/ms13/brick/alt
	icon = 'mojave/icons/turf/walls/brickalt.dmi'

/turf/closed/wall/ms13/brick/gray
	icon = 'mojave/icons/turf/walls/brickgray.dmi'

/turf/closed/wall/r_wall/ms13
	name = "base class wall"
	desc = "AHHH FUCK A BASE CLASS WALL"
	icon_state = "wall-0"
	base_icon_state = "wall"
	layer = EDGED_TURF_LAYER
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_WALL)
	canSmoothWith= list(SMOOTH_GROUP_MS13_WALL)

/turf/closed/wall/r_wall/ms13/metal
	name = "reinforced metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/rmetal.dmi'

/turf/closed/wall/r_wall/ms13/metal/rust
	name = "rusted reinforced metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/rrustmetal.dmi'

/turf/closed/wall/r_wall/ms13/concrete
	name = "concrete wall"
	icon = 'mojave/icons/turf/walls/concrete.dmi'

/turf/closed/wall/r_wall/ms13/concrete/alt
	icon = 'mojave/icons/turf/walls/concretealt.dmi'

/turf/closed/wall/r_wall/ms13/bunker
	name = "bunker wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/bunker.dmi'

/turf/closed/indestructible/ms13
	layer = EDGED_TURF_LAYER

/turf/closed/indestructible/ms13/metal
	name = "metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/metal.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_WALL)
	canSmoothWith= list(SMOOTH_GROUP_MS13_WALL)

/turf/closed/indestructible/ms13/comb
	name = "comb wall"
	desc = "honeybeast comb, lining the walls. They subtly drip a substance."
	icon = 'mojave/icons/turf/walls/comb.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_WALL)
	canSmoothWith= list(SMOOTH_GROUP_MS13_WALL)

//Player Craftable Walls

/turf/closed/wall/ms13/craftable
	name = "base class craftable wall"
	desc = "God has abandoned us, with functionality"
	baseturfs = /turf/open/floor/plating/ground/desert
	weldable = TRUE

/turf/closed/wall/ms13/craftable/scrap
	name = "rough scrap wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/roughscrap.dmi'

/turf/closed/wall/ms13/craftable/scrap/Initialize()
	. = ..()
	base_icon_state = pick("wall","wall_2","wall_3")
	switch(base_icon_state)
		if("wall_1")
			icon_state = "wall_1-0"
		if("wall_2")
			icon_state = "wall_2-0"
		else
			return

//Wall Supports

/obj/structure/girder/ms13
	name = "base class wall support"
	desc = "No more girder spam, circa mojave sun - 2021"
	can_displace = FALSE
	girderpasschance = 100
	icon = 'mojave/icons/turf/walls/girder.dmi'
	var/list/material_used
	var/wall_type = /turf/closed/wall/ms13/craftable

/obj/structure/girder/ms13/bars
	name = "rebar supports"
	desc = "Quick and cheap building supports for ghetto constructions."
	icon_state = "rebar"
	climbable = TRUE //you can weave through these things
	climb_time = 3 SECONDS
	material_used = list(/obj/item/stack/sheet/ms13/scrap)
	wall_type = /turf/closed/wall/ms13/craftable/scrap

/obj/structure/girder/ms13/bars/climb_structure(mob/living/user)
	src.add_fingerprint(user)
	user.visible_message("<span class='warning'>[user] starts weaving through [src].</span>", \
								"<span class='notice'>You start weaving through [src]...</span>")
	var/adjusted_climb_time = climb_time
	if(HAS_TRAIT(user, TRAIT_HANDS_BLOCKED))
		adjusted_climb_time *= 2
	if(HAS_TRAIT(user, TRAIT_FREERUNNING))
		adjusted_climb_time *= 0.8
	structureclimber = user
	if(do_mob(user, user, adjusted_climb_time))
		if(src.loc)
			if(do_climb(user))
				user.visible_message("<span class='warning'>[user] weaves through [src].</span>", \
									"<span class='notice'>You weave through [src].</span>")
				log_combat(user, src, "weaves through")
				. = 1
			else
				to_chat(user, "<span class='warning'>You fail to weave through [src].</span>")
	structureclimber = null

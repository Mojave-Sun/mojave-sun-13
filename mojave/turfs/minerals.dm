/turf/closed/mineral/random/ms13
	icon = 'mojave/icons/turf/walls/mineral.dmi'
	smooth_icon = 'mojave/icons/turf/walls/mineral.dmi'
	icon_state = "mineral-0"
	base_icon_state = "mineral"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_MINERALS)
	canSmoothWith= list(SMOOTH_GROUP_MS13_MINERALS)
	baseturfs = /turf/open/floor/plating/ms13/ground/mountain
	turf_type = /turf/open/floor/plating/ms13/ground/mountain
	environment_type = "waste"
	mineralSpawnChanceList = list(/obj/item/stack/ore/uranium = 5, /obj/item/stack/ore/diamond = 1, /obj/item/stack/ore/gold = 10,
		/obj/item/stack/ore/silver = 12, /obj/item/stack/ore/plasma = 20, /obj/item/stack/ore/iron = 40, /obj/item/stack/ore/titanium = 11)

/turf/closed/mineral/random/ms13/Initialize()
	. = ..()
	pixel_x = 4
	pixel_y = 4 //To offset a pixel shift done on /turf/closed/mineral

/turf/closed/mineral/random/ms13/drought
	icon = 'mojave/icons/turf/walls/mineral_drought.dmi'
	smooth_icon = 'mojave/icons/turf/walls/mineral_drought.dmi'

/turf/closed/indestructible/rock/ms13
	name = "dense rock"
	desc = "An extremely densely-packed rock, most mining tools or explosives would never get through this."
	icon = 'mojave/icons/turf/walls/indestructible_rock.dmi'
	icon_state = "indestructible_rock-0"
	base_icon_state = "indestructible_rock"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_MINERALS)
	canSmoothWith= list(SMOOTH_GROUP_MS13_MINERALS)
	layer = EDGED_TURF_LAYER //Remove this is tall walls or overlays end up not being used.

/turf/closed/indestructible/rock/ms13/drought
	icon = 'mojave/icons/turf/walls/indestructible_rock_drought.dmi'

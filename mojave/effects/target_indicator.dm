#define SMOOTH_GROUP_TARGET_INDICATOR S_OBJ(400)

/obj/effect/temp_visual/ms13/target_indicator
	name = "generic warning indicator"
	desc = "Do you even have the time to spare looking at this?"
	icon = 'mojave/icons/effects/target_indicator.dmi'
	icon_state = "target_indicator-0"
	base_icon_state = "target_indicator"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_TARGET_INDICATOR)
	canSmoothWith = list(SMOOTH_GROUP_TARGET_INDICATOR)
	layer = FLY_LAYER
	plane = ABOVE_GAME_PLANE
	duration = 5 //0.5 SECONDS

/obj/effect/temp_visual/ms13/target_indicator/Initialize(mapload)
	. = ..()
	if(smoothing_flags & (SMOOTH_BITMASK))
		QUEUE_SMOOTH_NEIGHBORS(src)
		QUEUE_SMOOTH(src)

/obj/effect/temp_visual/ms13/target_indicator/Destroy()
	if(smoothing_flags & (SMOOTH_BITMASK))
		QUEUE_SMOOTH_NEIGHBORS(src)
	return ..()

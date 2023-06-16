/////////////////////////////////////////////////////////////
///////////////////// MOJAVE SUN FLOORS /////////////////////
/////////////////////////////////////////////////////////////

////Wood floors////

/turf/open/floor/wood/ms13
	icon = 'mojave/icons/turf/floors.dmi'
	icon_state = "wood tiles"
	desc = "Wooden flooring."
	smoothing_groups = list(SMOOTH_GROUP_MS13_TILE)
	baseturfs = /turf/baseturf_bottom //No lattices please
	var/has_alternate_states = TRUE //for damage, alts etc.
	var/alternate_states = 1
	var/has_base_states = TRUE //for starting variety (mainly wood)
	var/base_states = 2

/turf/open/floor/wood/ms13/Initialize()
	. = ..()
	if(has_alternate_states)
		if(prob(25))
			icon_state = "[icon_state]_[rand(1,(alternate_states))]"
		else if(has_base_states && prob(80))
			icon_state = "[icon_state][rand(1,(base_states))]"

/turf/open/floor/wood/ms13/burn_tile()
	burnt = 1
	return //We lack sprites for this. To do: make overlay here instead.

/turf/open/floor/wood/ms13/break_tile()
	broken = 1
	return

/turf/open/floor/wood/ms13/crowbar_act(mob/living/user, obj/item/I)
	return FALSE

/turf/open/floor/wood/ms13/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/wood/screwdriver_act(mob/living/user, obj/item/I)
	return

/turf/open/floor/wood/ms13/common
	icon_state = "wood_common"
	alternate_states = 6

/turf/open/floor/wood/ms13/fancy
	icon_state = "wood_fancy"
	alternate_states = 6
	has_base_states = FALSE

/turf/open/floor/wood/ms13/wide
	icon_state = "wood_wide"
	alternate_states = 6

/turf/open/floor/wood/ms13/mosaic
	icon_state = "wood_mosaic"
	alternate_states = 6

////Broken Wood/Foundation floors////

/obj/structure/ms13/foundation
	name = "floor"
	icon = 'mojave/icons/turf/floors.dmi'
	icon_state = "wood_foundation"
	desc = "Exposed wooden foundation."
	density = FALSE
	anchored = TRUE
	armor = list(MELEE = 50, BULLET = 50, LASER = 0, ENERGY = 0, BOMB = 50, BIO = 0, FIRE = 80, ACID = 50)
	max_integrity = 300
	obj_flags = CAN_BE_HIT | BLOCK_Z_OUT_DOWN | BLOCK_Z_IN_UP
	smoothing_groups = list(SMOOTH_GROUP_MS13_TILE)
	layer = TURF_LAYER
	plane = FLOOR_PLANE

/obj/structure/ms13/foundation/Initialize(mapload)
	. = ..()
	var/static/list/bad_initialize = list(INITIALIZE_HINT_QDEL, INITIALIZE_HINT_QDEL_FORCE)
	if(!(. in bad_initialize))
		AddComponent(/datum/component/footstep_changer, FOOTSTEP_WOOD)

/obj/structure/ms13/foundation/variantone
	icon_state = "wood_foundation_broken_1"

/obj/structure/ms13/foundation/varianttwo
	icon_state = "wood_foundation_broken_2"

/obj/structure/ms13/foundation/variantthree
	icon_state = "wood_foundation_broken_3"

/obj/structure/ms13/foundation/variantfour
	icon_state = "wood_foundation_broken_4"

/obj/structure/ms13/foundation/variantfive
	icon_state = "wood_foundation_broken_5"

/obj/structure/ms13/foundation/variantsix
	icon_state = "wood_foundation_broken_6"

/obj/structure/ms13/foundation/common/variantone
	icon_state = "wood_common_broken_1"

/obj/structure/ms13/foundation/common/varianttwo
	icon_state = "wood_common_broken_2"

/obj/structure/ms13/foundation/common/variantthree
	icon_state = "wood_common_broken_3"

/obj/structure/ms13/foundation/common/variantfour
	icon_state = "wood_common_broken_4"

/obj/structure/ms13/foundation/common/variantfive
	icon_state = "wood_common_broken_5"

/obj/structure/ms13/foundation/common/variantsix
	icon_state = "wood_common_broken_6"

/obj/structure/ms13/foundation/fancy/variantone
	icon_state = "wood_fancy_broken_1"

/obj/structure/ms13/foundation/fancy/varianttwo
	icon_state = "wood_fancy_broken_2"

/obj/structure/ms13/foundation/fancy/variantthree
	icon_state = "wood_fancy_broken_3"

/obj/structure/ms13/foundation/fancy/variantfour
	icon_state = "wood_fancy_broken_4"

/obj/structure/ms13/foundation/fancy/variantfive
	icon_state = "wood_fancy_broken_5"

/obj/structure/ms13/foundation/fancy/variantsix
	icon_state = "wood_fancy_broken_6"

/obj/structure/ms13/foundation/wide/variantone
	icon_state = "wood_wide_broken_1"

/obj/structure/ms13/foundation/wide/varianttwo
	icon_state = "wood_wide_broken_2"

/obj/structure/ms13/foundation/wide/variantthree
	icon_state = "wood_wide_broken_3"

/obj/structure/ms13/foundation/wide/variantfour
	icon_state = "wood_wide_broken_4"

/obj/structure/ms13/foundation/wide/variantfive
	icon_state = "wood_wide_broken_5"

/obj/structure/ms13/foundation/wide/variantsix
	icon_state = "wood_wide_broken_6"

/obj/structure/ms13/foundation/mosaic/variantone
	icon_state = "wood_mosaic_broken_1"

/obj/structure/ms13/foundation/mosaic/varianttwo
	icon_state = "wood_mosaic_broken_2"

/obj/structure/ms13/foundation/mosaic/variantthree
	icon_state = "wood_mosaic_broken_3"

/obj/structure/ms13/foundation/mosaic/variantfour
	icon_state = "wood_mosaic_broken_4"

/obj/structure/ms13/foundation/mosaic/variantfive
	icon_state = "wood_mosaic_broken_5"

/obj/structure/ms13/foundation/mosaic/variantsix
	icon_state = "wood_mosaic_broken_6"

////Carpet floors////

/turf/open/floor/wood/ms13/carpet
	name = "carpet"
	desc = "carpeted wooden flooring."
	icon = 'mojave/icons/turf/carpet_red.dmi'
	icon_state = "carpet-255"
	base_icon_state = "carpet"
	footstep = FOOTSTEP_CARPET
	barefootstep = FOOTSTEP_CARPET_BAREFOOT
	clawfootstep = FOOTSTEP_CARPET_BAREFOOT
	has_alternate_states = FALSE
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_MS13_CARPET_RED, SMOOTH_GROUP_MS13_TILE)
	canSmoothWith = list(SMOOTH_GROUP_MS13_CARPET_RED)
	flags_1 = NONE
	bullet_bounce_sound = null
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	has_base_states = FALSE

/turf/open/floor/wood/ms13/carpet/blue
	icon = 'mojave/icons/turf/carpet_blue.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_MS13_CARPET_BLUE)
	canSmoothWith = list(SMOOTH_GROUP_MS13_CARPET_BLUE)

/turf/open/floor/wood/ms13/carpet/green
	icon = 'mojave/icons/turf/carpet_green.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN,SMOOTH_GROUP_MS13_CARPET_GREEN)
	canSmoothWith = list(SMOOTH_GROUP_MS13_CARPET_GREEN)

/turf/open/floor/wood/ms13/carpet/violet
	icon = 'mojave/icons/turf/carpet_violet.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN,SMOOTH_GROUP_MS13_CARPET_VIOLET)
	canSmoothWith = list(SMOOTH_GROUP_MS13_CARPET_VIOLET)

/turf/open/floor/wood/ms13/carpet/shaggy
	icon = 'mojave/icons/turf/carpet_shaggy_red.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN,SMOOTH_GROUP_MS13_CARPET_SHAGGY_RED)
	canSmoothWith = list(SMOOTH_GROUP_MS13_CARPET_SHAGGY_RED)

/turf/open/floor/wood/ms13/carpet/shaggy/blue
	icon = 'mojave/icons/turf/carpet_shaggy_blue.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN,SMOOTH_GROUP_MS13_CARPET_SHAGGY_BLUE)
	canSmoothWith = list(SMOOTH_GROUP_MS13_CARPET_SHAGGY_BLUE)

/turf/open/floor/wood/ms13/carpet/shaggy/green
	icon = 'mojave/icons/turf/carpet_shaggy_green.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN,SMOOTH_GROUP_MS13_CARPET_SHAGGY_GREEN)
	canSmoothWith = list(SMOOTH_GROUP_MS13_CARPET_SHAGGY_GREEN)

/turf/open/floor/wood/ms13/carpet/shaggy/violet
	icon = 'mojave/icons/turf/carpet_shaggy_violet.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN,SMOOTH_GROUP_MS13_CARPET_SHAGGY_VIOLET)
	canSmoothWith = list(SMOOTH_GROUP_MS13_CARPET_SHAGGY_VIOLET)

////Tiled Floors////

/obj/item/stack/tile/ms13 //We need this because upstream turf code is not great.
	turf_type = /turf/open/floor/ms13
	merge_type = /obj/item/stack/tile/ms13

/turf/open/floor/ms13
	desc = "Tiled flooring."
	icon = 'mojave/icons/turf/floors.dmi'
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/ms13
	smoothing_groups = list(SMOOTH_GROUP_MS13_TILE)
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	var/has_alternate_states = FALSE
	var/alternate_states

/turf/open/floor/ms13/burn_tile()
	burnt = 1
	return //We're not spriting damage variations for the millions of tiles we have. To do: make overlay here instead.

/turf/open/floor/ms13/break_tile()
	broken = 1
	return

/turf/open/floor/ms13/crowbar_act(mob/living/user, obj/item/I)
	return FALSE

/turf/open/floor/ms13/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return
/*
/turf/open/floor/ms13/Initialize()
	. = ..()
	if(has_alternate_states)
		if(prob(45))
			icon_state = "[icon_state]_[rand(1,(alternate_states))]" */

/turf/open/floor/ms13/tile
	icon_state = "grey"
	has_alternate_states = TRUE
	alternate_states = 8

/turf/open/floor/ms13/tile/long
	icon_state = "grey_long"
	alternate_states = 6

/turf/open/floor/ms13/tile/blue
	icon_state = "blue"

/turf/open/floor/ms13/tile/blue/long
	icon_state = "blue_long"
	alternate_states = 6

/turf/open/floor/ms13/tile/navy
	icon_state = "navy"
	alternate_states = 7

/turf/open/floor/ms13/tile/brown
	icon_state = "brown"

/turf/open/floor/ms13/tile/brown/big
	icon_state = "brown_big"
	has_alternate_states = FALSE

/turf/open/floor/ms13/tile/fancy
	icon_state = "fancy"
	alternate_states = 7

/turf/open/floor/ms13/tile/large
	icon_state = "tiled tiles"

/turf/open/floor/ms13/tile/large/navy
	icon_state = "navy_large"
	alternate_states = 3

/turf/open/floor/ms13/tile/large/cream
	icon_state = "cream_large"
	has_alternate_states = FALSE

/turf/open/floor/ms13/tile/large/black
	icon_state = "black_large"
	alternate_states = 3

/turf/open/floor/ms13/tile/large/white
	icon_state = "white_large"
	alternate_states = 3

/turf/open/floor/ms13/tile/large/green
	icon_state = "green_large"
	alternate_states = 3

/turf/open/floor/ms13/tile/large/checkered
	icon_state = "checker_large"
	alternate_states = 3

/turf/open/floor/ms13/tile/large/cafeteria
	icon_state = "cafe_large"
	alternate_states = 3

/turf/open/floor/ms13/tile/full
	icon_state = "tiled tiles"
	has_alternate_states = FALSE

/turf/open/floor/ms13/tile/full/navy
	icon_state = "navy_full"

/turf/open/floor/ms13/tile/full/green
	icon_state = "green_full"

////Metal Floors////

/turf/open/floor/ms13/metal
	footstep = FOOTSTEP_PLATING //clonk
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	icon_state = "steel_industrial"
	desc = "Metal flooring."
	smoothing_groups = list(SMOOTH_GROUP_MS13_TILE)

/turf/open/floor/ms13/metal/plate
	icon_state = "steel_solid"
	has_alternate_states = TRUE
	alternate_states = 3

/turf/open/floor/ms13/metal/border
	icon_state = "steel_industrial_b"

/turf/open/floor/ms13/metal/border/corner
	icon_state = "steel_industrial_b_corner"

/turf/open/floor/ms13/metal/border/sides
	icon_state = "steel_industrial_b_sides"

/turf/open/floor/ms13/metal/border/end
	icon_state = "steel_industrial_b_end"

/turf/open/floor/ms13/metal/grate
	icon_state = "steel_grate"

/turf/open/floor/ms13/metal/grate/alt
	icon_state = "steel_grate_alt"

/turf/open/floor/ms13/metal/grate/border
	icon_state = "steel_grate_border"

/turf/open/floor/ms13/metal/grate/border/warning
	icon_state = "steel_grate_warning"

/turf/open/floor/ms13/metal/warning
	icon_state = "steel_warning"

/turf/open/floor/ms13/metal/stayclear
	icon_state = "steel_stayclear"

/turf/open/floor/ms13/metal/walkway
	icon_state = "steel_walkway"

/turf/open/floor/ms13/metal/walkway/corner
	icon_state = "steel_walkway_corner"

/turf/open/floor/ms13/metal/walkway/end
	icon_state = "steel_walkway_end"

////Concrete Floors////

/turf/open/floor/ms13/concrete
	icon_state = "concrete_big"
	desc = "Concrete slabs."
	smoothing_groups = list(SMOOTH_GROUP_MS13_TILE)

/turf/open/floor/ms13/concrete/small
	icon_state = "concrete_small"
	has_alternate_states = TRUE
	alternate_states = 5

/turf/open/floor/ms13/concrete/bricks
	icon_state = "concrete_bricks"
	has_alternate_states = TRUE
	alternate_states = 8

/turf/open/floor/ms13/concrete/industrial
	icon_state = "concrete_industrial"
	desc = "Heavy duty concrete slabs." //DAS CONCRETE BABY

/turf/open/floor/ms13/concrete/industrial/alt
	icon_state = "concrete_industrial_alt"

/turf/open/floor/ms13/concrete/industrial/split
	icon_state = "concrete_industrial_split"

/turf/open/floor/ms13/concrete/industrial/walkway
	icon_state = "concrete_walkway"

/turf/open/floor/ms13/concrete/industrial/walkway/corner
	icon_state = "concrete_walkway_corner"

/turf/open/floor/ms13/concrete/industrial/walkway/end
	icon_state = "concrete_walkway_end"

////Hybrid Floors////

/turf/open/floor/ms13/concrete/cable
	icon_state = "concrete_cable_straight"
	desc = "Heavy duty cabling embedded in industrial grade concrete."

/turf/open/floor/ms13/concrete/cable/curved
	icon_state = "concrete_cable_curve"

/turf/open/floor/ms13/concrete/cable/merge
	icon_state = "concrete_cable_merge"

/turf/open/floor/ms13/concrete/cable/intersection
	icon_state = "concrete_cable_intersection"

/turf/open/floor/ms13/concrete/cable/box
	icon_state = "concrete_cable_box"

/turf/open/floor/ms13/concrete/cable/node
	icon_state = "concrete_cable_node"

/turf/open/floor/ms13/sewer
	icon = 'mojave/icons/turf/sewer_floor.dmi'
	icon_state = "floor-255"
	base_icon_state = "floor"
	desc = "Hard concrete sewer flooring, built to last."
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_TILE)
	canSmoothWith = list(SMOOTH_GROUP_CATWALK, SMOOTH_GROUP_MS13_WALL, SMOOTH_GROUP_CATWALK, SMOOTH_GROUP_MS13_TILE)

////Ceramic Floors////

/turf/open/floor/ms13/ceramic
	icon_state = "ceramic"
	desc = "Ceramic tiles."
	has_alternate_states = TRUE
	alternate_states = 2
	footstep = FOOTSTEP_FLOOR
	smoothing_groups = list(SMOOTH_GROUP_MS13_TILE)

/turf/open/floor/ms13/ceramic/ornate
	icon_state = "ornate"
	alternate_states = 3

/turf/open/floor/ms13/ceramic/sierra
	icon_state = "sierra"
	alternate_states = 3

////Brick Floors////

/turf/open/floor/ms13/brick
	icon_state = "brick"
	desc = "Brick flooring."
	has_alternate_states = TRUE
	alternate_states = 8
	footstep = FOOTSTEP_FLOOR
	smoothing_groups = list(SMOOTH_GROUP_MS13_TILE)

////Pipe Floors////

/turf/open/floor/ms13/metal/pipe
	icon_state = "pipe_straight"

/turf/open/floor/ms13/metal/pipe/Entered(mob/living/M)
	. = ..()
	if(!istype(M))
		return

	for(var/obj/structure/lattice/catwalk/C in get_turf(M))
		return

	if(prob(30) && M.m_intent == MOVE_INTENT_RUN && M.body_position != LYING_DOWN)
		M.slip(5, M.loc, GALOSHES_DONT_HELP, 0, FALSE)
		playsound(M, 'sound/effects/bang.ogg', 10, 1)
		to_chat(usr, "<span class='warning'>You trip on the pipes!</span>")
		return

/turf/open/floor/ms13/metal/pipe/corner
	icon_state = "pipe_corner"

/turf/open/floor/ms13/metal/pipe/intersection
	icon_state = "pipe_intersection"

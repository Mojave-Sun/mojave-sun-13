#define WALL_SMOOTHING SMOOTH_GROUP_MS13_SIDEWALK, SMOOTH_GROUP_MS13_WALL, SMOOTH_GROUP_MS13_WALL_METAL, SMOOTH_GROUP_MS13_WALL_WOOD, SMOOTH_GROUP_MS13_WALL_SCRAP, SMOOTH_GROUP_MS13_LOW_WALL,SMOOTH_GROUP_MS13_WALL_ADOBE, SMOOTH_GROUP_MS13_WALL_BRICK, SMOOTH_GROUP_MS13_WALL_REINFORCED, SMOOTH_GROUP_MS13_WINDOW, SMOOTH_GROUP_MS13_MINERALS
#define GRASS_SPONTANEOUS 		2
#define GRASS_WEIGHT 			2
#define LUSH_PLANT_SPAWN_LIST list(/obj/structure/flora/ms13/tree/tallpine = 7, /obj/structure/flora/ms13/tree/deadsnow = 5, /obj/structure/flora/ms13/tree/pine = 5, /obj/structure/flora/ms13/shrub = 5, /obj/structure/flora/bush = 5, /obj/structure/flora/ms13/forage = 1, /obj/structure/flora/ms13/forage/blackberry = 1, /obj/structure/flora/ms13/forage/mutfruit = 1, /obj/structure/flora/ms13/forage/ashrose = 1, /obj/structure/flora/ms13/forage/wildcarrot = 1, /obj/structure/flora/ms13/forage/aster = 1)
#define DESOLATE_PLANT_SPAWN_LIST list(/obj/structure/flora/grass/wasteland/snow = 10, /obj/structure/flora/bush = 1)
#define MUSHROOM_SPAWN_LIST list(/obj/structure/flora/ms13/forage/mushroom = 5, /obj/structure/flora/ms13/forage/mushroom/glowing = 1)
#define DESERT_LUSH_PLANT_SPAWN_LIST list(/obj/structure/flora/ms13/tree/joshua = 2, /obj/structure/flora/ms13/tree/cactus = 5)
#define DESERT_DESOLATE_PLANT_SPAWN_LIST list(/obj/structure/flora/grass/wasteland = 8)

/////////////////////////////////////////////////////////////
/////////////////// MOJAVE SUN PLATINGS /////////////////////
/////////////////////////////////////////////////////////////

//A plating that can't be destroyed but can have stuff like floor tiles slapped on for construction

////Ground Turfs////

/turf/open/floor/plating/ms13/ground
	name = "ground"
	desc = "Some really hard ground. Looks like you can't destroy this for sure."
	baseturfs = /turf/open/floor/plating/ms13/ground
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	attachment_holes = FALSE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/plating/ms13/ground/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/plating/ms13/ground/break_tile()
	return //unbreakable

/turf/open/floor/plating/ms13/ground/burn_tile()
	return //unburnable

/turf/open/floor/plating/ms13/ground/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

/turf/open/floor/plating/ms13/ground/MakeDry()
	return

/turf/open/floor/plating/ms13/ground/ex_act(severity, target)
	return

/turf/open/floor/plating/ms13/ground/desert
	name = "\proper desert"
	desc = "A stretch of desert."
	icon = 'mojave/icons/turf/ground.dmi'
	icon_state = "desert-255"
	base_icon_state = "desert"
	slowdown = 0.7 //Hard and very dry ground. Not as hard to walk on as sand
	baseturfs = /turf/open/floor/plating/ms13/ground/desert
	var/obj/structure/flora/turfPlant = null
	var/digResult = /obj/item/stack/ore/glass //Sounds like a whole lot of not my problem at this very second
	var/dug = FALSE
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_DESERT)
	canSmoothWith = list(SMOOTH_GROUP_MS13_DESERT)

/turf/open/floor/plating/ms13/ground/desert/Initialize()
	. = ..()
	//If no fences, machines (soil patches are machines), etc. try to plant grass
	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	if(prob(35))
		base_icon_state = "desert_alt_[rand(1,3)]"

/turf/open/floor/plating/ms13/ground/desert/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(!.)
		if(!digResult)
			return
		if(W.tool_behaviour == TOOL_SHOVEL || W.tool_behaviour == TOOL_MINING)
			if(dug)
				to_chat(user, "<span class='notice'>Looks like someone has dug here already.</span>")
				return TRUE

			if(!isturf(user.loc))
				return

			to_chat(user, "<span class='notice'>You start digging...</span>")

			if(W.use_tool(src, user, 40, volume=50))
				to_chat(user, "<span class='notice'>You dig a hole.</span>")
				getDug()
				SSblackbox.record_feedback("tally", "pick_used_mining", 1, W.type)
				return TRUE
		else if(istype(W, /obj/item/storage/bag/ore))
			for(var/obj/item/stack/ore/O in src)
				SEND_SIGNAL(W, COMSIG_PARENT_ATTACKBY, O)

/turf/open/floor/plating/ms13/ground/desert/proc/getDug()
	new digResult(src, 5)
	icon_state = "[icon_state]_dug"
	dug = TRUE

//Pass PlantForce for admin stuff I guess?
/turf/open/floor/plating/ms13/ground/desert/proc/plantGrass(Plantforce = FALSE)
	var/Weight = 0
	var/randPlant = null

	//spontaneously spawn grass
	if(Plantforce || prob(GRASS_SPONTANEOUS))
		randPlant = pickweight(DESERT_LUSH_PLANT_SPAWN_LIST) //Create a new grass object at this location, and assign var
		turfPlant = new randPlant(src)
		. = TRUE //in case we ever need this to return if we spawned
		return .

	//loop through neighbouring desert turfs, if they have grass, then increase weight
	for(var/turf/open/floor/plating/ms13/ground/desert/T in RANGE_TURFS(2, src))
		if(T.turfPlant)
			Weight += GRASS_WEIGHT

	//use weight to try to spawn grass
	if(prob(Weight))

		//If surrounded on 5+ sides, pick from lush
		if(Weight == (2 * GRASS_WEIGHT))
			randPlant = pickweight(DESERT_LUSH_PLANT_SPAWN_LIST)
		else
			randPlant = pickweight(DESERT_DESOLATE_PLANT_SPAWN_LIST)
		turfPlant = new randPlant(src)
		. = TRUE

//Make sure we delete the plant if we ever change turfs
/turf/open/floor/plating/ms13/ground/desert/ChangeTurf(path, new_baseturf, flags)
	if(turfPlant)
		qdel(turfPlant)
	. =  ..()

#define SHROOM_SPAWN	1

/turf/open/floor/plating/ms13/ground/snow
	name = "snow"
	desc = "Fresh powder."
	baseturfs = /turf/open/floor/plating/ms13/ground/snow
	icon_state = "snow"
	icon = 'icons/turf/snow.dmi'
	slowdown = 1
	var/obj/structure/flora/turfPlant = null
	var/digResult = /obj/item/stack/sheet/mineral/snow
	var/dug = FALSE
	var/area/curr_area = null

/turf/open/floor/plating/ms13/ground/snow/Initialize()
    . = ..()
    icon_state = "snow[rand(1,12)]"
    curr_area = get_area(src)
    if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src) || (locate(/obj/structure/flora) in src)))
        plant_grass()

/turf/open/floor/plating/ms13/ground/snow/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(!.)
		if(!digResult)
			return
		if(W.tool_behaviour == TOOL_SHOVEL || W.tool_behaviour == TOOL_MINING)
			if(dug)
				to_chat(user, "<span class='notice'>Looks like someone has dug here already.</span>")
				return TRUE

			if(!isturf(user.loc))
				return

			to_chat(user, "<span class='notice'>You start digging...</span>")

			if(W.use_tool(src, user, 40, volume=50))
				to_chat(user, "<span class='notice'>You dig a hole.</span>")
				getDug()
				SSblackbox.record_feedback("tally", "pick_used_mining", 1, W.type)
				return TRUE
		else if(istype(W, /obj/item/storage/bag/ore))
			for(var/obj/item/stack/ore/O in src)
				SEND_SIGNAL(W, COMSIG_PARENT_ATTACKBY, O)

/turf/open/floor/plating/ms13/ground/snow/proc/getDug()
	new digResult(src, 5)
	icon_state = "[icon_state]_dug"
	dug = TRUE

/turf/open/floor/plating/ms13/ground/snow/proc/plant_grass(Plantforce = FALSE)
	var/Weight = 0
	var/randPlant = null

	if(Plantforce || prob(GRASS_SPONTANEOUS))
		randPlant = pickweight(DESOLATE_PLANT_SPAWN_LIST)
		turfPlant = new randPlant(src)
		. = TRUE
		return .

	for(var/turf/open/floor/plating/ms13/ground/snow/T in RANGE_TURFS(2, src))
		if(T.turfPlant)
			Weight += GRASS_WEIGHT

		if(istype(curr_area, /area/ms13/snow/deepforest))
			if(prob(40))
				randPlant = pickweight(LUSH_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			else if(prob(20))
				randPlant = pickweight(DESOLATE_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			. = TRUE
			return .
		if(istype(curr_area, /area/ms13/snow/forest))
			if(prob(20))
				randPlant = pickweight(LUSH_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			else if(prob(10))
				randPlant = pickweight(DESOLATE_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			. = TRUE
			return .
		if(istype(curr_area, /area/ms13/snow/lightforest))
			if(prob(5))
				randPlant = pickweight(LUSH_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			else if(prob(10))
				randPlant = pickweight(DESOLATE_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			. = TRUE
			return .
		if(istype(curr_area, /area/ms13/desert))
			if(prob(5))
				randPlant = pickweight(DESERT_LUSH_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			else if(prob(10))
				randPlant = pickweight(DESERT_DESOLATE_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			. = TRUE
			return .
		else
			if(prob(Weight))
				if(Weight == (20 * GRASS_WEIGHT))
					randPlant = pickweight(DESOLATE_PLANT_SPAWN_LIST)
					turfPlant = new randPlant(src)
					. = TRUE
					return .

/turf/open/floor/plating/ms13/ground/snow/ChangeTurf(path, new_baseturf, flags)
	if(turfPlant)
		qdel(turfPlant)
	. =  ..()

/turf/open/floor/plating/ms13/ground/mountain
	name = "mountain"
	desc = "Damp cave flooring."
	baseturfs = /turf/open/floor/plating/ms13/ground/mountain
	icon = 'mojave/icons/turf/mining.dmi'
	icon_state = "rockfloor1"
	var/obj/structure/flora/turfPlant = null
	slowdown = 1

/turf/open/floor/plating/ms13/ground/mountain/Initialize()
	. = ..()
	icon_state = "rockfloor[rand(1,2)]"
	//If no fences, machines, etc. try to plant mushrooms
	if(!(\
			(locate(/obj/structure) in src) || \
			(locate(/obj/machinery) in src) ))
		plantShrooms()

/turf/open/floor/plating/ms13/ground/mountain/proc/plantShrooms()
	if(prob(SHROOM_SPAWN))
		turfPlant = pickweight(MUSHROOM_SPAWN_LIST)
		. = TRUE //in case we ever need this to return if we spawned
		return .

/turf/open/floor/plating/ms13/ground/dirt
	name = "dirt"
	desc = "Upon closer examination, it's still dirt."
	baseturfs = /turf/open/floor/plating/ms13/ground/dirt
	icon = 'icons/turf/floors.dmi'
	icon_state = "dirt"
	slowdown = 0.5
////Roads////

/turf/open/floor/plating/ms13/ground/road
	name = "\proper road"
	desc = "A stretch of road."
	icon = 'mojave/icons/turf/road.dmi'
	icon_state = "road-255"
	base_icon_state = "road"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_ROAD)
	canSmoothWith = list(SMOOTH_GROUP_MS13_ROAD)

/turf/open/floor/plating/ms13/ground/road/Initialize()
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_icon), 1)

/turf/open/floor/plating/ms13/ground/road/update_icon()
	. = ..() //Inheritance required for road decals
	var/crack_randomiser = "crack_[rand(1,18)]"
	var/road_randomiser = "rand(-10,10)"
	var/direction_randomiser = "rand(0,8)"
	if(prob(20))
		add_overlay(image('mojave/icons/turf/road.dmi', crack_randomiser, FLOAT_LAYER, direction_randomiser, road_randomiser, road_randomiser))

////Sidewalks////

/turf/open/floor/plating/ms13/ground/sidewalk
	name = "sidewalk"
	desc = "Paved tiles specifically designed for walking upon."
	icon = 'mojave/icons/turf/sidewalk.dmi'
	icon_state = "sidewalk-255"
	base_icon_state = "sidewalk"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_SIDEWALK)
	canSmoothWith = list(SMOOTH_GROUP_MS13_SIDEWALK, WALL_SMOOTHING, SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_MS13_DESERT)

/turf/open/floor/plating/ms13/ground/sidewalk/Initialize()
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_icon), 1)

/turf/open/floor/plating/ms13/ground/sidewalk/update_icon()
	. = ..()
	add_overlay(image('mojave/icons/turf/curb.dmi', icon_state, FLOAT_LAYER))
	if(prob(20))
		icon_state = "crack_[rand(1,11)]"
		dir = rand(0,8)

/turf/open/floor/plating/ms13/ground/sidewalk/cracked
	icon_state = "crack_3"

/turf/open/floor/plating/ms13/ground/sidewalk/cracked/Initialize()
	. = ..()
	icon_state = "crack_[rand(1,11)]"

////Roofing////

/turf/open/floor/plating/ms13/roof
	name = "roof"
	desc = "Old roofing."
	icon = 'mojave/icons/turf/roof_asphalt.dmi'
	icon_state = "roof-255"
	base_icon_state = "roof"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_MS13_ROOF_NORMAL)
	canSmoothWith = list(SMOOTH_GROUP_MS13_ROOF_NORMAL, WALL_SMOOTHING)

/turf/open/floor/plating/ms13/roof/noborder //for holes and stuff
	icon = 'mojave/icons/turf/roof_asphalt_noborder.dmi'

/turf/open/floor/plating/ms13/roof/sheet
	icon = 'mojave/icons/turf/roof_sheet.dmi'
	smoothing_groups = list(SMOOTH_GROUP_MS13_ROOF_SHEET, SMOOTH_GROUP_MS13_ROOF_SHEET)
	canSmoothWith = list(SMOOTH_GROUP_MS13_ROOF_SHEET, WALL_SMOOTHING)

/turf/open/floor/plating/ms13/roof/sheet/noborder //for holes and stuff
	icon = 'mojave/icons/turf/roof_sheet_noborder.dmi'

/turf/open/floor/plating/ms13/roof/metal
	icon = 'mojave/icons/turf/roof_metal.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_MS13_ROOF_METAL)
	canSmoothWith = list(SMOOTH_GROUP_MS13_ROOF_METAL, WALL_SMOOTHING)

/turf/open/floor/plating/ms13/roof/metal/rusty
	icon = 'mojave/icons/turf/roof_rusty.dmi'

/turf/open/floor/plating/ms13/roof/wood
	icon = 'mojave/icons/turf/roof_wood.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_MS13_ROOF_WOOD)
	canSmoothWith = list(SMOOTH_GROUP_MS13_ROOF_WOOD, WALL_SMOOTHING)

////Ice////

/turf/open/floor/plating/ms13/ice
	name = "ice sheet"
	desc = "A sheet of solid ice. Looks slippery. Tread Carefully."
	icon = 'mojave/icons/turf/ice.dmi'
	icon_state = "ice"
	baseturfs = /turf/open/floor/plating/ms13/ice
	slowdown = 1
	attachment_holes = FALSE
	bullet_sizzle = TRUE
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	var/static/mutable_appearance/crack = mutable_appearance('mojave/icons/turf/ice.dmi', "crack")
	var/static/mutable_appearance/holehole = mutable_appearance('mojave/icons/turf/ice.dmi', "hole_overlay")
	var/cracked = FALSE
	var/hole = FALSE

/turf/open/floor/plating/ms13/ice/attackby(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/plating/ms13/ice/break_tile()
	return //unbreakable

/turf/open/floor/plating/ms13/ice/burn_tile()
	return //unburnable

/turf/open/floor/plating/ms13/ice/ex_act(severity, target)
	return

/turf/open/floor/plating/ms13/ice/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(W.tool_behaviour == TOOL_SHOVEL || W.tool_behaviour == TOOL_MINING)
		if(hole)
			to_chat(user, "<span class='notice'>The ice is completely dug through.</span>")
			return TRUE

		if(!isturf(user.loc))
			return

		to_chat(user, "<span class='notice'>You start picking at the ice...</span>")

		playsound(get_turf(src), 'mojave/sound/ms13effects/icebreak.ogg', 100, FALSE, FALSE)

		if(W.use_tool(src, user, 100, volume=0))
			if(!cracked)
				add_overlay(crack)
				to_chat(user, "<span class='notice'>You crack the ice, loosening it.</span>")
				cracked = TRUE
			else
				if(cracked)
					cut_overlay(crack)
					add_overlay(holehole)
					density = TRUE
					to_chat(user, "<span class='notice'>You crack the ice, making a hole to the waters below.</span>")
					hole = TRUE
					return

/turf/open/floor/plating/ms13/ice/Initialize()
	. = ..()
	MakeSlippery(TURF_WET_PERMAFROST, INFINITY, 0, INFINITY, TRUE)

/turf/open/floor/plating/ms13/ice/innercorner
	icon_state = "inner_corner"

/turf/open/floor/plating/ms13/ice/innercurve
	icon_state = "inner_curve_large"

/turf/open/floor/plating/ms13/ice/corner
	icon_state = "corner"

/turf/open/floor/plating/ms13/ice/edge
	icon_state = "edge"

/turf/open/floor/plating/ms13/ice/smallcorner
	icon_state = "cornerpiece"

/turf/open/floor/plating/ms13/ice/end
	icon_state = "end"

/turf/open/floor/plating/ms13/ice/thin
	icon_state = "thin"

/turf/open/floor/plating/ms13/ice/shrinkage
	icon_state = "shrinkage"

/turf/open/floor/plating/ms13/ice/shore
	icon_state = "shore"

/turf/open/floor/plating/ms13/ice/single
	icon_state = "junction0"

/turf/open/floor/plating/ms13/ice/tunnel
	icon_state = "tunnel"

/obj/structure/fluff/icechunk
	name = "ice chunk"
	desc = "A segment of broken ice."
	icon = 'mojave/icons/turf/ice.dmi'
	icon_state = "chunk"

//This functions like normal openspace but prevents placing lattice, so people cannot cheese catwalks or floors clear across the map.
/turf/open/openspace/ms13_no_build
	icon = 'mojave/icons/turf/ground.dmi'
	icon_state = "transparent" //Different icon so it's visually distinct for mappers.
	can_build_on = FALSE

/turf/open/openspace/ms13_no_build/Initialize()
	. = ..()
	icon = 'icons/turf/floors.dmi'
	icon_state = "transparent" //Reset to original icon so it doesn't darken things when viewed in game.


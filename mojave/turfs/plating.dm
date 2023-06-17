#define WALL_SMOOTHING SMOOTH_GROUP_MS13_SIDEWALK, SMOOTH_GROUP_MS13_WALL, SMOOTH_GROUP_MS13_WALL_METAL, SMOOTH_GROUP_MS13_WALL_WOOD, SMOOTH_GROUP_MS13_WALL_SCRAP, SMOOTH_GROUP_MS13_LOW_WALL,SMOOTH_GROUP_MS13_WALL_ADOBE, SMOOTH_GROUP_MS13_WALL_BRICK, SMOOTH_GROUP_MS13_WALL_REINFORCED, SMOOTH_GROUP_MS13_WINDOW, SMOOTH_GROUP_MS13_MINERALS
#define DESERT_SMOOTHING SMOOTH_GROUP_MS13_DESERT, SMOOTH_GROUP_MS13_SIDEWALK, SMOOTH_GROUP_MS13_TILE, SMOOTH_GROUP_MS13_SNOW, SMOOTH_GROUP_MS13_ROAD, SMOOTH_GROUP_MS13_WATER
#define GRASS_SPONTANEOUS 		2.5
#define GRASS_WEIGHT 			2.4
#define SHROOM_WEIGHT			5
#define LUSH_PLANT_SPAWN_LIST list(/obj/structure/flora/ms13/tree/tallpine/snow = 7, /obj/structure/flora/ms13/forage/xander = 1, /obj/structure/flora/ms13/forage/brocflower = 1, /obj/structure/flora/ms13/forage/tarberry = 1, /obj/structure/flora/ms13/forage/blackberry = 1, /obj/structure/flora/ms13/forage/mutfruit = 1, /obj/structure/flora/ms13/forage/ashrose = 1, /obj/structure/flora/ms13/forage/wildcarrot = 1, /obj/structure/flora/ms13/forage/aster = 1)
#define DESOLATE_PLANT_SPAWN_LIST list(/obj/structure/flora/grass/wasteland/snow = 10)
#define MUSHROOM_SPAWN_LIST list(/obj/structure/flora/ms13/forage/mushroom = 5, /obj/structure/flora/ms13/forage/mushroom/glowing = 5, /obj/structure/flora/ms13/forage/brainshroom = 1, /obj/structure/flora/ms13/forage/fireshroom = 1,/obj/structure/flora/ms13/forage/gutshroom = 1, /obj/structure/flora/ms13/forage/lure = 1, /obj/structure/flora/ms13/forage/nara= 1)
#define DESERT_LUSH_PLANT_SPAWN_LIST list(/obj/structure/flora/grass/wasteland = 2.5, /obj/structure/flora/ms13/tree/drought/dead = 2, /obj/structure/flora/ms13/cactus = 2.5, /obj/structure/flora/ms13/cactus/tall = 2.5, /obj/structure/flora/ms13/leafy = 2, /obj/structure/flora/ms13/forage/xander/drought = 1.5, /obj/structure/flora/ms13/forage/brocflower/drought = 1.5, /obj/structure/flora/ms13/forage/ashrose/drought = 1, /obj/structure/flora/ms13/forage/aster/drought = 1, /obj/structure/flora/ms13/forage/yucca = 1.5, /obj/structure/flora/ms13/forage/barrel_cactus = 2)
#define DESERT_DESOLATE_PLANT_SPAWN_LIST list(/obj/structure/flora/grass/wasteland = 6, /obj/structure/flora/ms13/leafy = 1, /obj/structure/flora/ms13/cactus = 1, /obj/structure/flora/ms13/cactus/tall = 1)

#define TURF_LAYER_SNOW 2.003
#define TURF_LAYER_SNOW_BORDER 2.2

#define TURF_LAYER_ROAD 2.002
#define TURF_LAYER_ROAD_BORDER 2.0021
#define TURF_LAYER_ROAD_DECAL 2.00201

#define TURF_LAYER_DESERT 2.001
#define TURF_LAYER_DESERT_BORDER 2.0011

#define TURF_LAYER_ICE 2.001 //if someone puts ice and desert together im going to blow their brains out
#define TURF_LAYER_ICE_BORDER 2.0011

#define TURF_LAYER_WATER 2
#define TURF_LAYER_MOB_WATER 1.95
#define TURF_LAYER_WATER_UNDER 1.94
#define TURF_LAYER_WATER_BASE 1.93

/////////////////////////////////////////////////////////////
/////////////////// MOJAVE SUN PLATINGS /////////////////////
/////////////////////////////////////////////////////////////

//A plating that can't be destroyed but can have stuff like floor tiles slapped on for construction

////Ground Turfs////

/turf/open/floor/plating/ms13/ReplaceWithLattice()
	return //No lattice please - this might break things

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
	//Used in spawning plants on turfs
	var/obj/structure/flora/turfPlant = null
	//Used for larger than 32x border icons
	var/border_icon

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

// /turf/open/floor/plating/ms13/ground/ex_act(severity, target)
// 	return

/turf/open/floor/plating/dirt/ms13
	baseturfs = /turf/open/floor/plating/ms13/ground
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	attachment_holes = FALSE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	slowdown = 0.5

/turf/open/floor/plating/ms13/ground/desert
	name = "\proper desert"
	desc = "A stretch of desert."
	icon = 'mojave/icons/turf/64x/drought_1.dmi'
	icon_state = "dirt-255"
	base_icon_state = "dirt"
	slowdown = 0.7 //Hard and very dry ground. Not as hard to walk on as sand
	baseturfs = /turf/open/floor/plating/ms13/ground/desert
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_DESERT)
	canSmoothWith = list(DESERT_SMOOTHING)
	layer = TURF_LAYER_DESERT
	var/digResult = /obj/item/stack/ore/glass //Sounds like a whole lot of not my problem at this very second
	var/dug = FALSE

/turf/open/floor/plating/ms13/ground/desert/Initialize()
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_icon), 1)
	//If no fences, machines (soil patches are machines), etc. try to plant grass
	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()

/turf/open/floor/plating/ms13/ground/desert/update_icon()
	. = ..()
	var/rand_icon = rand(1,3)
	switch(rand_icon)
		if(1)
			icon = 'mojave/icons/turf/64x/drought_1.dmi'
			border_icon = 'mojave/icons/turf/64x/drought_1_border.dmi'
		if(2)
			icon = 'mojave/icons/turf/64x/drought_2.dmi'
			border_icon = 'mojave/icons/turf/64x/drought_2_border.dmi'
		if(3)
			icon = 'mojave/icons/turf/64x/drought_3.dmi'
			border_icon = 'mojave/icons/turf/64x/drought_3_border.dmi'

	add_overlay(image(border_icon, icon_state, TURF_LAYER_DESERT_BORDER, pixel_x = -16, pixel_y = -16))
/*
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
*/
//Pass PlantForce for admin stuff I guess?
/turf/open/floor/plating/ms13/ground/proc/plantGrass(Plantforce = FALSE)
	var/Weight = 0
	var/randPlant = null

	//spontaneously spawn grass
	if(Plantforce || prob(GRASS_SPONTANEOUS))
		randPlant = pick_weight(DESERT_LUSH_PLANT_SPAWN_LIST) //Create a new grass object at this location, and assign var
		turfPlant = new randPlant(src)
		. = TRUE //in case we ever need this to return if we spawned
		return .

	//loop through neighbouring desert turfs, if they have grass, then increase weight
	for(var/turf/open/floor/plating/ms13/ground/desert/T in RANGE_TURFS(2, src))
		if(T.turfPlant)
			Weight += GRASS_WEIGHT

	for(var/turf/open/floor/plating/ms13/ground/desertalt/T in RANGE_TURFS(2, src))
		if(T.turfPlant)
			Weight += GRASS_WEIGHT

	//use weight to try to spawn grass
	if(prob(Weight))

		//If surrounded on 5+ sides, pick from lush
		if(Weight == (2 * GRASS_WEIGHT))
			randPlant = pick_weight(DESERT_LUSH_PLANT_SPAWN_LIST)
		else
			randPlant = pick_weight(DESERT_DESOLATE_PLANT_SPAWN_LIST)
		turfPlant = new randPlant(src)
		. = TRUE

//Make sure we delete the plant if we ever change turfs
/turf/open/floor/plating/ms13/ground/desert/ChangeTurf(path, new_baseturf, flags)
	if(turfPlant)
		qdel(turfPlant)
	. =  ..()

/turf/open/floor/plating/ms13/ground/desertalt
	icon = 'mojave/icons/turf/ground.dmi'
	icon_state = "desert_1"
	baseturfs = /turf/open/floor/plating/ms13/ground/desertalt
	smoothing_groups = list(SMOOTH_GROUP_MS13_DESERT)
	canSmoothWith = list(SMOOTH_GROUP_MS13_DESERT)
	layer = TURF_LAYER

/turf/open/floor/plating/ms13/ground/desertalt/Initialize()
	. = ..()
	icon_state = "desert_[rand(1,3)]"

	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()

/turf/open/floor/plating/ms13/ground/snow
	name = "snow"
	desc = "Fresh powder."
	icon = 'mojave/icons/turf/64x/snow_1.dmi'
	icon_state = "snow-255"
	base_icon_state = "snow"
	slowdown = 1
	footstep = FOOTSTEP_SNOW
	baseturfs = /turf/open/floor/plating/ms13/ground/snow
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_SNOW)
	canSmoothWith = list(SMOOTH_GROUP_MS13_SNOW, SMOOTH_GROUP_MS13_TILE, SMOOTH_GROUP_MS13_WATER)
	layer = TURF_LAYER_SNOW
	var/digResult = /obj/item/stack/sheet/mineral/snow
	var/dug = FALSE
	var/area/curr_area = null

/turf/open/floor/plating/ms13/ground/snow/Initialize()
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_icon), 1)
	curr_area = get_area(src)
	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src) || (locate(/obj/structure/flora) in src)))
		plant_grass()

/turf/open/floor/plating/ms13/ground/snow/update_icon()
	. = ..()
	var/rand_icon = rand(1,3)
	switch(rand_icon)
		if(1)
			icon = 'mojave/icons/turf/64x/snow_1.dmi'
			border_icon = 'mojave/icons/turf/64x/snow_1_border.dmi'
		if(2)
			icon = 'mojave/icons/turf/64x/snow_2.dmi'
			border_icon = 'mojave/icons/turf/64x/snow_2_border.dmi'
		if(3)
			icon = 'mojave/icons/turf/64x/snow_3.dmi'
			border_icon = 'mojave/icons/turf/64x/snow_3_border.dmi'

	add_overlay(image(border_icon, icon_state, TURF_LAYER_SNOW_BORDER, pixel_x = -16, pixel_y = -16))

/turf/open/floor/plating/ms13/ground/snow/attackby(obj/item/W, mob/user, params)
	return
/*
/turf/open/floor/plating/ms13/ground/snow/attackby(obj/item/W, mob/user, params) Has to be fixed. Doesn't smooth out the spawned turf.
	. = ..()
	if(!.)
		if(!digResult)
			return
		if(W.tool_behaviour == TOOL_SHOVEL)
			if(dug)
				to_chat(user, span_notice("The snow is already dug and packed."))
				return TRUE

			if(!isturf(user.loc))
				return

			to_chat(user, span_notice("You start digging."))

			if(W.use_tool(src, user, 40, volume=50))
				to_chat(user, span_notice("You dig out a path."))
				getDug()
				return TRUE

/turf/open/floor/plating/ms13/ground/snow/proc/getDug()
	new /turf/open/floor/plating/ms13/ground/snow/dug(src) */

/turf/open/floor/plating/ms13/ground/snow/proc/plant_grass(Plantforce = FALSE)
	var/Weight = 0
	var/randPlant = null

	if(Plantforce || prob(GRASS_SPONTANEOUS))
		randPlant = pick_weight(DESOLATE_PLANT_SPAWN_LIST)
		turfPlant = new randPlant(src)
		. = TRUE
		return .

	for(var/turf/open/floor/plating/ms13/ground/snow/T in RANGE_TURFS(2, src))
		if(T.turfPlant)
			Weight += GRASS_WEIGHT

		if(istype(curr_area, /area/ms13/snow/deepforest))
			if(prob(40))
				randPlant = pick_weight(LUSH_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			else if(prob(20))
				randPlant = pick_weight(DESOLATE_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			. = TRUE
			return .
		if(istype(curr_area, /area/ms13/snow/forest))
			if(prob(20))
				randPlant = pick_weight(LUSH_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			else if(prob(10))
				randPlant = pick_weight(DESOLATE_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			. = TRUE
			return .
		if(istype(curr_area, /area/ms13/snow/lightforest))
			if(prob(5))
				randPlant = pick_weight(LUSH_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			else if(prob(10))
				randPlant = pick_weight(DESOLATE_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			. = TRUE
			return .
		if(istype(curr_area, /area/ms13/desert))
			if(prob(5))
				randPlant = pick_weight(DESERT_LUSH_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			else if(prob(10))
				randPlant = pick_weight(DESERT_DESOLATE_PLANT_SPAWN_LIST)
				turfPlant = new randPlant(src)
			. = TRUE
			return .
		else
			if(prob(Weight))
				if(Weight == (20 * GRASS_WEIGHT))
					randPlant = pick_weight(DESOLATE_PLANT_SPAWN_LIST)
					turfPlant = new randPlant(src)
					. = TRUE
					return .

/turf/open/floor/plating/ms13/ground/snow/ChangeTurf(path, new_baseturf, flags)
	if(turfPlant)
		qdel(turfPlant)
	. =  ..()

/turf/open/floor/plating/ms13/ground/snow/dug
	name = "paved snow"
	desc = "Freshly paved out snow."
	icon = 'mojave/icons/turf/64x/snow_paved.dmi'
	border_icon = 'mojave/icons/turf/64x/snow_1_border.dmi'
	dug = TRUE
	slowdown = 0.65
//	smoothing_groups = list(SMOOTH_GROUP_MS13_SNOW_PATH)
//	canSmoothWith = list(SMOOTH_GROUP_MS13_SNOW_PATH, SMOOTH_GROUP_MS13_WATER)

/turf/open/floor/plating/ms13/ground/mountain
	name = "mountain"
	desc = "Damp cave flooring."
	baseturfs = /turf/open/floor/plating/ms13/ground/mountain
	icon = 'mojave/icons/turf/cave.dmi'
	icon_state = "cave_1"
	slowdown = 0.1
	var/area/curr_area = null
	var/variants = 7

/turf/open/floor/plating/ms13/ground/mountain/Initialize()
	. = ..()
	icon_state = "cave_[rand(1,(variants))]"
	curr_area = get_area(src)
	//If no fences, machines, etc. try to plant mushrooms
	if(!(\
			(locate(/obj/structure) in src) || \
			(locate(/obj/machinery) in src) ))
		plantShrooms()

/turf/open/floor/plating/ms13/ground/mountain/proc/plantShrooms()
	var/randPlant = null
	if(!istype(curr_area, /area/ms13/underground/mountain))
		return

	if(prob(SHROOM_WEIGHT))
		randPlant = pick_weight(MUSHROOM_SPAWN_LIST)
		turfPlant = new randPlant(src)
	. = TRUE //in case we ever need this to return if we spawned
	return .

/turf/open/floor/plating/ms13/ground/mountain/ChangeTurf(path, new_baseturf, flags)
	if(turfPlant)
		qdel(turfPlant)
	. =  ..()

/turf/open/floor/plating/ms13/ground/mountain/drought
	name = "mountain"
	desc = "Dry cave flooring. Red dust kicks up as you walk by it."
	baseturfs = /turf/open/floor/plating/ms13/ground/mountain/drought
	icon = 'mojave/icons/turf/cave_drought.dmi'
	icon_state = "cave_1"
	slowdown = 0.20
	variants = 8

////Roads////

/turf/open/floor/plating/ms13/ground/road
	name = "\proper road"
	desc = "A stretch of road."
	baseturfs = /turf/open/floor/plating/ms13/ground/road
	icon = 'mojave/icons/turf/64x/road_1.dmi'
	icon_state = "road-255"
	base_icon_state = "road"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_ROAD)
	canSmoothWith = list(SMOOTH_GROUP_MS13_ROAD, SMOOTH_GROUP_MS13_SIDEWALK, SMOOTH_GROUP_MS13_TILE, SMOOTH_GROUP_MS13_SNOW, SMOOTH_GROUP_MS13_SNOW, SMOOTH_GROUP_MS13_WATER, SMOOTH_GROUP_MS13_OPENSPACE)
	layer = TURF_LAYER_ROAD

/turf/open/floor/plating/ms13/ground/road/Initialize()
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_icon), 1)

/turf/open/floor/plating/ms13/ground/road/update_icon()
	. = ..() //Inheritance required for road decals
	var/rand_icon = rand(1,3)
	var/crack_randomiser = "crack_[rand(1,24)]"
	var/road_randomiser = rand(-10,10)
	var/direction_randomiser = rand(0,8)

	switch(rand_icon)
		if(1)
			icon = 'mojave/icons/turf/64x/road_1.dmi'
			border_icon = 'mojave/icons/turf/64x/road_1_border.dmi'
		if(2)
			icon = 'mojave/icons/turf/64x/road_2.dmi'
			border_icon = 'mojave/icons/turf/64x/road_2_border.dmi'
		if(3)
			icon = 'mojave/icons/turf/64x/road_3.dmi'
			border_icon = 'mojave/icons/turf/64x/road_3_border.dmi'

	if(prob(20))
		add_overlay(image('mojave/icons/turf/road.dmi', crack_randomiser, TURF_LAYER_ROAD_DECAL, direction_randomiser, road_randomiser, road_randomiser))

	add_overlay(image(border_icon, icon_state, TURF_LAYER_ROAD_BORDER, pixel_x = -16, pixel_y = -16))


////Sidewalks////

/turf/open/floor/plating/ms13/ground/sidewalk
	name = "sidewalk"
	desc = "Paved tiles specifically designed for walking upon."
	baseturfs = /turf/open/floor/plating/ms13/ground/sidewalk
	icon = 'mojave/icons/turf/sidewalk.dmi'
	icon_state = "sidewalk-255"
	base_icon_state = "sidewalk"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_SIDEWALK)
	canSmoothWith = list(SMOOTH_GROUP_MS13_SIDEWALK, WALL_SMOOTHING, SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_MS13_DESERT, SMOOTH_GROUP_MS13_TILE)

/turf/open/floor/plating/ms13/ground/sidewalk/Initialize()
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_icon), 1)

/*
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
	icon_state = "crack_[rand(1,11)]"*/

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
	footstep = FOOTSTEP_ROOF
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

/turf/open/floor/plating/ms13/ground/ice
	name = "ice"
	desc = "A dangerous ice sheet, tread carefully."
	icon = 'mojave/icons/turf/64x/ice_1.dmi'
	icon_state = "ice-255"
	base_icon_state = "ice"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_ICE)
	canSmoothWith = list(SMOOTH_GROUP_MS13_ICE, SMOOTH_GROUP_MS13_SIDEWALK, WALL_SMOOTHING, SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_MS13_DESERT, SMOOTH_GROUP_MS13_TILE, SMOOTH_GROUP_MS13_SNOW, SMOOTH_GROUP_MS13_ROAD)
	layer = TURF_LAYER_ICE
	baseturfs = /turf/open/floor/plating/ms13/ground/ice/cracked
	//Used for increasing cracking when walking on ice
	var/crack_state = 1
	var/breaking = FALSE

/turf/open/floor/plating/ms13/ground/ice/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(W.force < 15)
		to_chat(user, span_notice("The [W.name] cannot break away the ice!"))
		return

	if(!breaking)
		user.balloon_alert_to_viewers("breaking the [src]", "breaking the [src]")
		playsound(get_turf(src), 'mojave/sound/ms13effects/icebreakshort.ogg', 100, FALSE, FALSE)
		breaking = TRUE
		if(do_after(user, 5 SECONDS, interaction_key = DOAFTER_SOURCE_BREAKICE))
			to_chat(user, span_notice("You break away the ice."))
			switch(crack_state)
				if(1)
					crack_state = 2
					update_icon()
				if(2)
					crack_state = 3
					update_icon()
				if(3)
					Icebreak()
					update_icon()
		breaking = FALSE

/turf/open/floor/plating/ms13/ground/ice/cracked
	baseturfs = /turf/open/floor/plating/ms13/ground/ice/morecracked
	icon = 'mojave/icons/turf/64x/ice_2.dmi'
	crack_state = 2

/turf/open/floor/plating/ms13/ground/ice/morecracked
	baseturfs = /turf/open/ms13/water/deep
	icon = 'mojave/icons/turf/64x/ice_3.dmi'
	crack_state = 3

/turf/open/floor/plating/ms13/ground/ice/Initialize()
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_icon), 1)
	MakeSlippery(TURF_WET_WATER, INFINITY, 0, INFINITY, TRUE, overlay = FALSE)

/turf/open/floor/plating/ms13/ground/ice/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent, overlay)
	AddComponent(/datum/component/wet_floor, wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent, overlay)

/turf/open/floor/plating/ms13/ground/ice/Entered(atom/movable/AM)
	. = ..()
	if(istype(AM, /mob/living/carbon))
		var/mob/living/carbon/fool = AM
		if(fool.m_intent == MOVE_INTENT_WALK)
			return //tread carefully
	if(isliving(AM) && prob(30))
		switch(crack_state)
			if(1)
				crack_state = 2
				update_icon()
			if(2)
				crack_state = 3
				update_icon()
			if(3)
				Icebreak()
				update_icon()
		for(var/turf/open/floor/plating/ms13/ground/ice/T in RANGE_TURFS(1, src))
			switch(T.crack_state)
				if(1)
					T.crack_state = 2
					T.update_icon()
				if(2)
					T.crack_state = 3
					T.update_icon()

/turf/open/floor/plating/ms13/ground/ice/proc/Icebreak()
	src.ChangeTurf(/turf/open/ms13/water/deep, flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/plating/ms13/ground/ice/update_icon()
	. = ..()
	add_overlay(image('mojave/icons/turf/64x/ice_border.dmi', icon_state, TURF_LAYER_ICE_BORDER, pixel_x = -16, pixel_y = -16))
	switch(crack_state)
		if(1)
			icon = 'mojave/icons/turf/64x/ice_1.dmi'
		if(2)
			icon = 'mojave/icons/turf/64x/ice_2.dmi'
		if(3)
			icon = 'mojave/icons/turf/64x/ice_3.dmi'

////Water////

#define iswater(A) (istype(A, /turf/open/ms13/water))

/turf/open/ms13/water
	name = "water"
	desc = "Cold dirty water."
	icon = 'mojave/icons/turf/water.dmi'
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_WATER)
	canSmoothWith = list(SMOOTH_GROUP_MS13_WATER)
	baseturfs = /turf/open/ms13/water
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER
	plane = FLOOR_PLANE
	layer = TURF_LAYER_WATER_BASE
	slowdown = 0.5
	// What type of water it'll give you when you fill a container from it.
	var/dispensedreagent = /datum/reagent/consumable/ms13/water/unfiltered
	var/next_splash = 1
	var/atom/watereffect = /obj/effect/overlay/ms13/water/medium
	var/atom/watertop = /obj/effect/overlay/ms13/water/top/medium
	var/depth = 0
	var/coldness = -100
	var/list/fish = list(/obj/item/food/meat/slab/ms13/fish/sockeye = 1,
		/obj/item/food/meat/slab/ms13/fish/smallmouth = 2,
		/obj/item/food/meat/slab/ms13/fish/largemouth = 1,
		/obj/item/food/meat/slab/ms13/fish/pink = 2,
		/obj/item/food/meat/slab/ms13/fish/chum = 2,
		/obj/item/food/meat/slab/ms13/fish/sturgeon = 1,
		/obj/item/food/meat/slab/ms13/fish/asian = 1)

// Increment fish every 5
#define fishPopFreq   5 MINUTES
// Increment fish pop by 5
#define fishPopIncAmt 5

GLOBAL_VAR_INIT(FishPop, 20)
GLOBAL_VAR(FishPopNextCalc)

/proc/getFishPop()
  if(world.time > GLOB.FishPopNextCalc)
    // Increment fishpop since last calc (i.e if 15 minutes, then increment by 5, 3 times)
    GLOB.FishPop += FLOOR( world.time - GLOB.FishPopNextCalc, fishPopFreq) * fishPopIncAmt
    GLOB.FishPopNextCalc = world.time + fishPopFreq

  return GLOB.FishPop

/turf/open/ms13/water/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(W.tool_behaviour == TOOL_FISHINGROD)
		if(!isturf(user.loc))
			return

		to_chat(user, "<span class='notice'>You start fishing...</span>")
		if(do_after(user, 40 SECONDS * W.toolspeed, interaction_key = DOAFTER_SOURCE_FISHING))
			if(!can_fish(user))
				return TRUE
			to_chat(user, "<span class='notice'>You reel in your catch.</span>")
			getFished(user)

	if(istype(W, /obj/item/reagent_containers))
		var/obj/item/reagent_containers/container = W
		if(container.is_refillable())
			if(!container.reagents.holder_full())
				container.reagents.add_reagent(dispensedreagent, min(container.volume - container.reagents.total_volume, container.amount_per_transfer_from_this))
				to_chat(user, span_notice("You fill [container] from [src]."))
				return TRUE
			to_chat(user, span_notice("\The [container] is full."))
			return FALSE

/turf/open/ms13/water/proc/getFished(mob/user)
	var/spawnFish = pick_weight(fish)
	new spawnFish(user.loc)
	GLOB.FishPop--

/turf/open/ms13/water/proc/can_fish(mob/user)
	if(!getFishPop())
		if(user)
			to_chat(user, "<span class='warning'>Looks like there's no fish here!</span>")
		return FALSE
	return TRUE

/turf/open/ms13/water/deep
	name = "deep water"
	desc = "Cold dirty water, it looks pretty deep."
	icon_state = "water_deep"
	baseturfs = /turf/open/ms13/water/deep
	watereffect = /obj/effect/overlay/ms13/water/deep
	watertop = /obj/effect/overlay/ms13/water/top/deep
	depth = 3

/turf/open/ms13/water/medium
	icon_state = "water_medium"
	baseturfs = /turf/open/ms13/water/medium
	watereffect = /obj/effect/overlay/ms13/water/medium
	watertop = /obj/effect/overlay/ms13/water/top/medium
	depth = 2

/turf/open/ms13/water/shallow
	icon_state = "water_shallow"
	baseturfs = /turf/open/ms13/water/shallow
	watereffect = /obj/effect/overlay/ms13/water/shallow
	watertop = /obj/effect/overlay/ms13/water/top/shallow
	depth = 1

/turf/open/ms13/water/Initialize()
	. = ..()
	new watereffect(src)
	new watertop(src)

/obj/effect/overlay/ms13/water
	name = "water"
	icon = 'mojave/icons/turf/water.dmi'
	density = FALSE
	mouse_opacity = 0
	layer = TURF_LAYER_WATER
	plane = FLOOR_PLANE
	anchored = TRUE

/obj/effect/overlay/ms13/water/deep
	icon_state = "water_deep_bottom"

/obj/effect/overlay/ms13/water/medium
	icon_state = "water_medium_bottom"

/obj/effect/overlay/ms13/water/shallow
	icon_state = "water_shallow_bottom"

/obj/effect/overlay/ms13/water/top
	layer = TURF_LAYER_WATER_UNDER

/obj/effect/overlay/ms13/water/top/deep
	icon_state = "water_deep_top"

/obj/effect/overlay/ms13/water/top/medium
	icon_state = "water_medium_top"

/obj/effect/overlay/ms13/water/top/shallow
	icon_state = "water_shallow_top"

/mob/living
	var/swimming = FALSE

/turf/open/ms13/water/MouseDrop_T(mob/living/M, mob/living/user)
	if(!M.swimming) //can't put yourself up if you are not swimming
		return ..()
	switch(depth)
		if(3)
			if(user == M)
				M.visible_message("<span class='notice'>[user] is getting out the deep water", \
								"<span class='notice'>You start getting out of the deep water.</span>")
				if(do_mob(user, M, 20))
					M.swimming = FALSE
					M.forceMove(src)
					to_chat(user, "<span class='notice'>You get out of the deep water.</span>")
			else
				user.visible_message("<span class='notice'>[M] is being dragged out the water by [user].</span>", \
								"<span class='notice'>You start getting [M] out of the deep water.")
				if(do_mob(user, M, 20))
					M.swimming = FALSE
					M.forceMove(src)
					to_chat(user, "<span class='notice'>You get [M] out of the deep water.</span>")
					return
		else
			return

/turf/open/ms13/water/MouseDrop_T(mob/living/M, mob/living/user)
	if(user.stat || user.body_position == LYING_DOWN || !Adjacent(user) || !M.Adjacent(user)|| !iscarbon(M))
		return
	if(M.swimming) //can't lower yourself again
		return
	else
		switch(depth)
			if(3)
				if(user == M)
					M.visible_message("<span class='notice'>[user] is descending in the deep water", \
									"<span class='notice'>You start lowering yourself in the deep water.</span>")
					if(do_mob(user, M, 20))
						M.swimming = TRUE
						addtimer(CALLBACK(src, .proc/transfer_mob_layer, M), 0.2 SECONDS)
						M.forceMove(src)
						to_chat(user, "<span class='notice'>You lower yourself in the deep water.</span>")
						//M.adjust_bodytemperature(coldness)
						//M.Jitter(20)
				else
					user.visible_message("<span class='notice'>[M] is being put in the deep water by [user].</span>", \
									"<span class='notice'>You start lowering [M] in the deep water.")
					if(do_mob(user, M, 20))
						M.swimming = TRUE
						addtimer(CALLBACK(src, .proc/transfer_mob_layer, M), 0.2 SECONDS)
						M.forceMove(src)
						to_chat(user, "<span class='notice'>You lower [M] in the deep water.</span>")
						//M.adjust_bodytemperature(coldness)
						//M.Jitter(20)
						return
			else
				return

/turf/open/ms13/water/Exited(atom/movable/gone, direction)
	..()
	if(isliving(gone))
		var/mob/living/M = gone
		if(!iswater(get_step(src, direction)))
			M.swimming = FALSE
			M.layer = initial(M.layer)
			M.plane = initial(M.plane)

/turf/open/ms13/water/Entered(atom/A, turf/OL)
	..()
	for(var/obj/structure/lattice/catwalk/C in get_turf(A))
		return

	if(isliving(A))
		var/mob/living/M = A
		var/mob/living/carbon/H = M
		addtimer(CALLBACK(src, .proc/transfer_mob_layer, M), 0.2 SECONDS)
		if(!(M.swimming))
			switch(depth)
				if(3)
					H.wash(CLEAN_WASH)
					if(iscarbon(M) && H.wear_mask && H.wear_mask.flags_cover & MASKCOVERSMOUTH)
						H.visible_message("<span class='danger'>[H] falls in the water!</span>",
											"<span class='userdanger'>You fall in the water!</span>")
						playsound(src, 'mojave/sound/ms13effects/splash.ogg', 60, 1, 1)
						H.Knockdown(20)
						H.swimming = TRUE
						//M.adjust_bodytemperature(coldness)
						return
					else
						H.dropItemToGround(H.get_active_held_item())
						H.adjustOxyLoss(5)
						H.emote("cough")
						H.visible_message("<span class='danger'>[H] falls in and takes a drink!</span>",
											"<span class='userdanger'>You fall in and swallow some water!</span>")
						playsound(src, 'mojave/sound/ms13effects/splash.ogg', 60, 1, 1)
						H.Knockdown(60)
						H.swimming = TRUE
						//M.adjust_bodytemperature(coldness)
				else
					H.swimming = TRUE
					//M.adjust_bodytemperature(coldness)
		if(H.body_position == LYING_DOWN)
			if(M.stat == DEAD)
				return
			switch(depth)
				if(3)
					H.visible_message("<span class='danger'>[H] flails in the water!</span>",
										"<span class='userdanger'>You're drowning!</span>")
					H.Knockdown(20)
					//M.adjust_bodytemperature(coldness)
					M.adjustStaminaLoss(20)
					M.adjustOxyLoss(10)
					M.adjustOrganLoss(ORGAN_SLOT_LUNGS, 20)
					playsound(src, 'mojave/sound/ms13effects/drown.ogg', 30, 1, 1)
				if(2)
					H.visible_message("<span class='danger'>[H] flails in the shallow water!</span>",
										"<span class='userdanger'>You're drowning!</span>")
					H.Knockdown(10)
					//M.adjust_bodytemperature(coldness)
					M.adjustStaminaLoss(10)
					M.adjustOxyLoss(5)
					M.adjustOrganLoss(ORGAN_SLOT_LUNGS, 10)
					playsound(src, 'mojave/sound/ms13effects/drown.ogg', 30, 1, 1)
		else //wading
			switch(depth)
				if(3)
					M.wash(CLEAN_WASH)
					//M.adjust_bodytemperature(coldness)
					//M.Jitter(20)
					M.adjustStaminaLoss(3)
				if(2)
					M.wash(CLEAN_WASH)
					//M.adjust_bodytemperature(coldness)
					//M.Jitter(20)
					M.adjustStaminaLoss(1)
				/*else
					M.adjust_bodytemperature(coldness)
					M.Jitter(20)*/
			return

/turf/open/ms13/water/proc/transfer_mob_layer(var/mob/living/carbon/M)
	if(iswater(get_turf(M)))
		M.layer = TURF_LAYER_MOB_WATER
		M.plane = FLOOR_PLANE
		M.update_icon(UPDATE_OVERLAYS)
	else
		return

/turf/open/ms13/water/sewer
	name = "sewer water"
	desc = "Murky and foul smelling water, if you could call it that."
	baseturfs = /turf/open/ms13/water/sewer
	dispensedreagent = /datum/reagent/consumable/ms13/water/dirty
	fish = list(/obj/item/food/meat/slab/ms13/fish/lamprey = 2,
		/obj/item/food/meat/slab/ms13/fish/largemouth = 1,
		/obj/item/food/meat/slab/ms13/fish/chum = 3,
		/obj/item/food/meat/slab/ms13/fish/blinky = 3,
		/obj/item/food/meat/slab/ms13/fish/asian = 1)


/turf/open/ms13/water/sewer/deep
	name = "deep water"
	desc = "Cold rancid sewer water, it looks pretty deep."
	icon_state = "sewer_deep"
	baseturfs = /turf/open/ms13/water/sewer/deep
	watereffect = /obj/effect/overlay/ms13/sewer/deep
	watertop = /obj/effect/overlay/ms13/sewer/top/deep
	depth = 3

/turf/open/ms13/water/sewer/medium
	icon_state = "sewer_medium"
	baseturfs = /turf/open/ms13/water/sewer/medium
	watereffect = /obj/effect/overlay/ms13/sewer/medium
	watertop = /obj/effect/overlay/ms13/sewer/top/medium
	depth = 2

/turf/open/ms13/water/sewer/shallow
	icon_state = "sewer_shallow"
	baseturfs = /turf/open/ms13/water/sewer/shallow
	watereffect = /obj/effect/overlay/ms13/sewer/shallow
	watertop = /obj/effect/overlay/ms13/sewer/top/shallow
	depth = 1

/obj/effect/overlay/ms13/sewer
	name = "water"
	icon = 'mojave/icons/turf/water.dmi'
	density = FALSE
	mouse_opacity = 0
	layer = TURF_LAYER_WATER
	plane = FLOOR_PLANE
	anchored = TRUE

/obj/effect/overlay/ms13/sewer/deep
	icon_state = "sewer_deep_bottom"

/obj/effect/overlay/ms13/sewer/medium
	icon_state = "sewer_medium_bottom"

/obj/effect/overlay/ms13/sewer/shallow
	icon_state = "sewer_shallow_bottom"

/obj/effect/overlay/ms13/sewer/top
	layer = TURF_LAYER_WATER_UNDER

/obj/effect/overlay/ms13/sewer/top/deep
	icon_state = "sewer_deep_top"

/obj/effect/overlay/ms13/sewer/top/medium
	icon_state = "sewer_medium_top"

/obj/effect/overlay/ms13/sewer/top/shallow
	icon_state = "sewer_shallow_top"

////Openspace////

//This functions like normal openspace but prevents placing lattice, so people cannot cheese catwalks or floors clear across the map.
/turf/open/openspace/ms13
	icon = 'mojave/icons/turf/ground.dmi'
	icon_state = "transparent" //Different icon so it's visually distinct for mappers.
	can_build_on = FALSE
	can_cover_up = FALSE
	smoothing_groups = list(SMOOTH_GROUP_MS13_OPENSPACE)

/turf/open/openspace/ms13/Initialize()
	. = ..()
	icon = 'icons/turf/floors.dmi'
	icon_state = "invisible" //Reset to original icon so it doesn't darken things when viewed in game.

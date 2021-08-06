
/datum/time_of_day
	var/name = ""
	var/color = ""
	var/duration = 300

/datum/time_of_day/day
	name = "Day"
	color = "#FFFFFF"
	duration = 9000

/datum/time_of_day/morning
	name = "Morning"
	color = "#808599"
	duration = 4500

/datum/time_of_day/evening
	name = "Evening"
	color = "#FFA891"
	duration = 4500

/datum/time_of_day/night
	name = "Night"
	color = "#050d29"
	duration = 9000

#define STEP_MORNING 0
#define STEP_DAY 1
#define STEP_EVENING 2
#define STEP_NIGHT 3


GLOBAL_VAR_INIT(GLOBAL_LIGHT_RANGE, 5)
GLOBAL_LIST_EMPTY(SUNLIGHT_QUEUE_WORK)   /* turfs to be stateChecked */
GLOBAL_LIST_EMPTY(SUNLIGHT_QUEUE_UPDATE) /* turfs to have their colours updated via corners (filter out the unroofed dudes) */
GLOBAL_LIST_EMPTY(SUNLIGHT_QUEUE_CORNER) /* turfs to have their colour/lights/etc updated */
GLOBAL_LIST_EMPTY(sunlight_objects)


// /var/total_sunlight_objects = 0
// /var/sunlight_objects_initialised = FALSE

// GLOBAL_LIST_INIT(globSunBackdrop, list (new/obj/lighting_general))
// cannibalized from lighting.dm



SUBSYSTEM_DEF(sunlight)
	name = "Sunlight"
	wait = LIGHTING_INTERVAL
	flags = SS_TICKER
	init_order = INIT_ORDER_SUNLIGHT


	var/list/atom/movable/screen/fullscreen/lighting_backdrop/Sunlight/sunlighting_planes = list()

	/* thanks ruskis */
	var/datum/time_of_day/current_step_datum
	var/datum/time_of_day/next_step_datum
	var/current_step
	var/next_step
	var/step_started
	var/step_finish
	var/current_color

	var/color = LIGHTING_BASE_MATRIX
	var/list/cornerColour = list()

	var/currentTime
	var/list/datum/time_of_day/time_cycle_steps = list(new /datum/time_of_day/morning(), new /datum/time_of_day/day(), \
														new /datum/time_of_day/evening(), new /datum/time_of_day/night())

/datum/controller/subsystem/sunlight/stat_entry()
	..("W:[GLOB.SUNLIGHT_QUEUE_WORK.len]|C:[GLOB.SUNLIGHT_QUEUE_CORNER.len]|U:[GLOB.SUNLIGHT_QUEUE_UPDATE.len]")

/datum/controller/subsystem/sunlight/proc/fullPlonk()
	GLOB.SUNLIGHT_QUEUE_WORK = GLOB.sunlight_objects

/datum/controller/subsystem/sunlight/Initialize(timeofday)
	if(!initialized)
		set_time_of_day(STEP_DAY)
		InitializeTurfs()
		fullPlonk()
		initialized = TRUE
	fire(FALSE, TRUE)
	..()

// It's safe to pass a list of non-turfs to this list - it'll only check turfs.
/* This is the proc that starts the crash loop. Maybe log what passes through it?
	-Thooloo
	*/
/datum/controller/subsystem/sunlight/proc/InitializeTurfs(list/targets)
	for (var/z in SSmapping.levels_by_trait(ZTRAIT_STATION))
		for (var/turf/T in block(locate(1,1,z), locate(world.maxx,world.maxy,z)))
			if (T.dynamic_lighting && T.loc:dynamic_lighting)
				// SSvis_overlays.add_vis_overlay(src, icon, overlay_state, layer, EMISSIVE_PLANE, dir)
				T.sunlight_object = new /atom/movable/sunlight_object(T)


/datum/controller/subsystem/sunlight/proc/check_cycle()
	if(world.time > step_finish)
		set_time_of_day(current_step + 1)

/datum/controller/subsystem/sunlight/proc/set_time_of_day(step)
	if(step > time_cycle_steps.len)
		step = STEP_DAY
	step_started = world.time
	current_step = step
	current_step_datum = time_cycle_steps[current_step]
	step_finish = current_step_datum.duration + world.time

	next_step = current_step + 1
	if(next_step > time_cycle_steps.len)
		next_step = 1
	next_step_datum = time_cycle_steps[next_step]

/* set sunlight colour */

/datum/controller/subsystem/sunlight/fire(resumed, init_tick_checks)
	MC_SPLIT_TICK_INIT(3)
	if(!init_tick_checks)
		MC_SPLIT_TICK
	var/i = 0
	for (i in 1 to GLOB.SUNLIGHT_QUEUE_WORK.len)
		var/atom/movable/sunlight_object/W = GLOB.SUNLIGHT_QUEUE_WORK[i]
		if(W)
			W.GetState()
			GLOB.SUNLIGHT_QUEUE_UPDATE += W

		if(init_tick_checks)
			CHECK_TICK
		else if (MC_TICK_CHECK)
			break
	if (i)
		GLOB.SUNLIGHT_QUEUE_WORK.Cut(1, i+1)
		i = 0


	if(!init_tick_checks)
		MC_SPLIT_TICK

	for (i in 1 to GLOB.SUNLIGHT_QUEUE_UPDATE.len)
		var/atom/movable/sunlight_object/U = GLOB.SUNLIGHT_QUEUE_UPDATE[i]
		if(U)
			U.ProcessState()
		if(init_tick_checks)
			CHECK_TICK
		else if (MC_TICK_CHECK)
			break
	if (i)
		GLOB.SUNLIGHT_QUEUE_UPDATE.Cut(1, i+1)
		i = 0


	if(!init_tick_checks)
		MC_SPLIT_TICK
	/* this runs uber slow when we do a unique |= add in the sunlight calc loop, so do it here */
	// GLOB.SUNLIGHT_QUEUE_CORNER = uniqueList(GLOB.SUNLIGHT_QUEUE_CORNER)
	for (i in 1 to GLOB.SUNLIGHT_QUEUE_CORNER.len)
		var/turf/T = GLOB.SUNLIGHT_QUEUE_CORNER[i]
		var/atom/movable/sunlight_object/U = T.sunlight_object

		if(!U || U.state != SUNLIGHT_INDOOR)
			continue

		U.UpdateColour()


		if(init_tick_checks)
			CHECK_TICK
		else if (MC_TICK_CHECK)
			break

	if (i)
		GLOB.SUNLIGHT_QUEUE_CORNER.Cut(1, i+1)
		i = 0


	check_cycle()
	nextBracket()



/datum/controller/subsystem/sunlight/proc/nextBracket()
	// current_color = current_step_datum.color //todo: remove this when no longer defuckulating
	var/blend_amount = (world.time - step_started) / current_step_datum.duration
	current_color = BlendRGB(current_step_datum.color, next_step_datum.color, blend_amount)

	/* for each thing, update the colour */
	for (var/atom/movable/screen/fullscreen/lighting_backdrop/Sunlight/SP in sunlighting_planes)
		SP.color = current_color


#undef STEP_MORNING
#undef STEP_DAY
#undef STEP_EVENING
#undef STEP_NIGHT


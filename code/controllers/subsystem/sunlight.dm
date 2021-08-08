//TODO: Change verbiage to outdoor_effects rather than sunlight
/datum/time_of_day
	var/name = ""
	var/color = ""
	var/duration = 50

/datum/time_of_day/day
	name = "Day"
	color = "#FFFFFF"
	duration = 50

/datum/time_of_day/morning
	name = "Morning"
	color = "#808599"
	duration = 50

/datum/time_of_day/evening
	name = "Evening"
	color = "#FFA891"
	duration = 50

/datum/time_of_day/night
	name = "Night"
	color = "#050d29"
	duration = 50

#define STEP_MORNING 0
#define STEP_DAY 1
#define STEP_EVENING 2
#define STEP_NIGHT 3


GLOBAL_VAR_INIT(GLOBAL_LIGHT_RANGE, 5)
GLOBAL_LIST_EMPTY(SUNLIGHT_QUEUE_WORK)   /* turfs to be stateChecked */
GLOBAL_LIST_EMPTY(SUNLIGHT_QUEUE_UPDATE) /* turfs to have their colours updated via corners (filter out the unroofed dudes) */
GLOBAL_LIST_EMPTY(SUNLIGHT_QUEUE_CORNER) /* turfs to have their colour/lights/etc updated */
GLOBAL_LIST_EMPTY(outdoor_effects)

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

	var/list/mutable_appearance/sunlight_overlays
	var/list/atom/movable/screen/fullscreen/weather/weather_planes_need_vis = list()
	var/sunlight_color = LIGHTING_BASE_MATRIX
	var/list/cornerColour = list()
	var/obj/weatherEffect
	var/currentTime
	var/list/datum/time_of_day/time_cycle_steps = list(new /datum/time_of_day/morning(), new /datum/time_of_day/day(), \
														new /datum/time_of_day/evening(), new /datum/time_of_day/night())

/datum/controller/subsystem/sunlight/stat_entry(msg)
	msg = "W:[GLOB.SUNLIGHT_QUEUE_WORK.len]|C:[GLOB.SUNLIGHT_QUEUE_CORNER.len]|U:[GLOB.SUNLIGHT_QUEUE_UPDATE.len]"
	return ..()

/datum/controller/subsystem/sunlight/proc/fullPlonk()
	for (var/z in SSmapping.levels_by_trait(ZTRAIT_STATION))
		for (var/turf/T in block(locate(1,1,z), locate(world.maxx,world.maxy,z)))
			if (T.dynamic_lighting && T.loc:dynamic_lighting)
				GLOB.SUNLIGHT_QUEUE_WORK += T

/datum/controller/subsystem/sunlight/Initialize(timeofday)
	if(!initialized)
		set_time_of_day(STEP_DAY)
		InitializeTurfs()
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
				GLOB.SUNLIGHT_QUEUE_WORK += T


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
/particles/rain
	width = 1000	 // 500 x 500 image to cover a moderately sized map
	height = 1000
	count = 2500	// 2500 particles
	spawning = 12	// 12 new particles per 0.1s
	bound1 = list(-1000, -300, -1000)   // end particles at Y=-300
	lifespan = 600  // live for 60s max
	fade = 50	   // fade out over the last 5s if still on screen
	// spawn within a certain x,y,z space
	position = generator("box", list(-700, 600,0), list(700,700,100))
	// control how the snow falls
	gravity = list(0.3, -1, -1)
	friction = 0.3  // shed 30% of velocity and drift every 0.1s
	icon 			  = 'icons/effects/weather_effects.dmi'
	icon_state 		  = "particle_drop"

/datum/controller/subsystem/sunlight/proc/getweatherEffect()
	if(!weatherEffect)
		weatherEffect = new /obj()
		weatherEffect.particles = new /particles/rain
		weatherEffect.filters += filter(type="alpha", render_source=WEATHER_RENDER_TARGET)
	return weatherEffect


/* set sunlight colour + add weather effect to clients */
/datum/controller/subsystem/sunlight/fire(resumed, init_tick_checks)
	MC_SPLIT_TICK_INIT(3)
	if(!init_tick_checks)
		MC_SPLIT_TICK
	var/i = 0

	for (i in 1 to weather_planes_need_vis.len)
		var/atom/movable/screen/fullscreen/weather/W = weather_planes_need_vis[i]
		if(W)
			if(!W.weatherEffect)
				W.weatherEffect = getweatherEffect()
				W.vis_contents = list(W.weatherEffect)
		if(init_tick_checks)
			CHECK_TICK
		else if (MC_TICK_CHECK)
			break
	if (i)
		weather_planes_need_vis.Cut(1, i+1)
		i = 0

	for (i in 1 to GLOB.SUNLIGHT_QUEUE_WORK.len)
		var/turf/T = GLOB.SUNLIGHT_QUEUE_WORK[i]
		if(T)
			T.GetSunlightState() //TODO: Rename to "GetOutdoorState"
			if(T.outdoor_effect)
				GLOB.SUNLIGHT_QUEUE_UPDATE += T.outdoor_effect

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
		var/atom/movable/outdoor_effect/U = GLOB.SUNLIGHT_QUEUE_UPDATE[i]
		if(U)
			U.ProcessState()
			if(U.state != SUNLIGHT_INDOOR)
				UpdateAppearance(U)

		if(init_tick_checks)
			CHECK_TICK
		else if (MC_TICK_CHECK)
			break
	if (i)
		GLOB.SUNLIGHT_QUEUE_UPDATE.Cut(1, i+1)
		i = 0


	if(!init_tick_checks)
		MC_SPLIT_TICK

	for (i in 1 to GLOB.SUNLIGHT_QUEUE_CORNER.len)
		var/turf/T = GLOB.SUNLIGHT_QUEUE_CORNER[i]
		var/atom/movable/outdoor_effect/U = T.outdoor_effect

		/* if we haven't initialized but we are affected, create new and check state */
		if(!U)
			T.outdoor_effect = new /atom/movable/outdoor_effect(T)
			T.GetSunlightState()
			U = T.outdoor_effect

			/* in case we aren't indoor somehow, wack us into the proc queue, we will be skipped on next indoor check */
			if(U.state != SUNLIGHT_INDOOR)
				GLOB.SUNLIGHT_QUEUE_UPDATE += T.outdoor_effect

		if(U.state != SUNLIGHT_INDOOR)
			continue

		//This might need to be run more liberally
		UpdateAppearance(U)


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




// Updates overlays and vis_contents for outdoor effects
/datum/controller/subsystem/sunlight/proc/UpdateAppearance(atom/movable/outdoor_effect/OE)

	//Update sunlight overlay
	SetSunlightOverlay(OE)

	//Update weather vis_content

//Sets (or removes) the sunlight overlay
/datum/controller/subsystem/sunlight/proc/SetSunlightOverlay(atom/movable/outdoor_effect/SO)

	var/mutable_appearance/MA
	if (SO.state != SUNLIGHT_INDOOR)
		MA = GetOverlay(1,1,1,1) /* fully lit */
	else //Indoor - do proper corner checks
		/* check if we are globally affected or not */
		var/static/datum/lighting_corner/dummy/dummy_lighting_corner = new

		var/datum/lighting_corner/cr = SO.source_turf.lighting_corner_SW || dummy_lighting_corner
		var/datum/lighting_corner/cg = SO.source_turf.lighting_corner_SE || dummy_lighting_corner
		var/datum/lighting_corner/cb = SO.source_turf.lighting_corner_NW || dummy_lighting_corner
		var/datum/lighting_corner/ca = SO.source_turf.lighting_corner_NE || dummy_lighting_corner

		var/fr = cr.sunFalloff
		var/fg = cg.sunFalloff
		var/fb = cb.sunFalloff
		var/fa = ca.sunFalloff

		MA = GetOverlay(fr, fg, fb, fa)

	SO.sunlight_overlay = MA
	//get weather overlay if we aren't indoors
	SO.overlays = SO.state == SUNLIGHT_INDOOR ? list(SO.sunlight_overlay) : list(SO.sunlight_overlay, getWeatherOverlay())
	// SO.vis_contents = SO.state == SUNLIGHT_INDOOR ? list() : list(getweatherEffect())
	SO.luminosity = MA.luminosity

//Retrieve an overlay from the list - create if necessary
/datum/controller/subsystem/sunlight/proc/GetOverlay(fr, fg, fb, fa)

	var/index = "[fr]|[fg]|[fb]|[fa]"
	LAZYINITLIST(sunlight_overlays)
	if(!sunlight_overlays[index])
		sunlight_overlays[index] = CreateOverlay(fr, fg, fb, fa)
	return sunlight_overlays[index]

//TODO Rather than having sunlight and weather - just have two planes, one for indoor and one for outdoor
/datum/controller/subsystem/sunlight/proc/getWeatherOverlay()
	var/mutable_appearance/MA = new /mutable_appearance()
	MA.blend_mode   	  = BLEND_OVERLAY
	MA.icon 			  = 'icons/hud/screen_gen.dmi'
	MA.icon_state 		  = "flash"
	MA.plane			  = WEATHER_PLANE /* we put this on a lower level than lighting so we dont multiply anything */
	MA.invisibility 	  = INVISIBILITY_LIGHTING
	return MA

//Create an overlay appearance from corner values
/datum/controller/subsystem/sunlight/proc/CreateOverlay(fr, fg, fb, fa)

	var/mutable_appearance/MA = new /mutable_appearance()

	MA.blend_mode   = BLEND_OVERLAY
	MA.icon		 = LIGHTING_ICON
	MA.icon_state   = null
	MA.plane		= SUNLIGHTING_PLANE /* we put this on a lower level than lighting so we dont multiply anything */
	MA.invisibility = INVISIBILITY_LIGHTING


	//MA gets applied as an overlay, but we pull luminosity out to set our outdoor_effect object's lum
	#if LIGHTING_SOFT_THRESHOLD != 0
	MA.luminosity = max(fr, fg, fb, fa) > LIGHTING_SOFT_THRESHOLD
	#else
	MA.luminosity = max(fr, fg, fb, fa) > 1e-6
	#endif

	if((fr & fg & fb & fa) && (fr + fg + fb + fa == 4)) /* this will likely never happen */
		MA.color = LIGHTING_BASE_MATRIX
	else if(!MA.luminosity)
		MA.color = SUNLIGHT_DARK_MATRIX
	else
		MA.color = list(
					fr, fr, fr,  00 ,
					fg, fg, fg,  00 ,
					fb, fb, fb,  00 ,
					fa, fa, fa,  00 ,
					00, 00, 00,  01 )
	return MA

#undef STEP_MORNING
#undef STEP_DAY
#undef STEP_EVENING
#undef STEP_NIGHT


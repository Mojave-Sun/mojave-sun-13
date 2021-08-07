//todo: handle moving sunlight turfs - see various uses of get_turf in lighting_object


/*

Sunlight System

	Objects + Details
		Sunlight Objects (this file)
			- Grayscale version of lighting_object
			- Has 3 states
				- SUNLIGHT_INDOOR  (0)
					- Turfs that are indoors. Has no light themselves but is affected by SUNLIGHT_BORDER
				- SUNLIGHT_OUTDOOR (1)
					- Turfs that are outdoors, with no neighbouring SUNLIGHT_INDOOR tiles
					  Emits no light, but is fully white to display the overlay colour
				- SUNLIGHT_BORDER  (2)
					-Turfs that are outdoors, which neighbour at least one SUNLIGHT_INDOOR tile.
				     Emits light to indoor tiles, and fully white to display the overlay colour

		Sunlight Overlay
			- per client screen overlay. This handles the actual sunlight colour.

		Sunlight Subsystem
			- Handles the sunlight object update queue, and the sunlight overlay colours


	todo:
	Investigate having SUNLIGHT_INDOOR also place themselves on a different layer of the sunlight plane,
	so that we can have a weather effect overlay without displaying indoors

*/

/atom/movable/outdoor_effect
	name = ""
	mouse_opacity = 0
	anchored = 1

	/* misc vars */
	var/sunlightLuminosity       = 0				//
	var/mutable_appearance/sunlight_overlay
	var/state 					 = SUNLIGHT_OUTDOOR	// If we are roofed, unroofed, or an unroofed turf with a roofed neighbur
	var/turf/roofTurf
	var/turf/source_turf
	var/list/datum/lighting_corner/affectingCorners

/atom/movable/outdoor_effect/Destroy(force)
	if (force)
		var/turf/badTurf = get_turf(source_turf)
		stack_trace("A sunlighting object has been deleted [COORD(badTurf)]")
		return ..()

	else
		return QDEL_HINT_LETMELIVE


/atom/movable/outdoor_effect/Initialize(mapload)
	. = ..()
	source_turf = loc
	if (source_turf.outdoor_effect)
		qdel(source_turf.outdoor_effect, force = TRUE)
	source_turf.outdoor_effect = src
	GLOB.outdoor_effects += src

/atom/movable/outdoor_effect/proc/DisableSunlight()
	var/turf/T = list()
	for(var/datum/lighting_corner/C in affectingCorners)
		LAZYREMOVE(C.globAffect, src)
		C.getSunFalloff()
		if( C.master_NE)
			T |= C.master_NE
		if (C.master_SE)
			T |= C.master_SE
		if (C.master_SW)
			T |= C.master_SW
		if (C.master_NW)
			T |= C.master_NW
	T |= source_turf /* get our calculated indoor lighting */
	GLOB.SUNLIGHT_QUEUE_CORNER += T

/atom/movable/outdoor_effect/proc/ProcessState()
	switch(state)
		if(SUNLIGHT_INDOOR)
			DisableSunlight() /* Do our indoor processing */
		if(SUNLIGHT_BORDER)
			CalcSunlightSpread()

#define hardSun 0.5 /* our hyperboloidy modifyer funky times -  */
/* calculate the indoor corners we are affecting */
#define SUN_FALLOFF(C, T) (1 - CLAMP01(sqrt((C.x - T.x) ** 2 + (C.y - T.y) ** 2 - hardSun) / max(1, GLOB.GLOBAL_LIGHT_RANGE)))


/atom/movable/outdoor_effect/proc/CalcSunlightSpread()

	var/list/turf/turfs                    = list()
	var/datum/lighting_corner/C
	var/turf/T
	var/list/tempMasterList = list() /* to mimimize double ups */
	var/list/corners  = list() /* corners we are currently affecting */

	//Set lum so we can see things
	var/oldLum = luminosity
	luminosity = GLOB.GLOBAL_LIGHT_RANGE

	for(T in view(CEILING(GLOB.GLOBAL_LIGHT_RANGE, 1), source_turf))
		if(IS_OPAQUE_TURF(T)) /* get_corners used to do opacity checks for arse */
			continue
		if (!T.lighting_corners_initialised)
			T.generate_missing_corners()
		corners |= T.lighting_corner_NE
		corners |= T.lighting_corner_SE
		corners |= T.lighting_corner_SW
		corners |= T.lighting_corner_NW
		turfs += T

	//restore lum
	luminosity = oldLum

	/* fix up the lists */
	/* add ourselves and our distance to the corner */
	LAZYINITLIST(affectingCorners)
	var/list/L = corners - affectingCorners
	affectingCorners += L
	for (C in L)
		LAZYSET(C.globAffect, src, SUN_FALLOFF(C,source_turf))
		if(C.globAffect[src] > C.sunFalloff) /* if are closer than current dist, update the corner */
			C.sunFalloff = C.globAffect[src]
			if (C.master_NE)
				tempMasterList |= C.master_NE
			if (C.master_SE)
				tempMasterList |= C.master_SE
			if (C.master_SW)
				tempMasterList |= C.master_SW
			if (C.master_NW)
				tempMasterList |= C.master_NW

	L = affectingCorners - corners // Now-gone corners, remove us from the affecting.
	affectingCorners -= L
	for (C in L)
		LAZYREMOVE(C.globAffect, src)
		C.getSunFalloff()
		if (C.master_NE)
			tempMasterList |= C.master_NE
		if (C.master_SE)
			tempMasterList |= C.master_SE
		if (C.master_SW)
			tempMasterList |= C.master_SW
		if (C.master_NW)
			tempMasterList |= C.master_NW

	GLOB.SUNLIGHT_QUEUE_CORNER += tempMasterList /* update the boys */

/* Related object changes */
/* I moved this here to consolidate sunlight changes as much as possible, so its easily disabled */

/* area fuckery */
/area/var/turf/roofType

/* turf fuckery */
/turf/var/tmp/atom/movable/outdoor_effect/outdoor_effect /* a turf's sunlight overlay */
/turf/var/turf/roofType /* our roof turf - may be a path for top z level, or a ref to the turf above*/

/* check ourselves and neighbours to see what sunlight overlay we need */
/turf/proc/GetSunlightState()
	var/TempState
	if(!(IS_OPAQUE_TURF(src) || HasRoof() ))
		TempState = SUNLIGHT_OUTDOOR
		for(var/turf/CT in RANGE_TURFS(1, src))
			if(IS_OPAQUE_TURF(CT)  || CT.HasRoof()) /* if we have a single roofed/indoor neighbour, we are a border */
				TempState = SUNLIGHT_BORDER
				break
	else /* roofed, so turn off the lights */
		TempState = SUNLIGHT_INDOOR

	/* if border or indoor, initialize. Set sunlight state if valid */
	if(!outdoor_effect && TempState <> SUNLIGHT_INDOOR)
		outdoor_effect = new /atom/movable/outdoor_effect(src)
	if(outdoor_effect)
		outdoor_effect.state = TempState
	return TempState

/turf/proc/HasRoof()
	/* if we are a wall or have a ceiling, we are under a roof and considered indoors */
	if(istype(src, /turf/closed) ||  GetCeilingTurf())
		return TRUE
	return FALSE

/* run up the Z column until we hit a non openspace turf, or the top of the map */
/turf/proc/GetCeilingTurf()
	if (roofType)
		roofType = roofType /* already calculated */
	else
		var/turf/ceiling = get_step_multiz(src, UP)
		if(ceiling)
			roofType = !istransparentturf(ceiling) ? ceiling : ceiling.GetCeilingTurf()
	return roofType


/* moved this out of reconsider lights so we can call it in multiz refresh  */
/turf/proc/reconsider_sunlight()
	if(!SSlighting.initialized)
		return

	/* remove roof refs (not path for psuedo roof) so we can recalculate it */
	if(roofType && !ispath(roofType))
		roofType = null

	var/atom/movable/outdoor_effect/S
	var/list/SunlightUpdates = list()

	//Add ourselves (we might not have corners initialized, and this handles it)
	SunlightUpdates += src

	if(lighting_corner_NE)
		if (lighting_corner_NE.master_NE)
			SunlightUpdates |= lighting_corner_NE.master_NE
		for(S in lighting_corner_NE.globAffect)
			SunlightUpdates |= S.source_turf

		if (lighting_corner_NE.master_SE)
			SunlightUpdates |= lighting_corner_NE.master_SE
		for(S in lighting_corner_NE.globAffect)
			SunlightUpdates |= S.source_turf

		if (lighting_corner_NE.master_SW)
			SunlightUpdates |= lighting_corner_NE.master_SW
		for(S in lighting_corner_NE.globAffect)
			SunlightUpdates |= S.source_turf

		if (lighting_corner_NE.master_NW)
			SunlightUpdates |= lighting_corner_NE.master_NW
		for(S in lighting_corner_NE.globAffect)
			SunlightUpdates |= S.source_turf

	if(lighting_corner_SE)
		if (lighting_corner_SE.master_NE)
			SunlightUpdates |= lighting_corner_SE.master_NE
		for(S in lighting_corner_SE.globAffect)
			SunlightUpdates |= S.source_turf

		if (lighting_corner_SE.master_SE)
			SunlightUpdates |= lighting_corner_SE.master_SE
		for(S in lighting_corner_SE.globAffect)
			SunlightUpdates |= S.source_turf

		if (lighting_corner_SE.master_SW)
			SunlightUpdates |= lighting_corner_SE.master_SW
		for(S in lighting_corner_SE.globAffect)
			SunlightUpdates |= S.source_turf

		if (lighting_corner_SE.master_NW)
			SunlightUpdates |= lighting_corner_SE.master_NW
		for(S in lighting_corner_SE.globAffect)
			SunlightUpdates |= S.source_turf

	if(lighting_corner_SW)
		if (lighting_corner_SW.master_NE)
			SunlightUpdates |= lighting_corner_SW.master_NE
		for(S in lighting_corner_SW.globAffect)
			SunlightUpdates |= S.source_turf

		if (lighting_corner_SW.master_SE)
			SunlightUpdates |= lighting_corner_SW.master_SE
		for(S in lighting_corner_SW.globAffect)
			SunlightUpdates |= S.source_turf

		if (lighting_corner_SW.master_SW)
			SunlightUpdates |= lighting_corner_SW.master_SW
		for(S in lighting_corner_SW.globAffect)
			SunlightUpdates |= S.source_turf

		if (lighting_corner_SW.master_NW)
			SunlightUpdates |= lighting_corner_SW.master_NW
		for(S in lighting_corner_SW.globAffect)
			SunlightUpdates |= S.source_turf

	if(lighting_corner_NW)
		if (lighting_corner_NW.master_NE)
			SunlightUpdates |= lighting_corner_NW.master_NE
		for(S in lighting_corner_NW.globAffect)
			SunlightUpdates |= S.source_turf

		if (lighting_corner_NW.master_SE)
			SunlightUpdates |= lighting_corner_NW.master_SE
		for(S in lighting_corner_NW.globAffect)
			SunlightUpdates |= S.source_turf

		if (lighting_corner_NW.master_SW)
			SunlightUpdates |= lighting_corner_NW.master_SW
		for(S in lighting_corner_NW.globAffect)
			SunlightUpdates |= S.source_turf

		if (lighting_corner_NW.master_NW)
			SunlightUpdates |= lighting_corner_NW.master_NW
		for(S in lighting_corner_NW.globAffect)
			SunlightUpdates |= S.source_turf

	GLOB.SUNLIGHT_QUEUE_WORK += SunlightUpdates

/* corner fuckery */
/datum/lighting_corner/var/list/globAffect = list() /* list of sunlight objects affecting this corner */
/datum/lighting_corner/var/sunFalloff = 0 /* smallest distance to sunlight turf, for sunlight falloff */

/* loop through and find our strongest sunlight value */
/datum/lighting_corner/proc/getSunFalloff()
	sunFalloff = 0

	var/atom/movable/outdoor_effect/S
	for(S in globAffect)
		sunFalloff = sunFalloff < globAffect[S] ? globAffect[S] : sunFalloff




/* Effect Fuckery */
/* these bits are to set the roof on a top-z level, as there is no turf above to act as a roof */
/obj/effect/mapping_helpers/sunlight/roofSetter
	icon_state = "roof"
	var/turf/roofType

/obj/effect/mapping_helpers/sunlight/roofSetter/mountain
	roofType = /turf/closed/indestructible/rock
	icon_state = "roof_rock"

// /obj/effect/mapping_helpers/sunlight/roofSetter/wood
// 	roofType = /turf/open/floor/wood/ms13
// 	icon_state = "roof_wood"


/obj/effect/mapping_helpers/sunlight/roofSetter/Initialize(mapload)
	. = ..()
	if(!mapload)
		log_mapping("[src] spawned outside of mapload!")
		return
	if(isturf(loc) && !get_step_multiz(loc, UP))
		var/turf/T = loc
		T.roofType = roofType
















#undef SUN_FALLOFF
#undef hardSun

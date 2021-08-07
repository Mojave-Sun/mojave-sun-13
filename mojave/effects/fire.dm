/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Partial TGMC port that creates a flame sprite object. Doesn't work like regular fire, ie. does not affect atmos or heat
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/ms13/fire
	name = "fire"
	desc = "Ouch!"
	anchored = TRUE
	icon = 'mojave/icons/objects/fire.dmi'
	icon_state = "red_2"
	layer = LOW_OBJ_LAYER
	light_system = MOVABLE_LIGHT
	light_on = TRUE
	light_power = 3
	light_color = LIGHT_COLOR_LAVA
	var/firelevel //Tracks how much "fire" there is. Basically the timer of how long the fire burns
	var/burnlevel = 10 //Tracks how HOT the fire is. This is basically the heat level of the fire and determines the temperature.
	var/flame_color = "red"

/obj/ms13/fire/Initialize(mapload, fire_lvl, burn_lvl, f_color, fire_stacks = 0, fire_damage = 0)
	. = ..()

	START_PROCESSING(SSobj, src)

	if(f_color)
		flame_color = f_color

	icon_state = "[flame_color]_2"
	if(fire_lvl)
		firelevel = fire_lvl
	if(burn_lvl)
		burnlevel = burn_lvl
	if(fire_stacks || fire_damage)
		for(var/mob/living/C in get_turf(src))
			C.flamer_fire_act(fire_stacks)

			if(C.IgniteMob())
				C.visible_message("<span class='danger'>[C] bursts into flames!</span>","<span class='highdanger'>You burst into flames!</span>")

/obj/ms13/fire/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/ms13/fire/extinguish()
	qdel(src)
	return

/obj/ms13/fire/Crossed(mob/living/M) //Only way to get it to reliable do it when you walk into it.
	. = ..()
	if(istype(M))
		M.flamer_fire_crossed(burnlevel, firelevel)


// override this proc to give different walking-over-fire effects
/mob/living/proc/flamer_fire_crossed(burnlevel, firelevel, fire_mod = 1)
	adjust_fire_stacks(burnlevel) //Make it possible to light them on fire later.
	IgniteMob()
	to_chat(src, "<span class='danger'>You are burned!</span>")

/obj/ms13/fire/proc/updateicon()
	var/light_color = "LIGHT_COLOR_LAVA"
	var/light_intensity = 3
	switch(flame_color)
		if("red")
			light_color = LIGHT_COLOR_LAVA
		if("blue")
			light_color = LIGHT_COLOR_CYAN
		if("green")
			light_color = LIGHT_COLOR_GREEN
	switch(firelevel)
		if(1 to 9)
			icon_state = "[flame_color]_1"
			light_intensity = 2
		if(10 to 25)
			icon_state = "[flame_color]_2"
			light_intensity = 4
		if(25 to INFINITY) //Change the icons and luminosity based on the fire's intensity
			icon_state = "[flame_color]_3"
			light_intensity = 6
	set_light_range_power_color(light_intensity, light_power, light_color)

/obj/ms13/fire/process()
	var/turf/T = loc
	firelevel = max(0, firelevel)
	if(!istype(T)) //Is it a valid turf?
		qdel(src)
		return

	updateicon()

	if(!firelevel)
		qdel(src)
		return

	T.flamer_fire_act(burnlevel, firelevel)

	var/j = 0
	for(var/i in T)
		if(++j >= 11)
			break
		var/atom/A = i
		if(QDELETED(A)) //The destruction by fire of one atom may destroy others in the same turf.
			continue
		A.flamer_fire_act(burnlevel, firelevel)

	firelevel -= 2 //reduce the intensity by 2 per tick
	return

/atom/proc/flamer_fire_act()
	return

// override this proc to give different idling-on-fire effects
/mob/living/flamer_fire_act(burnlevel, firelevel)
	if(!burnlevel)
		return
	adjust_fire_stacks(burnlevel) //If i stand in the fire i deserve all of this. Also Napalm stacks quickly.
	IgniteMob()
	adjustFireLoss(rand(10 , burnlevel)) //Including the fire should be way stronger.
	to_chat(src, "<span class='warning'>You are burned!</span>")

/proc/flame_radius(radius = 1, turf/epicenter, burn_intensity = 25, burn_duration = 25, burn_damage = 25, fire_stacks = 15, int_var = 0.5, dur_var = 0.5, colour = "red") //~Art updated fire.
	if(!isturf(epicenter))
		CRASH("flame_radius used without a valid turf parameter")
	for(var/T in filled_turfs(epicenter, radius, "circle"))
		radius = clamp(radius, 1, 50) //Sanitize inputs
		int_var = clamp(int_var, 0.1,0.5)
		dur_var = clamp(int_var, 0.1,0.5)
		fire_stacks = rand(burn_damage*(0.5-int_var),burn_damage*(0.5+int_var) ) + rand(burn_damage*(0.5-int_var),burn_damage*(0.5+int_var) )
		burn_damage = rand(burn_damage*(0.5-int_var),burn_damage*(0.5+int_var) ) + rand(burn_damage*(0.5-int_var),burn_damage*(0.5+int_var) )
		var/turf/turf_to_flame = T
		turf_to_flame.flame(rand(burn_intensity*(0.5-int_var), burn_intensity*(0.5+int_var)) + rand(burn_intensity*(0.5-int_var), burn_intensity*(0.5+int_var)), rand(burn_duration*(0.5-int_var), burn_duration*(0.5-int_var)) + rand(burn_duration*(0.5-int_var), burn_duration*(0.5-int_var)), colour, burn_damage, fire_stacks)

/turf/proc/flame(fire_lvl, burn_lvl, f_color, fire_stacks = 0, fire_damage = 0)
	//extinguish any flame present
	var/obj/ms13/fire/F = locate(/obj/ms13/fire) in src
	if(F)
		qdel(F)

	new /obj/ms13/fire(src, fire_lvl, burn_lvl, f_color, fire_stacks, fire_damage)

//Circle Calculation (currently only used for fire radius)

/proc/filled_turfs(atom/center, radius = 3, type = "circle", include_edge = TRUE)
	var/turf/center_turf = get_turf(center)
	if(radius < 0 || !center)
		return
	if(radius == 0)
		return list(center_turf)

	var/list/directions
	switch(type)
		if("square")
			directions = GLOB.alldirs
		if("circle")
			directions = GLOB.cardinals

	var/list/results = list(center_turf)
	var/list/turfs_to_check = list()
	turfs_to_check += center_turf
	for(var/i = radius; i > 0; i--)
		for(var/X in turfs_to_check)
			var/turf/T = X
			for(var/direction in directions)
				var/turf/AdjT = get_step(T, direction)
				if(!AdjT)
					continue
				if (AdjT in results) // Ignore existing turfs
					continue
				if(AdjT.density)
					if(include_edge)
						results += AdjT
					continue

				turfs_to_check += AdjT
				results += AdjT
	return results

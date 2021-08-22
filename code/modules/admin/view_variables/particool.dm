/*
	atom.particles



		Particle vars that affect the entire set (generators are not allowed for these)
			Var	Type	Description
			width	num	Size of particle image in pixels
			height
			count	num	Maximum particle count
			spawning	num	Number of particles to spawn per tick (can be fractional)
			bound1	vector	Minimum particle position in x,y,z space; defaults to list(-1000,-1000,-1000)
			bound2	vector	Maximum particle position in x,y,z space; defaults to list(1000,1000,1000)
			gravity	vector	Constant acceleration applied to all particles in this set (pixels per squared tick)
			gradient	color gradient	Color gradient used, if any
			transform	matrix	Transform done to all particles, if any (can be higher than 2D)

		Vars that apply when a particle spawns
			lifespan	num	Maximum life of the particle, in ticks
			fade	num	Fade-out time at end of lifespan, in ticks
			icon	icon	Icon to use, if any; no icon means this particle will be a dot
			Can be assigned a weighted list of icon files, to choose an icon at random
			icon_state	text	Icon state to use, if any
			Can be assigned a weighted list of strings, to choose an icon at random
			color	num or color	Particle color; can be a number if a gradient is used
			color_change	num	Color change per tick; only applies if gradient is used
			position	num	x,y,z position, from center in pixels
			velocity	num	x,y,z velocity, in pixels
			scale	vector (2D)	Scale applied to icon, if used; defaults to list(1,1)
			grow	num	Change in scale per tick; defaults to list(0,0)
			rotation	num	Angle of rotation (clockwise); applies only if using an icon
			spin	num	Change in rotation per tick
			friction	num	Amount of velocity to shed (0 to 1) per tick, also applied to acceleration from drift

		Vars that are evalulated every tick
			drift	vector	Added acceleration every tick; e.g. a circle or sphere generator can be applied to produce snow or ember effects



*/




/datum/particle_editor
	var/atom/movable/target

/datum/particle_editor/New(atom/target)
	src.target = target

/datum/particle_editor/ui_state(mob/user)
	return GLOB.admin_state

/datum/particle_editor/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Particool")
		ui.open()

/datum/particle_editor/ui_static_data(mob/user)
	var/list/data = list()
	data["particle_info"] = GLOB.master_particle_info
	return data

/datum/particle_editor/ui_data()
	var/list/data = list()
	data["target_name"] = target.name
	data["target_particle"] = build_particle_json(target.particles)
	return data

/datum/particle_editor/proc/build_particle_json(particles/P)
	. = new /list()


/datum/particle_editor/proc/digest_particle_json(list/L)
	. = new /particles

//expects an assoc list of name, type, value - type must be in this list
/datum/particle_editor/proc/translate_value(list/L)
	//string/float/int come in as the correct type, so just whack em in

	switch(L["type"])
		if("string") return L["value"]
		if("float") return L["value"]
		if("int") return L["value"]
		if("color") return L["value"]
		if("matrix") return stringToMatrix(L["value"])
		if("list") return stringToList(L["value"])
		// if("generator") return generateGenerator(L["value"]) // This value should be a new list, if it isn't then we will explode

/datum/particle_editor/proc/stringToMatrix(Str)

	//Normal Matrixes allow 6 - Projection matrixes allow 14 and 16 (CRAZY!) /// mayb
	var/list/L = stringToList(Str)
	switch(length(L))
		if(6)
			return matrix(L[0],L[1],L[2],L[3],L[4],L[5])
		// if(14)
		// 	return matrix(L[0],L[1],L[2],L[3],L[4],L[5],L[6],L[7],L[8],L[9],L[10],L[11],L[12],L[13])
		// if(16)
		// 	return matrix(L[0],L[1],L[2],L[3],L[4],L[5],L[6],L[7],L[8],L[9],L[10],L[11],L[12],L[13],L[14],L[15])

/datum/particle_editor/proc/stringToList(Str)
	return splittext(Str,regex(@"(?<!\\),"))



// /datum/particle_editor/proc/generateGenerator(list/L)


/datum/particle_editor/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	switch(action)
		if("add_particle")
			if(!target.particles)
				target.particles = new /particles
			. = TRUE
		if("remove_particle")
			target.particles = null
			. = TRUE
		if("transition_particle_value") //wtf is 4
			var/valName = params["new_data"]["name"]
			target.transition_particle(4, list("[valName]",translate_value(params["new_data"])))
			. = TRUE
		if("modify_particle_value")

			if(target.particles)
				target.particles.vars[params["new_data"]["name"]] = translate_value(params["new_data"])
			. = TRUE

		if("modify_color_value")
			var/new_color = input(usr, "Pick new particle color", "Particool Colors!") as color|null
			if(new_color)
				target.transition_particle(params["name"], 4, list("color" = new_color))
				. = TRUE
		if("modify_icon_value")
			var/icon/new_icon = input("Pick icon:", "Icon") as null|icon
			if(new_icon && target.particles)
				target.particles.icon = params["value"]
				. = TRUE
		if("mass_apply")
			if(!check_rights_for(usr.client, R_FUN))
				to_chat(usr, span_userdanger("Stay in your lane, jannie."))
				return
			var/target_path = text2path(params["path"])
			if(!target_path)
				return
			var/particle_to_put_on_fucking_everything = target.particles
			var/count = 0
			for(var/thing in world.contents)
				if(istype(thing, target_path))
					var/atom/movable/thing_at = thing
					thing_at.particles = particle_to_put_on_fucking_everything
			message_admins("LOCAL CLOWN [usr.ckey] JUST MASS FILTER EDITED [count] WITH PATH OF [params["path"]]!")
			log_admin("LOCAL CLOWN [usr.ckey] JUST MASS FILTER EDITED [count] WITH PATH OF [params["path"]]!")


//movable procs n stuff

/atom/movable/proc/transition_particle(name, time, list/new_params, easing, loop)
	if(!particles)
		return
	animate(particles, new_params, time = time, easing = easing, loop = loop)


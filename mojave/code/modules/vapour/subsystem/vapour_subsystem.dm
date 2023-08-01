SUBSYSTEM_DEF(vapour)
	name = "Vapour"
	init_order = INIT_ORDER_VAPOUR //Before atoms, because the emitters may need to know the singletons
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
	wait = 2 SECONDS
	flags = SS_BACKGROUND
	/// Currently active vapour
	var/list/active_vapour = list()
	/// All vapour in the world
	var/list/all_vapour = list()
	/// Currently processing batch of vapours
	var/list/current_run = list()
	/// Already processed vapours in cell process
	var/list/processed_this_run = list()
	/// Ticker for dissipation task
	var/dissipation_ticker = 0
	/// What's the current task we're doing
	var/vapour_task = VAPOUR_TASK_PROCESS
	/// Associative list of types of vapours to their instanced singletons
	var/list/singletons = list()
	/// Dissipation rate multiplier that only gets applied outdoors
	var/vapour_dissipation_outdoor_multiplier = VAPOUR_DISSIPATION_OUTDOOR_MULTIPLIER
	/// Dissipation rate multiplier that always gets applied
	var/vapour_dissipation_multiplier = 1

/datum/controller/subsystem/vapour/stat_entry(msg)
	msg += "|AT:[active_vapour.len]|P:[all_vapour.len]"
	return ..()

/datum/controller/subsystem/vapour/Initialize()
	//Initialize singletons
	for(var/type in subtypesof(/datum/vapours))
		var/datum/vapours/vapours_cast = type
		if(!initial(vapours_cast.name))
			continue
		singletons[type] = new type()
	return ..()

//for dissipation and what stage the vapour is running on
/datum/controller/subsystem/vapour/fire(resumed = FALSE)
	if(vapour_task == VAPOUR_TASK_PROCESS)
		while(current_run.len)
			var/datum/vapour/vapour = current_run[current_run.len]
			current_run.len--
			processed_this_run[vapour] = TRUE
			vapour.ProcessCell()
			if(MC_TICK_CHECK)
				return
		current_run = active_vapour.Copy()
		processed_this_run.Cut()
		dissipation_ticker++
		if(dissipation_ticker >= TICKS_TO_DISSIPATE)
			vapour_task = VAPOUR_TASK_DISSIPATE
			current_run = all_vapour.Copy()
	if(vapour_task == VAPOUR_TASK_DISSIPATE)
		while(current_run.len)
			var/datum/vapour/vapour = current_run[current_run.len]
			current_run.len--
			vapour.ScrubAmount(VAPOUR_HEIGHT_DIVISOR, FALSE, TRUE)
			if(MC_TICK_CHECK)
				return
		vapour_task = VAPOUR_TASK_PROCESS
		dissipation_ticker = 0

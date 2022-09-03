// Ported from Fortune, made by Rohesie //
// Busted right now. After the first time it turns the icon transparent, the entire icon's dimensions block mouse clicks.
///Makes large icons partially see through if high priority atoms are behind them.
/datum/component/largetransparency
	//Can be positive or negative. Determines how far away from parent the first registered turf is.
	var/x_offset = 0
	var/y_offset = 0
	//Has to be positive or 0.
	var/x_size = 0
	var/y_size = 0
	//The alpha values this switches in between.
	var/initial_alpha = 255
	var/target_alpha = 200
	//if this is supposed to prevent clicks if it's transparent.
	var/toggle_click = TRUE
	var/list/registered_turfs = list()
	var/amounthidden = 0

/datum/component/largetransparency/Initialize(x_offset, y_offset, x_size, y_size, initial_alpha, target_alpha)
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE
	var/atom/large_atom = parent
	if(!isnull(x_offset))
		src.x_offset = x_offset
	if(!isnull(y_offset))
		src.y_offset = y_offset
	if(!isnull(x_size))
		src.x_size = x_size
	if(!isnull(y_size))
		src.y_size = y_size
	if(isnull(initial_alpha))
		src.initial_alpha = large_atom.alpha
	else
		src.initial_alpha = initial_alpha
	if(!isnull(target_alpha))
		src.target_alpha = target_alpha
	if(!isnull(toggle_click))
		src.toggle_click = toggle_click
	if(large_atom.pixel_x)
		var/extra_x_offset = FLOOR(abs(large_atom.pixel_x / 32), 1) // Every full 32 pixel shifts we leave one turf behind.
		if(extra_x_offset)
			src.x_offset += large_atom.pixel_x > 0 ? extra_x_offset : -extra_x_offset
		if(large_atom.pixel_x % 32)
			src.x_size++ // Sprite is now sticking between two tiles, we'll have to listen for both.
			if(large_atom.pixel_x < 0)
				src.x_offset-- // If negative then we need to shift in the opposite direction.
	if(large_atom.pixel_y)
		var/extra_y_offset = FLOOR(abs(large_atom.pixel_y / 32), 1)
		if(extra_y_offset)
			src.y_offset += large_atom.pixel_y > 0 ? extra_y_offset : -extra_y_offset
		if(large_atom.pixel_y % 32)
			src.y_size++
			if(large_atom.pixel_y < 0)
				src.y_offset--


/datum/component/largetransparency/Destroy()
	registered_turfs.Cut()
	return ..()

/datum/component/largetransparency/RegisterWithParent()
	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, .proc/OnMove)
	RegisterWithTurfs()

/datum/component/largetransparency/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_MOVABLE_MOVED)
	UnregisterFromTurfs()

/datum/component/largetransparency/proc/RegisterWithTurfs()
	var/turf/current_tu = get_turf(parent)
	if(!current_tu)
		return
	var/turf/lowleft_tu = locate(clamp(current_tu.x + x_offset, 0, world.maxx), clamp(current_tu.y + y_offset, 0, world.maxy), current_tu.z)
	var/turf/upright_tu = locate(clamp(current_tu.x + x_offset + x_size, 0, world.maxx), clamp(current_tu.y + y_offset + y_size, 0, world.maxy), current_tu.z)
	registered_turfs = block(lowleft_tu, upright_tu) //small problems with z level edges but nothing gamebreaking.
	//register the signals
	for(var/regist_tu in registered_turfs)
		if(!regist_tu)
			continue
		RegisterSignal(regist_tu, list(COMSIG_ATOM_ENTERED, COMSIG_ATOM_CREATED), .proc/objectEnter)
		RegisterSignal(regist_tu, COMSIG_ATOM_EXITED, .proc/objectLeave)
		RegisterSignal(regist_tu, COMSIG_TURF_CHANGE, .proc/OnTurfChange)
		for(var/thing in regist_tu)
			var/atom/check_atom = thing
			if(!(check_atom.flags_1 & CRITICAL_ATOM_1))
				continue
			amounthidden++
	if(amounthidden)
		reduceAlpha()

/datum/component/largetransparency/proc/UnregisterFromTurfs()
	var/list/signal_list = list(COMSIG_ATOM_ENTERED, COMSIG_ATOM_EXITED, COMSIG_TURF_CHANGE, COMSIG_ATOM_CREATED)
	for(var/regist_tu in registered_turfs)
		UnregisterSignal(regist_tu, signal_list)
	registered_turfs.Cut()

/datum/component/largetransparency/proc/OnMove()
	SIGNAL_HANDLER
	amounthidden = 0
	restoreAlpha()
	UnregisterFromTurfs()
	RegisterWithTurfs()

/datum/component/largetransparency/proc/OnTurfChange()
	SIGNAL_HANDLER
	addtimer(CALLBACK(src, .proc/OnMove), 1, TIMER_UNIQUE|TIMER_OVERRIDE) //*pain

/datum/component/largetransparency/proc/objectEnter(datum/source, atom/enterer)
	SIGNAL_HANDLER
	if(!(enterer.flags_1 & CRITICAL_ATOM_1))
		return
	if(!amounthidden)
		reduceAlpha()
	amounthidden++

/datum/component/largetransparency/proc/objectLeave(datum/source, atom/leaver)
	SIGNAL_HANDLER
	if(!(leaver.flags_1 & CRITICAL_ATOM_1))
		return
	amounthidden = max(0, amounthidden - 1)
	if(!amounthidden)
		restoreAlpha()

/datum/component/largetransparency/proc/reduceAlpha()
	var/atom/par_atom = parent
	par_atom.alpha = target_alpha
	if(toggle_click)
		par_atom.mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/datum/component/largetransparency/proc/restoreAlpha()
	var/atom/par_atom = parent
	par_atom.alpha = initial_alpha
	if(toggle_click)
		par_atom.mouse_opacity = MOUSE_OPACITY_OPAQUE

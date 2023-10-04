/**
 * hi guys pog joga here
 * this is the fixeye component, it is only really useful when your character has the FoV component
 * basically while fixeye is active, your character will only turn when clicking on stuff
 *
 * notes: this should probably have a hud atom associated, hud sprite changes pending
 */
/datum/component/fixeye
	/// Current fixeye flags, such as FIXEYE_TOGGLED, FIXEYE_ACTIVE, etc
	var/fixeye_flags = NONE
	/// Holds the direction we should force the character to face
	var/faced_dir = NONE

/datum/component/fixeye/Initialize()
	. = ..()
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE

/datum/component/fixeye/RegisterWithParent()
	var/mob/living/living_parent = parent
	// this shit uses a fuckton of signals because i wanted it to be very feature complete
	RegisterSignal(living_parent, COMSIG_FIXEYE_TOGGLE, .proc/user_toggle_fixeye)
	RegisterSignal(living_parent, COMSIG_FIXEYE_DISABLE, .proc/safe_disable_fixeye)
	RegisterSignal(living_parent, COMSIG_FIXEYE_ENABLE, .proc/safe_enable_fixeye)
	RegisterSignal(living_parent, COMSIG_FIXEYE_LOCK, .proc/lock_fixeye)
	RegisterSignal(living_parent, COMSIG_FIXEYE_UNLOCK, .proc/unlock_fixeye)
	RegisterSignal(living_parent, COMSIG_LIVING_DEATH, .proc/on_death)
	RegisterSignal(living_parent, COMSIG_MOB_LOGOUT, .proc/on_logout)
	RegisterSignal(living_parent, COMSIG_FIXEYE_CHECK, .proc/check_flags)

/datum/component/fixeye/UnregisterFromParent()
	var/mob/living/living_source = parent
	UnregisterSignal(living_source, list(COMSIG_FIXEYE_TOGGLE, COMSIG_FIXEYE_DISABLE, COMSIG_FIXEYE_ENABLE, COMSIG_FIXEYE_LOCK, COMSIG_FIXEYE_UNLOCK, COMSIG_FIXEYE_CHECK))
	UnregisterSignal(living_source, COMSIG_LIVING_DEATH)
	UnregisterSignal(living_source, COMSIG_MOB_LOGOUT)

/// Called when the user tries to intentionally toggle fixeye on or off
/datum/component/fixeye/proc/user_toggle_fixeye(mob/living/source, silent = FALSE, forced = FALSE)
	SIGNAL_HANDLER

	if(fixeye_flags & FIXEYE_TOGGLED)
		safe_disable_fixeye(source, silent, forced)
	else if(source.stat == CONSCIOUS)
		safe_enable_fixeye(source, silent, forced)

/// Lock fixeye to it's current status
/datum/component/fixeye/proc/lock_fixeye(mob/living/source)
	SIGNAL_HANDLER

	fixeye_flags |= FIXEYE_LOCKED
	return TRUE

/// Unlocks fixeye, letting it be properly changed on or off
/datum/component/fixeye/proc/unlock_fixeye(mob/living/source)
	SIGNAL_HANDLER

	fixeye_flags &= ~FIXEYE_LOCKED
	return TRUE

/// Safely (as in respecting requirements and toggle flag) calls enable_fixeye
/datum/component/fixeye/proc/safe_enable_fixeye(mob/living/source, silent = FALSE, forced = FALSE)
	SIGNAL_HANDLER

	if((fixeye_flags & FIXEYE_TOGGLED) && (fixeye_flags & FIXEYE_ACTIVE))
		return TRUE
	else if((fixeye_flags & FIXEYE_LOCKED) && !forced)
		return TRUE
	fixeye_flags |= FIXEYE_TOGGLED
	enable_fixeye(source, silent, forced)
	return TRUE

/// Actually enables fixeye
/datum/component/fixeye/proc/enable_fixeye(mob/living/source, silent = TRUE, forced = TRUE)
	if(fixeye_flags & FIXEYE_ACTIVE)
		return
	fixeye_flags |= FIXEYE_ACTIVE
	SEND_SIGNAL(source, COMSIG_LIVING_FIXEYE_ENABLED, silent, forced)
	if(!silent)
		source.playsound_local(source, 'mojave/sound/ms13interface/fixeye_on.ogg', 25, FALSE, pressure_affected = FALSE)
	faced_dir = source.dir
	RegisterSignal(source, COMSIG_ATOM_PRE_DIR_CHANGE, .proc/before_dir_change)
	RegisterSignal(source, COMSIG_MOB_CLIENT_MOVED, .proc/on_client_move)
	RegisterSignal(source, COMSIG_MOB_CLICKON, .proc/on_clickon)

/// Safely (as in respecting requirements and toggle flag) calls disable_fixeye
/datum/component/fixeye/proc/safe_disable_fixeye(mob/living/source, silent = FALSE, forced = FALSE)
	SIGNAL_HANDLER

	if(!(fixeye_flags & FIXEYE_TOGGLED) && !(fixeye_flags & FIXEYE_ACTIVE))
		return TRUE
	else if((fixeye_flags & FIXEYE_LOCKED) && !forced)
		return TRUE
	fixeye_flags &= ~FIXEYE_TOGGLED
	disable_fixeye(source, silent, forced)
	return TRUE

/// Actually disables fixeye
/datum/component/fixeye/proc/disable_fixeye(mob/living/source, silent = TRUE, forced = TRUE)
	if(!(fixeye_flags & FIXEYE_ACTIVE))
		return
	fixeye_flags &= ~FIXEYE_ACTIVE
	faced_dir = NONE
	SEND_SIGNAL(source, COMSIG_LIVING_FIXEYE_DISABLED, silent, forced)
	if(!silent)
		source.playsound_local(source, 'mojave/sound/ms13interface/fixeye_off.ogg', 25, FALSE, pressure_affected = FALSE)
	UnregisterSignal(source, list(COMSIG_ATOM_PRE_DIR_CHANGE, COMSIG_MOB_CLIENT_MOVED, COMSIG_MOB_CLICKON))

/// Returns a field of flags that are in both the second arg and our fixeye_flags variable.
/datum/component/fixeye/proc/check_flags(mob/living/source, flags)
	SIGNAL_HANDLER

	return (fixeye_flags & flags)

/// Disables fixeye upon death if necessary
/datum/component/fixeye/proc/on_death(mob/living/source)
	SIGNAL_HANDLER

	safe_disable_fixeye(source)


/// Disables fixeye upon logout if necessary
/datum/component/fixeye/proc/on_logout(mob/living/source)
	SIGNAL_HANDLER

	safe_disable_fixeye(source)

/// Added movement delay if moving backwards
/datum/component/fixeye/proc/on_client_move(mob/living/source, client/client, direction, newloc, oldloc, added_delay)
	SIGNAL_HANDLER

	if(oldloc != newloc && (direction & REVERSE_DIR(source.dir)))
		client.move_delay += added_delay*0.5

/// Keep that fucking face right where we want it
/datum/component/fixeye/proc/before_dir_change(mob/living/source, dir, newdir)
	SIGNAL_HANDLER

	// You can change dir while holding alt, as a treat
	if(!(fixeye_flags & FIXEYE_LOCKED) && source.client.keys_held["Alt"])
		return

	return COMPONENT_NO_DIR_CHANGE

/// Handles dir change when clicking, and only when clicking (yes this is hacky)
/datum/component/fixeye/proc/on_clickon(mob/living/source, atom/A, params)
	SIGNAL_HANDLER

	//This should never happen, but just to be sure
	if(!(fixeye_flags & FIXEYE_ACTIVE))
		return

	//No dir change on shift click
	var/list/modifiers = params2list(params)
	if(LAZYACCESS(modifiers, SHIFT_CLICK))
		return

	//No dir change on hud elements
	if(istype(A, /atom/movable/screen))
		return
	//No dir change on inventory items
	else if(isitem(A))
		var/obj/item/item_atom = A
		if((item_atom.item_flags & IN_INVENTORY) || (item_atom.loc && SEND_SIGNAL(item_atom.loc, COMSIG_CONTAINS_STORAGE)))
			return
	//No dir change on self
	else if(A == source)
		return

	//This is stupid and evil but it works
	UnregisterSignal(source, COMSIG_ATOM_PRE_DIR_CHANGE)
	var/new_dir = get_dir(source, A)
	//Evil switch statement that turns diagonal dirs into acceptable cardinal ones so FoV doesn't shit itself
	if(!(new_dir in GLOB.cardinals))
		switch(new_dir)
			if(NORTHEAST)
				new_dir = NORTH
			if(NORTHWEST)
				new_dir = WEST
			if(SOUTHWEST)
				new_dir = SOUTH
			if(SOUTHEAST)
				new_dir = EAST
			else
				new_dir = NORTH
	source.setDir(new_dir)
	RegisterSignal(source, COMSIG_ATOM_PRE_DIR_CHANGE, .proc/before_dir_change)

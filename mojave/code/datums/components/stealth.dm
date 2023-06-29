// MOJAVE SUN STEALTH COMPONENT

/datum/component/stealth
	/// Tells the code whether stealth is on or off
	var/stealth_on = FALSE
	/// Sets the cooldown time for stealth as a number
	var/cooldown_time
	/// Sets how long you'll be stealthed as a number
	var/stealth_time
	/// How visible the user is when active, 0 = completely invisible
	var/visibility

	COOLDOWN_DECLARE(stealth_cooldown)

/datum/component/stealth/Initialize(mapload)
	. = ..()
	if(!isclothing(parent))
		return COMPONENT_INCOMPATIBLE
	cooldown_time = src.cooldown_time
	stealth_time = src.stealth_time
	visibility = src.visibility

/datum/component/stealth/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, .proc/dropped)
	RegisterSignal(parent, COMSIG_ITEM_ATTACK_SELF, .proc/attack_self)

/datum/component/stealth/proc/dropped(mob/user)
	SIGNAL_HANDLER

	if(stealth_on)
		disrupt(user)

/datum/component/stealth/proc/attack_self(mob/user)
	SIGNAL_HANDLER

	toggle(user)

/datum/component/stealth/proc/toggle(mob/user)
	if(!ishuman(user))
		return
	if(!COOLDOWN_FINISHED(src, stealth_cooldown))
		return
	playsound(get_turf(src), 'mojave/items/stealth/stealthboy_sfx/stealthboy_activate.ogg', 20, 50, 0)
	stealth_on = !stealth_on
	if(stealth_on)
		user.alpha = "[visibility]"
		to_chat(user, "<span class='notice'>You activate the [src].</span>")
		addtimer(CALLBACK(src, .proc/disrupt, user), "[stealth_time]" SECONDS)
		user.add_filter("stealth_ripple", 2, list("type" = "ripple", "flags" = WAVE_BOUNDED, "radius" = 0, "size" = 2))
		var/filter = user.get_filter("stealth_ripple")
		animate(filter, radius = 32, time = 15, size = 0, loop = 1)
	else
		user.alpha = initial(user.alpha)
		to_chat(user, "<span class='notice'>You deactivate the [src].</span>")
		COOLDOWN_START(src, stealth_cooldown, "[cooldown_time]" SECONDS)

/datum/component/stealth/proc/disrupt(mob/user)
	if(stealth_on)
		user.alpha = initial(user.alpha)
		stealth_on = FALSE
	COOLDOWN_START(src, stealth_cooldown, "[cooldown_time]" SECONDS)
	playsound(get_turf(src), 'mojave/items/stealth/stealthboy_sfx/stealthboy_deactivate.ogg', 20, 50, 0)
	to_chat(user, "<span class='notice'>[src] deactivates.</span>")

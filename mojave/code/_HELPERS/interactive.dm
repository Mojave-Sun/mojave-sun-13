//Used for interactive procs/code, ie. A interacting with B. Mojave Sun style//

//Interactivity//Rust-Like speedup do_after//
//Pretty buggy as of now, only use on things not in inventory//

/proc/do_after_interactive(mob/user, time = 3 SECONDS, atom/target, timed_action_flags = NONE, progress = TRUE, datum/callback/extra_checks, interaction_key, max_interact_count = 1, bonus_time = 0, focus_sound = null, type = /obj/effect/hallucination/simple/progress_focus)
	if(!user)
		return FALSE
	var/atom/target_loc = null
	if(target && !isturf(target))
		target_loc = target.loc

	if(!interaction_key && target)
		interaction_key = target //Use the direct ref to the target
	if(interaction_key) //Do we have a interaction_key now?
		var/current_interaction_count = LAZYACCESS(user.do_afters, interaction_key) || 0
		if(current_interaction_count >= max_interact_count) //We are at our peak
			return
		LAZYSET(user.do_afters, interaction_key, current_interaction_count + 1)

	var/atom/user_loc = user.loc

	var/drifting = FALSE
	if(SSmove_manager.processing_on(user, SSspacedrift))
		drifting = TRUE

	var/holding = user.get_active_held_item()
	time -= bonus_time
	time *= user.cached_multiplicative_actions_slowdown

	var/datum/progressbar/progbar
	if(progress)
		progbar = new(user, time, target || user, bonus_time, focus_sound, type)

	var/endtime = world.time + time
	var/starttime = world.time
	. = TRUE
	while (world.time + progbar?.bonus_progress < endtime)
		stoplag(1)

		if(!QDELETED(progbar))
			progbar.update(world.time - starttime)

		if(drifting && !SSmove_manager.processing_on(user, SSspacedrift))
			drifting = FALSE
			user_loc = user.loc

		if(
			QDELETED(user) \
			|| (!(timed_action_flags & IGNORE_USER_LOC_CHANGE) && !drifting && user.loc != user_loc) \
			|| (!(timed_action_flags & IGNORE_HELD_ITEM) && user.get_active_held_item() != holding) \
			|| (!(timed_action_flags & IGNORE_INCAPACITATED) && HAS_TRAIT(user, TRAIT_INCAPACITATED)) \
			|| (extra_checks && !extra_checks.Invoke()) \
		)
			. = FALSE
			break

		if(
			!(timed_action_flags & IGNORE_TARGET_LOC_CHANGE) \
			&& !drifting \
			&& !QDELETED(target_loc) \
			&& (QDELETED(target) || target_loc != target.loc) \
			&& ((user_loc != target_loc || target_loc != user)) \
			)
			. = FALSE
			break

	if(!QDELETED(progbar))
		progbar.end_progress()

	if(interaction_key)
		LAZYREMOVE(user.do_afters, interaction_key)

/obj/effect/hallucination/simple/progress_focus
	name = "focus"
	desc = "If I focus, I might be able to speed up my progress a little bit."
	image_icon = 'mojave/icons/effects/interactive.dmi'
	image_state = "progress_focus"
	image_layer = HUD_PLANE
	///The progress bar that this booster is linked to
	var/datum/progressbar/linked_bar
	///How much this focus helps overall progress
	var/time_per_click
	///Sound played when clicked
	var/focus_sound = 'sound/machines/click.ogg'
	///Secondary object used to block clicks, provide special animation, etc.
	var/obj/effect/hallucination/simple/extra_effect
	///How many times this focus can be used
	var/max_uses
	///How many times this focus has been used
	var/uses = 0
	///The max frequency that this can be used per second
	var/max_use_frequency = 1.5

/obj/effect/hallucination/simple/progress_focus/Initialize(mapload, mob/target_mob, datum/progressbar/target_bar, bonus_time, f_sound)
	. = ..()
	var/fastest_possible_time = target_bar.goal - bonus_time
	max_uses = round(fastest_possible_time/10/max_use_frequency, 1)
	target = target_mob
	linked_bar = target_bar
	time_per_click = bonus_time/max_uses
	if (f_sound)
		focus_sound = f_sound
	build_extra_effect()

/obj/effect/hallucination/simple/progress_focus/proc/build_extra_effect()
	extra_effect = new /obj/effect/hallucination/simple/progress_trap(get_turf(src), target, linked_bar, time_per_click)

/obj/effect/hallucination/simple/progress_focus/attackby(obj/item/I, mob/user, params)
	. = ..()
	on_boost(user)
	uses += 1
	if (uses >= max_uses)
		linked_bar.booster = null
		qdel(src)

/obj/effect/hallucination/simple/progress_focus/proc/on_boost(mob/user)
	user.playsound_local(user, focus_sound, 50, TRUE)
	linked_bar.boost_progress(time_per_click)
	var/new_x = rand(-12,12)
	var/new_y = rand(-12,12)
	update_icon(image_state, image_icon, new_px = new_x, new_py = new_y)
	extra_effect.update_icon(extra_effect.image_state, extra_effect.image_icon, new_px = new_x, new_py = new_y)

/obj/effect/hallucination/simple/progress_focus/Destroy()
	. = ..()
	QDEL_NULL(extra_effect)

/obj/effect/hallucination/simple/progress_trap
	name = ""
	desc = ""
	image_icon = 'mojave/icons/effects/interactive.dmi'
	image_state = "progress_trap"
	image_layer = ABOVE_HUD_PLANE
	///The progress bar that this booster is linked to
	var/datum/progressbar/linked_bar
	///How much this focus hurts overall progress
	var/loss_per_click

/obj/effect/hallucination/simple/progress_trap/Initialize(mapload, mob/target_mob, datum/progressbar/target_bar, time_delta)
	. = ..()
	target = target_mob
	linked_bar = target_bar
	loss_per_click = -1 * time_delta

/obj/effect/hallucination/simple/progress_trap/attackby(obj/item/I, mob/user, params)
	. = ..()
	linked_bar.boost_progress(loss_per_click)
	user.playsound_local(user, 'sound/machines/buzz-sigh.ogg', 50, TRUE)

/obj/effect/hallucination/simple/progress_focus/skillcheck
	name = "skill check"
	desc = "If I get my timing right, I could get my work done a little more efficiently."
	image_state = "skill_ring"
	max_use_frequency = 2.5
	var/start_time
	var/spin_speed = 0.5 SECONDS

/obj/effect/hallucination/simple/progress_focus/skillcheck/Initialize(mapload, mob/target_mob, datum/progressbar/target_bar, bonus_time, f_sound)
	. = ..()
	extra_effect.SpinAnimation(spin_speed, -1)
	start_time = REALTIMEOFDAY

/obj/effect/hallucination/simple/progress_focus/skillcheck/build_extra_effect()
	extra_effect = new /obj/effect/hallucination/simple/skill_marker(get_turf(src), target)

/obj/effect/hallucination/simple/progress_focus/skillcheck/on_boost(mob/user)
	var/current_time = REALTIMEOFDAY

	var/time_diff = (current_time - start_time) % spin_speed
	var/degrees = time_diff * 360/spin_speed
	var/obj/effect/hallucination/simple/skill_marker/temp_effect = new(get_turf(src), target)
	temp_effect.transform = matrix().Turn(degrees)
	QDEL_IN(temp_effect, spin_speed)
	if (time_diff > (spin_speed/2 * 0.6) && time_diff < spin_speed - (spin_speed/2 * 0.6))
		linked_bar.boost_progress(time_per_click)
		user.playsound_local(user, focus_sound, 50, TRUE)
	else
		linked_bar.boost_progress(-1 * time_per_click)
		user.playsound_local(user, 'sound/machines/buzz-sigh.ogg', 50, TRUE)

/obj/effect/hallucination/simple/skill_marker
	name = ""
	desc = ""
	image_icon = 'mojave/icons/effects/interactive.dmi'
	image_state = "skill_arrow"
	image_layer = ABOVE_HUD_PLANE


//

/obj/structure/ladder/ms13
	name = "ladder"
	desc = "A questionable metal ladder. There's got to be stairs around, right?"
	icon = 'mojave/icons/structure/ladders.dmi'
	icon_state = "ladder10"
	resistance_flags = INDESTRUCTIBLE
	travel_time = 2 SECONDS

// TG code edited for SFX //

/obj/structure/ladder/ms13/travel(going_up, mob/user, is_ghost, obj/structure/ladder/ladder)
	if(!is_ghost)
		ladder.add_fingerprint(user)
		if(!do_after(user, travel_time, target = src))
			return
		playsound(user, pick('mojave/sound/ms13effects/ladder1.ogg',
							'mojave/sound/ms13effects/ladder2.ogg',
							'mojave/sound/ms13effects/ladder3.ogg',
							'mojave/sound/ms13effects/ladder4.ogg'), 60)
		show_fluff_message(going_up, user)

	var/turf/target = get_turf(ladder)
	user.zMove(target = target, z_move_flags = ZMOVE_CHECK_PULLEDBY|ZMOVE_ALLOW_BUCKLED|ZMOVE_INCLUDE_PULLED)
	ladder.use(user) //reopening ladder radial menu ahead

// TG code edit to add a check for blocked ladders //

/obj/structure/ladder/ms13/use(mob/user, is_ghost=FALSE)
	if (!is_ghost && !in_range(src, user))
		return

	if(obstructed)
		to_chat(user, span_warning("It's blocked, you'll have to find a way to change that."))
		return

	var/list/tool_list = list()
	if (up)
		tool_list["Up"] = image(icon = 'icons/testing/turf_analysis.dmi', icon_state = "red_arrow", dir = NORTH)
	if (down)
		tool_list["Down"] = image(icon = 'icons/testing/turf_analysis.dmi', icon_state = "red_arrow", dir = SOUTH)
	if (!length(tool_list))
		to_chat(user, span_warning("[src] doesn't seem to lead anywhere!"))
		return

	var/result = show_radial_menu(user, src, tool_list, custom_check = CALLBACK(src, .proc/check_menu, user, is_ghost), require_near = !is_ghost, tooltips = TRUE)
	if (!is_ghost && !in_range(src, user))
		return  // nice try
	switch(result)
		if("Up")
			if(up.obstructed)
				to_chat(user, span_warning("[src] is obstructed!"))
				return
			else
				travel(TRUE, user, is_ghost, up)
		if("Down")
			travel(FALSE, user, is_ghost, down)
		if("Cancel")
			return

	if(!is_ghost)
		add_fingerprint(user)

// Subtypes //

/obj/structure/ladder/ms13/manhole
	name = "manhole"
	desc = "A manhole ladder, you could probably push the cover off from here, or try dragging it back on."
	travel_time = 2 SECONDS
	pixel_y = 7
	icon_state = "manhole_closed"

/obj/structure/ladder/ms13/manhole/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Use <b>RIGHT-CLICK</b> on [src] to open or close it.</span>"

/obj/structure/ladder/ms13/manhole/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return

	. = SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	var/obj/item/bodypart/arm = user.get_bodypart(user.active_hand_index % 2 ? BODY_ZONE_L_ARM : BODY_ZONE_R_ARM)

	if(!down && up.obstructed)
		if(do_after(user, 10 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_LADDERBLOCKERS))
			up.icon_state = "manhole_open"
			up.desc = "An open manhole, it still stinks even after all these years. You could use a crowbar or your hands to slide the cover back on."
			up.obstructed = FALSE
			obstructed = FALSE
			to_chat(user, span_notice("You push up on the cover from below, and slide it off."))
			return

	if(!down && !up.obstructed)
		if(do_after(user, 10 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_LADDERBLOCKERS))
			up.icon_state = "manhole_closed"
			up.desc = "A heavy stamped manhole. You could probably pry it up with a crowbar to access the lower town systems. Or, try using your hands..."
			up.obstructed = TRUE
			obstructed = TRUE
			to_chat(user, span_notice("You carefully drag and slide the cover back on from below."))
			return

	else
		if(obstructed)
			to_chat(user, span_warning("It's so heavy! Surely there's a better way of doing this."))
			if(do_after(user, 10 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_LADDERBLOCKERS))
				obstructed = FALSE
				icon_state = "manhole_open"
				desc = "An open manhole, it still stinks even after all these years. You could use a crowbar or your hands to slide the cover back on."
				to_chat(user, span_notice("With a lot of effort, you manage to finally get the cover off."))
				if(prob(10))
					to_chat(user, span_userdanger("MY ARM! THE PAIN!"))
					arm.force_wound_upwards(/datum/wound/blunt/moderate)
					arm.receive_damage(10)
		else
			if(do_after(user, 10 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_LADDERBLOCKERS))
				obstructed = TRUE
				icon_state = "manhole_closed"
				desc = "A heavy stamped manhole. You could probably pry it up with a crowbar to access the lower town systems. Or, try using your hands..."
				to_chat(user, span_notice("You carefully slide the cover back on the manhole."))


/obj/structure/ladder/ms13/manhole/crowbar_act_secondary(mob/living/user, obj/item/tool)
	if(down && obstructed)
		if(do_after(user, 4 SECONDS * tool.toolspeed, target = src, interaction_key = DOAFTER_SOURCE_LADDERBLOCKERS))
			obstructed = FALSE
			icon_state = "manhole_open"
			desc = "An open manhole, it still stinks even after all these years. You could use a crowbar or your hands to slide the cover back on."
			to_chat(user, span_notice("You wedge the crowbar in and pull the cover off the manhole."))
			return

	if(down && !obstructed)
		if(do_after(user, 4 SECONDS * tool.toolspeed, target = src, interaction_key = DOAFTER_SOURCE_LADDERBLOCKERS))
			obstructed = TRUE
			icon_state = "manhole_closed"
			desc = "A heavy stamped manhole. You could probably pry it up with a crowbar to access the lower town systems. Or, try using your hands..."
			to_chat(user, span_notice("You hook the edge of the manhole cover with your crowbar and slide it back on."))
			return

/obj/structure/ladder/ms13/manhole/update_icon_state()
	. = ..()
	if(down)
		name = "manhole entry"
		desc = "A heavy stamped manhole. You could probably pry it up with a crowbar to access the lower town systems."
		icon_state = "manhole_closed"
		obstructed = TRUE
	else
		icon_state = "ladder10"

/obj/structure/ladder/ms13/bunker
	name = "bunker"
	icon_state = "bunker_closed"
	travel_time = 2 SECONDS

/obj/structure/ladder/ms13/bunker/welder_act_secondary(mob/living/user, obj/item/I)
	if(down && obstructed)
		if(!I.tool_start_check(user, amount=0))
			return TRUE
		if(I.use_tool(src, user, 15 SECONDS, volume=80))
			obstructed = FALSE
			icon_state = "bunker_open"
			desc = "Looks like the entrance to some bunker. The bars on the grate have been cut off, allowing entry."
			to_chat(user, span_notice("You cut-weld the bars off the grate, letting you slip past."))


/obj/structure/ladder/ms13/bunker/update_icon_state()
	. = ..()
	if(down)
		name = "bunker grate"
		desc = "It looks like a grate, leading to some sort of bunker. You could probably weld the bars off."
		icon_state = "bunker_closed"
		obstructed = TRUE
	else
		icon_state = "ladder10"

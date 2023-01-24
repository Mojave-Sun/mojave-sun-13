/mob/living/proc/do_zoom()
	var/do_normal_zoom = TRUE
	var/stored_fov = 0
	if(!zoomed)
		if(src.body_position == LYING_DOWN)
			return
		if(do_normal_zoom)
			var/_x = 0
			var/_y = 0
			switch(dir)
				if (NORTH)
					_y = 7
				if (EAST)
					_x = 7
				if (SOUTH)
					_y = -7
				if (WEST)
					_x = -7
			if(ishuman(src))
				var/mob/living/carbon/human/H = src
				for(var/trait_type in fov_traits)
					var/fov_type = fov_traits[trait_type]
					if(fov_type > stored_fov)
						stored_fov = fov_type
						fov_view = 0
						visible_message(span_notice("Stored FOV [stored_fov] in the balls"), vision_distance = 2)
				H.zoomed = TRUE
				animate(client, pixel_x = world.icon_size*_x, pixel_y = world.icon_size*_y, time = 5, easing = SINE_EASING)
				visible_message(span_notice("[src] peers into the distance"), vision_distance = 2)
				overlay_fullscreen("peeper", /atom/movable/screen/fullscreen/crit/vision)
				add_movespeed_modifier(/datum/movespeed_modifier/ms13/peeper) //Too busy peeping the horror to walk the chungus

	else
		AddComponent(/datum/component/fov_handler, stored_fov)
		stored_fov = 0
		visible_message(span_notice("Stored FOV [stored_fov] in the balls"), vision_distance = 2)
		reset_zoom()
	update_fov_client()

/mob/living/proc/reset_zoom()
	animate(client, pixel_x = 0, pixel_y = 0, time = 2, easing = SINE_EASING)
	remove_movespeed_modifier(/datum/movespeed_modifier/ms13/peeper) //Too busy peeping the horror to walk the chungus
	clear_fullscreen("peeper")
	visible_message(span_notice("[src] focuses near themselves again."), vision_distance = 2)
	zoomed = FALSE

/datum/movespeed_modifier/ms13/peeper
	multiplicative_slowdown = 1

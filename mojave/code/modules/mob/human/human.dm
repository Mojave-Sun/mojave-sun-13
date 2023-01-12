/mob/living/proc/do_zoom()
	var/do_normal_zoom = TRUE
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
				H.zoomed = TRUE
				animate(client, pixel_x = world.icon_size*_x, pixel_y = world.icon_size*_y, time = 5, easing = SINE_EASING)
				face_atom(dir)//Face what we're zoomed in on.
	else
		if(do_normal_zoom)
			if(ishuman(src))
				animate(client, pixel_x = 0, pixel_y = 0, time = 2, easing = SINE_EASING)
				face_atom(FALSE)//Reset us back to normal.
		zoomed = FALSE

/mob/living/carbon/human/proc/reset_zoom()
	animate(client, pixel_x = 0, pixel_y = 0, time = 2, easing = SINE_EASING)
	zoomed = FALSE

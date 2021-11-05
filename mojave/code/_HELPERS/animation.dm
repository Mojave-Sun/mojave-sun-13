
///Makes a recoil-like animation on the mob camera.
/proc/recoil_camera(mob/M, duration, backtime_duration, strength, angle)
	if(!M || !M.client)
		return
	var/client/sufferer = M.client
	strength *= world.icon_size
	var/oldx = sufferer.pixel_x
	var/oldy = sufferer.pixel_y

	//get pixels to move the camera in an angle
	var/mpx = sin(angle) * strength
	var/mpy = cos(angle) * strength
	animate(sufferer, pixel_x = oldx+mpx, pixel_y = oldy+mpy, time = duration, flags = ANIMATION_RELATIVE)
	animate(pixel_x = oldx, pixel_y = oldy, time = backtime_duration, easing = BACK_EASING)

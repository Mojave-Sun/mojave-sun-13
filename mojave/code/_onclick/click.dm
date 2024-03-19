/mob/alt_click_on_secondary(var/atom/A)
	A.alt_click_on_secondary(src)
/*
/atom/proc/alt_click_on_secondary(var/mob/user)
	return
*/
/atom/alt_click_on_secondary(var/mob/living/user)
	if(!istype(user))
		return
	user.face_atom(src)//Face what we're zoomed in on.
	user.do_zoom(src)
	return

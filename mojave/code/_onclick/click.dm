/mob/alt_click_on_secondary(var/atom/A)
	A.alt_click_on_secondary(src)
/*
/atom/proc/alt_click_on_secondary(var/mob/user)
	return
*/
/atom/alt_click_on_secondary(var/mob/living/user)
	if(!istype(user))
		return
	if(user.body_position == LYING_DOWN)
		return
	user.visible_message("<span class='notice'>[user] peers into the distance.</span>")
	user.face_atom(src)
	user.do_zoom(src)
	return

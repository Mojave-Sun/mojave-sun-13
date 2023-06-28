/mob/living/Login()
	. = ..()
	if(!. || !client)
		return FALSE

	update_nv_client()

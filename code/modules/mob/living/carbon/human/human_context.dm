/mob/living/carbon/human/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()
	var/face_name = get_face_name("")
	if(user.mind?.guestbook && (user != src) && face_name)
		if(user.mind.guestbook.get_known_name(user, src, face_name))
			context[SCREENTIP_CONTEXT_CTRL_SHIFT_LMB] = "Edit guestbook"
		else
			context[SCREENTIP_CONTEXT_CTRL_SHIFT_LMB] = "Add to guestbook"

	if (!ishuman(user))
		return .

	if (user == src)
		return .

	if (pulledby == user)
		switch (user.grab_state)
			if (GRAB_PASSIVE)
				context[SCREENTIP_CONTEXT_CTRL_LMB] = "Grip"
			if (GRAB_AGGRESSIVE)
				context[SCREENTIP_CONTEXT_CTRL_LMB] = "Choke"
			if (GRAB_NECK)
				context[SCREENTIP_CONTEXT_CTRL_LMB] = "Strangle"
			else
				return .
	else
		context[SCREENTIP_CONTEXT_CTRL_LMB] = "Pull"

	return CONTEXTUAL_SCREENTIP_SET

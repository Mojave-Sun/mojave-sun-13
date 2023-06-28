/// Examine messages
/mob/living/carbon/on_examine_atom(atom/examined, examine_more = FALSE)
	if(!client)
		return

	if((src == examined) || (!DirectAccess(examined) && get_dist(src, examined) > EYE_CONTACT_RANGE) || (stat >= UNCONSCIOUS) || is_blind())
		return

	if(CHECK_BITFIELD(wear_mask?.flags_inv, HIDEFACE) || CHECK_BITFIELD(head?.flags_inv, HIDEFACE) || CHECK_BITFIELD(glasses?.flags_inv, HIDEFACE))
		return

	if(!ismob(examined))
		visible_message(span_boldnotice("<span style='color: [chat_color];'><b>[src]</b></span> looks at [examined]."), \
						span_boldnotice("I look at [examined]."), \
						vision_distance = EYE_CONTACT_RANGE)
	else
		var/mob/mob_examined = examined
		visible_message(span_boldnotice("<span style='color: [chat_color];'><b>[src]</b></span> looks at \
						<span style='color: [mob_examined.chat_color];'><b>[examined]</b></span>."), \
						span_boldnotice("I look at <b>[examined]</b>."), \
						vision_distance = EYE_CONTACT_RANGE)

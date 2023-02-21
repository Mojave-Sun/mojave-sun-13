/obj/item/bodypart
	/// The meat we turn into when butchered yum
	var/meat_type = /obj/item/food/meat/slab/ms13/bodypart

/obj/item/bodypart/attackby(obj/item/weapon, mob/user, params)
	//bad component usage omg!!!!
	var/datum/component/butchering/butchering_component = weapon.GetComponent(/datum/component/butchering)
	if(butchering_component?.butchering_enabled)
		add_fingerprint(user)
		if(length(contents))
			playsound(loc, 'sound/weapons/slice.ogg', 50, TRUE, -1)
			user.visible_message(span_warning("[user] begins to tear open [src]."),\
				span_notice("You begin to tear open [src]..."))
			if(do_after(user, FLOOR(butchering_component.speed, 1), target = src))
				drop_organs(user, TRUE)
				visible_message(span_warning("\The [src] spills it's organs out."))
				playsound(src, 'mojave/sound/ms13gore/flesh1.ogg', 65, FALSE)
			return
		//sorry we can't really use the processable component here
		if(!meat_type)
			to_chat(user, span_warning("\The [src] cannot be butchered for any meat."))
			return
		user.visible_message(span_warning("[user] begins to butcher [src]..."),\
				span_notice("You begin to butcher [src]..."))
		if(do_after(user, FLOOR(butchering_component.speed, 1), target = src))
			user.visible_message(span_warning("[user] butchers [src]."),\
					span_notice("You butcher [src]."))
			playsound(src, 'mojave/sound/ms13gore/flesh2.ogg', 65, FALSE)
			new meat_type(drop_location())
			qdel(src)
		return
	return ..()

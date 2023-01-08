//MS13 SHUTTERS STORAGE//

//MS13 BASE SHUTTER//

/obj/machinery/door/poddoor/shutters/ms13
	desc = "Mechanical pre-war shutters, somewhat still functional."
	icon = 'mojave/icons/structure/shutters.dmi'
	plane = ABOVE_GAME_PLANE
	layer = ABOVE_MOB_LAYER
	closingLayer = ABOVE_MOB_LAYER
	hitted_sound = 'mojave/sound/ms13effects/impact/metal/metal_crunch_2.wav'
	max_integrity = 800 // hardy bois
	//Used for the icon planar (horizontal or vertical) as stated on the sprite in the dmi ie. opening-left-[HERE]-red
	var/icon_plane
	//Used for the icon direction as stated on the sprite in the dmi ie. opening-[HERE]-horizon-red
	var/icon_direction
	//Used for the icon colour descriptor ie. opening-left-horizon-[HERE]
	var/color_type
	//Used for pre-open states
	var/pre_open = FALSE

/obj/machinery/door/poddoor/shutters/ms13/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	return

/obj/machinery/door/poddoor/shutters/ms13/Initialize()
	. = ..()
	update_appearance()
	if(pre_open)
		density = FALSE
		opacity = FALSE

/obj/machinery/door/poddoor/shutters/ms13/crush()
	for(var/mob/living/L in get_turf(src))
		L.visible_message(span_warning("[src] closes on [L], crushing [L.p_them()]!"), span_userdanger("[src] closes on you and crushes you!"))
		SEND_SIGNAL(L, COMSIG_LIVING_DOORCRUSHED, src)
		if(ishuman(L)) //For humans
			L.adjustBruteLoss(50)
			L.emote("scream")
			L.Paralyze(50)
		else //for simple_animals & borgs
			L.adjustBruteLoss(DOOR_CRUSH_DAMAGE)
		var/turf/location = get_turf(src)
		L.add_splatter_floor(location)
		log_combat(src, L, "crushed")

/obj/machinery/door/poddoor/shutters/ms13/do_animate(animation)
	switch(animation)
		if("opening")
			flick("opening-[icon_direction]-[icon_plane]-[color_type]", src)
			playsound(src, 'mojave/sound/ms13effects/garage_open.ogg', 30, TRUE)
		if("closing")
			flick("closing-[icon_direction]-[icon_plane]-[color_type]", src)
			playsound(src, 'mojave/sound/ms13effects/garage_close.ogg', 30, TRUE)

/obj/machinery/door/poddoor/shutters/ms13/update_icon_state()
	..()
	switch(density)
		if(TRUE)
			icon_state = "closed-[icon_direction]-[icon_plane]-[color_type]"
		if(FALSE)
			icon_state = "open-[icon_direction]-[icon_plane]-[color_type]"

/obj/machinery/door/poddoor/shutters/ms13/attackby(obj/item/I, mob/living/user, params)
	if(!user.combat_mode && !(I.item_flags & NOBLUDGEON))
		return attack_hand(user)

/obj/machinery/door/poddoor/shutters/ms13/default_deconstruction_screwdriver(mob/user, icon_state_open, icon_state_closed, obj/item/screwdriver)
	return

/obj/machinery/door/poddoor/shutters/ms13/horizontal
	icon_plane = "horizon"

/obj/machinery/door/poddoor/shutters/ms13/horizontal/indestructible
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/door/poddoor/shutters/ms13/vertical
	icon_plane = "vertical"
	pixel_y = 16

/obj/machinery/door/poddoor/shutters/ms13/vertical/indestructible
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

//MS13 RED SHUTTER//

//Destructible//

/obj/machinery/door/poddoor/shutters/ms13/horizontal/red/left
	icon_state = "closed-left-horizon-red"
	icon_direction = "left"
	color_type = "red"

/obj/machinery/door/poddoor/shutters/ms13/horizontal/red/left/pre_open
	icon_state = "open-left-horizon-red"
	pre_open = TRUE

/obj/machinery/door/poddoor/shutters/ms13/horizontal/red/mid
	icon_state = "closed-mid-horizon-red"
	icon_direction = "mid"
	color_type = "red"

/obj/machinery/door/poddoor/shutters/ms13/horizontal/red/mid/pre_open
	icon_state = "open-mid-horizon-red"
	pre_open = TRUE

/obj/machinery/door/poddoor/shutters/ms13/horizontal/red/right
	icon_state = "closed-right-horizon-red"
	icon_direction = "right"
	color_type = "red"

/obj/machinery/door/poddoor/shutters/ms13/horizontal/red/right/pre_open
	icon_state = "open-right-horizon-red"
	pre_open = TRUE

/obj/machinery/door/poddoor/shutters/ms13/horizontal/red/solo
	icon_state = "closed-solo-horizon-red"
	icon_direction = "solo"
	color_type = "red"

/obj/machinery/door/poddoor/shutters/ms13/horizontal/red/solo/pre_open
	icon_state = "open-solo-horizon-red"
	pre_open = TRUE

/obj/machinery/door/poddoor/shutters/ms13/vertical/red/mid
	icon_state = "closed-mid-vertical-red"
	icon_direction = "mid"
	color_type = "red"

/obj/machinery/door/poddoor/shutters/ms13/vertical/red/mid/pre_open
	icon_state = "open-mid-vertical-red"
	pre_open = TRUE

/obj/machinery/door/poddoor/shutters/ms13/vertical/red/top
	icon_state = "closed-top-vertical-red"
	icon_direction = "top"
	color_type = "red"

/obj/machinery/door/poddoor/shutters/ms13/vertical/red/top/pre_open
	icon_state = "open-top-vertical-red"
	pre_open = TRUE

//Indestructible//

/obj/machinery/door/poddoor/shutters/ms13/horizontal/indestructible/red/left
	icon_state = "closed-left-horizon-red"
	icon_direction = "left"
	color_type = "red"

/obj/machinery/door/poddoor/shutters/ms13/horizontal/indestructible/red/left/pre_open
	icon_state = "open-left-horizon-red"
	pre_open = TRUE

/obj/machinery/door/poddoor/shutters/ms13/horizontal/indestructible/red/mid
	icon_state = "closed-mid-horizon-red"
	icon_direction = "mid"
	color_type = "red"

/obj/machinery/door/poddoor/shutters/ms13/horizontal/indestructible/red/mid/pre_open
	icon_state = "open-mid-horizon-red"
	pre_open = TRUE

/obj/machinery/door/poddoor/shutters/ms13/horizontal/indestructible/red/right
	icon_state = "closed-right-horizon-red"
	icon_direction = "right"
	color_type = "red"

/obj/machinery/door/poddoor/shutters/ms13/horizontal/indestructible/red/right/pre_open
	icon_state = "open-right-horizon-red"
	pre_open = TRUE

/obj/machinery/door/poddoor/shutters/ms13/horizontal/indestructible/red/solo
	icon_state = "closed-solo-horizon-red"
	icon_direction = "solo"
	color_type = "red"

/obj/machinery/door/poddoor/shutters/ms13/horizontal/indestructible/red/solo/pre_open
	icon_state = "open-solo-horizon-red"
	pre_open = TRUE

/obj/machinery/door/poddoor/shutters/ms13/vertical/indestructible/red/mid
	icon_state = "closed-mid-vertical-red"
	icon_direction = "mid"
	color_type = "red"

/obj/machinery/door/poddoor/shutters/ms13/vertical/indestructible/red/mid/pre_open
	icon_state = "open-mid-vertical-red"
	pre_open = TRUE

/obj/machinery/door/poddoor/shutters/ms13/vertical/indestructible/red/top
	icon_state = "closed-top-vertical-red"
	icon_direction = "top"
	color_type = "red"

/obj/machinery/door/poddoor/shutters/ms13/vertical/indestructible/red/top/pre_open
	icon_state = "open-top-vertical-red"
	pre_open = TRUE

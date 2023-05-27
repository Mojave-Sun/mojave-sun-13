
/mob
	var/list/stored_alert_text = list()

/mob/proc/throw_alert_text(type, text, override = FALSE)

	if(!text || QDELETED(src))
		return

	var/atom/movable/screen/alert/text/thealert
	thealert = new type(text = text)
	thealert.override_alerts = override
	if(override)
		thealert.timeout = null
	thealert.owner = src

	stored_alert_text |= thealert
	if(client && hud_used)
		hud_used.reorganize_alert_texts()
	thealert.transform = matrix(-32, 6, MATRIX_TRANSLATE)
	animate(thealert, transform = matrix(), time = 2.5, easing = CUBIC_EASING)

	if(thealert.timeout)
		addtimer(CALLBACK(src, .proc/alert_text_timeout, thealert), thealert.timeout)
	return thealert

/mob/proc/alert_text_timeout(atom/movable/screen/alert/text/alert)
	clear_alert_text(alert)

// Proc to clear an existing alert.
/mob/proc/clear_alert_text(atom/movable/screen/alert/text/alert, clear_override = FALSE)
	if(!alert)
		return 0
	if(alert.override_alerts && !clear_override)
		return 0

	stored_alert_text -= alert
	if(client && hud_used)
		hud_used.reorganize_alert_texts()
		client.screen -= alert
	qdel(alert)

/atom/movable/screen/alert/text
	icon = 'mojave/icons/hud/ms_ui_alerttext.dmi'
	icon_state = "empty"
	name = "Alert Text"
	timeout = 5 SECONDS

	var/message = "Test"

/atom/movable/screen/alert/text/MouseEntered(location, control, params)
	return

/atom/movable/screen/alert/text/MouseExited()
	return

/atom/movable/screen/alert/text/New(loc, text)
	if(text)
		message = text
	. = ..()

/atom/movable/screen/alert/text/Initialize(mapload)
	. = ..()
	var/image/I = image(null)
	I.layer = FLY_LAYER
	I.maptext_width = 96
	I.maptext_height = 24
	I.plane =  ABOVE_HUD_PLANE
	I.pixel_x = -round(I.maptext_width/2) + 70
	I.pixel_y = 2

	var/style = "font-family: 'Small Fonts'; font-size: 7px; color: #f0dd5f;"
	I.maptext = "<center><span style=\"[style]\">[message]</span></center>"

	add_overlay(I)

/atom/movable/screen/alert/text/brutal
	icon_state = "brutal"
	name = "Brutal"
	message = "You have become addicted to Vodka."

/atom/movable/screen/alert/text/dead
	icon_state = "dead"
	name = "Dead"

/atom/movable/screen/alert/text/cry
	icon_state = "cry"
	name = "Cry"

/atom/movable/screen/alert/text/sad
	icon_state = "sad"
	name = "Sad"

/atom/movable/screen/alert/text/nohappy
	icon_state = "nohappy"
	name = "Nohappy"

/atom/movable/screen/alert/text/normal
	icon_state = "normal"
	name = "Normal"

/atom/movable/screen/alert/text/smallhappy
	icon_state = "smallhappy"
	name = "Small happy"

/atom/movable/screen/alert/text/happy
	icon_state = "happy"
	name = "Happy"

/atom/movable/screen/alert/text/joke
	icon_state = "joke"
	name = "Joke"

// Re-render all alert texts - also called in /datum/hud/show_hud() because it's needed there
/datum/hud/proc/reorganize_alert_texts(mob/viewmob)
	var/mob/screenmob = viewmob || mymob
	if(!screenmob.client)
		return FALSE
	var/list/alert_texts = mymob.stored_alert_text
	if(!hud_shown)
		for(var/atom/movable/screen/alert/text/i in alert_texts)
			screenmob.client.screen -= i
		return TRUE
	var/iCounter = 0
	for(var/atom/movable/screen/alert/text/i in alert_texts)
		iCounter++
		switch(iCounter)
			if(1)
				. = ui_alerttext1
			if(2)
				. = ui_alerttext2
			if(3)
				. = ui_alerttext3
			if(4)
				. = ui_alerttext4
			if(5)
				. = ui_alerttext5 // Right now there's 5 slots
			else
				. = ""
		i.screen_loc = .
		screenmob.client.screen |= i
	if(!viewmob)
		for(var/M in mymob.observers)
			reorganize_alert_texts(M)
	return TRUE

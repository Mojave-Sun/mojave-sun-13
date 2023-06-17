// This will allow you to show an icon in the browse window
// This is added to mob so that it can be used without a reference to the browser object
/mob/proc/browse_rsc_icon(icon, icon_state, dir = -1)

//// Actual Terminals ////
/obj/machinery/ms13/terminal
	name = "desktop terminal"
	desc = "A RobCo Industries terminal, widely available for commercial and private use before the war."
	icon = 'mojave/icons/structure/terminals.dmi'
	icon_state = "terminal"
	light_color = LIGHT_COLOR_GREEN
	pixel_y = 8
	layer = BELOW_OBJ_LAYER
	max_integrity = 500 // Hearty lil things.
	integrity_failure = 0
	idle_power_usage = 300
	active_power_usage = 300
	density = TRUE
	var/broken = FALSE // Used for pre-broken terminals
	var/active = TRUE // These should usually probably start off
	var/screen_icon = "terminal_screen" // The icon grabbed for the screen icon overlay
	var/termtag = "Home" // We use this for flavor.
	var/termnumber = null // Flavor
	var/mode = 0 // What page we're on. 0 is the main menu. 1 is the text editor. 2 is the document viewer. 3 is the optional utility page
	var/system = "ROBCO50" // Flavour text on the top indicating system type. Very awesome stuff.
	var/prog_notekeeper = TRUE // Almost all consoles have the word processor installed, but we can remove it if we want to
	var/remote_capability = FALSE // For special terminals that can activate certain things. Wall terminals / The quirky ones with antennas namely
	var/rigged = FALSE // Ultra cursed var. If true, terminal explodes violently on certain interaction. Delightfully devilish.
	var/riggable = TRUE // To determine rigging eligibility
	var/datum/looping_sound/ms13/terminal/soundloop
	var/password_needed = FALSE
	var/password
	var/unlocked = FALSE
	var/joker_titles = list("Safe codes",
	"Stash location",
	"About the safe",
	"Weapons cache details",
	"Your payment",
	"Pickup location",
	"Something really important",
	"Looking for a good time",
	"Power Armor unlock code",
	"Bunker Location",
	"Free caps") // Suffer
	var/chosen_joker = ""
	//Used for the Background
	var/main_color = "#062113"
	//Used for the Text
	var/secondary_color = "#4aed92"

// Document variables
	var/doc_title_1 = "readme"
	var/doc_content_1 = ""
	var/doc_title_2 = ""
	var/doc_content_2 = ""
	var/doc_title_3 = ""
	var/doc_content_3 = ""
	var/doc_title_4 = ""
	var/doc_content_4 = ""
	var/doc_title_5 = ""
	var/doc_content_5 = ""
	var/loaded_title = ""
	var/loaded_content = ""

// Signal variables
	var/signal_title_1 = ""
	var/signal_id_1 = "null"
	var/signal_title_2 = ""
	var/signal_id_2 = "null"
	var/signal_title_3 = ""
	var/signal_id_3 = "null"
	var/signal_title_4 = ""
	var/signal_id_4 = "null"
	var/signal_title_5 = ""
	var/signal_id_5 = "null"
	var/signal_title_6 = ""
	var/signal_id_6 = "null"
	var/signal_title_single = "" //single use commands
	var/signal_id_single = "null"
	var/used = FALSE
	var/id = null // Currently selected ID

// Notekeeper vars
	var/notehtml = ""
	var/title = "ERROR 0xCM513F3D"
	var/note = "'Invalid Entry. Please enter your information.'"

/obj/machinery/ms13/terminal/Initialize(mapload)
	. = ..()
	register_context()
	chosen_joker = pick(joker_titles)
	termnumber = "No.[rand(360,620)]" // VERY unlikely to get two identical numbers.
	FXtoggle()
	if(!broken)
		write_documents()

/obj/machinery/ms13/terminal/screwdriver_act_secondary(mob/living/user, obj/item/weapon)
	if(flags_1&NODECONSTRUCT_1)
		return TRUE
	..()
	weapon.play_tool_sound(src)
	if(do_after(user, 30 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/machinery/ms13/terminal/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/scrap(loc, 3)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 3)
			new /obj/item/stack/sheet/ms13/glass(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc, 4)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc, 3)
			new /obj/item/stack/sheet/ms13/circuits(loc, 2)
			new /obj/item/ms13/component/vacuum_tube(loc)
		else
			new /obj/item/stack/sheet/ms13/scrap(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
			new /obj/item/stack/sheet/ms13/glass(loc)
			new /obj/item/stack/sheet/ms13/scrap_electronics(loc)
			new /obj/item/stack/sheet/ms13/scrap_copper(loc)
	qdel(src)

/obj/machinery/ms13/terminal/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/machinery/ms13/terminal/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>screwdriver</b> to carefully take apart [src] for parts.")

/obj/machinery/ms13/terminal/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_SCREWDRIVER)
			context[SCREENTIP_CONTEXT_RMB] = "Disassemble"
			return CONTEXTUAL_SCREENTIP_SET

/obj/machinery/ms13/terminal/proc/FXtoggle() // For overlays/sound
	if(!broken && active)
		add_overlay(image(icon, "[screen_icon]", ABOVE_OBJ_LAYER, dir))
		soundloop = new(src, TRUE)
	else
		cut_overlays()
		QDEL_NULL(soundloop)

/obj/machinery/ms13/terminal/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir, armour_penetration)
	. = ..()
	if(prob(35))
		do_sparks(1, FALSE, src)
	if(atom_integrity < 250)
		broken = TRUE
		desc = "[initial(desc)] It looks broken."
		FXtoggle()
		update_icon_state()

/obj/machinery/ms13/terminal/proc/Boom()
	explosion(src,1,2,3,3,2)
	do_sparks(8, TRUE, src)
	broken = TRUE
	qdel(src)

/obj/machinery/ms13/terminal/Destroy()
	. = ..()
	QDEL_NULL(soundloop)

/obj/machinery/ms13/terminal/update_icon_state()
	. = ..()
	if(!active)
		cut_overlays()
	if(broken)
		icon_state = "[initial(icon_state)]_ruined"
	if(rigged)
		icon_state = "[initial(icon_state)]_rigged"

/obj/machinery/ms13/terminal/ui_interact(mob/user)
	. = ..()
	if(broken || !active)
		return

	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return

	if(password_needed && !unlocked)
		var/guess = tgui_input_text(user, "Enter the password", "Password")
		if(guess == !password)
			return
		if(!guess)
			return
		unlocked = TRUE
		to_chat(user, span_notice("You unlock the computer."))

	var/clicksound = pick('mojave/sound/ms13machines/terminals/ui_hacking_charenter_01.ogg','mojave/sound/ms13machines/terminals/ui_hacking_charenter_02.ogg', 'mojave/sound/ms13machines/terminals/ui_hacking_charenter_03.ogg',)
	playsound(src, clicksound, 50, FALSE)
	var/dat = ""
	dat += "<head><style>body {padding: 0; margin: 15px; background-color: [main_color]; color: [secondary_color]; line-height: 170%;} a, button, a:link, a:visited, a:active, .linkOn, .linkOff {color: [secondary_color]; text-decoration: none; background: [main_color]; border: none; padding: 1px 4px 1px 4px; margin: 0 2px 0 0; cursor: url('default_mousepointer.ico'), default;} a:hover {color: [main_color]; background: [secondary_color]; border: 1px solid [secondary_color]} a.white, a.white:link, a.white:visited, a.white:active {color: [secondary_color]; text-decoration: none; background: [secondary_color]; border: 1px solid #161616; padding: 1px 4px 1px 4px; margin: 0 2px 0 0; cursor: url('default_mousepointer.ico'), default;} a.white:hover {color: [main_color]; background: [secondary_color];} .linkOn, a.linkOn:link, a.linkOn:visited, a.linkOn:active, a.linkOn:hover {color: [secondary_color]; background: [main_color]; border-color: [main_color];} .linkOff, a.linkOff:link, a.linkOff:visited, a.linkOff:active, a.linkOff:hover{color: [secondary_color]; background: [main_color]; border-color: [main_color];}</style></head><font face='courier'>"
	switch (system)
		if ("ROBCO50")
			dat += "<center><b>ROBCO INDUSTRIES UNIFIED OPERATING SYSTEM V.5.0</b><br>"
			dat += "<b>COPYRIGHT 2075-2077 ROBCO INDUSTRIES</b><br>"
		if ("ROBCO38")
			dat += "<center><b>ROBCO INDUSTRIES UNIFIED OPERATING SYSTEM V.3.8</b><br>"
			dat += "<b>COPYRIGHT 2072-2075 ROBCO INDUSTRIES</b><br>"
		if ("APRICOT")
			dat += "<center><b>APRICOT COMPUTING SYSTEM VERSION 4B</b><br>"
			dat += "<b>COPYRIGHT 2069-2070 APRICOT COMPUTING INC.</b><br>"

	switch (mode) // Text at the top of the page
		if (0) // If we're on the home page
			dat += "= [termtag] Terminal [termnumber] =</center>"
		if (1) // If we're in the word processor
			dat += "= RobCo Word Processor V.22 =</center>"
			dat += "= [title] =</center>"
		if (2) // If we're viewing a document
			dat += "= [loaded_title] =</center>"
		if (3) // If we're in the utility page
			dat += "= RobCo Utili-Dock V.5 =</center>"
	dat += "<br>"

// The next line is the death of hope. Gaze not longer upon it than you need to.
	switch (mode)
		if (0)
			dat += "TERMINAL FUNCTIONS"
			if(prog_notekeeper)
				dat += "<br><a href='byond://?src=[REF(src)];choice=1'>\>  Word Processor</a>"
			if(remote_capability)
				dat += "<br><a href='byond://?src=[REF(src)];choice=3'>\>  Utili-Dock</a>"
			dat += "<br><br>"
			dat += "FILE SYSTEM"
			if(doc_title_1)
				dat += "<br><a href='byond://?src=[REF(src)];choice=doc_1'>\>  [doc_title_1]</a>"
			if(doc_title_2)
				dat += "<br><a href='byond://?src=[REF(src)];choice=doc_2'>\>  [doc_title_2]</a>"
			if(doc_title_3)
				dat += "<br><a href='byond://?src=[REF(src)];choice=doc_3'>\>  [doc_title_3]</a>"
			if(doc_title_4)
				dat += "<br><a href='byond://?src=[REF(src)];choice=doc_4'>\>  [doc_title_4]</a>"
			if(doc_title_5)
				dat += "<br><a href='byond://?src=[REF(src)];choice=doc_5'>\>  [doc_title_5]</a>"
			if(rigged)
				dat += "<br><a href='byond://?src=[REF(src)];choice=joker'>\>  [chosen_joker]</a><br>"

		if (1)
			dat += "</center><font face=\"Courier\">[(!notehtml ? note : notehtml)]</font>"
		if (2)
			dat += "[loaded_content]"
		if (3)
			dat += " Network online. Pending input. "

	if (mode)
		dat += "<br><br><center>=============================================================================</center>"
		if(mode == 1) // Notepad page
			dat += "<a href='byond://?src=[REF(src)];choice=Title'>\>  Title</a><br>"
			dat += "<a href='byond://?src=[REF(src)];choice=Contents'>\>  Edit</a><br>"
			dat += "<a href='byond://?src=[REF(src)];choice=Save'>\>  Save</a><br>"

		if(mode == 3) // Signaller page
			if(signal_title_1)
				dat += "<a href='byond://?src=[REF(src)];choice=signal_one'>\>  [signal_title_1]</a><br>"
			if(signal_title_2)
				dat += "<a href='byond://?src=[REF(src)];choice=signal_two'>\>  [signal_title_2]</a><br>"
			if(signal_title_3)
				dat += "<a href='byond://?src=[REF(src)];choice=signal_three'>\>  [signal_title_3]</a><br>"
			if(signal_title_4)
				dat += "<a href='byond://?src=[REF(src)];choice=signal_four'>\>  [signal_title_4]</a><br>"
			if(signal_title_5)
				dat += "<a href='byond://?src=[REF(src)];choice=signal_five'>\>  [signal_title_5]</a><br>"
			if(signal_title_6)
				dat += "<a href='byond://?src=[REF(src)];choice=signal_six'>\>  [signal_title_6]</a><br>"
			if(signal_title_single && !used)
				dat += "<a href='byond://?src=[REF(src)];choice=signal_single'>\>  [signal_title_single]</a><br>"
				used = TRUE
		dat += "<a href='byond://?src=[REF(src)];choice=Return'>\>  Return</a>"

	dat += "</font></div>"
	var/datum/browser/popup = new(user, "terminal", null, 600, 400)
	popup.set_content(dat)
	popup.set_title_image(user.browse_rsc_icon(src.icon, src.icon_state))
	popup.open()

/obj/machinery/ms13/terminal/Topic(href, href_list)
	..()
	var/mob/living/U = usr

	if(usr.canUseTopic(src) && !href_list["close"])
		add_fingerprint(U)
		U.set_machine(src)
		switch(href_list["choice"])

// Notekeeper
			if ("Title")
				var/t = tgui_input_text(U, "Please enter your entry title", "entry title", max_length = 25)
				if (in_range(src, U))
					if (mode == 1 && t)
						title = t

			if ("Contents")
				var/n = tgui_input_text(U, "Please enter your entry contents", "entry contents")
				if (in_range(src, U))
					if (mode == 1 && n)
						note = n
						notehtml = parsemarkdown(n, U)
				else
					return

			if ("Save")
				if (!in_range(src, U))
					return
				var/choice = tgui_alert(usr, "Please select data slot", buttons = list("Slot 1","Slot 2","Slot 3","Slot 4","Slot 5"))

				if(choice=="Slot 1")
					doc_title_1 = title
					doc_content_1 = note

				if(choice=="Slot 2")
					doc_title_2 = title
					doc_content_2 = note

				if(choice=="Slot 3")
					doc_title_3 = title
					doc_content_3 = note

				if(choice=="Slot 4")
					doc_title_4 = title
					doc_content_4 = note

				if(choice=="Slot 5")
					doc_title_5 = title
					doc_content_5 = note

// Files - We assign the datum information to the loaded_ variables so we don't need a different page for each document
			if ("doc_1")
				loaded_title = doc_title_1
				loaded_content = doc_content_1
				mode = 2

			if ("doc_2")
				loaded_title = doc_title_2
				loaded_content = doc_content_2
				mode = 2

			if ("doc_3")
				loaded_title = doc_title_3
				loaded_content = doc_content_3
				mode = 2

			if ("doc_4")
				loaded_title = doc_title_4
				loaded_content = doc_content_4
				mode = 2

			if ("doc_5")
				loaded_title = doc_title_5
				loaded_content = doc_content_5
				mode = 2

// Signal sender - Should have a few of these just in case.
			if("signal_one")
				id = signal_id_1
				transmit_signal()

			if("signal_two")
				id = signal_id_2
				transmit_signal()

			if("signal_three")
				id = signal_id_3
				transmit_signal()

			if("signal_four")
				id = signal_id_4
				transmit_signal()

			if("signal_five")
				id = signal_id_5
				transmit_signal()

			if("signal_six")
				id = signal_id_6
				transmit_signal()

			if("signal_single")
				id = signal_id_single
				transmit_signal()

// Joker - AKA character killer
			if("joker") // It's go time. Used for rigged terminals.
				var/file_in_memory = /datum/terminal/document/joker
				var/datum/terminal/document/J = new file_in_memory

				loaded_title = J.title
				loaded_content = J.content
				mode = 2
				addtimer(CALLBACK(src, .proc/Boom), 2 SECONDS)
				message_admins("A rigged terminal has been triggered. [ADMIN_JMP(src)].")

// Return
			if("Return")
				if(mode) // If we're not on the home page...
					mode = 0 // Take us there

// Menu functions
			if ("1") // Notepad
				mode = 1
			if ("3") // Signaller
				mode = 3

	updateUsrDialog()
	return

/obj/machinery/ms13/terminal/proc/write_documents()
	if (doc_title_1)
		var/file_in_memory = text2path("/datum/terminal/document/[doc_title_1]")
		var/datum/terminal/document/N = new file_in_memory
		doc_title_1 = "[N.title]"
		doc_content_1 = "[N.content]"
	if (doc_title_2)
		var/file_in_memory = text2path("/datum/terminal/document/[doc_title_2]")
		var/datum/terminal/document/N = new file_in_memory
		doc_title_2 = "[N.title]"
		doc_content_2 = "[N.content]"
	if (doc_title_3)
		var/file_in_memory = text2path("/datum/terminal/document/[doc_title_3]")
		var/datum/terminal/document/N = new file_in_memory
		doc_title_3 = "[N.title]"
		doc_content_3 = "[N.content]"
	if (doc_title_4)
		var/file_in_memory = text2path("/datum/terminal/document/[doc_title_4]")
		var/datum/terminal/document/N = new file_in_memory
		doc_title_4 = "[N.title]"
		doc_content_4 = "[N.content]"
	if (doc_title_5)
		var/file_in_memory = text2path("/datum/terminal/document/[doc_title_5]")
		var/datum/terminal/document/N = new file_in_memory
		doc_title_5 = "[N.title]"
		doc_content_5 = "[N.content]"

	return

/obj/machinery/ms13/terminal/proc/transmit_signal()
	var/openclose
	for(var/obj/machinery/door/poddoor/M in GLOB.machines)
		if(M.id == src.id)
			if(openclose == null)
				openclose = M.density
			INVOKE_ASYNC(M, openclose ? /obj/machinery/door/poddoor.proc/open : /obj/machinery/door/poddoor.proc/close)

//// Extra variants ////
/obj/machinery/ms13/terminal/pristine
	icon_state = "terminal_new" // Shouldn't really even be used. But i'll add it anyways.

/obj/machinery/ms13/terminal/rusty
	icon_state = "terminal_rusted"

/obj/machinery/ms13/terminal/vault
	name = "terminal stand"
	desc = "A multi-monitored heavy duty vault-tec terminal stand. Very uncommon to see anywhere else."
	icon_state = "terminal_vault"
	screen_icon = "terminal_vault_screen"
	termtag = "vault"
	system = "ROBCO38"
	light_color = LIGHT_COLOR_DARK_BLUE
	main_color = "#2b84bb"
	secondary_color = "#093b4d"

/obj/machinery/ms13/terminal/crafted
	name = "crafted terminal"
	desc = "A miracle of man- A terminal that has been locally produced by a wastelander, as can be clearly seen by the quality."
	icon_state = "terminal_handmade"
	screen_icon = "terminal_handmade_screen"
	pixel_y = 12

//// Wall mounted terminals ////
/obj/machinery/ms13/terminal/wall
	name = "wall mounted terminal"
	desc = "A RobCo Industries terminal. This one is handily mounted to a wall for added convenience."
	icon_state = "wallterminal"
	base_icon_state = "wallterminal"
	screen_icon = "wallterminal_screen"
	termtag = "Utility"
	active = FALSE
	density = FALSE
	riggable = FALSE
	var/flippable = TRUE

/obj/machinery/ms13/terminal/wall/Initialize(mapload)
	. = ..()
	if(!flippable)
		active = TRUE
	AddElement(/datum/element/wall_mount)

/obj/machinery/ms13/terminal/wall/AltClick(mob/user)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	if(broken)
		return
	update_icon_state()
	if(!flippable)
		return
	if(!active)
		playsound(src, 'mojave/sound/ms13machines/terminals/keyboard_down.ogg', 50, FALSE)
		playsound(src, 'mojave/sound/ms13machines/terminals/poweron.ogg', 50, FALSE)
		active = TRUE
		icon_state = "[base_icon_state]_down"
	else
		playsound(src, 'mojave/sound/ms13machines/terminals/keyboard_up.ogg', 50, FALSE)
		playsound(src, 'mojave/sound/ms13machines/terminals/poweroff.ogg', 50, FALSE)
		active = FALSE
		icon_state = "[base_icon_state]"
	FXtoggle()

/obj/machinery/ms13/terminal/wall/examine(mob/user)
	. = ..()
	if(flippable)
		. += span_notice("You can flip [src] up and down using <b>ALT+CLICK.</b>")

/obj/machinery/ms13/terminal/wall/pristine
	icon_state = "wallterminal_new"
	base_icon_state = "wallterminal_new"

/obj/machinery/ms13/terminal/wall/rust
	icon_state = "wallterminal_rusted"
	base_icon_state = "wallterminal_rusted"

/obj/machinery/ms13/terminal/wall/classic
	icon_state = "terminal_classic"
	base_icon_state = "terminal_classic"
	screen_icon = "terminal_classic_screen"
	light_color = LIGHT_COLOR_DARK_BLUE
	main_color = "#1f7cb6"
	secondary_color = "#012c3b"
	flippable = FALSE
	system = "APRICOT"

//// Unique Computers ////

/obj/machinery/ms13/terminal/pristine/mayor

/obj/machinery/ms13/terminal/pristine/mayor/Initialize(mapload)
	. = ..()
	password = "[GLOB.fscpassword]"

//// Wasteland Computers ////
/// Potentially controversial. These are computers that should be primarily scatterd through the wastland. They have a high chance of being inoperable roundstart, and a VERY VERY SLIGHT chance to be visibly rigged to explode. ///

/obj/machinery/ms13/terminal/wasteland

/obj/machinery/ms13/terminal/wasteland/Initialize(mapload)
/*	if(prob(65))
		broken = TRUE
		riggable = FALSE
		update_icon_state() */
	if(!riggable)
		return
	else if(prob(1)) // Ultra rare pre-rigged terminals. Stay woke out there.
		rigged = TRUE
	. = ..()

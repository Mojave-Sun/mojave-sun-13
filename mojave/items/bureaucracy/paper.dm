// MOJAVE SUN PAPER/NOTES STORAGE

// BASE //

/obj/item/paper/ms13
	icon = 'mojave/icons/objects/clutter/clutter_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	inhand_icon_state = "paper"
	grind_results = null
	slot_flags = null

/obj/item/paper/ms13/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clutter/clutter_inventory.dmi')
	AddElement(/datum/element/craftable, /obj/item/knife/ms13/scissors, /obj/item/storage/fancy/ms13/cigarettes/rollies/empty, 1, 60 SECONDS, crafting_sound_start = 'mojave/sound/ms13effects/crafting/paperfoldstart.ogg', crafting_sound_mid = list('mojave/sound/ms13effects/crafting/paperfold1.ogg' = 1, 'mojave/sound/ms13effects/crafting/paperfold2.ogg' = 1, 'mojave/sound/ms13effects/crafting/paperfold3.ogg' = 1, 'mojave/sound/ms13effects/crafting/paperfold4.ogg' = 1), surface_type = /obj/structure/table/ms13, crafting_focus_sound = list('mojave/sound/ms13effects/crafting/scissorsnip1.ogg' = 1, 'mojave/sound/ms13effects/crafting/scissorsnip2.ogg' = 1, 'mojave/sound/ms13effects/crafting/scissorsnip3.ogg' = 1))

/obj/item/paper/ms13/AltClick(mob/living/user, obj/item/I)
	return //aint no paper airplanes, NO FUN ALLOWED
//
/obj/item/paper/ms13/wash(clean_types, mob/living/user, obj/structure/S)
	to_chat(user, "<span class='notice'>You start drying and working the [name].</span>")
	if(do_after(user, 10 SECONDS, S))
		var/obj/I = new /obj/item/ms13/rolling_paper(S.loc)
		to_chat(user, "<span class='notice'>You process the [name] into [I] making it thinner and cleaner than before.</span>")
		qdel(src)
		user.put_in_active_hand(I)

/obj/item/paper/ms13/paperslip
	name = "paper slip"
	desc = "A little slip of paper left over after a larger piece was cut. Whoa."
	icon_state = "paperslip"

/obj/item/papercutter/ms13
	name = "paper cutter"
	desc = "A board with a large blade used for cutting paper into smaller shapes."
	icon = 'mojave/icons/objects/clutter/clutter_world.dmi'
	icon_state = "papercutter"

/obj/item/papercutter/ms13/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clutter/clutter_inventory.dmi')

/obj/item/paper_bin/ms13
	name = "paper bin"
	desc = "Contains all the paper you'll never need."
	icon = 'mojave/icons/objects/clutter/clutter_world.dmi'
	icon_state = "paper_bin1"
	papertype = /obj/item/paper/ms13
	bin_overlay_string = "null"

/obj/item/paper_bin/ms13/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clutter/clutter_inventory.dmi')

// CUSTOM //

/obj/item/paper/ms13/prewritten/secretary
	name = "paper- 'Town Hall Secretarial Log No. #0952'"
	info = {"<i>Town Hall Secretarial Log No. #0952<B>
	<br>
	Visitors Entry:<B>
	<br>
	Clarrissa Eldersteen 6:00am /Secretary
	<br>
	Richter O'Connery 7:00am /Mayor
	<br>
	Dave Hutchkins 11:00pm /Maintanance
	<br>
	Bob Jerry 11:30pm /Informational Technician
	<br>
	Vanessa Mason 12:30pm /Bookkeeper
	<br>
	Richter O'Connery 4:00pm /Mayor
	<br>
	Visitors Exit:<B>
	<br>
	Richter O'Connery 10:00am /Reason, Campaign Speech
	<br>
	Bob Jerry 11:30pm /Reason, Library Informational Update
	<br>
	Vanessa Mason 5:30pm /Reason, Clocked Out
	<br>
	</i>"}

/obj/item/paper/ms13/prewritten/mayor_password
	name = "paper- 'Backup Terminal Passcodes'"

/obj/item/paper/ms13/prewritten/mayor_password/Initialize()
	info = {"<i>Backup Terminal Passcodes - PRIVATE EYES ONLY<B>
	<br>
	9219210 = password123
	<br>
	9211818 = [GLOB.fscpassword]
	<br>
	9258839 = Excelsior 349
	<br>
	9021353 = Zimbabwewarrior96
	<br>
	2910227 = Whiskey 482
	</i>"}
	. = ..()

/obj/item/paper/ms13/prewritten/confession
	name = "paper - 'American Pig Interrogation'"
	info = {"<i>Audio Recorder Log No. #05<B>
	<br>
	Interrogator: State your name, American Pig
	<br>
	Interrogatee: M-My name is... Bradley Johnson...
	<br>
	Interrogator: What is your rank and occupation, Pig?
	<br>
	Interrogatee: I.. I'm a Second Lieutenant.. with the 49th.. MP Brigade... of the.. Californian...National Guard...
	<br>
	Interrogator: Repeat what you said before, about the President.
	<br>
	Interrogatee: The... <coughs up blood> ...
	<br>
	Interrogator: <Heard slaps and slight screams through the microphone>
	<br>
	Interrogator: Tell me what I want to know and I'll give you the medicine you desperately need.
	<br>
	Interrogatee: G-God... Bless.. the United.. St-
	<br>
	Interrogator: <More shouts and punches can be heard, when finally a single shot rings out>
	<br>
	Interrogator: Useless dog, he's probably lying anyways.
	<br>
	</i>"}

/obj/item/paper/ms13/prewritten/crooked_note
	name = "paper - 'Crooked Note'"
	info = {"I saw it in a blizzard. And it saw me. It haunts me for now, I know it. God, please, help...
	"}

/obj/item/paper/ms13/prewritten/ncr_intercom
	name = "paper - 'Intercom connection'"
	info = {"<i><B>Intercom functionality restored!</B>
	<br>
	<br>
	It took quite a while. But the intercom system is all linked up again. You can thank me later, Sergeant.
	<br>
	Molerats do a lot of damage. Look out for them. I've had to swap them around to make the wiring actually work.
	<br>
	This time, The mayor's line is on the right. The NCR Garrison is on the left.
	<br>
	Try not to forget it. What we know, keep to ourselves. Careless talk costs lives.
	<br>
	<br>
	Keep fighting the good fight. - Specialist Roberts.
	</i>"}

/obj/item/paper/ms13/prewritten/mammoth_milbase_warning
	name = "paper - 'Danger ahead!'"
	info = {"<i>
	Danger! Wastelanders and alike beware!
	<br><br>
	<br>The courtyard of this abandoned military base is still patrolled by an active and relentless sentry unit.
	<br>The temptation must be deafening, but heed this advice and escape with your life. No plasma pistol is worth the several thousand pounds of kickass roaming FREE within that base.
	<br>Go outside. Listen closely... You might even be able to hear it in the distance. It's OUT. It's FREE. There will NOT be a warning. By the time you hear the guns spin, you're already <u>DEAD</u>.
	<br>Opening the gate or venturing further will only lead to certain doom. Turn back now and live to tell the tale.
	</i>"}

/obj/item/paper/ms13/prewritten/snowcrest_store
	name = "paper- 'Goodbye, all'"
	info = {"<i>
	To the people of Snowcrest,
	<br>
	It is with a heavy heart that I write this note to bid you farewell. After years of serving this community as a store owner, I can no longer bear the weight of the NCR's oppressive laws and regulations on small businesses like mine. They claim to bring order and prosperity, but all I've witnessed is their iron grip suffocating the life out of our once thriving town.
	<br>
	The constant taxation, licensing fees, and bureaucratic red tape have made it impossible for me to sustain my livelihood and support my family. As much as it pains me to leave behind the place I called home, I have no choice but to seek a better future elsewhere, where my hard work and dedication are not hampered by overbearing regulations.
	<br>
	I will cherish the memories shared with each and every one of you. Snowcrest has been a community like no other, and it breaks my heart to see it slowly withering under the rule of the NCR. I hope that one day, the spirit of independence and self-reliance will return to this town, allowing it to flourish once more.
	<br>
	Remember, my friends, that resilience and unity can overcome any challenge. Stand together, support each other, and resist the oppression that threatens to consume your freedoms.
	<br>
	Wishing you all the strength and determination to weather these trying times. I hope our paths cross again someday, under a brighter sky.
	<br>
	Farewell and take care,
	<br>
	Matty H </i>"}

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

/obj/item/paper/ms13/AltClick(mob/living/user, obj/item/I)
	return //aint no paper airplanes, NO FUN ALLOWED

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


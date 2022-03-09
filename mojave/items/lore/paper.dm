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
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/clutter/clutter_inventory.dmi')

/obj/item/paper/ms13/AltClick(mob/living/user, obj/item/I)
	return //aint no paper airplanes, NO FUN ALLOWED

/obj/item/paper/ms13/paperslip
	name = "paper slip"
	desc = "A little slip of paper left over after a larger piece was cut. Whoa."
	icon_state = "paperslip"

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

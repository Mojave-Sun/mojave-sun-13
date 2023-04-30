/obj/item/folder/blue
	desc = "A blue folder."
	icon_state = "folder_blue"
	bg_color = "#355e9f"

/obj/item/folder/red
	desc = "A red folder."
	icon_state = "folder_red"
	bg_color = "#b5002e"

/obj/item/folder/yellow
	desc = "A yellow folder."
	icon_state = "folder_yellow"
	bg_color = "#b88f3d"

/obj/item/folder/white
	desc = "A white folder."
	icon_state = "folder_white"
	bg_color = "#d9d9d9"

/obj/item/folder/documents
	name = "folder- 'TOP SECRET'"
	desc = "A folder stamped \"Top Secret - Property of Nanotrasen Corporation. Unauthorized distribution is punishable by death.\""

/obj/item/folder/documents/Initialize(mapload)
	. = ..()
	new /obj/item/documents/nanotrasen(src)
	update_appearance()

/obj/item/folder/syndicate
	icon_state = "folder_syndie"
	bg_color = "#3f3f3f"
	name = "folder- 'TOP SECRET'"
	desc = "A folder stamped \"Top Secret - Property of The Syndicate.\""

/obj/item/folder/syndicate/red
	icon_state = "folder_sred"

/obj/item/folder/syndicate/red/Initialize(mapload)
	. = ..()
	new /obj/item/documents/syndicate/red(src)
	update_appearance()

/obj/item/folder/syndicate/blue
	icon_state = "folder_sblue"

/obj/item/folder/syndicate/blue/Initialize(mapload)
	. = ..()
	new /obj/item/documents/syndicate/blue(src)
	update_appearance()

/obj/item/folder/syndicate/mining/Initialize(mapload)
	. = ..()
	new /obj/item/documents/syndicate/mining(src)
	update_appearance()

/obj/item/folder/ms13
	name = "debug name"
	desc = "you're not supposed to be seeing this"
	icon = 'mojave/icons/objects/clutter/clutter_world.dmi'
	grid_height = 32
	grid_width = 32

/obj/item/folder/ms13/update_overlays()
	. = ..()
	if(contents.len)
		. += "folder_paper"

/obj/item/folder/ms13/brown
	name = "folder"
	desc = "A brown folder."
	icon_state = "folder_brown"

/obj/item/folder/ms13/red
	name = "folder"
	desc = "A red folder."
	icon_state = "folder_red"

/obj/item/folder/ms13/blue
	name = "folder"
	desc = "A blue folder."
	icon_state = "folder_blue"

/obj/item/folder/ms13/green
	name = "folder"
	desc = "A green folder."
	icon_state = "folder_green"

/datum/client_colour/glass_colour/brown
	colour = "#8a694e"

/obj/item/clothing/glasses/ms13
	name = "generic ms13 glasses"
	desc = "this doesn't even exist"
	inhand_icon_state = "sunglasses"
	icon = 'mojave/icons/objects/clothing/clothing_world/glasses_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/eyes.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	grid_width = 32
	grid_height = 32
	equip_delay_self = 0.25 SECONDS
	equip_delay_other = 0.35 SECONDS

/obj/item/clothing/glasses/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clothing/clothing_inventory/glasses_inventory.dmi')


/obj/item/clothing/glasses/ms13/black
	name = "black glasses"
	desc = "Very plain black glasses. Normally used by hipsters and the near-blind."
	icon_state = "black"

/obj/item/clothing/glasses/ms13/cap
	name = "bottle-cap glasses"
	desc = "A crude pair of glasses made from well worn bottlecaps. A waste of money in the very literal sense."
	icon_state = "cap"

/obj/item/clothing/glasses/ms13/cap/nuka
	name = "pristine bottle-cap glasses"
	desc = "A pristine pair of tinted glasses from before the war, likely some kind of marketing scheme or promotion. But now instead seen on the heads of random, likely insane wastelanders."
	icon_state = "capnew"
	tint = 1
	glass_colour_type = /datum/client_colour/glass_colour/darkred
	flags_cover = GLASSESCOVERSEYES

/obj/item/clothing/glasses/ms13/old
	name = "old glasses"
	desc = "Old, dirty glasses from before the war. Not very useful as actual glasses, but function just fine as an accessory."
	icon_state = "old"

/obj/item/clothing/glasses/ms13/fashionable
	name = "fashionable shades"
	desc = "Eccentric, fashionable, tinted shades for the post-nuclear performer."
	icon_state = "fashion"
	tint = 1
	glass_colour_type = /datum/client_colour/glass_colour/gray

/obj/item/clothing/glasses/ms13/leather
	name = "leather goggles"
	desc = "Thick goggles made from leather. A makeshift solution to keeping things out of your eyes."
	icon_state = "leather"
	flags_cover = GLASSESCOVERSEYES

/obj/item/clothing/glasses/ms13/metal
	name = "metal goggles"
	desc = "Tinted metal goggles for weathering the wastes, cold to the touch."
	icon_state = "gogglemetal"
	inhand_icon_state = "sunglasses"
	tint = 1
	glass_colour_type = /datum/client_colour/glass_colour/gray
	flags_cover = GLASSESCOVERSEYES

/obj/item/clothing/glasses/ms13/cool
	name = "shades"
	desc = "An undeniably cool pair of tinted shades."
	icon_state = "cool"
	tint = 1
	glass_colour_type = /datum/client_colour/glass_colour/gray

/obj/item/clothing/glasses/ms13/goggles
	name = "goggles"
	desc = "A plain pair of goggles for keeping things out of your eyes."
	icon_state = "goggles"
	flags_cover = GLASSESCOVERSEYES

/obj/item/clothing/glasses/ms13/sunglasses
	name = "sunglasses"
	desc = "Plain, tinted sunglasses. Useful for keeping the Mojave Sun out of your eyes."
	icon_state = "sunglasses"
	tint = 1
	glass_colour_type = /datum/client_colour/glass_colour/gray

/obj/item/clothing/glasses/ms13/welding
	name = "welding goggles"
	desc = "A heavy duty pair of welding goggles. For when you'd like to use a welder but would not like to go blind."
	icon_state = "welding"
	flash_protect = FLASH_PROTECTION_WELDER
	tint = 2
	visor_vars_to_toggle = VISOR_FLASHPROTECT | VISOR_TINT
	flags_cover = GLASSESCOVERSEYES
	glass_colour_type = /datum/client_colour/glass_colour/gray

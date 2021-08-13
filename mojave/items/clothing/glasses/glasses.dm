/datum/client_colour/glass_colour/brown
	colour = "#8a694e"

/obj/item/clothing/glasses/ms13
	name = "generic ms13 glasses"
	desc = "this doesn't even exist"
	inhand_icon_state = "sunglasses"
	icon = 'mojave/icons/objects/clothing/glasses.dmi'
	worn_icon = 'mojave/icons/mob/clothing/eyes.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'

/obj/item/clothing/glasses/ms13/black
	name = "black glasses"
	desc = "Snazzy glasses for the hip or near-blind."
	icon_state = "black"

/obj/item/clothing/glasses/ms13/cap
	name = "bottle-cap glasses"
	desc = "Crude soda caps crafted into spectacles, they provide some sort of uh ... Quirkiness."
	icon_state = "cap"
	tint = 1
	glass_colour_type = /datum/client_colour/glass_colour/brown

/obj/item/clothing/glasses/ms13/cap/nuka
	desc = "Limited edition nuka-cola brand cappy spectacles, see life better with Nuka!"
	icon_state = "capnew"
	glass_colour_type = /datum/client_colour/glass_colour/darkred
	flags_cover = GLASSESCOVERSEYES

/obj/item/clothing/glasses/ms13/old
	name = "old spectacles"
	desc = "Pre-war dirtied glasses, relics from a different time."
	icon_state = "old"

/obj/item/clothing/glasses/ms13/fashionable
	name = "swanky shades"
	desc = "Very fashionable!"
	icon_state = "fashion"
	tint = 1
	glass_colour_type = /datum/client_colour/glass_colour/gray

/obj/item/clothing/glasses/ms13/leather
	name = "leather goggles"
	desc = "Rugged tinted handcrafted leather goggles for the harsh wasteland."
	icon_state = "leather"
	tint = 1
	glass_colour_type = /datum/client_colour/glass_colour/gray
	flags_cover = GLASSESCOVERSEYES

/obj/item/clothing/glasses/ms13/metal
	name = "metal goggles"
	desc = "Hardy metal goggles for baring the harsh winter storms, cold to the touch."
	icon_state = "gogglemetal"
	inhand_icon_state = "sunglasses"
	tint = 2
	glass_colour_type = /datum/client_colour/glass_colour/gray
	flags_cover = GLASSESCOVERSEYES

/obj/item/clothing/glasses/ms13/cool
	name = "sunglasses"
	desc = "Very cool."
	icon_state = "cool"
	tint = 1
	glass_colour_type = /datum/client_colour/glass_colour/gray

/obj/item/clothing/glasses/ms13/goggles
	name = "goggles"
	desc = "Strap on and see shit partner."
	icon_state = "goggles"
	flags_cover = GLASSESCOVERSEYES

/obj/item/clothing/glasses/ms13/sunglasses
	name = "sunglasses"
	desc = "Strangely ancient technology used to help provide rudimentary eye cover from the harsh mojave sun."
	icon_state = "sunglasses"

/obj/item/clothing/glasses/ms13/welding
	name = "welding goggles"
	desc = "Arclight insured RobCo pre-war welding goggles, to help you keep your sight."
	icon_state = ""
	flash_protect = FLASH_PROTECTION_WELDER
	tint = 2
	visor_vars_to_toggle = VISOR_FLASHPROTECT | VISOR_TINT
	flags_cover = GLASSESCOVERSEYES
	glass_colour_type = /datum/client_colour/glass_colour/gray
